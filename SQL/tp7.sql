-- Solutions extracted from tp07-08_en-solution.pdf
-- Q1
current_role | current_catalog
--------------+-----------------
postrgre | TP

-- Q2
DROP TABLE IF EXISTS Log CASCADE;
CREATE TABLE Log(
  wwhen timestamp,
  wwho char(20),
  wwhat varchar(800),
  PRIMARY KEY(wwhen, wwho, wwhat)
);

-- Q3
INSERT INTO Player VALUES ('1001', 'Todd Jackson', 'USA') ON CONFLICT DO NOTHING;
INSERT INTO Player VALUES ('1002', 'Michael Matthews', 'USA') ON CONFLICT DO NOTHING;
INSERT INTO Player VALUES ('1003', 'Jamie Griffith', 'USA') ON CONFLICT DO NOTHING;
INSERT INTO Player VALUES ('1004', 'Iloy Roberts', 'Belgium') ON CONFLICT DO NOTHING;
INSERT INTO Player VALUES ('1005', 'Erin Kolthof', 'Belgium') ON CONFLICT DO NOTHING;

-- Q4
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = current_schema AND table_name = 'player'
  ) THEN
    DROP TRIGGER IF EXISTS trace ON Player;
  END IF;
END;
$$;
CREATE OR REPLACE FUNCTION trig_trace() RETURNS trigger AS $$
BEGIN
  INSERT INTO Log VALUES (
    current_timestamp, current_role,
    'Suppression du joueur ['||OLD.id||'] '||OLD.name||' ('||OLD.country||')'
  );
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trace AFTER DELETE ON Player FOR EACH ROW
EXECUTE FUNCTION trig_trace();

-- Q6 (V1)
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = current_schema AND table_name = 'player'
  ) THEN
    DROP TRIGGER IF EXISTS trace ON Player;
  END IF;
END;
$$;
CREATE OR REPLACE FUNCTION trig_trace() RETURNS trigger AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO Log VALUES (
      current_timestamp, current_role,
      'V1 Addition of player ['||NEW.id||'] '||NEW.name||' ('||NEW.country||')'
    );
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO Log VALUES (
      current_timestamp, current_role,
      'V1 Modification of player ['||NEW.id||'] '||NEW.name||' ('||NEW.country||')'
    );
    RETURN NEW;
  ELSE
    INSERT INTO Log VALUES (
      current_timestamp, current_role,
      'V1 Deletion of player ['||OLD.id||'] '||OLD.name||' ('||OLD.country||')'
    );
    RETURN OLD;
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trace AFTER INSERT OR UPDATE OR DELETE ON Player
FOR EACH ROW
EXECUTE FUNCTION trig_trace();

-- Q6 (V2)
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = current_schema AND table_name = 'player'
  ) THEN
    DROP TRIGGER IF EXISTS trace_update ON Player;
    DROP TRIGGER IF EXISTS trace_delete ON Player;
    DROP TRIGGER IF EXISTS trace_insert ON Player;
  END IF;
END;
$$;
CREATE OR REPLACE FUNCTION trig_trace_update() RETURNS trigger AS $$
BEGIN
  INSERT INTO Log VALUES (
    current_timestamp, current_role,
    'V2 Modification of player ['||NEW.id||'] '||NEW.name||' ('||NEW.country||')'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trace_update AFTER UPDATE ON Player
FOR EACH ROW
EXECUTE FUNCTION trig_trace_update();

CREATE OR REPLACE FUNCTION trig_trace_delete() RETURNS trigger AS $$
BEGIN
  INSERT INTO Log VALUES (
    current_timestamp, current_role,
    'V2 Deletion of player ['||OLD.id||'] '||OLD.name||' ('||OLD.country||')'
  );
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trace_delete AFTER DELETE ON Player
FOR EACH ROW
EXECUTE FUNCTION trig_trace_delete();

CREATE OR REPLACE FUNCTION trig_trace_insert() RETURNS trigger AS $$
BEGIN
  INSERT INTO Log VALUES (
    current_timestamp, current_role,
    'V2 Addition of player ['||NEW.id||'] '||NEW.name||' ('||NEW.country||')'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trace_insert AFTER INSERT ON Player
FOR EACH ROW
EXECUTE FUNCTION trig_trace_insert();

-- Q8
DROP TABLE IF EXISTS BestScorer CASCADE;
CREATE TABLE BestScorer (
  idGame char(8) REFERENCES Game,
  idPlayer varchar(10) REFERENCES Player,
  score numeric,
  PRIMARY KEY(idGame)
);

-- Q9
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = current_schema AND table_name = 'gamedetail'
  ) THEN
    DROP TRIGGER IF EXISTS best ON GameDetail;
  END IF;
END;
$$;
CREATE OR REPLACE FUNCTION trig_best() RETURNS trigger AS $$
DECLARE
  val numeric;
BEGIN
  SELECT score INTO val FROM BestScorer WHERE idGame = NEW.idGame;
  IF val IS NULL THEN
    INSERT INTO BestScorer VALUES (NEW.idGame, NEW.idPlayer, NEW.points);
  ELSIF val < NEW.points THEN
    UPDATE BestScorer SET idPlayer = NEW.idPlayer, score = NEW.points
    WHERE idGame = NEW.idGame;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER best AFTER INSERT ON GameDetail FOR EACH ROW
EXECUTE FUNCTION trig_best();

-- Q13
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = current_schema AND table_name = 'gamedetail'
  ) THEN
    DROP TRIGGER IF EXISTS gamedetail ON GameDetail;
  END IF;
END;
$$;
CREATE OR REPLACE FUNCTION trig_gamedetail() RETURNS trigger AS $$
DECLARE
  val numeric;
BEGIN
  IF NEW.fieldGoalsAttempted != 0 THEN
    val := NEW.fieldGoalsMade / NEW.fieldGoalsAttempted;
  ELSE
    val := 0;
  END IF;
  IF NEW.fieldGoalsPrctage != val THEN
    RAISE WARNING 'fieldGoalsPrctage set from % to %', NEW.fieldGoalsPrctage, val;
    NEW.fieldGoalsPrctage := val;
  END IF;

  IF NEW.threePointsAttempted != 0 THEN
    val := NEW.threePointsMade / NEW.threePointsAttempted;
  ELSE
    val := 0;
  END IF;
  IF NEW.threePointsPrctage != val THEN
    RAISE WARNING 'threePointsPrctage set from % to %', NEW.threePointsPrctage, val;
    NEW.threePointsPrctage := val;
  END IF;

  IF NEW.freeThrowsAttempted != 0 THEN
    val := NEW.freeThrowsMade / NEW.freeThrowsAttempted;
  ELSE
    val := 0;
  END IF;
  IF NEW.freeThrowsPrctage != val THEN
    RAISE WARNING 'freeThrowsPrctage set from % to %', NEW.freeThrowsPrctage, val;
    NEW.freeThrowsPrctage := val;
  END IF;

  val := NEW.offensiveRebounds + NEW.defensiveRebounds;
  IF NEW.rebounds != val THEN
    RAISE WARNING 'rebounds set from % to %', NEW.rebounds, val;
    NEW.rebounds := val;
  END IF;

  val := 3*NEW.threePointsMade + 2*(NEW.fieldGoalsMade - NEW.threePointsMade) + NEW.freeThrowsMade;
  IF NEW.points != val THEN
    RAISE WARNING 'points set from % to %', NEW.points, val;
    NEW.points := val;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER gamedetail AFTER INSERT OR UPDATE ON GameDetail
FOR EACH ROW EXECUTE FUNCTION trig_gamedetail();


