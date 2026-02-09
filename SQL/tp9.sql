-- =========================================
-- Q1/Q2 : MEMBER + numérotation MYY###
-- =========================================
DROP TRIGGER IF EXISTS memberNb ON Member;
DROP TABLE IF EXISTS Do CASCADE;
DROP TABLE IF EXISTS Sport CASCADE;
DROP TABLE IF EXISTS Coach CASCADE;
DROP TABLE IF EXISTS Member CASCADE;
DROP SEQUENCE IF EXISTS seq_member;

CREATE TABLE Member (
  number char(6) PRIMARY KEY,
  name   varchar(40)
);

CREATE SEQUENCE IF NOT EXISTS seq_member INCREMENT BY 1 START WITH 1;

CREATE OR REPLACE FUNCTION tg_memberNb() RETURNS trigger AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    NEW.number := 'M' || to_char(current_date, 'YY') || lpad(nextval('seq_member')::text, 3, '0');
  ELSE
    NEW.number := OLD.number; -- on ne change pas le numéro en update
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER memberNb
BEFORE INSERT OR UPDATE ON Member
FOR EACH ROW
EXECUTE FUNCTION tg_memberNb();

-- =========================================
-- Q3 : Vérification rapide (optionnel)
-- =========================================
INSERT INTO Member (name) VALUES ('Sophie'), ('Leon');
UPDATE Member SET number = 'A00000' WHERE name = 'Leon';
SELECT * FROM Member;

-- =========================================
-- Q4 : COACH / SPORT + cardinalités
-- =========================================
CREATE TABLE Coach (
  id   numeric PRIMARY KEY,
  name varchar(40)
);

CREATE TABLE Sport (
  name  varchar(40) PRIMARY KEY,
  price numeric CHECK (price > 0),
  coach numeric NOT NULL REFERENCES Coach DEFERRABLE INITIALLY DEFERRED
);

-- Un coach doit enseigner au moins un sport
CREATE OR REPLACE FUNCTION tg_coach() RETURNS trigger AS $$
DECLARE nb numeric;
BEGIN
    SELECT COUNT(*) INTO nb FROM Sport WHERE coach = NEW.id;
    IF nb = 0 THEN
        RAISE EXCEPTION 'The coach % does not teach any sport', NEW.id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER coach BEFORE INSERT OR UPDATE ON Coach
FOR EACH ROW
EXECUTE FUNCTION tg_coach();

-- Si un sport est supprimé, on vérifie si le coach enseigne encore un sport et si oui alors on supprime le coach
CREATE OR REPLACE FUNCTION tg_sport() RETURNS trigger AS $$
DECLARE nb numeric;
BEGIN
    SELECT COUNT(*) INTO nb FROM Sport WHERE coach = OLD.coach;
    IF nb = 0 THEN
        RAISE NOTICE 'The coach % is deleted since it does not teach any sport anymore', OLD.coach;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER sport AFTER UPDATE OR DELETE ON Sport


-- Verifier que un seul coach enseigne chaque sport
CREATE OR REPLACE FUNCTION tg_sport_unique() RETURNS trigger AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Sport WHERE coach = NEW.coach) THEN
        RAISE EXCEPTION 'Only one coach can teach a sport';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sport_unique BEFORE INSERT OR UPDATE ON Sport
FOR EACH ROW
EXECUTE FUNCTION tg_sport_unique();

