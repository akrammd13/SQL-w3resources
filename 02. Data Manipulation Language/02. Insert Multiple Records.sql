--Insert Multiple Records
--Write a SQL query to insert multiple records into a table in a single operation.
-- Insert multiple employee records into the "Employees" table.
USE w3resources
GO

INSERT INTO dbo.Employees(EmployeeID, Name, Age, Salary)
VALUES
(2, 'Berna Alder', 20, 25000),
(3, 'Khayri Ivo', 28, 52000),
(4, 'Teppo Abel', 35, 60000);
