--Write a SQL query to rename an existing table.
-- Rename the "Employees" table to "Staff".
USE w3resources
GO
-- Syntax:
-- EXEC sp_rename 'old_table_name', 'new_table_name';

EXEC sp_rename 'Employees', 'Staff';