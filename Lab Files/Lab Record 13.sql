-- This table is required to be created otherwise the PLSQL Lab Record 13 will not work.

CREATE TABLE EMP (
    empno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(50),
    salary NUMBER(10, 2)
);

INSERT INTO EMP (empno, ename, salary) VALUES (1, 'Alice', 50000);
INSERT INTO EMP (empno, ename, salary) VALUES (2, 'Bob', 60000);
INSERT INTO EMP (empno, ename, salary) VALUES (3, 'Charlie', 55000);
INSERT INTO EMP (empno, ename, salary) VALUES (4, 'David', 70000);
INSERT INTO EMP (empno, ename, salary) VALUES (5, 'Eve', 80000);

COMMIT; -- Commit the transaction to save the data



