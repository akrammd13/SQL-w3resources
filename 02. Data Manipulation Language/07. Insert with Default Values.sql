/*
Insert with Default Values
Write a SQL query to insert a record into a table with default values for unspecified columns.
-- Insert a record with default values for unspecified columns.
*/

USE w3resources
GO

INSERT INTO dbo.Employees(EmployeeID, Name) -- Specify only some columns.
VALUES (6, 'David Warner'); -- Provide values for specified columns; others use defaults.