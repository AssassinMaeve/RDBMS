-- Create the Customers table
CREATE TABLE Customers (
    CID INT, -- Customer ID
    CName VARCHAR(50), -- Customer Name
    City VARCHAR(15), -- City
    DOB DATE -- Date of Birth
);

-- i. Add Primary Key to Customers (CID)
ALTER TABLE Customers 
ADD CONSTRAINT pk_CID PRIMARY KEY (CID);

-- ii. Make Customer Name as Unique Key
ALTER TABLE Customers 
ADD CONSTRAINT uq_CustomerName UNIQUE (CName);

-- iii. Make Customer Id NOT NULL
ALTER TABLE Customers 
MODIFY CID NOT NULL;

-- iv. Make City to accept default value ‘Mangaluru’
ALTER TABLE Customers 
MODIFY City DEFAULT 'Mangaluru';


-- Create the Sales table with initial columns
CREATE TABLE Sales (
    SID INTEGER NOT NULL, -- Sales ID
    SName VARCHAR(25) NOT NULL, -- Sales Name
    DOB DATE NOT NULL, -- Date of Birth
    CID INTEGER, -- Customer ID (Foreign Key)
    City CHAR(20) DEFAULT 'Mangaluru', -- City with default value
    EmailID VARCHAR(20) -- Email ID (to be set as Primary Key later)
);

-- i) Change Primary Key from EmailID to SID
ALTER TABLE Sales 
ADD CONSTRAINT pk_EmailID PRIMARY KEY (EmailID); -- Add primary key constraint on EmailID

ALTER TABLE Sales 
DROP CONSTRAINT pk_EmailID; -- Drop primary key constraint on EmailID

ALTER TABLE Sales 
ADD CONSTRAINT pk_SID PRIMARY KEY (SID); -- Add primary key constraint on SID

-- ii) Add foreign key to Sales (CID)
ALTER TABLE Sales 
ADD CONSTRAINT fk_CustomerID FOREIGN KEY (CID) REFERENCES Customers(CID); -- Add foreign key constraint

-- iii) Add 2 Unique constraints to Sales (SName and EmailID)
ALTER TABLE Sales 
ADD CONSTRAINT uq_SName UNIQUE (SName); -- Unique constraint on SName

ALTER TABLE Sales 
ADD CONSTRAINT uq_EmailID UNIQUE (EmailID); -- Unique constraint on EmailID

-- iv) Change the default value of City from ‘Mangaluru’ to ‘Mysore’
ALTER TABLE Sales 
MODIFY City DEFAULT 'Mysore'; -- Change default value for City

-- Insert records into Sales table
INSERT INTO Sales (SID, SName, DOB, CID, City, EmailID) VALUES (1, 'Alice', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 1, 'Mangaluru', 'alice@example.com');
INSERT INTO Sales (SID, SName, DOB, CID, City, EmailID) VALUES (2, 'Bob', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 2, 'Coorg', 'bob@example.com');
INSERT INTO Sales (SID, SName, DOB, CID, City, EmailID) VALUES (3, 'Charlie', TO_DATE('1992-07-20', 'YYYY-MM-DD'), 3, 'Kasaragod', 'charlie@example.com');
INSERT INTO Sales (SID, SName, DOB, CID, City, EmailID) VALUES (4, 'David', TO_DATE('1988-03-30', 'YYYY-MM-DD'), 4, 'Mangaluru', 'david@example.com');
INSERT INTO Sales (SID, SName, DOB, CID, City, EmailID) VALUES (5, 'Eve', TO_DATE('1995-12-12', 'YYYY-MM-DD'), 5, 'Mysore', 'eve@example.com');
INSERT INTO Sales (SID, SName, DOB, CID, City, EmailID) VALUES (6, 'Frank', TO_DATE('1991-11-11', 'YYYY-MM-DD'), 6, 'Udupi', 'frank@example.com');
INSERT INTO Sales (SID,SName,DOB,CID ,City ,EmailID ) VALUES (7,'Grace','1993-09-09','7','Mangaluru','grace@example.com');
INSERT INTO Sales (SID,SName,DOB,CID ,City ,EmailID ) VALUES (8,'Heidi','1987-06-06','8','Coorg','heidi@example.com');
INSERT INTO Sales (SID,SName,DOB,CID ,City ,EmailID ) VALUES (9,'Ivan','1994-08-08','9','Bangalore','ivan@example.com');
INSERT INTO Sales (SID,SName,DOB,CID ,City ,EmailID ) VALUES (10,'Judy','1996-04-04','10','Kasaragod','judy@example.com');

SELECT * FROM Customers;
commit;

drop table sales;
SELECT * FROM Customer WHERE CID = 1;


