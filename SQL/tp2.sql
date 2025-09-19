\! echo '########## Q1 ##########';
/* Q1) Analyse des tables */

ANALYZE team;
ANALYZE game;
ANALYZE gamedetail;
ANALYZE player;

\! echo '########## Q2 ##########';
/* Q2) */

EXPLAIN ANALYZE
SELECT	p.name, g.dateGame
FROM	Game g
		JOIN GameDetail gd ON g.id = gd.idGame
		JOIN Player p ON p.id = gd.idPlayer
WHERE	gd.personnalFoul = 6
		AND gd.playingTime = (
			SELECT	min(playingTime)
			FROM	GameDetail
			WHERE	personnalFoul = 6
		);

\! echo '########## Q3 ##########';
/* Q3) */

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_class WHERE relname = 'idx_game_date'
    ) THEN
        CREATE INDEX idx_game_date ON GameDetail(personnalFoul);
    END IF;
END
$$;

\! echo '########## Q4 ##########';
/* Q4) */

SELECT	t.abbreviation, t.nickname, t.city, g.ptsHome, g.ptsAway
FROM	Team t
		JOIN Game g ON (
			(t.id = g.idHomeTeam AND g.homeTeamWins)
			OR (t.id = g.idVisitorTeam AND NOT g.homeTeamWins)
		)
WHERE	abs(g.ptsHome-g.ptsAway) = (
			SELECT	max(abs(g2.ptsHome-g2.ptsAway))
			FROM	Game g2
		);

\! echo '########## Q5 ##########';
/* Q5) */
EXPLAIN ANALYZE
	SELECT t.abbreviation, t.nickname, t.city, g.ptsHome, g.ptsAway
	FROM Team t
		JOIN Game g ON (
			(t.id = g.idHomeTeam AND g.homeTeamWins)
			OR (t.id = g.idVisitorTeam AND NOT g.homeTeamWins)
		)
	WHERE abs(g.ptsHome-g.ptsAway) = (
		SELECT max(abs(g2.ptsHome-g2.ptsAway)) FROM Game g2
	);


\! echo '########## Q6 ##########';
/* Q6) */
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_class WHERE relname = 'idx_ga'
    ) THEN
        CREATE INDEX idx_ga ON Game(abs(ptsHome-ptsAway));
    END IF;
END
$$;

\! echo '########## Q7 ##########';
/* Q7) */
SELECT DISTINCT p.*
FROM Player p JOIN GameDetail gd ON p.id = gd.idPlayer
WHERE gd.startPosition='C' AND gd.steals > 5;

\! echo '########## Q8 ##########';
/* Q8) */
EXPLAIN ANALYZE
SELECT DISTINCT p.*
FROM Player p JOIN GameDetail gd ON p.id = gd.idPlayer
WHERE gd.startPosition='C' AND gd.steals > 5;

\! echo '########## Q9 ##########';
/* Q9) */
CREATE INDEX idx_gd_startPosition ON GameDetail(startPosition);
EXPLAIN ANALYZE
SELECT DISTINCT p.*
FROM Player p JOIN GameDetail gd ON p.id = gd.idPlayer
WHERE gd.startPosition='C' AND gd.steals > 5;

\! echo '########## Q10 ##########';
/* Q10) */
DROP INDEX IF EXISTS idx_ga;
DROP INDEX IF EXISTS idx_gd_startPosition;


\! echo '########## Q11 ##########';
/* Q11) */
/* a) */
SELECT		t.nickname, t.city, count(*)
FROM		Team t
			JOIN Game g ON (
				(t.id = g.idHomeTeam AND g.homeTeamWins)
				OR (t.id = g.idVisitorTeam AND NOT g.homeTeamWins)
			)
GROUP BY	t.nickname, t.city
ORDER BY	3 DESC;

/* b) */
SELECT		t.nickname, t.city, hw.nb+vw.nb
FROM		Team t
			JOIN (
				SELECT		t.id, count(*) nb
				FROM		Team t
							JOIN Game g ON t.id = g.idHomeTeam
				WHERE		g.homeTeamWins
				GROUP BY	t.id
			) hw ON t.id = hw.id
			JOIN (
				SELECT		t.id, count(*) nb
				FROM		Team t
							JOIN Game g ON t.id = g.idVisitorTeam
				WHERE		NOT g.homeTeamWins
				GROUP BY	t.id
			) vw ON t.id = vw.id
ORDER BY	3 DESC ;

\! echo '########## Q14 ##########';
/* Q14) */
SELECT DISTINCT count (p.name), p.name
FROM GameDetail gd JOIN Player p ON p.id = gd.idPlayer
WHERE gd.points >= 40
GROUP BY p.name
ORDER BY count (p.name) DESC ;

\! echo '########## Q15 ##########';
/* Q15) */
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_class WHERE relname = 'idxPoints'
    ) THEN
        CREATE INDEX idxPoints ON GameDetail(points);
    END IF;
END
$$;

\! echo '########## Q16 ##########';
/* Q16) */
SELECT DISTINCT p.name
FROM Player p JOIN GameDetail gd ON p.id = gd.idPlayer
WHERE gd.assists + gd.steals > 22;

\! echo '########## Q17 ##########';
/* Q17) */
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_class WHERE relname = 'idx_assteals'
    ) THEN
        CREATE INDEX idx_assteals ON GameDetail((assists+steals));
    END IF;
END
$$;
