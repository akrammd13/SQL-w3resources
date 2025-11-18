/*
08. Unique Salespeople IDs

From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id.
*/

-- This query selects unique/distinct values from the 'salesman_id' column in the 'orders' table.
SELECT DISTINCT salesman_id
-- Specifies the table from which to retrieve the data (in this case, 'orders').
FROM Orders;
