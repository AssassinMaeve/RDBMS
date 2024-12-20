/*

Create a table named Student_Bio(Regno Int Primary Key, Sname Varchar(20) Not Null, DOB date Not Null, City varchar(15), Category varchar(3) should accept only  ‘GEN’,’OBC’,’SC’,’ST’, Total_Marks number(3) Total_Marks >0)
Note : Add Constraints while creating tables and also name the constraints
i)	Display all the Regno, City, Sname,Total Marks in the Ascending order of City descending order of Total_Marks
ii)	Display all the Regno, City, Sname,TotalMarks for Category =”SC” or “ST” in the Descending order of Marks and descending order of SName
iii)	Display all students who do not belong to city ‘Mangalore’, ‘Kasaragod’ and ‘Coorg’ and whose category is NOT  ‘SC’ and DOB is in between 1st Jan 1990 and Jun 30th 1999
iv)	Display all the student name, city name, dob whose name begins with letter ‘A’  or letter ‘M’  in the ascending order of city
v)	Display all the Regno and Marks for those whose marks are in between 300 and 500 and who do not belong to City ‘Mysore’, ‘Bangalore’, ‘Mangalore’
vi)	Display all the Regno and Marks for those whose marks are in between 500 and 550 and City is either ‘Mangalore’ or ‘Udupi’  and Category is either ‘OBC’ or ‘GEN’
vii)	Display all the Regno and Marks for those whose marks are in between 300 and 550  and Category is either ‘OBC’ or ‘GEN’ and City name ends with letter ‘e’ in the descending order of Total_marks


Part -II
Consider the following Tables and  the execute the given queries

a.	Bank_Customer(CID Integer, Cname NN, DOB NN, City NN  City Name in Capital Letters)
b.	Loans(LoanID Integer , CID Integer , LDate Date, LAmount  Number(10,2), LCloseDate Date, Status Char(1), Ltype varChar(10)  ‘Personal’, ‘Consumer’,’Vehicle’)


a.	Count the total records in Bank_customers whose city is not null
b.	Display Max and Min Loan amount 
c.	Display Datewise Total of Loan where the total loan<60,000
d.	Display Total Loan and average loan issued Date wise in the ascending order of date
e.	Display Status and Total Loan and average loan issued Status wise for dates between 1st Jan 2015 to 31st March 2017
f.	Display the total loan amount  Status wise (only for  Personal Loan) 
g.	Display Total loan amount based on type and status NOT ‘C’ and amount<50000
h.	Display Total loan amount based on type and for the total amount in between 3 Lacs to 5Lacs and Date <31st march 2016
i.	Display the total count of Loans Status wise in each category in the descending order of type

*/

-- Create the table without constraints first
CREATE TABLE Student_Bio (
    Regno INT PRIMARY KEY,
    Sname VARCHAR(20) NOT NULL,
    DOB DATE NOT NULL,
    City VARCHAR(15),
    Category VARCHAR(3) check (Category IN ('GEN', 'OBC', 'SC', 'ST')),
    Total_Marks NUMBER(3) CHECK (Total_Marks > 0)
);

-- Now add constraints separately
ALTER TABLE Student_Bio 
ADD CONSTRAINT chk_Category CHECK (Category IN ('GEN', 'OBC', 'SC', 'ST'));

ALTER TABLE Student_Bio 
ADD CONSTRAINT chk_TotalMarks CHECK (Total_Marks > 0);


-- i) Display all the Regno, City, Sname, Total Marks in ascending order of City and descending order of Total_Marks
SELECT Regno, City, Sname, Total_Marks 
FROM Student_Bio 
ORDER BY City ASC, Total_Marks DESC;

INSERT INTO STUDENT_BIO (REGNO,SNAME,DOB,CITY,CATEGORY,TOTAL_MARKS) VALUES (1, 'Maeve', TO_DATE ('2001-11-12','YYYY-MM-DD'), 'mangalore', 'GEN', 500);
INSERT INTO STUDENT_BIO (REGNO,SNAME,DOB,CITY,CATEGORY,TOTAL_MARKS) VALUES (2, 'Ahio', TO_DATE ('2001-12-01','YYYY-MM-DD'), 'udupi', 'SC', 500);
INSERT INTO STUDENT_BIO (REGNO,SNAME,DOB,CITY,CATEGORY,TOTAL_MARKS) VALUES (3, 'Pat', TO_DATE ('2001-11-12','YYYY-MM-DD'), 'goa', 'ST', 200);
INSERT INTO STUDENT_BIO (REGNO,SNAME,DOB,CITY,CATEGORY,TOTAL_MARKS) VALUES (4, 'Sammy', TO_DATE ('2001-11-08','YYYY-MM-DD'), 'goa', 'OBC', 100);
INSERT INTO STUDENT_BIO (REGNO,SNAME,DOB,CITY,CATEGORY,TOTAL_MARKS) VALUES (5, 'Glen', TO_DATE ('1992-11-08','YYYY-MM-DD'), 'goa', 'OBC', 100);
INSERT INTO STUDENT_BIO (REGNO,SNAME,DOB,CITY,CATEGORY,TOTAL_MARKS) VALUES (6, 'Slade', TO_DATE ('1995-11-08','YYYY-MM-DD'), 'Siolim', 'OBC', 100);
INSERT INTO STUDENT_BIO (REGNO,SNAME,DOB,CITY,CATEGORY,TOTAL_MARKS) VALUES (7, 'Adlyn', TO_DATE ('1995-11-08','YYYY-MM-DD'), 'mangalore', 'OBC', 510);
INSERT INTO STUDENT_BIO (REGNO,SNAME,DOB,CITY,CATEGORY,TOTAL_MARKS) VALUES (8, 'Suvi', TO_DATE ('1995-11-08','YYYY-MM-DD'), 'mangalore', 'OBC', 520);
INSERT INTO STUDENT_BIO (REGNO,SNAME,DOB,CITY,CATEGORY,TOTAL_MARKS) VALUES (9, 'Gayu', TO_DATE ('1995-11-08','YYYY-MM-DD'), 'mangalore', 'OBC', 530);



-- ii) Display all the Regno, City, Sname, Total Marks for Category = 'SC' or 'ST' in descending order of Marks and descending order of SName
SELECT Regno, City, Sname, Total_Marks 
FROM Student_Bio 
WHERE Category IN ('SC', 'ST') 
ORDER BY Total_Marks DESC, Sname DESC;


-- iii) Display all students who do not belong to city ‘Mangalore’, ‘Kasaragod’ and ‘Coorg’ 
-- and whose category is NOT ‘SC’ and DOB is between 1st Jan 1990 and Jun 30th 1999
SELECT * 
FROM Student_Bio 
WHERE City NOT IN ('Mangalore', 'Kasaragod', 'Coorg') 
AND Category != 'SC' 
AND DOB BETWEEN DATE'1990-01-01' AND DATE '1999-06-30';


-- iv) Display all the student name, city name, dob whose name begins with letter ‘A’ or letter ‘M’ in ascending order of city
SELECT Sname, City, DOB 
FROM Student_Bio 
WHERE Sname LIKE 'A%' OR Sname LIKE 'M%' 
ORDER BY City ASC;

-- v) Display all the Regno and Marks for those whose marks are between 300 and 500 
-- and who do not belong to City ‘Mysore’, ‘Bangalore’, ‘Mangalore’
SELECT Regno, Total_Marks 
FROM Student_Bio 
WHERE Total_Marks BETWEEN 300 AND 500 
AND City NOT IN ('Mysore', 'Bangalore', 'Mangalore');

-- vi) Display all the Regno and Marks for those whose marks are between 500 and 550 
-- and City is either ‘Mangalore’ or ‘Udupi’ and Category is either ‘OBC’ or ‘GEN’
SELECT Regno, Total_Marks 
FROM Student_Bio 
WHERE Total_Marks BETWEEN 500 AND 550 
AND City IN ('mangalore', 'udupi') 
AND Category IN ('OBC', 'GEN');

-- vii) Display all the Regno and Marks for those whose marks are between 300 and 550  
-- and Category is either ‘OBC’ or ‘GEN’ and City name ends with letter ‘e’ in descending order of Total_marks
SELECT Regno, Total_Marks 
FROM Student_Bio 
WHERE Total_Marks BETWEEN 300 AND 550 
AND Category IN ('OBC', 'GEN') 
AND City LIKE '%e' 
ORDER BY Total_Marks DESC;

----------------------------------------------------------------------------------------------------------------------------

-- a)	Bank_Customer(CID Integer, Cname NN, DOB NN, City NN  City Name in Capital Letters)
CREATE TABLE Bank_Customer (
    CID INTEGER PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    City VARCHAR(50) NOT NULL CHECK (UPPER(City) = City)
);

INSERT INTO BANK_CUSTOMER (CID,Cname,DOB,City) VALUES (1, 'Maeve', DATE '2001-11-12', 'MANGALORE');
INSERT INTO BANK_CUSTOMER (CID,Cname,DOB,City) VALUES (2, 'Glen', DATE '1999-11-12', 'MANGALORE');
INSERT INTO BANK_CUSTOMER (CID,Cname,DOB,City) VALUES (3, 'Pat', DATE '2003-11-12', 'GOA');
INSERT INTO BANK_CUSTOMER (CID,Cname,DOB,City) VALUES (4, 'Sammy', DATE '2003-11-12', 'MANGALORE');
INSERT INTO BANK_CUSTOMER (CID,Cname,DOB,City) VALUES (5, 'Justin', DATE '1995-11-12', 'UDUPI');
INSERT INTO BANK_CUSTOMER (CID,Cname,DOB,City) VALUES (6, 'Myron', DATE '1985-11-12', 'GOA');


-- b)	Loans(LoanID Integer , CID Integer , LDate Date, LAmount  Number(10,2), LCloseDate Date, Status Char(1), Ltype varChar(10)  ‘Personal’, ‘Consumer’,’Vehicle’)
CREATE TABLE Loans (
    LoanID INTEGER PRIMARY KEY,
    CID INTEGER,
    LDate DATE,
    LAmount NUMBER(10,2),
    LCloseDate DATE,
    Status CHAR(1),
    LType VARCHAR(10) CHECK (LType IN ('Personal', 'Consumer', 'Vehicle')),
    FOREIGN KEY (CID) REFERENCES Bank_Customer(CID)
);

INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (1, 1, date '2023-01-15', 15000, NULL, 'A', 'Personal');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (2, 2, date'2023-02-20', 25000.00, NULL, 'A', 'Vehicle');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (3, 3, date'2023-03-10', 10000.00, NULL, 'A', 'Consumer');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (4, 4, date'2023-04-05', 30000.00, NULL, 'A', 'Personal');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (5, 5, date'2023-05-25', 20000.00, NULL, 'A', 'Vehicle');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (6, 6, date'2023-06-15', 18000.00, NULL, 'A', 'Consumer');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (7, 7, date'2023-07-20', 22000.00, NULL, 'A', 'Personal');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (8, 8, date'2023-08-30', 17000.00, NULL, 'A', 'Vehicle');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (9, 9, date'2023-09-10', 16000.00, NULL, 'A', 'Consumer');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (10, 10, date '2023-10-25', 28000.00, NULL, 'A', 'Personal');
INSERT INTO Loans (LoanID, CID, LDate, LAmount, LCloseDate, Status, LType) VALUES (11, 11, date '2016-10-25', 29000.00, NULL, 'A', 'Personal');


-- a. Count the total records in Bank_Customers whose city is not null
SELECT COUNT(*) AS Total_Customers FROM Bank_Customer WHERE City IS NOT NULL;

-- b. Display Max and Min Loan amount
SELECT MAX(LAmount) AS Max_Loan_Amount, MIN(LAmount) AS Min_Loan_Amount FROM Loans;

-- c. Display Datewise Total of Loan where the total loan < 60,000
SELECT LDate, SUM(LAmount) AS Total_Loan_Amount
FROM Loans
GROUP BY LDate
HAVING SUM(LAmount) < 60000;

-- d. Display Total Loan and average loan issued Date wise in ascending order of date
SELECT LDate, SUM(LAmount) AS Total_Loan_Amount, AVG(LAmount) AS Average_Loan_Amount
FROM Loans
GROUP BY LDate
ORDER BY LDate ASC;

-- e. Display Status and Total Loan and average loan issued Status wise for dates between 1st Jan 2015 to 31st March 2017
SELECT Status, SUM(LAmount) AS Total_Loan_Amount, AVG(LAmount) AS Average_Loan_Amount
FROM Loans
WHERE LDate BETWEEN TO_DATE('2015-01-01', 'YYYY-MM-DD') AND TO_DATE('2017-03-31', 'YYYY-MM-DD')
GROUP BY Status;

-- f. Display the total loan amount Status wise (only for Personal Loan)
SELECT Status, SUM(LAmount) AS Total_Loan_Amount
FROM Loans
WHERE LType = 'Personal'
GROUP BY Status;

-- g. Display Total loan amount based on type and status NOT ‘C’ and amount < 50000
SELECT LType, Status, SUM(LAmount) AS Total_Loan_Amount
FROM Loans
WHERE Status != 'C' AND LAmount < 50000
GROUP BY LType, Status;

-- h. Display Total loan amount based on type for the total amount in between 3 Lacs to 5Lacs and Date <31st march 2016
SELECT LType, SUM(LAmount) AS Total_Loan_Amount
FROM Loans
WHERE LAmount BETWEEN 300000 AND 500000 AND LDate < TO_DATE('2016-03-31', 'YYYY-MM-DD')
GROUP BY LType;

-- i. Display the total count of Loans Status wise in each category in descending order of type
SELECT LType, Status, COUNT(*) AS Loan_Count
FROM Loans
GROUP BY LType, Status
ORDER BY LType DESC;


