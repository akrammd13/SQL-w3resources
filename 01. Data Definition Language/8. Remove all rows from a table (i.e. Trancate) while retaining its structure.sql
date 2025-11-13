--Write a SQL query to remove all rows from a table (i.e. Trancate) while retaining its structure.

USE w3resources
GO

-- First Insert some inputs the 'Employees' table
INSERT INTO Employees (ID, Name, Age, Salary, DepartmentID)
VALUES 
(1, 'John Doe', 28, 40000, 101),
(2, 'Priya Sharma', 32, 55000, 102),
(3, 'Ravi Patel', 25, 32000, 103),
(4, 'Emily Carter', 29, 48000, 101),
(5, 'Amit Kumar', 35, 60000, 104),
(6, 'Sophia Brown', 27, 39000, 103),
(7, 'Rahul Verma', 30, 45000, 102),
(8, 'Olivia Wilson', 26, 37000, 105),
(9, 'Karan Singh', 31, 52000, 104),
(10, 'Emma Johnson', 24, 31000, 101);

-- Now truncate the table i.e. delete all the data from the 'Employees' table
TRUNCATE TABLE Employees;