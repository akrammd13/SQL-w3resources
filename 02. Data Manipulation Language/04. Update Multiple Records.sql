--Update Multiple Records
--Write a SQL query to update multiple records in a table based on a specific condition.
-- Increase the salary of all employees aged over 30 by 10%.
USE w3resources
GO

UPDATE dbo.Employees
SET Salary = Salary * 1.10
WHERE age > 30;