--Write a SQL query to create an index on a column to improve query performance.

-- Create an index on the "Name" column to improve query performance.
USE w3resources
GO

CREATE INDEX idx_Name ON Employees(Name); -- Create an index for faster lookups.
