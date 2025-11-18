/*
09. Salespeople in Paris
From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city. 
-- This query selects specific columns 'name' and 'city' from the 'salesman' table.
*/

-- This query selects specific columns 'name' and 'city' from the 'salesman' table.
SELECT name, city
-- Specifies the table from which to retrieve the data (in this case, 'salesman').
FROM salesman
-- Filters the rows to only include those where the 'city' column has the value 'Paris'.
WHERE city = 'Paris';
