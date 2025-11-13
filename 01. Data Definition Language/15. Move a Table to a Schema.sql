--Move a Table to a Schema

--Write a SQL query to move a table from one schema to another.

-- Move the "Staff" table to the "HR" schema.

USE w3resources;
GO

ALTER SCHEMA HR TRANSFER dbo.Staff;

