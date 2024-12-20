/*
Aim: Testing all the DDL (Create, Alter) and DML (Insert, Update, Delete) and RENAME Commands
Create a table CUSTOMER with following columns:
1)	C_id INTEGER, CName VARCHAR(20),city CHAR(15),DOB DATE
2)	Alter the structure of above table.
a.	Increase the size of CName by 10 characters
b.	Add extra column name cell phone CHAR(10) and E-mail ID CHAR(35)
3)	Insert 10 records.
4)	Drop the column E-mail ID.
5)	Add column Income NUMBER (10,2)
6)	Update values of Income column.
7)	Change the name of the table CUSTOMER to CUSTOMERS
8)	Update the Income of customers who belongs to City Mangalore.
a.	Update the City and Income of first 3 customers.
b.	Update the Income of customer belongs to Mangalore. Udupi or Kasaragod
9)	Delete the Customer whose Income is greater than 200000 and less than 500000
*/

create table customer(cid INTEGER, cname VARCHAR2(20), city CHAR(15), DOB DATE );
ALTER TABLE customer MODIFY cname VARCHAR2(30);
SELECT *FROM CUSTOMER;
ALTER TABLE customer ADD(cellphone CHAR(10), email CHAR(35));


INSERT INTO CUSTOMER (cid, cName, city, DOB, cellphone, email) VALUES (1, 'ALICE', 'MANGALURU', TO_DATE('1990-01-01', 'YYYY-MM-DD'), '1234567890', 'alice@example.com');
INSERT INTO customer (cid, cName, city, DOB, cellphone, email) VALUES (2, 'BOB', 'UDUPI', TO_DATE('1985-05-15', 'YYYY-MM-DD'), '0987654321', 'bob@example.com');
INSERT INTO customer (cid, cName, city, DOB, cellphone, email) VALUES (3, 'CHARLIE', 'KASARAGOD', TO_DATE('1992-07-20', 'YYYY-MM-DD'), '1122334455', 'charlie@example.com');
INSERT INTO customer (cid, cName, city, DOB, cellphone, email) VALUES (4, 'DAVID', 'MANGALURU', TO_DATE('1988-03-30', 'YYYY-MM-DD'), '2233445566', 'david@example.com');
INSERT INTO customer (cid, cName, city, DOB, cellphone, email) VALUES (5, 'EVE', 'MANGALURU', TO_DATE('1995-12-12', 'YYYY-MM-DD'), '3344556677', 'eve@example.com');
INSERT INTO customer (cid, cName, city, DOB, cellphone, email) VALUES (6, 'FRANK', 'UDUPI', TO_DATE('1991-11-11', 'YYYY-MM-DD'), '4455667788', 'frank@example.com');
INSERT INTO customer (cid, cName, city, DOB, cellphone, email) VALUES (7, 'GRACE', 'KASARAGOD', TO_DATE('1993-09-09', 'YYYY-MM-DD'), '5566778899', 'grace@example.com');
INSERT INTO customer (cid, cName, city, DOB, cellphone, email) VALUES (8, 'Maeve', 'Goa', TO_DATE('2001-09-09', 'YYYY-MM-DD'),'9822489709', 'maeve@gmail.com');
INSERT INTO customer (cid, cName, city, DOB, cellphone, email) VALUES (9,'IVAN','UDUPI',TO_DATE('1994-08-08','YYYY-MM-DD'),'7788990011','ivan@example.com');

ALTER TABLE customer DROP COLUMN email;
ALTER TABLE CUSTOMER ADD Income NUMBER(10,2);

UPDATE CUSTOMER SET INCOME = 50000 where cid IN (2);

-- Rename Tables
ALTER TABLE customer RENAME to customers;
RENAME sale TO sales;

UPDATE CUSTOMERS SET CITY = 'newcity', Income = 60000 WHERE ROWNUM <=3;
UPDATE CUSTOMERS SET INCOME = 600000 WHERE CITY IN ('MANGALURU','UDUPI','KASARAGOD');

DELETE FROM CUSTOMER WHERE INCOME > 20000 AND INCOME < 70000; 
COMMIT;


