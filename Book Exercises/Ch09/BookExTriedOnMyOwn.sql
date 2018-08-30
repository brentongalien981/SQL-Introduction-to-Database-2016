SELECT * 
  FROM promotion;
  
SELECT isbn, title, location, '     ' Count
  FROM books, warehouses
  ORDER BY location, title;
  
SELECT title, name
  FROM books, publisher;
  
SELECT isbn, title, location, '   ' Count
  FROM books CROSS JOIN warehouses
  ORDER BY location, title;
  
SELECT title, name, publisher.pubid
  FROM books, publisher
  WHERE books.pubid = publisher.pubid;
  
SELECT title, books.pubid, name
  FROM books, publisher
  WHERE books.pubid = publisher.pubid
  AND publisher.pubid = 4;
  
SELECT b.title, b.cost, b.pubid, p.name
  FROM books b, publisher p
  WHERE b.pubid = p.pubid
  AND (b.cost < 15 OR p.pubid = 1)
  ORDER BY title;
  
SELECT c.lastname, c.firstname, b.title, b.category AS "myCategory"
  FROM customers c, orders o, orderitems oi, books b
  WHERE c.customer# = o.customer#
    AND o.order# = oi.order#
    AND oi.isbn = b.isbn
    AND category = 'COMPUTER'
  ORDER BY lastname, firstname;
  
SELECT title, pubid, name
  FROM publisher NATURAL JOIN books;
  
SELECT b.title, pubid, p.name
  FROM publisher p JOIN books b
    USING (pubid);
    
SELECT b.title, b.pubid, p.name
  FROM publisher2 p JOIN books b
    ON p.id = b.pubid;
    
SELECT b.title, b.pubid, p.name
  FROM publisher2 p JOIN books b
    ON p.id = b.pubid
  WHERE pubid = 4;
  
SELECT c.lastname, c.firstname, b.title
  FROM customers c JOIN orders o USING (customer#)
    JOIN orderitems oi USING (order#)
    JOIN books b USING (isbn)
  WHERE category = 'COMPUTER'
  ORDER BY lastname, firstname;
  
DESCRIBE publisher;  

SELECT *
  FROM promotion;
  
SELECT b.title, p.gift, b.retail, p.minretail, p.maxretail
  FROM books b, promotion p
  WHERE b.retail BETWEEN p.minretail AND p.maxretail;
  
SELECT b.title, p.gift
  FROM books b JOIN promotion p
    ON b.retail BETWEEN p.minretail AND p.maxretail;
    
SELECT r.firstname, r.lastname, c.lastname "Referred"
  FROM customers c, customers r
  WHERE c.referred = r.customer#;
  
SELECT r.firstname, r.lastname, c.lastname AS "referreD"
  FROM customers c JOIN customers r
    ON c.referred = r.customer#;
    
SELECT c.lastname, c.firstname, o.order#
  FROM customers c, orders o
  WHERE c.customer# = o.customer#(+)
  ORDER BY c.lastname, c.firstname;
  
SELECT c.lastname, c.firstname, o.order#
  FROM customers c LEFT OUTER JOIN orders o
    USING (customer#)
  ORDER BY c.lastname, c.firstname;
  
SELECT c.lastname, c.firstname, o.order#
  FROM customers c RIGHT OUTER JOIN orders o
    USING (customer#)
  ORDER BY c.lastname, c.firstname;  
  
SELECT ba.authorid
  FROM books b JOIN bookauthor ba
    USING (isbn)
  WHERE category = 'FAMILY LIFE'
UNION ALL
SELECT ba.authorid
  FROM books b JOIN bookauthor ba
    USING (isbn)
  WHERE category = 'CHILDREN'
  ORDER BY authorid;
  
SELECT pubid, name
  FROM publisher
UNION
SELECT id, name
  FROM publisher3;
  
SELECT customer#
  FROM customers
INTERSECT
SELECT customer#
  FROM orders;
  
SELECT customer#
  FROM customers
MINUS
SELECT customer#
  FROM orders;  

  
  