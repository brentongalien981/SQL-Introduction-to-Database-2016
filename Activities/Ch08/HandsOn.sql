INSERT INTO customers (customer#, lastname, firstname, address, city, state, zip, region)
VALUES (1234, 'Polikarpova', 'Kate', 'Progress', 'Toronto', 'TO', 'L6E1V5', 'W');

SELECT *
  FROM customers;
  
SELECT lastname, firstname, city
  FROM customers;
  
SELECT lastname, firstname, state, city
  FROM customers
    WHERE state IN ('FL', 'WA');
    
SELECT *
  FROM author;
  
SELECT order#, shipdate
  FROM orders
    WHERE shipdate > '01-APR-2009';
    
SELECT title, category
  FROM books
    WHERE category != 'FITNESS';
    
SELECT customer#, lastname, state
  FROM customers
    WHERE state = 'GA' OR state = 'NJ'
      ORDER BY lastname;
      
SELECT order#, orderdate
  FROM orders
    WHERE orderdate <= '01-APR-09';
  

  
  
