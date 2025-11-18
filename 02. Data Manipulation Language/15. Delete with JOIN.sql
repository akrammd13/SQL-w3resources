/*
Delete with JOIN
Write a SQL query to delete records from one table based on a condition derived from a related table using a JOIN.
-- Delete employees who belong to a department that has been marked as inactive.
*/

-- Temporary Departments table
CREATE TABLE #Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    IsActive BIT   -- 1 = Active, 0 = Inactive
);

-- Insert sample data
INSERT INTO #Departments (DepartmentID, DepartmentName, IsActive)
VALUES
(10, 'HR', 0),          -- Inactive
(20, 'Finance', 1),     -- Active
(30, 'IT', 0),          -- Inactive
(40, 'Sales', 1);       -- Active

-- Temporary Employees table
CREATE TABLE #Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Age INT,
    Salary INT,
    DepartmentID INT
);

-- Insert sample employees
INSERT INTO #Employees (Name, Age, Salary, DepartmentID)
VALUES
('John Carter', 30, 50000, 10),   -- Belongs to inactive dept (10)
('Maria Gomez', 26, 46000, 20),   -- Active dept (20)
('Amit Sharma', 33, 55000, 30),   -- Belongs to inactive dept (30)
('Sara Singh', 28, 48000, 40);    -- Active dept (40)

SELECT * FROM #Employees

-- Delete employees who belong to a department that has been marked as inactive.
DELETE E
FROM #Employees E
JOIN #Departments D
ON E.DepartmentID = D.DepartmentID
WHERE D.IsActive = 0;


SELECT * FROM #Employees
