-- write a PL/SQL program to find the greatest of three numbers

DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
    c NUMBER := 30;
    greatest NUMBER;
BEGIN
    IF (a > b AND a > c) THEN
        greatest := a;
    ELSIF (b > a AND b > c) THEN
        greatest := b;
    ELSE
        greatest := c;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Greatest number: ' || greatest);
END;
