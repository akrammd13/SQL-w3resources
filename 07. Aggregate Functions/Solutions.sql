/*
1. Calculate Total Purchase Amount of All Orders
From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.
Sample table: orders
*/

SELECT SUM(purch_amt) as [Total Purchase Amount] FROM Orders;

/*
2. Calculate Average Purchase Amount of All Orders
From the following table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount. 
Sample table: orders
*/
SELECT CAST(AVG(purch_amt) as DECIMAL(10,2)) as [Average Purchase Amount] FROM Orders;

/*
3. Count the Number of Unique Salespeople
From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople.  
Sample table: orders
*/
SELECT  COUNT(Distinct salesman_id) as [number of salespeople] FROM Salesman;


/*
4. Count the Number of Customers
From the following table, write a SQL query to count the number of customers. Return number of customers.  
Sample table: customer
*/

SELECT  COUNT(customer_id) as customers FROM Customer;

/*
5. Count Customers with at Least One Grade
From the following table, write a SQL query to determine the number of customers who received at least one grade for their activity.  
Sample table: customer
*/

SELECT COUNT(*) FROM Customer WHERE grade IS NOT NULL;

/*
6. Find Maximum Purchase Amount
From the following table, write a SQL query to find the maximum purchase amount.  
Sample table: orders
*/

SELECT MAX(purch_amt) FROM Orders;

/*
7. Find Minimum Purchase Amount
From the following table, write a SQL query to find the minimum purchase amount. 
Sample table: orders
*/
SELECT MIN(purch_amt) FROM Orders;

/*
8. Find Highest Customer Grade in Each City
From the following table, write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.
Sample table: customer
*/

select city, max(grade)
from Customer
group by city;

/*
9. Find Highest Purchase Amount Ordered by Each Customer
From the following table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. 
Sample table: orders
*/

select C.customer_id, max(O.purch_amt)
from Customer C
join Orders O
on C.customer_id = O.customer_id
group by C.customer_id;


/*
10. Highest Purchase by Customer on Date
From the orders table, write a SQL query to determine the highest purchase amount made by each customer on each order date.
For every unique combination of customer_id and ord_date, return:
customer_id
ord_date
the maximum purchase amount placed by that customer on that date
*/

select customer_id,ord_date, max(purch_amt)
from Orders
group by customer_id,ord_date;


/*
11. Highest Purchase Amount by Salesperson on '2012-08-17'
From the following table, write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount 
Sample table: orders
*/

select salesman_id, max(purch_amt) as max_purch
from Orders
where ord_date = '2012-08-17'
group by salesman_id;


/*
12. Highest Purchase Amount by Customer on Specific Date
From the following table, write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. 
Filter the result by highest order (purchase) amount above 2000.00. 
Return customer id, order date and maximum purchase amount.
Sample table: orders
*/
select customer_id, ord_date, max(purch_amt) as max_purch
from Orders
group by customer_id,ord_date
Having max(purch_amt) > 2000;

/*
13. Max Purchase Amount by Customer and Order Date (2000-6000)
From the following table, write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. 
Return customer id, order date and maximum purchase amount.
Sample table: orders
*/

select customer_id, ord_date, max(purch_amt)
from Orders
group by customer_id, ord_date
having  max(purch_amt) between  2000 and 6000;


/*
14. Max Purchase Amount by Customer and Order Date (Filter)
From the following table, write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. 
Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount.
Sample table: orders
*/
select customer_id, ord_date, max(purch_amt)
from Orders
group by customer_id, ord_date
having  max(purch_amt) in (2000, 3000, 5760, 6000) ;

/*
15. Max Purchase Amount for Customers (ID Range 3002-3007)
From the following table, write a SQL query to determine the maximum order amount for each customer. 
The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount.
Sample table: orders
*/
select customer_id, max(purch_amt)
from Orders
group by customer_id
having customer_id between 3002 and 3007;


/*
16. Max Purchase > 1000 for Customers (ID 3002-3007)
From the following table, write a SQL query to find the maximum order (purchase) amount for each customer. 
The customer ID should be in the range 3002 and 3007(Begin and end values are included.). 
Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount.
Sample table: orders
*/
select customer_id, max(purch_amt)
from Orders
group by customer_id
having customer_id between 3002 and 3007 and max(purch_amt) > 1000;


/*
17. Max Purchase by Salesperson (ID 5003-5008)
From the following table, write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. 
Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). 
Return salesperson id and maximum purchase amount.
Sample table: orders
*/

select salesman_id, max(purch_amt)
from Orders
group by salesman_id
having salesman_id between 5003 and 5008.

/*
18. Count Orders on '2012-08-17'
From the following table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.
Sample table: orders
*/
select count(ord_no) as [No of Orders]
from Orders
where ord_date = '2012-08-17';

/*
19. Count Salespeople in a City
From the following table, Write a SQL query to count the number of salespeople in each city.. 
Return number of salespeople.
Sample table: salesman
*/
select city, count(salesman_id) as [number of salesman]
from Salesman
group by city;

/*
20. Count Orders by Order Date and Salesperson
From the following table, write a SQL query to count the number of orders based on the combination of each order date and salesperson. 
Return order date, salesperson id.
Sample table: orders
*/

select ord_date, salesman_id, count(ord_no) as [No of Orders]
from Orders
group by ord_date, salesman_id;



/*
21. Calculate Average Product Price
From the following table, write a SQL query to calculate the average product price. Return average product price.
Sample table: item_mast
*/
select avg(pro_price) from item_mast;

/*
22. Count Products with Price >= 350
From the following table, write a SQL query to count the number of products whose price are higher than or equal to 350. Return number of products.
Sample table: item_mast
*/

select count(pro_price) [Number of Products]
from item_mast
where pro_price >= 350;

/*
23. Average Price for Unique Companies
From the following table, write a SQL query to compute the average price for unique companies. Return average price and company id.
Sample table: item_mast
*/
select pro_com, avg(pro_price)
from item_mast
group by PRO_COM;

-------------------------------------------------------------------------------------------------------------------------------------
/*
USE w3resources
GO
CREATE TABLE emp_department (
    DPT_CODE INT PRIMARY KEY,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT INT
);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT)
VALUES
(57, 'IT',      65000),
(63, 'Finance', 15000),
(47, 'HR',     240000),
(27, 'RD',      55000),
(89, 'QC',      75000);
*/
-------------------------------------------------------------------------------------------------------------------------------------

/*
24. Sum of Allotment Amount for All Departments
From the following table, write a SQL query to compute the sum of the allotment amount of all departments. Return sum of the allotment amount.
Sample table: emp_department
*/ 
SELECT sum(dpt_allotment) [sum of the allotment amount.]
from emp_department;

/*
25. Count of Employees in Each Department
From the following table, write a SQL query to count the number of employees in each department. 
Return department code and number of employees.
Sample table: emp_details
*/
select emp_dept, count(emp_idno)
from emp_details
group by emp_dept;

----------------------------------------------------------- END --------------------------------------------------------------------------------