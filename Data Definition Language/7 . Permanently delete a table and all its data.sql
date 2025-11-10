-- Write a SQL query to permanently delete a table and all its data.
-- Delete the "Departments" table permanently.
USE w3resources
GO

-- Cannot drop table 'Department' because it is being referenced by a FOREIGN KEY constraint.

--In that case, first drop or disable the foreign key constraint.
ALTER TABLE Employees
DROP CONSTRAINT FK_Department;

-- Then drop the "Departments" table
DROP TABLE Departments;