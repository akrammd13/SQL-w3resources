--Write a SQL query to assign a default value to a column in an existing table.

-- Set a default value of 0 for the "Employees" column.
/*
SYNTAX : 
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
DEFAULT default_value FOR column_name;
*/
ALTER TABLE Employees
ADD CONSTRAINT DF_Staff_Salary
DEFAULT 0 FOR Salary;
