-- Write a PL/SQL program to find the natural numbers using loop

declare
	limit number:=5;
begin
	for i in 1..limit loop
		dbms_output.put_line(i);
	end loop;
end;
