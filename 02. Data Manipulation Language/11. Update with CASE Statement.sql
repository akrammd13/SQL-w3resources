/*
Update with CASE Statement
Write a SQL query to update records in a table using conditional logic with a CASE statement.
-- Update salaries based on age: increase by 5000 if age > 30, otherwise increase by 2000.
*/

USE w3resources
GO

UPDATE dbo.Employees
SET Salary = (
	CASE	
		WHEN age > 30 THEN (Salary + 5000)
		ELSE Salary + 2000
	END
);

