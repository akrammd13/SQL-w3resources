--Write a SQL query to remove a column from an existing table.

-- Remove the "Department" column from the "Employees" table.
USE w3resources
GO

ALTER TABLE dbo.Employees
DROP COLUMN Departmrnt;
