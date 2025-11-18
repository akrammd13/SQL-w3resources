USE w3resources
GO

-- create a table
CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(5,2)
);

-- insert the data
INSERT INTO Salesman (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog',  'New York', 0.15),
(5002, 'Nail Knite',  'Paris',     0.13),
(5005, 'Pit Alex',    'London',    0.11),
(5006, 'Mc Lyon',     'Paris',     0.14),
(5007, 'Paul Adam',   'Rome',      0.13),
(5003, 'Lauson Hen',  'San Jose',  0.12);

--1. Display All Salespeople
--Write a SQL statement that displays all the information about all salespeople.
SELECT * FROM dbo.Salesman;