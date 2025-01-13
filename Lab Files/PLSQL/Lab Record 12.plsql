-- PL/SQL Program to find total and average marks using CURSOR

DECLARE
    CURSOR marks_cursor IS
        SELECT marks FROM students;  -- Cursor to select marks from students table

    total_marks NUMBER := 0;        -- Variable to hold total marks
    record_count NUMBER := 0;       -- Variable to count number of records (renamed)
    fetched_mark NUMBER;            -- Variable to hold fetched mark
    average_marks NUMBER;           -- Variable to hold average marks
BEGIN
    OPEN marks_cursor;               -- Open the cursor

    LOOP
        FETCH marks_cursor INTO fetched_mark;  -- Fetch each mark into fetched_mark
        EXIT WHEN marks_cursor%NOTFOUND;      -- Exit when no more records

        record_count := record_count + 1;      -- Increment count for each mark fetched
        total_marks := total_marks + fetched_mark;  -- Add to total marks
    END LOOP;

    CLOSE marks_cursor;                  -- Close the cursor

    IF record_count > 0 THEN              -- Check if count is greater than zero to avoid division by zero
        average_marks := total_marks / record_count;  -- Calculate average
        DBMS_OUTPUT.PUT_LINE('Total Marks: ' || total_marks);   -- Output total marks
        DBMS_OUTPUT.PUT_LINE('Average Marks: ' || average_marks);  -- Output average marks
    ELSE
        DBMS_OUTPUT.PUT_LINE('No records found.');  -- Handle case with no records
    END IF;
END;
