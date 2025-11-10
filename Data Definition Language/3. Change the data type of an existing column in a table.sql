--Write a SQL query to change the data type of an existing column in a table
USE w3resources
GO

ALTER TABLE dbo.Employees
ALTER COLUMN Salary INT;
