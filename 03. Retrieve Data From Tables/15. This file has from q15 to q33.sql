/*
15. Physics Winners Since 1950
From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner.
Sample table: nobel_win
*/

SELECT winner
FROM Nobel_win
WHERE subject = 'Physics' and year >= 1950;


/*
16. Chemistry Winners (1965-1975)
From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country.
Sample table: nobel_win
*/

SELECT year, subject, winner, country
FROM Nobel_win
WHERE subject = 'Chemistry' AND year BETWEEN 1965 AND 1975;


/*
17. Prime Ministers After 1972
Write a SQL query to display all details of the Prime Ministerial(category) winners after year 1972 of Menachem Begin and Yitzhak Rabin.
Sample table: nobel_win
*/

SELECT *
FROM Nobel_win
WHERE year > 1972
  AND winner IN ('Menachem Begin', 'Yitzhak Rabin');


/*
18. Winners with First Name Louis
From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category.
Sample table: nobel_win
*/

SELECT  year, subject, winner, country, category
FROM Nobel_win
WHERE winner LIKE 'Louis%';


/*
19. Combine Winners (Physics 1970 & Economics 1971)
From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.
Sample table: nobel_win
*/

SELECT year, subject, winner, country, category
FROM Nobel_win
WHERE (subject = 'Physics' AND year = 1970) OR (subject = 'Economics' AND year = 1971);


/*
20. 1970 Winners Excluding Physiology & Economics
From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category.
Sample table: nobel_win
*/

SELECT year, subject, winner, country, category
FROM Nobel_win
WHERE year = 1970 AND subject NOT IN ('Physiology', 'Economics');


/*
21. Physiology Before 1971 & Peace After 1974
From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category.
Sample table: nobel_win
*/

SELECT year, subject, winner, country, category
FROM Nobel_win
WHERE (subject = 'Physiology' and year < 1971) OR (subject = 'Peace' and year >= 1974);

/*
22. Details of Johannes Georg Bednorz
From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.
Sample table : nobel_win
*/

SELECT year, subject, winner, country, category
FROM Nobel_win
WHERE winner = 'Johannes Georg Bednorz';

/*
23. Winners Excluding Subjects Starting with P
From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending.
Sample table : nobel_win
*/

SELECT year, subject, winner, country, category
FROM Nobel_win
WHERE subject NOT LIKE 'P%'
ORDER BY year DESC;

/*
24. Ordered 1970 Nobel Prize Winners
From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.
Sample table: nobel_win
*/

SELECT year, subject, winner, country, category
FROM Nobel_win
WHERE year = 1970 
ORDER BY
	CASE
		WHEN subject NOT IN ('Chemistry' , 'Economics') THEN 0
		ELSE 1
	END,
	subject;


/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
USE w3resources
GO 

CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(100),
    PRO_PRICE DECIMAL(10,2),
    PRO_COM INT
);

INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
(101, 'Mother Board',        3200.00, 15),
(102, 'Key Board',            450.00, 16),
(103, 'ZIP drive',            250.00, 14),
(104, 'Speaker',              550.00, 16),
(105, 'Monitor',             5000.00, 11),
(106, 'DVD drive',            900.00, 12),
(107, 'CD drive',             800.00, 12),
(108, 'Printer',             2600.00, 13),
(109, 'Refill cartridge',     350.00, 13),
(110, 'Mouse',                250.00, 12);

SELECT * FROM item_mast;

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*
25. Products in Price Range Rs.200-600
From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.
Sample table: item_mast
*/
 SELECT pro_id, pro_name, pro_price, pro_com
 FROM item_mast
 WHERE PRO_PRICE BETWEEN 200 AND 600;


/*
26. Average Price for Manufacturer Code 16
From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.
Sample table: item_mast
*/

SELECT CAST(AVG(pro_price) as DECIMAL(10,2)) AS AVG_PRICE
FROM item_mast
WHERE pro_com = 16;

/*
27. Display Item Name and Price
From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'
Sample table : item_mast
*/

SELECT  pro_name AS 'Item Name' , pro_price AS 'Price in Rs.'
FROM item_mast;

/*
28. Items with Price >= $250
From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.
Sample table: item_mast
*/

SELECT pro_name , pro_price
FROM item_mast
WHERE PRO_PRICE >= 250
ORDER BY PRO_PRICE DESC, PRO_NAME ASC;

/*
29. Average Price per Company
From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code.
Sample table: item_mast
*/

SELECT CASt(AVG(pro_price) AS DECIMAL(10,2)) AS [AVERAGE PRICE], pro_com AS [COMPANY CODE]
FROM item_mast
GROUP BY pro_com;

/*
30. Cheapest Item
From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.
Sample table: item_mast
*/

SELECT pro_name, pro_price
FROM dbo.item_mast
WHERE pro_price = ( SELECT MIN(pro_price) FROM item_mast)

/* -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
USE w3resources
GO
CREATE TABLE emp_details (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);

INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
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

SELECT * FROM emp_details;

/* -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */

/*
31. Unique Employee Last Names
From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname.
Sample table: emp_details
*/

SELECT DISTINCT EMP_LNAME
FROM emp_details;

/*
32. Employees with Last Name Snares
From the following table, write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.
Sample table: emp_details
*/

SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM emp_details
WHERE EMP_LNAME = 'Snares';

/*
33. Employees in Department 57
From the followiemp_deptng table, write a SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.
Sample table: emp_details
*/

SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM emp_details
WHERE emp_dept = 57;
