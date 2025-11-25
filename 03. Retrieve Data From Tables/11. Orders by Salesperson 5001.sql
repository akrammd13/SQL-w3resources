/*
11. Orders by Salesperson 5001
From the Orders table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.
*/

SELECT ord_no, ord_date, purch_amt
FROM Orders
WHERE salesman_id = 5001;