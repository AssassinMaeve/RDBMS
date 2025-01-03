-- Write a PL/SQL PROCEDURE program to check whether a given number is prime or not.

CREATE OR REPLACE PROCEDURE check_prime(n NUMBER) IS
    is_prime BOOLEAN := TRUE;
BEGIN
    IF n <= 1 THEN
        is_prime := FALSE;
    ELSE
        FOR i IN 2..FLOOR(SQRT(n)) LOOP
            IF MOD(n, i) = 0 THEN
                is_prime := FALSE;
                EXIT;
            END IF;
        END LOOP;
    END IF;
    IF is_prime THEN
        DBMS_OUTPUT.PUT_LINE(n || ' is a prime number.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(n || ' is not a prime number.');
    END IF;
END;
/

BEGIN
    check_prime(17);
    check_prime(18);
END;
/