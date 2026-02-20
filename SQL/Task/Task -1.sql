
--  1. Get all customers from India.
select * from sql_practice.customers
where country = 'India';

-- 2. Get top 3 highest paid employees.
select salary from sql_practice.employees
order by salary desc limit 3;

-- 3. Find distinct order statuses.
SELECT distinct(status) FROM sql_practice.orders;

-- 4. Get latest 5 orders.
SELECT order_date FROM sql_practice.orders
where order_date is not null
order by order_date desc limit 5;

-- 5. Get 3 employees after skipping first 2.
SELECT * FROM sql_practice.employees
ORDER BY employee_id
LIMIT 3 OFFSET 2;

-- 6. Get customers from Pune ordered by first name.
Select * from customers
where city = 'Pune'
order by first_name;
