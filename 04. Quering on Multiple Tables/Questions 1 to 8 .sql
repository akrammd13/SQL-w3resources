-- emp_details_2 Table Creation
USE w3resources
GO

CREATE TABLE salesman_2 (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(5,2)
);

INSERT INTO salesman_2 (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris',    0.13),
(5005, 'Pit Alex',   'London',   0.11),
(5006, 'Mc Lyon',    'Paris',    0.14),
(5007, 'Paul Adam',  'Rome',     0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);


-- Customer_2 Table Creation
USE w3resources
GO

CREATE TABLE customer_2 (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT NULL,        -- grade can be NULL
    salesman_id INT
);

INSERT INTO customer_2 (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando',   'New York',    100, 5001),
(3007, 'Brad Davis',     'New York',    200, 5001),
(3005, 'Graham Zusi',    'California',  200, 5002),
(3008, 'Julian Green',   'London',      300, 5002),
(3004, 'Fabian Johnson', 'Paris',       300, 5006),
(3009, 'Geoff Cameron',  'Berlin',      100, 5003),
(3003, 'Jozy Altidor',   'Moscow',      200, 5007),
(3001, 'Brad Guzan',     'London',      NULL, 5005); -- grade missing


-- 
USE w3resources
GO

CREATE TABLE orders_2 (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders_2 (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26,  '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60,'2012-07-27', 3007, 5001),
(70008, 5760.00,'2012-09-10', 3002, 5001),
(70010, 1983.43,'2012-10-10', 3004, 5006),
(70003, 2480.40,'2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29,  '2012-08-17', 3003, 5007),
(70013, 3045.60,'2012-04-25', 3002, 5001);

/* --------------------------------------------------------------------------------------------------------------------------------------------- */

/*
1. Sales & City Matching
From the following tables, write a SQL query to find the salespeople and customers who live in the same city. Return customer name, salesperson name and salesperson city.
Sample table: salesman_2 and customer_2
*/

SELECT C.cust_name, S.name, S.city
FROM customer_2 C
JOIN salesman_2 S
ON C.salesman_id = S.salesman_id
WHERE C.city = S.city;


/*
2. Customer-Salesperson Association
From the following tables, write a SQL query to locate all the customers and the salesperson who works for them. Return customer name, and salesperson name.
Sample table: salesman_2 and customer_2
*/

SELECT C.cust_name, S.name
FROM customer_2 C
JOIN salesman_2 S
ON C.salesman_id = S.salesman_id


/*
3. Different City Orders
From the following tables, write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city. Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table).
Sample table: salesman_2 and customer_2 and orders_2
*/

SELECT  O.ord_no, C.cust_name, O.customer_id, O.salesman_id
FROM customer_2 C
JOIN orders_2 O ON C.customer_id = O.customer_id
JOIN salesman_2 S ON S.salesman_id = O.salesman_id
WHERE S.city <> C.city;


/*
4. Customer Orders Listing
Write a SQL query to locate the orders made by customers. Return order number, customer name.
*/

SELECT O.ord_no, C.cust_name
FROM orders_2 O 
JOIN customer_2 C
ON O.customer_id = C.customer_id;


/*
5. Customer Grade & Salesperson City
From the given tables (orders, customer, and salesman), write a SQL query to retrieve all customers who have a non-NULL grade and are associated with a salesperson whose city is not NULL.

For each qualifying record, display:
- Customer name as Customer
- Customer grade as Grade
- Order number as Order No
*/

SELECT C.cust_name AS [Customer], C.grade AS [Grade], O.ord_no
FROM customer_2 C
JOIN orders_2 O 
    ON C.customer_id = O.customer_id
JOIN salesman_2 S 
    ON O.salesman_id = S.salesman_id
WHERE grade IS NOT NULL AND S.city IS NOT NULL;


/*
6. Commission Range Filtering
Write a SQL query to find those customers who are served by a salesperson and the salesperson earns commission in the range of 12% to 14% (Begin and end values are included.). Return cust_name AS "Customer", city AS "City".
Sample table: salesman_2 and customer_2
*/

SELECT C.cust_name AS [Customer], C.city AS [City]
FROM customer_2 C
JOIN salesman_2 S
ON C.salesman_id = S.salesman_id
WHERE S.commission BETWEEN 0.12 AND 0.14;


/*
7. Calculated Commission for High Grade
Write a SQL query to find all orders executed by the salesperson and ordered by the customer whose grade is greater than or equal to 200. 
Compute purch_amt*commission as “Commission”. Return customer name, commission as “Commission%” and Commission.
*/

SELECT C.cust_name AS [Customer], S.commission AS [Commission%], (O.purch_amt * S.commission) AS [Commission]
FROM orders_2 O
JOIN customer_2 C 
    ON O.customer_id = C.customer_id
JOIN salesman_2 S
    ON O.salesman_id = S.salesman_id
WHERE C.grade >= 200;

/*
8. Orders on Specific Date
Write a SQL query to find those customers who placed orders on October 5, 2012. 
Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id.
*/

SELECT C.customer_id, C.cust_name, C.city, C.grade, C.salesman_id, O.ord_no, O.purch_amt, O.ord_date, O.customer_id, O.salesman_id
FROM customer_2 C
JOIN orders_2 O ON C.customer_id = O.customer_id
WHERE O.ord_date = '2012-10-05';


--------------------------------------------------------------- END ---------------------------------------------------------------------------