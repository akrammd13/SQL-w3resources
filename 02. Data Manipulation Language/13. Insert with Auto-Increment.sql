/*
Insert with Auto-Increment
Write a SQL query to insert a record into a table where the primary key is auto-generated.
-- Insert a record where EmployeeID is auto-generated.
*/

USE w3resources
GO
-- Creating a table with Identity Primary column
CREATE TABLE Emp (
	ID INT PRIMARY KEY IDENTITY,
	NAME VARCHAR(50) DEFAULT '',
	AGE INT DEFAULT 0,
	SALARY INT DEFAULT 0
);

-- Inserting few data
INSERT INTO dbo.Emp(NAME, AGE, SALARY)  -- Exclude the auto-increment column.
VALUES 
('Mukesh', 25, 20000), -- Provide values for other columns.
('Raja', 30, 35000),
('Hira', 45, 42000);

-- checking the records inside the table
SELECT * FROM dbo.Emp;