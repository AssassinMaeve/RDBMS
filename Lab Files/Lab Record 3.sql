/*

Lab Record : 3

Aim: Adding and Altering Business Rule, Naming Constraints, Dropping Constraints and Testing Simple Queries


1.	Create the following relations					
a.	Bank_Customer(CID Integer, Cname NN, DOB NN, City NN  City Name in Capital Letters)
b.	Loans(LoanID Integer , CID Integer , LDate Date, LAmount  Number(10,2), LCloseDate Date, Status Char(1))

2.	Add the following constraints
a.	Add constraint to Loans to make LCloseDate > Ldate
b.	Make CName to accept in Capital Letters
c.	Add Constraint to Loans make Status to accept only the values  ‘A’, ‘C’, ‘N’

3.	Insert few records to both the table (3 Records to Bank_Customer and 9 Records to Loans)

4.	 Add the following Constraints with the constraint Names
a.	Add primary Key to BankCustomer (CID) and Loans (LoanID)
b.	Add Foreign Key to Loans(CID)
c.	Drop the Foreign Key and Recreate the same with ON DELETE CASCADE/SET NULL option
d.	Drop the Business Rule constraints (LCloseDate and CName)

5.	Do the following queries						
a.	Display all the Customer ID,  Name, City  for those customers whose city=’Mangaluru’ 
b.	Display all the Customer ID,  Name, City  for those customers whose city=’Mangaluru’ in the Descending Order of City and Ascending order of Customer name
c.	Display all the Customer ID,  Name, City  for those customers whose city is either ’Mangaluru’, ‘Mysore’ or ‘Bengaluru’ in the ascending order of City
d.	Display all the  Name, City  for those customers whose  name begins with ‘A’ or ‘C’ and DOB > 1st Jan 1990
e.	Display all the Customer ID,  Name, City  for those customers whose Name ends with letter ‘L’  and   city is NOT  ’Mangaluru’, ‘Mysore’ or ‘Bengaluru’  or ‘Coorg’ in the ascending order of City

f.	Display all the Customer ID,  LoanID, LDate, Lamount  for those customers whose Loan Amount is >50,000 and less than 1,00,000 and Loan Date is before 31st March 2016 in the Descending order of LAmount


*/

-- Create Bank_Customer table
CREATE TABLE Bank_Customer (
    CID INTEGER,
    CName VARCHAR2(100) NOT NULL,
    DOB DATE NOT NULL,
    City VARCHAR2(100) 
);

drop TABLE Bank_Customer;
-- SELECT *from LOANS;
DROP TABLE Loans;
ALTER TABLE Bank_Customer DROP CONSTRAINT Primary;


-- Create Loans table
CREATE TABLE Loans (
    LoanID INTEGER,
    CID INTEGER,
    LDate DATE,
    LAmount NUMBER(10, 2),
    LCloseDate DATE,
    Status CHAR(1)         
);

ALTER TABLE Loans ADD CONSTRAINT chk_LCloseDate CHECK (LCloseDate > LDate);
ALTER TABLE Bank_Customer add CONSTRAINT cname_upper check (CName = UPPER(CName));

ALTER TABLE loans add constraint chk_Status CHECK (Status IN ('A', 'C', 'N'));

-- Insert records into Bank_Customer
INSERT INTO Bank_Customer (CID, CName, DOB, City) VALUES (1, 'ALICE', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'MANGALURU');
INSERT INTO Bank_Customer (CID, CName, DOB, City) VALUES (2, 'BOB', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 'MYSORE');
INSERT INTO Bank_Customer (CID, CName, DOB, City) VALUES (3, 'CHARLIE', TO_DATE('1992-08-20', 'YYYY-MM-DD'), 'BENGALURU');
INSERT INTO Bank_Customer (CID, CName, DOB, City) VALUES (4, 'Loki', TO_DATE('1992-08-20', 'YYYY-MM-DD'), 'GOA');
INSERT INTO Bank_Customer (CID, CName, DOB, City) VALUES (5, 'Maeve', TO_DATE('1992-08-20', 'YYYY-MM-DD'), 'SIOLIM');
INSERT INTO Bank_Customer (CID, CName, DOB, City) VALUES (6, 'JACKL', TO_DATE('1992-08-20', 'YYYY-MM-DD'), 'LOOH');




-- Insert records into Loans
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status) VALUES (1, 1, TO_DATE('2015-01-10', 'YYYY-MM-DD'), 60000.00, TO_DATE('2016-01-10', 'YYYY-MM-DD'), 'A');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status) VALUES (2, 1, TO_DATE('2016-02-15', 'YYYY-MM-DD'), 75000.00, TO_DATE('2017-02-15', 'YYYY-MM-DD'), 'C');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status) VALUES (3, 2, TO_DATE('2014-03-20', 'YYYY-MM-DD'), 50000.00, TO_DATE('2015-03-20', 'YYYY-MM-DD'), 'N');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status) VALUES (4, 3, TO_DATE('2016-04-25', 'YYYY-MM-DD'), 90000.00, TO_DATE('2017-04-25', 'YYYY-MM-DD'), 'A');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status) VALUES (5, 3, TO_DATE('2016-05-30', 'YYYY-MM-DD'), 30000.00, TO_DATE('2017-05-30', 'YYYY-MM-DD'), 'C');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status) VALUES (6, 2, TO_DATE('2015-06-10', 'YYYY-MM-DD'), 85000.00, TO_DATE('2016-06-10', 'YYYY-MM-DD'), 'N');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status) VALUES (7, 1, TO_DATE('2017-07-15', 'YYYY-MM-DD'), 95000.00 , TO_DATE('2018-07-15', 'YYYY-MM-DD'), 'A');
INSERT INTO Loans (LoanID, CID ,LDate ,LAmount ,LCloseDate ,Status ) VALUES (8 ,3 ,TO_DATE('2018-08-20' ,'YYYY-MM-DD') ,40000.00 ,TO_DATE('2019-08-20' ,'YYYY-MM-DD') ,'C');
INSERT INTO Loans (LoanID ,CID ,LDate ,LAmount ,LCloseDate ,Status ) VALUES (9 ,2 ,TO_DATE('2020-09-25' ,'YYYY-MM-DD') ,70000.00 ,TO_DATE('2021-09-25' ,'YYYY-MM-DD') ,'N');

-- Add primary key constraints with names
ALTER TABLE Bank_Customer ADD CONSTRAINT PK_BankCustomer PRIMARY KEY (CID);
ALTER TABLE Loans ADD CONSTRAINT PK_Loans PRIMARY KEY (LoanID);

-- Add foreign key constraint with a name
ALTER TABLE Loans ADD CONSTRAINT FK_Loans_BankCustomer FOREIGN KEY (CID) REFERENCES Bank_Customer(CID);

-- Drop the existing foreign key constraint
ALTER TABLE Loans DROP CONSTRAINT FK_Loans_BankCustomer;

-- Recreate the foreign key with ON DELETE CASCADE option
ALTER TABLE Loans ADD CONSTRAINT FK_Loans_BankCustomer FOREIGN KEY (CID) REFERENCES Bank_Customer(CID) ON DELETE CASCADE;

-- Drop the business rule constraints
ALTER TABLE Loans DROP CONSTRAINT chk_LCloseDate;
ALTER TABLE Bank_Customer DROP CONSTRAINT cname_upper; 

SELECT CID AS "Customer ID", CName AS "Name", City 
FROM Bank_Customer 
WHERE City = 'MANGALURU';

SELECT CID AS "Customer ID", CName AS "Name", City 
FROM Bank_Customer 
WHERE City = 'MANGALURU' 
ORDER BY City DESC, CName ASC;

SELECT CID, CName, City
FROM Bank_Customer
WHERE City IN ('MANGALURU', 'MYSORE', 'BENGALURU')
ORDER BY City ASC;

SELECT *FROM BANK_CUSTOMER WHERE
CNAME LIKE 'A%' OR
CNAME LIKE 'C%' AND DOB > '1-JAN-1990';

SELECT CID, CName, City
FROM Bank_Customer
WHERE CName LIKE '%L'                                               -- Name ends with 'L'
AND City NOT IN ('Mangaluru', 'Mysore', 'Bengaluru', 'Coorg')     -- Exclude specified cities
ORDER BY City ASC;                                                  -- Order results by City in ascending order

SELECT CID, LoanID, LDate, LAmount
FROM Loans
WHERE LAmount > 50000 AND LAmount < 100000                      -- Loan amount conditions
  AND LDate < TO_DATE('2016-03-31', 'YYYY-MM-DD')               -- Loan date condition
ORDER BY LAmount DESC;                                          -- Order results by Loan Amount in descending order

