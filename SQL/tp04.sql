

-- Q1 : Fonction pour savoir si une équipe a plus (ou égal) de victoires à l'extérieur qu'à domicile sur une saison
CREATE OR REPLACE FUNCTION isbestaway(teamId character varying(10), seasonParam numeric)
RETURNS BOOLEAN AS $$
DECLARE
    away_wins INTEGER;
    home_wins INTEGER;
BEGIN
    SELECT COUNT(*) INTO away_wins
    FROM Game
    WHERE idVisitorTeam = teamId
      AND NOT homeTeamWins
      AND season = seasonParam;

    SELECT COUNT(*) INTO home_wins
    FROM Game
    WHERE idHomeTeam = teamId
      AND homeTeamWins
      AND season = seasonParam;

    RETURN away_wins >= home_wins;
END;
$$ LANGUAGE plpgsql;

SELECT isbestaway(
    (SELECT id FROM Team WHERE nickname = 'Raptors'),
    2021
);

-- Q2 : Fonction pour obtenir toutes les équipes "bestaway" pour une saison donnée
CREATE OR REPLACE FUNCTION bestAway(seasonParam numeric)
RETURNS TABLE (
    id            character varying(10),
    abbreviation  character(3),
    nickname      character varying(30),
    city          character varying(30)
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Game g WHERE g.season = seasonParam) THEN
        RAISE EXCEPTION 'Saison % inexistante', seasonParam USING ERRCODE = 'P0002'; 
    END IF;

    RETURN QUERY
    SELECT
        t.id,
        t.abbreviation,
        t.nickname,
        t.city
    FROM Team t
    JOIN Game g
      ON g.season = seasonParam
     AND (g.idHomeTeam = t.id OR g.idVisitorTeam = t.id)
    GROUP BY t.id, t.abbreviation, t.nickname, t.city
    HAVING
        COUNT(*) FILTER (WHERE g.idVisitorTeam = t.id AND NOT g.homeTeamWins)
        >=
        COUNT(*) FILTER (WHERE g.idHomeTeam = t.id AND g.homeTeamWins);
END;
$$;


-- Q3 : Fonction qui teste si une équipe a été "bestaway" n saisons consécutives
CREATE OR REPLACE FUNCTION bestAwayConsecutive(teamId character varying(10), n integer)
RETURNS boolean
LANGUAGE plpgsql
AS $$
DECLARE
    seasons integer[];
    num_seasons integer;
    i integer;
    current_streak integer := 0;
    longest_streak integer := 0;
    prev_season integer := NULL;
    season_i integer;
BEGIN
    SELECT array_agg(season::int ORDER BY season::int)
      INTO seasons
      FROM (SELECT DISTINCT season FROM Game) s;

    IF seasons IS NULL OR array_length(seasons, 1) IS NULL THEN
        IF n IS NULL OR n <= 0 THEN
            RAISE EXCEPTION 'Paramètre n invalide (<= 0) sur base vide'
                USING ERRCODE = 'P0001';
        END IF;
        RETURN false;
    END IF;

    num_seasons := array_length(seasons, 1);

    IF n IS NULL OR n <= 0 THEN
        RAISE EXCEPTION 'Paramètre n invalide: % (doit être > 0)', n
            USING ERRCODE = 'P0001';
    END IF;
    IF n > num_seasons THEN
        RAISE EXCEPTION 'Paramètre n trop grand: % (max possible: %)', n, num_seasons
            USING ERRCODE = 'P0001';
    END IF;

    FOR i IN 1..num_seasons LOOP
        season_i := seasons[i];

        IF isbestaway(teamId, season_i) THEN
            IF prev_season IS NOT NULL AND season_i = prev_season + 1 THEN
                current_streak := current_streak + 1;
            ELSE
                current_streak := 1;
            END IF;
        ELSE
            current_streak := 0;
        END IF;

        IF current_streak > longest_streak THEN
            longest_streak := current_streak;
        END IF;

        prev_season := season_i;
    END LOOP;

    RETURN longest_streak >= n;
END;
$$;

-- Q4 : Fonction pour récupérer l'équipe avec le meilleur pourcentage de tirs à 3 pts sur une saison
DROP FUNCTION IF EXISTS bestPercentage3pt(integer);

CREATE OR REPLACE FUNCTION bestPercentage3pt(season_year integer)
RETURNS character varying(10) AS $$
DECLARE
    best_team_id character varying(10);
BEGIN
    SELECT team_id
      INTO best_team_id
      FROM (
        SELECT gd.idteam AS team_id,
               AVG(CASE WHEN gd.threepointsattempted > 0
                        THEN gd.threepointsmade::double precision / gd.threepointsattempted
                        ELSE NULL END) AS pct3
        FROM gamedetail gd
        JOIN game g ON gd.idgame = g.id
        WHERE g.season = season_year
        GROUP BY gd.idteam
        ORDER BY pct3 DESC NULLS LAST
        LIMIT 1
      ) sub;

    RETURN best_team_id;
END;
$$ LANGUAGE plpgsql;

SELECT bestPercentage3pt(2021);

-- Q5 : Fonction qui calcule le total de 3pts marqués par un joueur pour une saison
CREATE OR REPLACE FUNCTION threePointsByPlayer(playerId character varying(10), seasonParam numeric)
RETURNS integer AS $$
DECLARE
    total3 integer;
BEGIN
    SELECT COALESCE(SUM(gd.threepointsmade), 0)
      INTO total3
      FROM gamedetail gd
      JOIN game g ON g.id = gd.idgame
     WHERE gd.idplayer = playerId
       AND g.season = seasonParam;

    RETURN total3;
END;
$$ LANGUAGE plpgsql;

-- Q6 : Fonction qui retourne le meilleur marqueur à 3 pts de la saison
CREATE OR REPLACE FUNCTION bestThreePointPlayer(season_param numeric)
RETURNS character varying(10) AS $$
DECLARE
    best_player_id character varying(10);
BEGIN
    SELECT idplayer
      INTO best_player_id
      FROM (
            SELECT gd.idplayer, SUM(gd.threepointsmade) AS total_3pt
              FROM gamedetail gd
              JOIN game g ON g.id = gd.idgame
             WHERE g.season = season_param
             GROUP BY gd.idplayer
             ORDER BY total_3pt DESC NULLS LAST
             LIMIT 1
      ) sub;

    RETURN best_player_id;
END;
$$ LANGUAGE plpgsql;

-- Q7 : Pour chaque saison, affiche le meilleur marqueur à 3 pts (nom/id/total)
DO $$
DECLARE
    season_rec RECORD;
    best_pid   character varying(10);
    best_name  text;
    total_3    integer;
BEGIN
    FOR season_rec IN (
        SELECT DISTINCT season::numeric AS season
          FROM game
         ORDER BY season::numeric
    ) LOOP
        best_pid := bestThreePointPlayer(season_rec.season);

        IF best_pid IS NULL THEN
            RAISE NOTICE 'Saison %: aucun joueur trouvé', season_rec.season;
            CONTINUE;
        END IF;

        SELECT p.name INTO best_name
          FROM player p
         WHERE p.id = best_pid;

        total_3 := threePointsByPlayer(best_pid, season_rec.season);

        RAISE NOTICE 'Saison %: % (id=%) a marqué % tirs à 3 pts',
            season_rec.season, best_name, best_pid, total_3;
    END LOOP;
END $$;



-- Q8 : Fonction qui retourne le meilleur marqueur à 3 pts de la saison
CREATE OR REPLACE FUNCTION bestThreePointPlayer(season_param numeric)
RETURNS character varying(10) AS $$
DECLARE
    best_player_id character varying(10);
BEGIN
    SELECT idplayer
      INTO best_player_id
      FROM (
            SELECT gd.idplayer, SUM(gd.threepointsmade) AS total_3pt
              FROM gamedetail gd


