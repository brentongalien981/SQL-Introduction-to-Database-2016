/* Table Creations */

CREATE TABLE MuzarMusic_Table_Customers
(
  Customer# NUMBER(5),
  LastName VARCHAR2(20) NOT NULL,
  FirstName VARCHAR2(20) NOT NULL,
  Email VARCHAR2(30),
  Address VARCHAR2(40) NOT NULL,
  City VARCHAR2(20) NOT NULL,
  Province VARCHAR2(20) NOT NULL,
  PostalCode VARCHAR2(6) NOT NULL
);


CREATE TABLE MuzarMusic_Table_Transactions
(
  Transaction# NUMBER(6),
  Customer# NUMBER(5),
  TransactionDate DATE DEFAULT SYSDATE,
  DeliveryCost NUMBER(6),
  DeliveryDate DATE
);


CREATE TABLE Muzar_Table_TransactionItems
(
  Transaction# NUMBER(6),
  Item# NUMBER(7),
  Product# NUMBER(8),
  Quantity NUMBER(3)  NOT NULL
);


CREATE TABLE MuzarMusic_Table_Products
(
  Product# NUMBER(6),
  Name VARCHAR2(40) NOT NULL,
  Cost NUMBER(6) NOT NULL,
  Retail NUMBER(6) NOT NULL,
  InstrumentType VARCHAR2(20),
  ManufacturingDate DATE
);


CREATE TABLE MuzarMusic_Table_Manufacturers
(
  ManufacturerId NUMBER(4),
  Name VARCHAR2(30) NOT NULL,
  Phone# NUMBER(10) NOT NULL
);


CREATE TABLE MuzarMusic_Table_Employees
(
  EmployeeId NUMBER(6),
  LastName VARCHAR2(20) NOT NULL,
  FirstName VARCHAR2(20) NOT NULL,
  Phone# NUMBER(10)
);




/* Constraints */
ALTER TABLE MuzarMusic_Table_Customers
  ADD CONSTRAINT MMCustomers_Customer#_pk PRIMARY KEY (Customer#);
  


ALTER TABLE MuzarMusic_Table_Transactions
  ADD CONSTRAINT MMTransactions_Transaction#_pk PRIMARY KEY (Transaction#);
  
ALTER TABLE MuzarMusic_Table_Transactions  
  ADD CONSTRAINT MMTransactions_Customer#_fk FOREIGN KEY (Customer#)
    REFERENCES MuzarMusic_Table_Customers (Customer#);
    
    
    
ALTER TABLE MuzarMusic_Table_Products
  ADD CONSTRAINT MMProducts_Product#_pk PRIMARY KEY (Product#);
  
  
  
ALTER TABLE Muzar_Table_TransactionItems
  ADD CONSTRAINT MMTranItems_Tran#Item#_pk PRIMARY KEY (Transaction#, Item#);
  
ALTER TABLE Muzar_Table_TransactionItems
  ADD CONSTRAINT MMTranItems_Transaction#_fk FOREIGN KEY (Transaction#)
    REFERENCES MuzarMusic_Table_Transactions (Transaction#);    
  
ALTER TABLE Muzar_Table_TransactionItems
  ADD CONSTRAINT MMTranItems_Product#_fk FOREIGN KEY (Product#)
    REFERENCES MuzarMusic_Table_Products (Product#);  
    
    
    
ALTER TABLE MuzarMusic_Table_Manufacturers
  ADD CONSTRAINT MMManufac_ManufacId_pk PRIMARY KEY (ManufacturerId);
  
  
  
ALTER TABLE MuzarMusic_Table_Employees
  ADD CONSTRAINT MMEmployees_EmployeeId_pk PRIMARY KEY (EmployeeId); 