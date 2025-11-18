/*
10. Customers with Grade 200

From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.

Sample table: customer

*/

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT NULL,        -- grade can be NULL (as in your last row)
    salesman_id INT
);

INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando',   'New York',    100, 5001),
(3007, 'Brad Davis',     'New York',    200, 5001),
(3005, 'Graham Zusi',    'California',  200, 5002),
(3008, 'Julian Green',   'London',      300, 5002),
(3004, 'Fabian Johnson', 'Paris',       300, 5006),
(3009, 'Geoff Cameron',  'Berlin',      100, 5003),
(3003, 'Jozy Altidor',   'Moscow',      200, 5007),
(3001, 'Brad Guzan',     'London',       NULL, 5005);  -- grade missing → NULL


--write a SQL query to find customers whose grade is 200
SELECT * FROM Customer WHERE grade = 200;