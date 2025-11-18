-- Update a Single Record
-- Write a SQL query to update a single record in a table based on a specific condition.
-- Update the salary of an employee with EmployeeID = 1.
USE w3resources
GO

UPDATE dbo.Employees
SET Salary = 55000
WHERE EmployeeID = 1;
