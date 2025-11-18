/*
Delete Multiple Records
Write a SQL query to delete multiple records from a table based on a specific condition.
-- Delete all employees with a salary less than 50000.
*/
USE w3resources
GO

DELETE FROM dbo.Employees
WHERE Salary < 50000;