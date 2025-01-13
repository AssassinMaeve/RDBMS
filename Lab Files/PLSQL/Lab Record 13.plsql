-- PL/SQL Program to find da, hra and net using CURSOR

SET SERVEROUTPUT ON;

DECLARE
    -- Declaring variables
    emp_no EMP.empno%TYPE;
    emp_name EMP.ename%TYPE;
    emp_salary EMP.salary%TYPE;
    da NUMBER;
    hra NUMBER;
    net_salary NUMBER;

    -- Declaring cursor
    CURSOR emp_cursor IS
        SELECT empno, ename, salary FROM EMP;  -- Cursor to select employee details

BEGIN
    OPEN emp_cursor;  -- Open the cursor

    LOOP
        FETCH emp_cursor INTO emp_no, emp_name, emp_salary;  -- Fetch employee details
        EXIT WHEN emp_cursor%NOTFOUND;                        -- Exit when no more records

        -- Calculate DA (60% of salary) and HRA (20% of salary)
        da := emp_salary * 0.60;
        hra := emp_salary * 0.20;

        -- Calculate Net Salary (Salary + DA + HRA)
        net_salary := emp_salary + da + hra;

        -- Output the results
        DBMS_OUTPUT.PUT_LINE('Emp No: ' || emp_no || ', Name: ' || emp_name || ', Salary: ' || emp_salary || ', DA: ' || da || ', HRA: ' || hra || ', Net Salary: ' || net_salary);
    END LOOP;

    CLOSE emp_cursor;  -- Close the cursor
END;
/

