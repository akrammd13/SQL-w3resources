--Write a SQL query to create a foreign key relationship between two tables.

-- Create a new table "Departments" and link it to "Employees" using a foreign key.

USE w3resources
GO

-- Create a new table "Departments"
CREATE TABLE Departments(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(50)
);

-- Create a new column "DepartmentID" in Employees table
ALTER TABLE Employees
ADD DepartmentID INT;

-- 
ALTER TABLE Employees
ADD CONSTRAINT FK_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);