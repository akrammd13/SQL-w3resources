-- Write a SQL query to add a unique constraint to a column in an existing table.
-- -- Add a unique constraint to the "Name" column to ensure no duplicate names.

USE w3resources
GO

ALTER TABLE dbo.Employees
ADD CONSTRAINT UC_Name UNIQUE(Name); 