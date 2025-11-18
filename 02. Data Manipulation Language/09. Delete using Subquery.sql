/*
Delete using Subquery
Write a SQL query to delete records from a table using a subquery to determine the condition.
-- Delete employees who work in the same department as EmployeeID = 2.
*/


USE w3resources
GO

DELETE FROM dbo.Employees
WHERE Department = (SELECT Department FROM dbo.Employees WHERE EmployeeID = 2);