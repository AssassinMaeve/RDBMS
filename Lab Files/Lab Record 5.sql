/*

i)	Create the following relations					
a.	Persons(PID Int Primary Key, Pname Varchar(20) in Proper case Letters , DOB Date Not Null, City Varchar(15) Not Null, Category char(3))



b.	Deposits (DID Int PK, PID Int FK, Date1 Date Not Null, CDate Date  Cdate>Date1, AcBal Number(10,2) AcBal>0,  DepType  Varchar(15)  accept only ‘Savings’, ‘Recurring’, ‘Fixed’, or ‘Current’ , Status Char(1) accept only ‘A’, ‘S’,’C’)



Note : All the constraints should be added while creating the tables (name all the constraints)

Insert 15 or more  records into  the above tables  					



Do the following queries

a.	Count the total number of records in Persons table for city =’Mangaluru’
b.	Count the number of records in Deposits for savings account and Current Account
c.	Display Status and Total Loan and average loan issued Status wise for dates between 1st Apr 2016 to 31st March 2017
d.	Display Max and Min of Deposit  amount  (AcBal)
e.	Display Total Deposit and Average Deposit amount DepType-wise in the ascending order of DepType
f.	Display Total Deposit amount DepType-wise for sum of amount > 75000  in the descending order TotalAmount
g.	Display  Deposit Type, Total Deposit amount DepType  and Status wise for only AcBal>25,000 
h.	Display  Date1,Deposit Type, Total Deposit amount Datewise  and Deposit Type wise for only Status =’A’ or ‘S’ and sum of amount <80,000  in the Ascending order of Total
Part – II
Aim : i) Learning simple joins (Inner Join)
        ii) Testing Simple joins with aggregate function 


i)	Display PID, Pname, City, DID, AcBal,  DepType in the descending order of Pname 
ii)	Display PID, Pname, City, DID, AcBal,  DepType in the descending order of city name and descending order of Pname 
iii)	Display PID, Pname, City, DID, AcBal,  DepType , Status for City Name=’Mangaluru’ or ‘Coorg’
iv)	Display PID, Pname, City, DID, AcBal,  DepType , Status for City Name=’Mangaluru’ or ‘Coorg’ and Date1 in between 1st Jan 2016 to 31st Dec 2016
v)	Display DepType, Total Deposit and Average Deposit amount DepType-wise in the ascending order of DepType for city=’Mangaluru’
vi)	Display City,Total Deposit and Average Deposit amount Citywise, DepType-wise in the ascending order of city, DepType 
vii)	Display City, Total Deposit  City-wise for AcBal>10,000 in the ascending order of City
viii)	Display City, DepType, Total Deposit  Citywise, DepType-wise for TotalDepo amount >50,000 


*/

CREATE TABLE Persons (
    PID INT PRIMARY KEY,
    Pname VARCHAR(20) CHECK (Pname = INITCAP(Pname)), -- Proper case constraint
    DOB DATE NOT NULL,
    City VARCHAR(15) NOT NULL,
    Category CHAR(3),
    CONSTRAINT chk_City CHECK (City IS NOT NULL)
);

CREATE TABLE Deposits (
    DID INT PRIMARY KEY,
    PID INT,
    Date1 DATE NOT NULL,
    CDate DATE,
    AcBal NUMBER(10,2) CHECK (AcBal > 0),
    DepType VARCHAR(15) CHECK (DepType IN ('Savings', 'Recurring', 'Fixed', 'Current')),
    Status CHAR(1) CHECK (Status IN ('A', 'S', 'C')),
    CONSTRAINT chk_CDate CHECK (CDate > Date1),
    CONSTRAINT fk_PID FOREIGN KEY (PID) REFERENCES Persons(PID)
);

INSERT INTO Persons (PID, Pname, DOB, City, Category) VALUES 
(1, 'Alice Johnson', date '1990-05-15', 'Mangaluru', 'C01'),
(2, 'Bob Smith', date '1985-03-22', 'Coorg', 'C02'),
(3, 'Charlie Brown', date '1978-12-30', 'Mangaluru', 'C01'),
(4, 'Diana Prince', date '1982-07-04', 'Bangalore', 'C03'),
(5, 'Edward Elric', date '1995-09-23', 'Mangaluru', 'C01'),
(6, 'Fiona Gallagher', date '1988-11-11', 'Coorg', 'C02'),
(7, 'George Washington', date '1965-02-22', 'Delhi', 'C03'),
(8, 'Hannah Baker', date '1992-06-12', 'Mangaluru', 'C01'),
(9, 'Ian Malcolm', date '1970-10-12', 'Mumbai', 'C02'),
(10, 'Julia Roberts', date '1980-04-20', 'Mangaluru', 'C01'),
(11, 'Kevin Hart', date '1985-07-07', 'Coorg', 'C02'),
(12, 'Laura Croft', date '1993-01-15', 'Chennai', 'C03'),
(13, 'Mike Tyson', date '1970-06-30', 'Mangaluru', 'C01'),
(14, 'Nina Simone', date'1960-05-05', 'Coorg', 'C02'),
(15, 'Oscar Wilde', date '1854-10-16', 'London', null);

INSERT INTO Deposits (DID, PID, Date1, CDate, AcBal, DepType, Status) VALUES 
(1, 1, TO_DATE('2023-01-15','YYYY-MM-DD'), TO_DATE('2023-02-15','YYYY-MM-DD'), 15000.00,  'Savings', 'A'),
(2, 2, TO_DATE('2023-02-20','YYYY-MM-DD'), TO_DATE('2023-03-20','YYYY-MM-DD'), 25000.00, 'Current', 'A'),
(3, 3, TO_DATE('2023-03-10','YYYY-MM-DD'), TO_DATE('2023-04-10','YYYY-MM-DD'), 10000.00, 'Recurring', 'S'),
(4, 4, TO_DATE('2023-04-05','YYYY-MM-DD'), TO_DATE('2023-05-05','YYYY-MM-DD'), 30000.00, 'Fixed', 'A'),
(5, 5, TO_DATE('2023-05-25','YYYY-MM-DD'), TO_DATE('2023-06-25','YYYY-MM-DD'), 20000.00, 'Savings', 'A'),
(6, 6, TO_DATE('2023-06-15','YYYY-MM-DD'), TO_DATE('2023-07-15','YYYY-MM-DD'), 18000.00,'Current', 'A'),
(7, 7, TO_DATE('2023-07-20','YYYY-MM-DD'), TO_DATE('2023-08-20','YYYY-MM-DD'), 22000.00,'Recurring', 'S'),
(8, 8, TO_DATE('2023-08-30','YYYY-MM-DD'), TO_DATE('2023-09-30','YYYY-MM-DD'), 17000.00,'Fixed', 'A'),
(9, 9, TO_DATE('2023-09-10','YYYY-MM-DD'), TO_DATE('2023-10-10','YYYY-MM-DD'), 16000.00,'Savings', 'A'),
(10, 10, TO_DATE('2023-10-25','YYYY-MM-DD'), TO_DATE('2023-11-25','YYYY-MM-DD'), 28000.00,'Recurring', 'S'),
(11, 11, TO_DATE('2022-11-01','YYYY-MM-DD'), TO_DATE('2022-12-01','YYYY-MM-DD'), 120000.00,'Fixed', 'A'),
(12, 12, TO_DATE('2019-09-01','YYYY-MM-DD'), TO_DATE('2019-09-30','YYYY-MM-DD'), 5000.00,'Current', 'C'),
(13, 13 ,TO_DATE('2018-08-01','YYYY-MM-DD'), TO_DATE('2018-08-30','YYYY-MM-DD'), 7500.00,'Recurring', 'S'),
(14 ,14 ,TO_DATE('2017-07-01','YYYY-MM-DD'),TO_DATE('2017-07-30','YYYY-MM-DD'), 6000.00,'Savings', 'A'),
(15 ,15 ,TO_DATE('2016-06-01','YYYY-MM-DD'),TO_DATE('2016-06-10','YYYY-MM-DD'),4500.00,'Fixed','A');

-- a. Count the total number of records in Persons table for city = ’Mangaluru’
SELECT COUNT(*) AS Total_Records
FROM Persons
WHERE City = 'Mangaluru';


DROP table Deposits;
DROP table Persons;
SELECT *from Deposits;
select *from Persons;

-- Count the number of records in Deposits for savings account and current account
SELECT 
    COUNT(*) AS Total_Savings_Accounts 
FROM Deposits 
WHERE DepType = 'Savings'
UNION ALL
SELECT 
    COUNT(*) AS Total_Current_Accounts 
FROM Deposits 
WHERE DepType = 'Current';

-- c. Display Status and Total Loan and average loan issued Status wise for dates between April 1st 2016 to March 31st 2017
SELECT 
    Status,
    SUM(AcBal) AS Total_Loan,
    AVG(AcBal) AS Average_Loan
FROM Deposits
WHERE Date1 BETWEEN TO_DATE('2016/04/01','yyyy/mm/dd') AND TO_DATE('2017/03/31','yyyy/mm/dd')
GROUP BY Status;

-- d. Display Max and Min of Deposit amount (AcBal)
SELECT 
    MAX(AcBal) AS Max_Deposit,
    MIN(AcBal) AS Min_Deposit
FROM Deposits;

-- e. Display Total Deposit and Average Deposit amount DepType-wise in ascending order of DepType
SELECT 
    DepType,
    SUM(AcBal) AS Total_Deposit,
    AVG(AcBal) AS Average_Deposit
FROM Deposits
GROUP BY DepType
ORDER BY DepType ASC;

-- f. Display Total Deposit amount DepType-wise for sum of amount > 75000 in descending order TotalAmount
SELECT 
    DepType,
    SUM(AcBal) AS Total_Deposit_Amount
FROM Deposits
GROUP BY DepType
HAVING SUM(AcBal) > 75000
ORDER BY Total_Deposit_Amount DESC;

-- g. Display Deposit Type and Total Deposit amount DepType and Status wise for only AcBal > 25,000
SELECT 
    DepType,
    SUM(AcBal) AS Total_Deposit_Amount,
    Status
FROM Deposits
WHERE AcBal > 25000
GROUP BY DepType, Status;

-- h. Display Date1 and Deposit Type and Total Deposit amount Datewise and Deposit Type wise for only Status = ’A’ or ’S’ and sum of amount <80,000 in ascending order of Total
SELECT 
    Date1,
    DepType,
    SUM(AcBal) AS Total_Deposit_Amount
FROM Deposits
WHERE Status IN ('A', 'S')
GROUP BY Date1, DepType
HAVING SUM(AcBal) < 80000
ORDER BY Total_Deposit_Amount ASC;

-- Part III: Simple Joins with Aggregate Functions
-- i. Display PID, Pname, City, DID, AcBal in descending order of Pname
SELECT 
    p.PID,
    p.Pname,
    p.City,
    d.DID,
    d.AcBal,
    d.DepType
FROM Persons p 
JOIN Deposits d ON p.PID = d.PID 
ORDER BY p.Pname DESC;

-- ii. Display PID,Pname ,City,DID ,AcBal in descending order of city name and descending order of Pname
SELECT 
    p.PID,
    p.Pname,
    p.City,
    d.DID,
    d.AcBal,
    d.DepType
FROM Persons p 
JOIN Deposits d ON p.PID = d.PID 
ORDER BY p.City DESC ,p.Pname DESC;

-- iii. Display PID,Pname ,City,DID ,AcBal in descending order of city name and descending order of Pname
SELECT 
   p.PID,
   p.Pname,
   p.City,
   d.DID,
   d.AcBal,
   d.DepType ,
   d.Status  
FROM Persons p 
JOIN Deposits d ON p.PID = d.PID  
WHERE p.City IN ('Mangaluru');

-- iv. Display PID,Pname ,City,DID ,AcBal in descending order of city name and descending order of Pname
SELECT 
   p.PID,
   p.Pname,
   p.City,
   d.DID,
   d.AcBal,
   d.DepType,
   d.Status
FROM Persons p 
JOIN Deposits d ON p.PID = d.PID  
WHERE (p.City = 'Mangaluru' OR p.City = 'Coorg') 
AND d.Date1 BETWEEN TO_DATE('2016/01/01', 'yyyy/mm/dd') 
AND TO_DATE('2016/12/31', 'yyyy/mm/dd');


-- v. Display DepType ,Total Deposit and Average Deposit amount DepType-wise in the ascending order of DepType for city=’Mangaluru’
SELECT 
   d.DepType ,
   SUM(d.AcBal) AS Total_Deposit ,
   AVG(d.AcBal) AS Average_Deposit  
FROM Persons p 
JOIN Deposits d ON p.PID = d.PID  
WHERE p.City = 'Mangaluru'
GROUP BY d.DepType  
ORDER BY d.DepType ASC;

-- vi. Display City ,Total Deposit and Average Deposit amount Citywise ,DepType-wise in the ascending order of city ,DepType
SELECT 
   p.City ,
   d.DepType ,
   SUM(d.AcBal) AS Total_Deposit ,
   AVG(d.AcBal) AS Average_Deposit  
FROM Persons p 
JOIN Deposits d ON p.PID = d.PID  
GROUP BY p.City,d.DepType  
ORDER BY p.City ASC,d.DepType ASC;

-- vii. Display City ,Total Deposit City-wise for AcBal>10 ,000 in the ascending order of City
SELECT 
   p.City ,
   SUM(d.AcBal) AS Total_Deposit  
FROM Persons p 
JOIN Deposits d ON p.PID = d.PID  
WHERE d.AcBal >10000  
GROUP BY p.City  
ORDER BY p.City ASC;

-- viii. Display City ,DepType ,Total Deposit Citywise ,DepType-wise for TotalDepo amount >50 ,000
SELECT 
   p.City ,
   d.DepType ,
   SUM(d.AcBal) AS Total_Deposit  
FROM Persons p 
JOIN Deposits d ON p.PID = d.PID  
GROUP BY p.City,d.DepType  
HAVING SUM(d.AcBal)>50000 ;

