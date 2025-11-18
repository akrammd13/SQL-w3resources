/*
Update and Reset a Column
Write a SQL query to reset the value of a specific column to NULL for all rows in a table.
-- Reset the "Age" column to NULL for all employees.
*/

USE w3resources
GO

-- creating a copy-table of Employees
SELECT *
INTO #EmployeesCopy
FROM Employees

-- see the records if #EmployeesCopy
SELECT * FROM #EmployeesCopy;


-- Reset the "Age" column to NULL for all employees.
UPDATE #EmployeesCopy
SET Age = Null;


/* NOte
Create a Temporary Table + Copy All Records (SQL Server)
--> Method 1: Create temp table automatically from a SELECT

This is the fastest and most common method.

SELECT *
INTO #TempEmployees
FROM Employees;

- Creates a temp table named #TempEmployees
- Copies all rows and all columns
- Data types are copied automatically
- No need to define columns manually

--> Method 2: Create temp table first, then insert

Use if you want full control over column types.

-- Create the temp table
CREATE TABLE #TempEmployees (
    ID INT,
    Name VARCHAR(100),
    Age INT,
    Salary INT
);

-- Insert all records
INSERT INTO #TempEmployees
SELECT *
FROM Employees;


- More control
- Useful when you want custom datatypes or additional columns

- Note (SQL Server Specific)

Temporary tables start with #

They are stored in tempdb

They auto-delete when the session ends

ANSI SQL does NOT have temp tables — SQL Server feature

*/