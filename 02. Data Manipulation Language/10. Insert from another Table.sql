/*
Insert from another Table
Write a SQL query to copy data from one table into another table.
-- Insert employees from the "OldEmployees" table into the "Employees" table.
*/

USE w3resources
GO

---- Create the OldEmployees table
--CREATE TABLE OldEmployees (
--    ID INT,
--    Name VARCHAR(100),
--    Age INT,
--    Salary INT
--);
--GO

---- Insert sample records
--INSERT INTO OldEmployees (ID, Name, Age, Salary)
--VALUES 
--(101, 'John Carter', 28, 45000),
--(102, 'Maria Gomez', 32, 52000),
--(103, 'Amit Sharma', 29, 48000),
--(104, 'Sana Sheikh', 35, 60000),
--(105, 'Robert Brown', 30, 50000);
--GO

INSERT INTO dbo.Employees(EmployeeID, Name, Age, Salary)
SELECT ID, Name, Age, Salary
FROM dbo.OldEmployees;

