-- Create a table named "Employees" with columns for ID, Name, Age, and Salary.
-- Define a primary key column for unique identification.
-- Name cannot be null.
-- Age must be greater than 0.
-- Salary is stored as a decimal with 2 decimal places.

USE w3resources
GO

CREATE TABLE Employees (
	ID INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Age INT CHECK(Age > 0),
	Salary DECIMAL(10, 2)
);