-- Write a PL/SQL PROCEDURE Program to find the average of 5 numbers

CREATE OR REPLACE PROCEDURE 

calculate_average(num1 NUMBER, num2 NUMBER, num3 NUMBER, num4 NUMBER, num5 NUMBER)
IS avg_result NUMBER;
BEGIN
    avg_result := (num1 + num2 + num3 + num4 + num5) / 5;
    DBMS_OUTPUT.PUT_LINE('Average is: ' || avg_result);
END;
/

BEGIN
    calculate_average(10,20,30,40,50);
END;
/