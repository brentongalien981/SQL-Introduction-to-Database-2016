--1
INSERT INTO orders (Order#, Customer#, Orderdate)
  VALUES (1021, 1009, '20-JUL-2009');
  
--2
UPDATE orders
  SET shipzip = 33222
  WHERE order# = 1017;
  
--3
COMMIT;

--4
/*
  There will be an error here, because customer# 2000 doesn't exist.
*/
/* 
INSERT INTO orders (order#, customer#, orderdate)
  VALUES (1022, 2000, '06-AUG-09');
*/

--5
/*
INSERT INTO orders (order#, customer#)
  VALUES (1023, 1009);
  
The error here is, there should always be a valid value for the orderdate column.
In this case it's empty and null.
*/

--6
UPDATE books
  SET cost = '&NewCost'
  WHERE isbn = '&ISBN';
  
--7

--8
ROLLBACK;


--9
DELETE FROM orderitems
  WHERE order# = 1005;
  
DELETE FROM orders
  WHERE order# = 1005;  

--10
ROLLBACK;


-- Housekeepings
SELECT *
  FROM orders;
  
SELECT * FROM books;