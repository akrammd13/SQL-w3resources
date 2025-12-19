/*
1. Salespeople FROM ParIS or Rome
FROM the following table, write a SQL query to find the details of those salespeople who come FROM the 'ParIS' City or 'Rome' City. Return salesman_id, name, city, commISsion.
Sample table: salesman
*/

SELECT *
FROM Salesman
WHERE city in ('Rome', 'ParIS');

/*
2. Salespeople in ParIS or Rome
FROM the following table, write a SQL query to find the details of the salespeople who come FROM either 'ParIS' or 'Rome'. Return salesman_id, name, city, commISsion. 
Sample table: salesman
*/

-- SAME as Q1


/*
3. Salespeople NOT in ParIS or Rome
FROM the following table, write a SQL query to find the details of those salespeople who live in cities other than ParIS and Rome. Return salesman_id, name, city, commISsion.  
Sample table: salesman
*/

SELECT *
FROM Salesman
WHERE NOT city IN ('Rome', 'ParIS');

/*
4. Customers with Specific IDs
FROM the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. 
Return customer_id, cust_name, city, grade, and salesman_id.  
Sample table: customer
*/

SELECT * FROM Customer
WHERE customer_id in ( 3007, 3008, 3009);

/*
5. Salespeople with CommISsion 0.12-0.14
FROM the following table, write a SQL query to find salespeople who receive commISsions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commISsion.  
Sample table: salesman
*/

SELECT * FROM Salesman
WHERE commISsion between 0.12 and 0.14;


/*
6. Orders Between 500-4000 Excluding Specific Amounts
FROM the following table, write a SQL query to SELECT orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 
Sample table: orders
*/

SELECT * FROM Orders
WHERE purch_amt between 500 and 4000 and purch_amt NOT in (948.50 , 1983.43);



/*
7. Salespeople with Names Range
FROM the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (NOT inclusive). Return salesman_id, name, city, commISsion. 
Sample table: salesman
*/
SELECT * FROM Salesman
WHERE name between 'A' and 'L';

/*
8. Salespeople with Names NOT A-M Range
FROM the following table, write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'M'. Return salesman_id, name, city, commISsion.  
Sample table: salesman
*/

SELECT * FROM Salesman
WHERE NOT name < 'A' and name >= 'N';


/*
9. Customers with Names Starting with B
FROM the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.. 
Sample table: customer
*/

SELECT * FROM Customer
WHERE cust_name LIKE 'B%';

/*
10. Customers with Names Ending with N
FROM the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
Sample table: customer
*/

SELECT * FROM Customer
WHERE cust_name LIKE '%n';

/*
11. Salespeople Name Starts 'N' with Fourth 'L'
FROM the following table, write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character IS 'l'. Rests may be any character. Return salesman_id, name, city, commISsion. 
Sample table : salesman
*/

SELECT * FROM Salesman
WHERE name LIKE 'N__l%';

----------------------------------------------------------------------------------------------------------------------------------------------
USE w3resources
GO

CREATE TABLE testtable (
    col1 VARCHAR(100)
);

INSERT INTO testtable (col1)
VALUES
('A001/DJ-402\44_/100/2015'),
('A001_\DJ-402\44_/100/2015'),
('A001_DJ-402-2014-2015'),
('A002_DJ-401-2014-2015'),
('A001/DJ_401'),
('A001/DJ_402\44'),
('A001/DJ_402\44\2015'),
('A001/DJ-402%45\2015/200'),
('A001/DJ_402\45\2015%100'),
('A001/DJ_402%45\2015/300'),
('A001/DJ-402\44');

/*
12. Rows with Underscore Character
FROM the following table, write a SQL query to find those rows WHERE col1 contains the escape character underscore ( _ ). Return col1.
Sample table: testtable
*/

SELECT * FROM testtable
WHERE col1 LIKE '%/_%' ESCAPE '/' ;


/*
13. Rows Without Underscore Character
FROM the following table, write a SQL query to identify those rows WHERE col1 does NOT contain the escape character underscore ( _ ). Return col1.
Sample table: testtable
*/

SELECT * FROM testtable
WHERE NOT col1 LIKE '%/_%' ESCAPE '/' ;


/*
14. Rows with Forward Slash Character
FROM the following table, write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.
Sample table: testtable
*/
SELECT * FROM testtable
WHERE col1 LIKE '%//%' ESCAPE '/' ;


/*
15. Rows Without Forward Slash Character
FROM the following table, write a SQL query to identify those rows WHERE col1 does NOT contain the forward slash character ( / ). Return col1.
Sample table: testtable
*/

SELECT * FROM testtable
WHERE NOT col1 LIKE '%//%' ESCAPE '/' ;

/*
16. Rows with '_/' String
FROM the following table, write a SQL query to find those rows WHERE col1 contains the string ( _/ ). Return col1.
Sample table: testtable
*/

SELECT * FROM testtable
WHERE col1 LIKE '%/_//%' ESCAPE '/' ;


/*
17. Rows Without '_/' String
FROM the following table, write a SQL query to find those rows WHERE col1 does NOT contain the string ( _/ ). Return col1.
Sample table: testtable
*/

SELECT * FROM testtable
WHERE NOT col1 LIKE '%/_//%' ESCAPE '/' ;

/*
18. Rows with Percent Character
FROM the following table, write a SQL query to find those rows WHERE col1 contains the character percent ( % ). Return col1.
Sample table: testtable
*/

SELECT * FROM testtable
WHERE col1 LIKE '%/%%' ESCAPE '/' ;


/*
19. Rows Without Percent Character
FROM the following table, write a SQL query to find those rows WHERE col1 does NOT contain the character percent ( % ). Return col1.
Sample table: testtable
*/
SELECT * FROM testtable
WHERE NOT col1 LIKE '%/%%' ESCAPE '/' ;


/*
20. Customers Without Grade
FROM the following table, write a SQL query to find all those customers who does NOT have any grade. Return customer_id, cust_name, city, grade, salesman_id.
Sample table: customer
*/

SELECT * FROM Customer
WHERE grade IS NULL;


/*
21. Customers With Grade
FROM the following table, write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id.
Sample table: customer
*/

SELECT * FROM Customer
WHERE grade IS NOT NULL;


/*
22. Employees with Last Name Starting 'D'
FROM the following table, write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept. Go to the editor
Sample table: emp_details
*/


SELECT * FROM emp_details
WHERE EMP_LNAME LIKE 'D%';

------------------------------------------------------------- END ------------------------------------------------------------------------