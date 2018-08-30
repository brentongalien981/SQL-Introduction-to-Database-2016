CREATE TABLE Aliases
(
	Alias_ID NUMBER(6),
	Criminal_ID NUMBER(6),
	Alias VARCHAR2(10)
);
DESCRIBE Aliases;
CREATE TABLE Criminals
(
	Criminal_ID NUMBER(6),
	Last VARCHAR2(15),
	First VARCHAR2(10),
	Street VARCHAR2(30),
	City VARCHAR2(20),
	State CHAR(2),
	Zip CHAR(5),
	Phone CHAR(10),
	V_status CHAR(1) DEFAULT 'N',
	P_status CHAR(1) DEFAULT 'N'
);
DESCRIBE Criminals;
CREATE TABLE Crimes
(
	Crime_ID NUMBER(9),
	Criminal_ID NUMBER(6),
	Classification CHAR(1),
	Date_charged DATE,
	Status CHAR(2),
	Hearing_date DATE,
	Appeal_cut_date DATE
);
DESCRIBE Crimes;
CREATE TABLE Sentences
(
	Sentence_ID NUMBER(6),
	Criminal_ID NUMBER(6),
	Type CHAR(1),
	Prob_ID NUMBER(5),
	Start_date DATE,
	End_date DATE,
	Violations NUMBER(3)
);
DESCRIBE Sentences;
CREATE TABLE Prob_officers
(
	Prob_ID NUMBER(5),
	Last VARCHAR2(15),
	First VARCHAR2(10),
	Street VARCHAR2(30),
	City VARCHAR2(20),
	State CHAR(2),
	Zip CHAR(5),
	Phone CHAR(10),
	Email VARCHAR2(30),
	Status CHAR(1) DEFAULT 'A'
);
DESCRIBE Prob_officers;
CREATE TABLE Crime_charges
(
	Charge_ID NUMBER(10),
	Crime_ID NUMBER(9),
	Crime_code NUMBER(3),
	Charge_status CHAR(2),
	Fine_amount NUMBER(7,2),
	Court_fee NUMBER(7,2),
	Amount_paid NUMBER(7,2),
	Pay_due_date DATE
);
DESCRIBE Crime_charges;
CREATE TABLE Crime_officers
(
	Crime_ID NUMBER(9),
	Officer_ID NUMBER(8)		
);
DESCRIBE Crime_officers;
CREATE TABLE Officers
(
	Officer_ID NUMBER(8),
	Last VARCHAR2(15),
	First VARCHAR2(10),
	Precinct CHAR(4),
	Badge VARCHAR2(14),
	Phone CHAR(10),
	Status CHAR(1) DEFAULT 'A'
);
DESCRIBE Officers;
CREATE TABLE Appeals
(
	Appeal_ID NUMBER(5),
	Crime_ID NUMBER(9),
	Filing_date DATE,
	Hearing_date DATE,
	Status CHAR(1) DEFAULT 'P'
);
DESCRIBE Appeals;
CREATE TABLE Crime_codes
(
	Crime_code NUMBER(3),
	Code_description VARCHAR2(30)
);
DESCRIBE Crime_codes;
ALTER TABLE Crimes
	MODIFY (Classification DEFAULT 'U');
ALTER TABLE Crimes
	ADD (Date_Recorded DATE DEFAULT SYSDATE);
ALTER TABLE Prob_officers
	ADD (Pager# NUMBER(10));
ALTER TABLE Aliases
	MODIFY (Alias VARCHAR2(20));
