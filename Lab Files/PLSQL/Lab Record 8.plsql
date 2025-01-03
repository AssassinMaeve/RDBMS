-- Write a PL/SQL FUNCTION program to find the factorial of given number.

CREATE OR REPLACE FUNCTION factorial(n IN NUMBER) 
RETURN NUMBER IS result NUMBER := 1;

BEGIN
 IF n= 0 THEN
 	RETURN 1;
 END IF;
 FOR i IN 1..n LOOP
	 result:=result * i;
 END LOOP;
 RETURN result;
 END;
/

DECLARE
	num NUMBER := 5;
	fact NUMBER;
BEGIN
	fact:=factorial(num);
	DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || 'is:'|| fact);
END;
/