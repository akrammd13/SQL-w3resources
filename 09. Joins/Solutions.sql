/*
1. Sales & City Matching
From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
*/

select S.name, C.cust_name, C.city
from Salesman S
join Customer C
on S.salesman_id = C.salesman_id
where S.city = C.city;

/*
2. Orders in Amount Range
From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
*/

select O.ord_no, O.purch_amt, C.cust_name, C.city
from Orders O
join Customer C
on O.customer_id = C.customer_id
WHERE O.purch_amt between 500 and 2000;

/*
3. Salesman-Customer Representation
From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
*/

select C.cust_name, C.city, S.name, S.commission
from Customer C
join Salesman S
on S.salesman_id = C.salesman_id

/*
4. High Commission Salespeople
From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. 
Return Customer Name, customer city, Salesman, commission.  
*/

select C.cust_name, C.city, S.name, S.commission
from Customer C
join Salesman S
on C.salesman_id = S.salesman_id
where S.commission > 0.12;


/*
5. Different City & High Commission
write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. 
Return Customer Name, customer city, Salesman, salesman city, commission.  
*/

select C.cust_name, C.city, S.name, S.commission
from Customer C
join Salesman S
on C.salesman_id = S.salesman_id
where C.city != S.city and S.commission > 0.12;

/*
6. Order Details Report
From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
*/

select O.ord_no, O.ord_date, O.purch_amt, C.cust_name, C.grade, S.name, S.commission
from Customer C
join Salesman S
	on C.salesman_id = S.salesman_id
join Orders O
	on C.customer_id = O.customer_id;

/*
7. Join All Tables Uniquely
Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
*/

select O.ord_no, O.ord_date, O.purch_amt, C.cust_name, C.grade, S.name, S.commission
from Customer C
join Salesman S
	on C.salesman_id = S.salesman_id
join Orders O
	on C.customer_id = O.customer_id;

/*
8. Customer & Salesman Sorted by Customer_ID
From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. 
The results should be sorted by ascending customer_id.  
*/

select C.cust_name, C.city, C.grade, S.name, S.city
from Customer C
join Salesman S
on C.salesman_id = S.salesman_id
order by C.customer_id;

/*
9. Customers with Grade Less Than 300
From the following tables write a SQL query to find those customers with a grade less than 300. 
Return cust_name, customer city, grade, Salesman, salesmancity. 
The result should be ordered by ascending customer_id. 
*/

SELECT C.cust_name, C.city, C.grade, S.name, S.city
from Customer C
join Salesman S
on C.salesman_id = S.salesman_id
where C.grade < 300
order by C.customer_id;

/*
10. Customer Order Report by Date
Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order 
according to the order date to determine whether any of the existing customers have placed an order or not.
*/

select c.cust_name,c.city, o.ord_no, o.ord_date, o.purch_amt
from Customer c
left join Orders o
on c.customer_id = o.customer_id
order by o.ord_date;

/*
11. Order & Salesperson Report
SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, 
and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
*/

select c.cust_name,c.city, o.ord_no, o.ord_date, o.purch_amt, s.name, s.commission
from Customer c
left join Orders o
	on c.customer_id = o.customer_id
left join Salesman s
	on c.salesman_id = s.salesman_id;

/*
12. Salespersons List (Including Unassigned)
Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
*/

select C.cust_name, C.city, C.grade, S.name, S.city
from Salesman S
LEFT Join Customer C
on S.salesman_id = C.salesman_id
order by S.name;

/*
13. Comprehensive Sales & Order Report

From the following tables write a SQL query to list all salespersons along with customer name, city, grade, salesman,  order number, date, and amount.
Condition for selecting list of salesmen : 
1. Salesmen who works for one or more customer 
				or, 
2. Salesmen who not yet join under any customer,
Condition for selecting list of customer : 
3. placed one or more orders, 
				or 
4. no order placed to their salesman.
*/

SELECT 
    S.name        AS salesman_name,
    S.city        AS salesman_city,
    C.cust_name,
    C.city        AS customer_city,
    C.grade,
    O.ord_no,
    O.ord_date,
    O.purch_amt
FROM Salesman S
LEFT JOIN Customer C
    ON S.salesman_id = C.salesman_id
LEFT JOIN Orders O
    ON C.customer_id = O.customer_id
ORDER BY S.salesman_id;

/*
14. Salesmen List with Order and Grade Criteria
Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
*/

SELECT 
    S.name AS salesman_name,
    S.city AS salesman_city,
    C.cust_name,
    C.city AS customer_city,
    C.grade,
    O.ord_no,
    O.ord_date,
    O.purch_amt
FROM Salesman S
LEFT JOIN Customer C
    ON S.salesman_id = C.salesman_id
LEFT JOIN Orders O
    ON C.customer_id = O.customer_id
WHERE 
      (O.purch_amt >= 2000 AND C.grade IS NOT NULL)
   OR O.ord_no IS NULL
ORDER BY S.salesman_id;

/*
15. Customer Order Placement Report
Write a SQL query to generate a report that lists all customers from the existing customer table, 
along with the details of any orders they have placed.

The report should include:
- Customer name
- Customer city
- Order number
- Order date
- Purchase amount

Requirements:
- If a customer has placed multiple orders, show one row per order.
- Customers who have not placed any orders should still appear in the result, with order-related columns shown as NULL.
- Only customers present in the customer table should be considered.
*/

SELECT c.cust_name,
       c.city,
       o.ord_no,
       o.ord_date,
       o.purch_amt
FROM Customer c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id;

/*
16. Customer Order & Grade Report (Rewritten – Accurate)
From the customer and orders tables, write a SQL query to generate a report that displays order details for customers who have a grade assigned.

The report should include:
- Customer name
- Customer city
- Order number
- Order date
- Purchase amount

Requirements:
- Include only those customers who have a non-NULL grade.
- Display all orders placed by these customers.
- If a customer with a valid grade has placed multiple orders, show one row per order.
- Orders belonging to customers without a grade should be excluded from the result.
- The result may include customers regardless of whether they appear in both tables, but only rows satisfying the grade condition should be returned.
*/

select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
from Customer c
left join  Orders o
on c.customer_id = o.customer_id
where c.grade is not null

/*
17. Salesman-Customer Full Combination
Write a SQL query to combine each row of the salesman table with each row of the customer table.
*/

SELECT *
FROM SALESMAN S
CROSS JOIN CUSTOMER C;

/*
18. Cartesian Product with City Flag
Write a SQL query to generate a Cartesian product between the salesperson and customer tables.
*/

select *
from Salesman S
cross join Customer C;

/*
19. Cartesian Product with Valid City & Grade
Write a SQL statement to create a Cartesian product between salesperson and customer, 
i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.
******* QUESTION is imperfect because cross join with where is similar to inner join
*/

select *
from Customer c
cross join Salesman s
where s.city is not null and c.grade is not null;

/*
20. Cartesian Product with Non Matching Cities
Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa 
for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.
*/
 -- QUESTION is imperfect

/*
21. Matched Company & Item Join
From the following tables write a SQL query to select all rows from both participating tables as long as there is a match between pro_com and com_id.
Sample table: company_mast and item_mast
*/

select *
from item_mast i
join company_mast c
on i.PRO_COM = c.com_id;

/*
22. Product & Company Details
Write a SQL query to display the item name, price, and company name of all the products.
*/

select i.pro_name, i.pro_price, c.com_name
from item_mast i
join company_mast c
on i.PRO_COM = c.com_id;

/*
23. Average Price by Company
From the following tables write a SQL query to calculate the average price of items of each company. Return average value and company name.
*/

select c.com_name, AVG(i.pro_price) as AVG_PRICE
from item_mast i
join company_mast c
on i.PRO_COM = c.com_id
group by c.com_name;

/*
24. Average Price (>=350) by Company
From the following tables write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. 
Return average value and company name.
*/

select c.com_name, AVG(i.pro_price) as AVG_PRICE
from item_mast i
join company_mast c
on i.PRO_COM = c.com_id
group by c.com_name
having  AVG(i.pro_price)>=350;

/*
25. Most Expensive Product by Company
From the following tables write a SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name.
*/

-- Selecting specific columns from the result of an inner join between 'item_mast' and 'company_mast' tables
SELECT A.pro_name, A.pro_price, F.com_name
-- Specifying the tables to retrieve data from ('item_mast' as 'A' and 'company_mast' as 'F')
FROM item_mast A 
-- Performing an inner join based on the equality of 'pro_com' in 'item_mast' and 'com_id' in 'company_mast'
INNER JOIN company_mast F
ON A.pro_com = F.com_id
-- Adding additional conditions to the join, ensuring the 'pro_price' matches the maximum 'pro_price' for the corresponding company
AND A.pro_price =
   (
     -- Subquery: Selecting the maximum 'pro_price' for the current company
     SELECT MAX(A.pro_price)
     FROM item_mast A
     WHERE A.pro_com = F.com_id
   );

/*
26. Employee & Department Full Report
From the following tables write a SQL query to display all the data of employees including their department.
*/

select * 
from emp_details e
join emp_department d
on e.EMP_DEPT = d.dpt_code;

/*
27. Employee Name & Department Sanction
From the following tables write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount.
*/

select e.EMP_FNAME, e.EMP_LNAME, d.DPT_NAME, d.DPT_ALLOTMENT
from emp_details e
join emp_department d
on e.EMP_DEPT = d.dpt_code;

/*
28. High Budget Departments Employee List
From the following tables write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees.
*/

select e.EMP_FNAME, e.EMP_LNAME
from emp_details e
join emp_department d
on e.EMP_DEPT = d.dpt_code
where d.DPT_ALLOTMENT > 50000;

/*
29. Departments with More Than Two Employees
From the following tables write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name.
*/

select d.DPT_NAME
from emp_details e
join emp_department d
on e.EMP_DEPT = d.dpt_code
group by d.DPT_NAME
HAVING count(*)>2;

--------------------------------------------------------------- END ----------------------------------------------------------------------


