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
WHERE subject 