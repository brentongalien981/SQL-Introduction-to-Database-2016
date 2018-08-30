/* This is a comment */
/* this is another comment
CREATE TABLE random_table
*/

-- This is a one-line comment.
-- CREATe

DESC acctmanager;

INSERT INTO acctmanager
  VALUES ('T500', 'NICK', 'TAYLOR', '05-SEP-09', 42000, 3500, 'NE');
  
SELECT *
  FROM acctmanager;
  
INSERT INTO acctmanager
  VALUES ('L500', 'MANDY', 'LOPEZ', '01-OCT-2009', 47000, 1500, NULL);
  
DESC acctmanager;

INSERT INTO acctmanager (amid, amfirst, amlast, amsal, amcomm, region)
  VALUES('J500', 'Sammie', 'Jones', 39500, 2000, 'NW');


  
ALTER TABLE acctmanager
  ADD (amearn AS (amsal + amcomm));
  
INSERT INTO acctmanager (amid, amfirst, amlast, amsal, amcomm, region)
  VALUES ('D500', 'SCOTT', 'DAVIS', 53000, 6000, 'SE');
  
INSERT INTO acctmanager (amid, amfirst, amlast, amedate, amsal, amcomm, region)
  VALUES ('M500', 'Peg', 'O''hara', DEFAULT, 46000, 2000, 'SW');
  
INSERT INTO acctbonus (amid, amsal, region)
  SELECT amid, amsal, region
    FROM acctmanager;
    
SELECT *
  FROM acctbonus;
  
UPDATE acctmanager
  SET amedate = '01-AUG-09'
    WHERE amid = 'J500';
    
UPDATE acctmanager
  SET region = 'W'
    WHERE region IN ('NE', 'NW');
    
UPDATE acctmanager
  SET amedate = '10-OCT-09',
      region = 'S'
    WHERE amid = 'L500';
    
UPDATE customers
  SET region = '';
  
UPDATE customers
  SET region = '&Region'
    WHERE state = '&State';
    
UPDATE customers
  SET region = '&REHIYON'
    WHERE state = '&ESTADO';    
    
SELECT customer#, state, region
  FROM customers;
  
DELETE FROM acctmanager
  WHERE amid = 'J500';
  
COMMIT;
    
UPDATE acctmanager
  SET region = 'E'
  WHERE amid = 'M500';
COMMIT;
UPDATE acctmanager
  SET region = 'E'
  WHERE amid = 'T500';
UPDATE acctmanager
  SET region = 'E'
  WHERE amid = 'L500';  
SAVEPOINT ONE;
UPDATE acctmanager
  SET amcomm = 6600
  WHERE amid = 'T500';
  
ROLLBACK TO ONE;

ROLLBACK;

  
  
  
  
  
  


SELECT *
  FROM acctmanager;
  
SELECT *
  FROM customers;  