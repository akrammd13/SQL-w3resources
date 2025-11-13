--Write a SQL query to remove a constraint from an existing table.

-- Remove the unique constraint "UC_Name" from the "Employees" table.

ALTER TABLE Staff
DROP CONSTRAINT DF_Staff_Salary;