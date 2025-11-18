/*
Update using Subquery
Write a SQL query to update records in a table using a subquery to determine the condition.
Update the salary of employees in the same department as EmployeeID = 1. -- Increase the salary by 5000.
*/
--INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department)
--VALUES 
--(1, 'John Doe', 28, 40000, 101),
--(2, 'Priya Sharma', 32, 55000, 102),
--(3, 'Ravi Patel', 25, 32000, 103),
--(4, 'Emily Carter', 29, 48000, 101),
--(5, 'Amit Kumar', 35, 60000, 104),
--(6, 'Sophia Brown', 27, 39000, 103),
--(7, 'Rahul Verma', 30, 45000, 102),
--(8, 'Olivia Wilson', 26, 37000, 105),
--(9, 'Karan Singh', 31, 52000, 104),
--(10, 'Emma Johnson', 24, 31000, 101);

USE w3resources
GO

UPDATE dbo.Employees
SET Salary = Salary + 5000 -- Increase the salary by 5000.
WHERE Department = (SELECT Department FROM dbo.Employees WHERE EmployeeID = 1); -- Use a subquery to find the department of EmployeeID = 1.
