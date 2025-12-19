USE w3resources
GO

CREATE TABLE customer_3 (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT NULL,        -- grade can be NULL
    salesman_id INT
);

INSERT INTO customer_3 (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando',   'New York',    100, 5001),
(3007, 'Brad Davis',     'New York',    200, 5001),
(3005, 'Graham Zusi',    'California',  200, 5002),
(3008, 'Julian Green',   'London',      300, 5002),
(3004, 'Fabian Johnson', 'Paris',       300, 5006),
(3009, 'Geoff Cameron',  'Berlin',      100, 5003),
(3003, 'Jozy Altidor',   'Moscow',      200, 5007),
(3001, 'Brad Guzan',     'London',      NULL, 5005);

CREATE TABLE orders_3 (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders_3 (ord_no, purch_amt, ord_date, customer_id, salesman_id)
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

CREATE TABLE salesman_3 (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(5,2)
);

INSERT INTO salesman_3 (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris',    0.13),
(5005, 'Pit Alex',   'London',   0.11),
(5006, 'Mc Lyon',    'Paris',    0.14),
(5007, 'Paul Adam',  'Rome',     0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE emp_details_2 (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);

INSERT INTO emp_details_2 (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES
(127323, 'Michale',  'Robbin',     57),
(526689, 'Carlos',   'Snares',     63),
(843795, 'Enric',    'Dosio',      57),
(328717, 'Jhon',     'Snares',     63),
(444527, 'Joseph',   'Dosni',      47),
(659831, 'Zanifer',  'Emily',      47),
(847674, 'Kuleswar', 'Sitaraman',  57),
(748681, 'Henrey',   'Gabriel',    47),
(555935, 'Alex',     'Manuel',     57),
(539569, 'George',   'Mardy',      27),
(733843, 'Mario',    'Saule',      63),
(631548, 'Alan',     'Snappy',     27),
(839139, 'Maria',    'Foster',     57);



/*
1. Customers with Grade > 100
 Write a SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id.
*/

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer_3
WHERE grade>100;

/*
2. New York Customers with Grade > 100
 Write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id.
*/

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer_3
WHERE city = 'New York' AND grade > 100;

/*
3. New York or Grade > 100
 Write a SQL query to find customers who are from the city of New York or have a grade of over 100. Return customer_id, cust_name, city, grade, and salesman_id.
*/

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer_3
WHERE city = 'New York' OR grade > 100;

/*
4. New York or Not Grade > 100
 Write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id.
*/

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer_3
WHERE city = 'New York' OR NOT grade > 100;

/*
5. Not New York and Not Grade > 100
 Write a SQL query to identify customers who are not from the city of 'New York' and do not have a grade value greater than 100. Return customer_id, cust_name, city, grade, and salesman_id..
*/

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer_3
WHERE city != 'New York' OR NOT grade > 100;

/*
6. Exclude Specific Orders
 Write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
*/

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM orders_3 
WHERE NOT ((ord_date = '2012-09-10' and salesman_id > 5005) or purch_amt > 1000);

/*
7. Salespeople with Commission Range 0.10-0.12
 Write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission.
*/

SELECT salesman_id, name, city, commission
FROM salesman_3
WHERE commission BETWEEN 0.10 AND 0.12;

/*
8. Orders with Amount < 200 or Exclusions
 Write a SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' 
 and a customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
*/

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM orders_3
WHERE purch_amt < 200 or NOT (ord_date >= '2012-02-10' and customer_id < 3009);

/*
9. Conditional Orders Exclusions
 Write a SQL query to find all orders that meet the following conditions. 
 Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.
*/

SELECT * 
FROM orders_3
WHERE NOT ((ord_date = '2012-08-17' or customer_id > 3005) and purch_amt < 1000);

/*
10. Orders with Achieved Percentage > 50%
Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.
*/

SELECT 
    ord_no, 
    purch_amt,
    ((purch_amt * 100)/6000) AS [Achieved %],
    (((6000-purch_amt) * 100)/6000) AS [Unachieved %]
FROM orders_3
WHERE (purch_amt * 100)/6000 > 50;

/*
11. Employees with Last Name Dosni or Mardy
 Write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept.
 Sample table : emp_details_2
*/

SELECT * 
FROM emp_details_2
WHERE EMP_LNAME in ('Dosni', 'Mardy');


/*
12. Employees in Department 47 or 63
From the following table, write a SQL query to find the employees who work at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept.
Sample table : emp_details
*/

SELECT * 
FROM emp_details_2
WHERE EMP_DEPT in (47,63);

-------------------------------------------------------------------- END -------------------------------------------------------------------------