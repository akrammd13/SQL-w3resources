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
from customer c


/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/




/*

*/





