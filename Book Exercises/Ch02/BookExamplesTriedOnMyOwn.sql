DESCRIBE Customers;
DESCRIBE Books;

SELECT *
  FROM Customers;
  
SELECT title
  FROM books;
  
SELECT title, category
  FROM books;
  
SELECT title AS "Title"
  FROM books;
  
SELECT title "Title", pubdate "Date of Publication"
  FROM books;
  
SELECT title AS "Title", pubdate AS "Date of Publication", category "Genre"
  FROM books;  
  
SELECT title pangalan
  FROM books;
  
SELECT title, retail
  FROM books;
  
SELECT title, retail, cost, retail - cost AS "Profit"
  FROM books;
  
SELECT * 
  FROM books;
  
SELECT title, retail, discount, retail-discoUnt
  FROM books;
  
SELECT * 
  FROM customers;
  
SELECT DISTINCT state
  FROM customers;
  
SELECT DISTINCT state, city
  FROM customers;
  
SELECT lastname || firstname
  FROM customers;
  
SELECT lastname || ' ' || firstname
  FROM customers;
  
SELECT lastname || ', ' || firstname AS "Customer Name"
  FROM customers;
  
SELECT customer# || ': ' || lastname || ', ' || firstname AS "The Customer"
  FROM customers;