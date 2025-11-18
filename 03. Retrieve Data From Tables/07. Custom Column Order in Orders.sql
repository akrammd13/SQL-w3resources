/*
07. Custom Column Order in Orders

Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.
*/

CREATE TABLE Orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26,  '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70005, 2400.60,'2012-07-27', 3007, 5001),
(70008, 5760.00,'2012-09-10', 3002, 5001),
(70010, 1983.43,'2012-10-10', 3004, 5006),
(70003, 2480.40,'2012-10-10', 3009, 5003),
(70011, 75.29,  '2012-08-17', 3003, 5007),
(70013, 3045.60,'2012-04-25', 3002, 5001),
(70001, 150.50, '2012-10-05', 3005, 5002),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70012, 250.45, '2012-06-27', 3008, 5002);




SELECT ord_date, salesman_id, ord_no, purch_amt
FROM dbo.Orders;