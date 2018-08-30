CREATE TABLE store_reps
(
  rep_ID NUMBER(5),
  last VARCHAR2(15),
  first VARCHAR2(10),
  comm CHAR(1) DEFAULT 'Y',
    CONSTRAINT store_reps_rep_ID_pk PRIMARY KEY (rep_ID)
);





ALTER TABLE store_reps
  MODIFY (first CONSTRAINT store_reps_first_nn NOT NULL);
  
ALTER TABLE store_reps
  MODIFY (last CONSTRAINT store_reps_last_nn NOT NULL);  
  
  


  
ALTER TABLE store_reps
  ADD CONSTRAINT store_reps_comm_ck CHECK (comm IN ('Y', 'N'));
  




ALTER TABLE store_reps
  ADD (Base_salary NUMBER(7,2) CONSTRAINT store_reps_Base_salary_ck CHECK (Base_salary > 0));






CREATE TABLE book_stores
(
  Store_ID NUMBER(8),
  Name VARCHAR2(30),
  Contact VARCHAR2(30),
  Rep_ID VARCHAR2(5),
    CONSTRAINT book_stores_Store_ID_pk PRIMARY KEY (Store_ID),
    CONSTRAINT book_stores_Name_uk UNIQUE (Name)
);

ALTER TABLE book_stores
  MODIFY (Name CONSTRAINT book_stores_Name_nn NOT NULL);  




ALTER TABLE book_stores
  MODIFY (Rep_ID NUMBER(5));

ALTER TABLE book_stores
  ADD CONSTRAINT book_stores_Rep_ID_fk FOREIGN KEY (Rep_ID)
    REFERENCES store_reps (Rep_ID);






SELECT constraint_name, column_name
  FROM user_cons_columns
    WHERE table_name = 'STORE_REPS';
  
