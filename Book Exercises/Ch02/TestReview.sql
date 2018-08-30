DESC customers;

SELECT customer#, lastname, firstname, city
  FROM customers;
  
SELECT * FROM customers;

SELECT lastname AS "Apilyedo", city AS "sIyUdAd"
  FROM customers;
  
SELECT * FROM books;

SELECT title, retail - cost AS "Kikitain"
  FROM books;
  
SELECT DISTINCT state
  FROM customers;
  
SELECT UNIQUE state
  FROM customers;
  
SELECT firstname || ' ** ' || lastname AS "Pangalan", city, state AS estado
  FROM customers;
  

SELECT table_name
  FROM user_tables;
  