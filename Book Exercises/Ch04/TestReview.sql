CREATE TABLE ch03_exam_coaches
(
  coach# NUMBER(3) PRIMARY KEY,
  name VARCHAR2(30)
);

RENAME ch03_exam_coaches
  TO ch04_exam_coaches;
  
CREATE TABLE ch04_exam_trainer
(
  trainer# NUMBER(3),
  name VARCHAR2(30),
    CONSTRAINT ch04_exam_trainer_trainer#_pk PRIMARY KEY (trainer#)
);

DESC ch03_exam_players;

ALTER TABLE ch03_exam_players
  ADD CONSTRAINT ch03ExamPlayers_player#_pk PRIMARY KEY (player#);
  
CREATE TABLE ch04_exam_teams
(
  team# NUMBER (3),
  name VARCHAR2(40),
    CONSTRAINT ch04ExamTeams_team#_pk PRIMARY KEY (team#)
);

ALTER TABLE ch03_exam_players
  ADD (team# NUMBER(3));
  
ALTER TABLE ch04_exam_teams
  ADD (mascott VARCHAR2(30));
  
  