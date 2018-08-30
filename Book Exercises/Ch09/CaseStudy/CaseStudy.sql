-- Question 1
-- Version A (Regular Version)
SELECT c.criminal_id, c.last, c.first, cc.crime_code, cc.fine_amount
  FROM criminals c, crimes cr, crime_charges cc
    WHERE c.criminal_id = cr.criminal_id
      AND cr.crime_id = cc.crime_id;

      
-- Question 1
-- Version B (Version using JOIN)
SELECT criminal_id, c.last, c.first, cc.crime_code, cc.fine_amount
  FROM criminals c JOIN crimes cr USING (criminal_id)
  JOIN crime_charges cc USING (crime_id);





-- Question 2
-- Version A
SELECT c.criminal_id, c.last, c.first, cr.status AS "Crime Status", cr.classification, cr.date_charged, a.filing_date, a.status AS "Appeal Status"
  FROM criminals c, crimes cr, appeals a
    WHERE c.criminal_id = cr.criminal_id
      AND cr.crime_id = a.crime_id(+);
      
      
-- Question 2
-- Version B
SELECT criminal_id, c.last, c.first, cr.status AS "Crime Status", cr.classification, cr.date_charged, a.filing_date, a.status AS "Appeal Status"
  FROM criminals c JOIN crimes cr USING  (criminal_id) 
  LEFT OUTER JOIN appeals a USING (crime_id);
      

      
      
      
-- Question 3
-- Version A
/* 
    NOTE: Crimes Classification 
              F (Felony)
              M (Misdemeanor)
              O (Other)
              U (Undefined)
 */
SELECT c.criminal_id, c.last, c.first, cr.classification, cr.date_charged, cc.crime_code, cc.fine_amount
  FROM criminals c, crimes cr, crime_charges cc
    WHERE c.criminal_id = cr.criminal_id
      AND cr.crime_id = cc.crime_id
      AND cr.classification = 'O'
    ORDER BY c.criminal_id, cr.date_charged;
    
    
-- Question 3
-- Version B
SELECT criminal_id, c.last, c.first, cr.classification, cr.date_charged, cc.crime_code, cc.fine_amount
  FROM criminals c JOIN crimes cr USING (criminal_id)
  JOIN crime_charges cc USING (crime_id)
    WHERE cr.classification = 'O'
    ORDER BY criminal_id, cr.date_charged;    
    
    
    
    
    
-- Question 4
-- Version A 
SELECT criminals.criminal_id, last, first, v_status, p_status, alias
  FROM criminals, aliases
    WHERE criminals.criminal_id = aliases.criminal_id(+)
    ORDER BY last;
    
    
-- Question 4
-- Version B 
SELECT criminal_id, last, first, v_status, p_status, alias
  FROM criminals LEFT OUTER JOIN aliases USING (criminal_id)
    ORDER BY last;
    
    
    
    
    
-- Question 5
/*
      Question:
      
      A table named Prob_Contact contains the required frequency of contact with a probation
      officer, based on the length of the probation period (the number of days assigned to probation).
      Review the data in this table, which indicates ranges for the number of days and applicable
      contact frequencies. Create a list containing each criminal who has been assigned
      a probation period, which is indicated by the sentence type. The list should contain the criminal
      name, probation start date, probation end date, and required frequency of contact. Sort
      the list by criminal name and probation start date.
      
      Note: Sentences Type
                J ( Jail Period)
                H (House Arrest)
                P (Probation)
 */
 
-- DEBUG: Just reviewing the tables needed.
DESCRIBE prob_contact;
DESCRIBE prob_officers;
DESCRIBE sentences;
DESCRIBE criminals;

SELECT *
  FROM prob_contact;
SELECT *
  FROM prob_officers;
SELECT *
  FROM sentences;
SELECT *
  FROM criminals;  
  
-- Version A 
SELECT c.last, c.first, s.start_date, s.end_date, s.end_date - s.start_date AS "# of Probation Days", p.low_amt, p.high_amt, p.con_freq
  FROM criminals c, sentences s, prob_contact p
    WHERE c.criminal_id = s.criminal_id
      AND s.type = 'P'
      AND s.end_date - s.start_date BETWEEN p.low_amt AND p.high_amt
    ORDER BY c.last, s.start_date;
    

-- Question 5    
-- Version B
SELECT c.last, c.first, s.start_date, s.end_date, s.end_date - s.start_date AS "# of Probation Days", p.low_amt, p.high_amt, p.con_freq
  FROM criminals c JOIN sentences s
    ON c.criminal_id = s.criminal_id
      JOIN prob_contact p
        ON s.end_date - s.start_date BETWEEN p.low_amt AND p.high_amt
      WHERE s.type = 'P'
  ORDER BY c.last, s.start_date;    
    
    
    
    
    
-- Question 6
-- Version A
SELECT o.last || ', ' || o.first AS "Officer Name", s.last || ', ' || s.first AS "Supervisor Name"
  FROM prob_officers o, prob_officers s
    WHERE o.mgr_id = s.prob_id(+)
    ORDER BY o.last;
    
    
-- Question 6
-- Version B
SELECT o.last || ', ' || o.first AS "Officer Name", s.last || ', ' || s.first AS "Supervisor Name"
  FROM prob_officers o JOIN prob_officers s
    ON o.mgr_id = s.prob_id(+)
    ORDER BY o.last;    
