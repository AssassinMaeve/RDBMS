-- Write a PL/SQL FUNCTION program to find the Fibonacci series.

CREATE OR REPLACE FUNCTION fibonacci(n NUMBER) RETURN VARCHAR2 IS
	a NUMBER :=0;
	b NUMBER :=1;
	temp NUMBER;
	result VARCHAR2(4000) := '0, 1';
BEGIN
	FOR i IN 3..n LOOP
		temp :=a+b;
		a :=b;
		b :=temp;
		result :=result ||', ' || temp;
	END LOOP;
	RETURN result;
END;
/

DECLARE
	fib_result VARCHAR2(4000);
BEGIN
	fib_result := fibonacci(10);
	DBMS_OUTPUT.PUT_LINE('Fibonacci Series: ' || fib_result);
END;
/