/*
1. write a SQL query to find all salespeople and customers located in the city of London.
*/
select salesman_id as ID, name, 'Salesman' as [S/C] from Salesman where city = 'London'
union all
select customer_id as ID, cust_name, 'Customer' as [S/C] from Customer where city = 'London'