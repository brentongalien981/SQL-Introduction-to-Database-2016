CREATE TABLE ch03_exam_players
(
  player# NUMBER(2),
  name VARCHAR2(30),
  position CHAR(2),
  team VARCHAR2(30) DEFAULT 'Free Agent'
);

CREATE TABLE ch03_exam_players_miniature AS
(
  SELECT player#, name
  FROM ch03_exam_players
);

ALTER TABLE ch03_exam_players
  ADD (brand VARCHAR2(20) DEFAULT 'NBA');
  
ALTER TABLE ch03_exam_players
  MODIFY (name VARCHAR(40));
  
ALTER TABLE ch03_exam_players
  DROP COLUMN brand;
  
ALTER TABLE ch03_exam_players
  ADD (country VARCHAR2(30) DEFAULT 'USA');
  
ALTER TABLE ch03_exam_players
  SET UNUSED (country);
  
ALTER TABLE ch03_exam_players
  DROP UNUSED COLUMNS;
  
RENAME ch03_exam_players_miniature
  TO ch03_exam_players_reduced;
  
DESC ch03_exam_players_reduced;

INSERT INTO ch03_exam_players_reduced (player#, name)
  VALUES (8, 'Kobe Bryant');
  
TRUNCATE TABLE ch03_exam_players_reduced;

DROP TABLE ch03_exam_players_reduced PURGE;

FLASHBACk TABLE ch03_exam_players_reduced TO BEFORE DROP;