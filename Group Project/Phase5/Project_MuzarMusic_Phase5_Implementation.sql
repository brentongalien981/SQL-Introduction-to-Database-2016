-- 1) Customers
INSERT INTO Customers
  VALUES (10001, 'Bryant', 'Kobe', 'kb24@lakers.com', '24 Bur Oak Ave.', 'Los Angeles', 'Alberta', 'A1B2C3');
INSERT INTO Customers
  VALUES (10002, 'James', 'LeBron', 'lj23@cavs.com', '23 Ohio St.', 'Cleveland', 'Ontario', 'B2C3D4');
INSERT INTO Customers
  VALUES (10003, 'Wade', 'Dwyane', 'dw03@heat.com', '3 Florida Rd.', 'Miami', 'Yukon', 'C3D4E5');  
INSERT INTO Customers
  VALUES (10004, 'McGrady', 'Tracy', 'tm1@rockets.com', '1 Texas Ave.', 'Houston', 'Ontario', 'D4E5F6');  
INSERT INTO Customers
  VALUES (10005, 'Oneal', 'Shaquille', 'so34@lakers.com', '34 Cupertino Ave.', 'Los Angeles', 'Alberta', 'E5F6G7');    

SELECT * 
  FROM Customers;
  
  
  
  

-- 2) Transactions

INSERT INTO Transactions
  VALUES (200001, 10001, '04-APR-2012', 120, '14-APR-2012');
INSERT INTO Transactions
  VALUES (200002, 10002, '14-MAR-2013', 20, '16-MAR-2013');
INSERT INTO Transactions
  VALUES (200003, 10003, '14-MAY-2013', 30, '16-MAY-2013');
INSERT INTO Transactions
  VALUES (200004, 10004, '14-MAY-2013', 20, '15-MAY-2013');  
INSERT INTO Transactions
  VALUES (200005, 10004, '14-MAY-2013', 40, '19-MAY-2013');  
  
SELECT * 
  FROM Transactions;  
  
  
  
  
  
-- 3) Products

INSERT INTO Products
  VALUES (300001, 'Dave Weckl Signature Drums', 3999, 4200, 'Drums', '17-DEC-2014');
INSERT INTO Products
  VALUES (300002, 'Fender Basic Electric Guitar', 490, 559, 'Guitar', '13-FEB-2013');  
INSERT INTO Products
  VALUES (300003, 'Yamaha Live Drumset', 1970, 2119, 'Drums', '11-FEB-2015');    
INSERT INTO Products
  VALUES (300004, 'Ludwig Solo Drumset', 2499, 2599, 'Drums', '01-OCT-2014');    
INSERT INTO Products
  VALUES (300005, 'Roland Electirc Keyboard', 1280, 1320, 'Keyboard', '06-MAY-2015');    
INSERT INTO Products
  VALUES (300006, 'Fender Lead Electric Guitar', 890, 999, 'Guitar', '13-FEB-2016');    
  
SELECT * 
  FROM Products;    





-- 4) Manufacturers

INSERT INTO Manufacturers
  VALUES (4001, 'Pearl', '6471182828');
INSERT INTO Manufacturers
  VALUES (4002, 'Yamaha', '4161182828');  
INSERT INTO Manufacturers
  VALUES (4003, 'Fender', '4162282828');    
INSERT INTO Manufacturers
  VALUES (4004, 'Roland', '4162282831');      
INSERT INTO Manufacturers
  VALUES (4005, 'Ludwig', '6472282831');      
  
SELECT * 
  FROM Manufacturers;      
  
  



-- 5) Employees

INSERT INTO Employees
  VALUES (500001, 'Budenholzer', 'Scott', '6471182898');
INSERT INTO Employees
  VALUES (500002, 'Lue', 'Tyronne', '6471110000');  
INSERT INTO Employees
  VALUES (500003, 'Van Gundy', 'Stan', '4162220000');    
INSERT INTO Employees
  VALUES (500004, 'Kerr', 'Steve', '4162223333');      
INSERT INTO Employees
  VALUES (500005, 'Vogul', 'Frank', '6479998855');      
  
SELECT * 
  FROM Employees;      
  
  
  
  
  
-- 6) TransactionItems

INSERT INTO TransactionItems
  VALUES (200001, 1000001, 300001, 1);
INSERT INTO TransactionItems
  VALUES (200001, 1000002, 300004, 1);  
INSERT INTO TransactionItems
  VALUES (200002, 1000001, 300003, 1);  
INSERT INTO TransactionItems
  VALUES (200003, 1000001, 300002, 2);  
INSERT INTO TransactionItems
  VALUES (200003, 1000002, 300003, 1);    
INSERT INTO TransactionItems
  VALUES (200003, 1000003, 300004, 1);    
INSERT INTO TransactionItems
  VALUES (200004, 1000001, 300003, 1);      
  
SELECT * 
  FROM TransactionItems;      
  
  
  
  
  
  
-- DESCRIBE the tables.
DESCRIBE Customers;  
DESCRIBE Transactions;  
DESCRIBE Products;  
DESCRIBE Manufacturers;  
DESCRIBE Employees;  
DESCRIBE TransactionItems;  




-- Select customers from province 'Alberta'.
SELECT * FROM Customers
  WHERE Province = 'Alberta';
  
-- Select transaction before or during date 2014.
SELECT * FROM Transactions
  WHERE TransactionDate <= '31-DEC-2014';

-- Select products that cost more than $600.
SELECT * FROM Products
  WHERE Cost > 600;
  
-- Select products of type 'Guitar'.
SELECT * FROM Products
  WHERE InstrumentType = 'Guitar'; 
  
-- Select all manufacturers.
SELECT * FROM Manufacturers; 

-- Select all employees.
SELECT * FROM Employees; 

-- Select all transactions with Transaction# "200003", with customer info, JOINING
-- the name of the products she/he bought.
SELECT c.Customer#, c.LastName, c.FirstName, t.Transaction#, p.Name, p.Cost
  FROM Customers c, Transactions t, Products p, TransactionItems ti
    WHERE c.Customer# = t.Customer#
      AND t.Transaction# = ti.Transaction#
      AND p.Product# = ti.Product#
      AND ti.Transaction# = 200003;
  
