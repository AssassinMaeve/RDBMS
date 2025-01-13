-- This table is required to be created otherwise the PLSQL Lab Record 12 will not work.

CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(100),
    marks NUMBER
);

INSERT INTO students (student_id, student_name, marks) VALUES (1, 'Alice', 85);
INSERT INTO students (student_id, student_name, marks) VALUES (2, 'Bob', 78);
INSERT INTO students (student_id, student_name, marks) VALUES (3, 'Charlie', 92);
INSERT INTO students (student_id, student_name, marks) VALUES (4, 'David', 88);
INSERT INTO students (student_id, student_name, marks) VALUES (5, 'Eve', 95);

COMMIT; -- Commit the transaction to save the data

