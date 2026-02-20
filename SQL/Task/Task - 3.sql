-- Practice Excercises

-- * INNER JOIN
-- * LEFT JOIN
-- * RIGHT JOIN
-- * SELF JOIN
-- * CROSS JOIN

-- Using tables: `customers`, `orders`, `employees`

-- ---

-- # 🟢 🔹 INNER JOIN Exercises

-- 1️⃣ Retrieve all orders along with customer first name and city.
select concat(c.first_name," ",c.last_name) as customer_name,c.city from  customers c  join orders o  using(customer_id); 

-- 2️⃣ Get customer name, order date, and order amount for all completed orders.
select concat(c.first_name," ",c.last_name) as customer_name,o.order_date,o.amount from customers c inner join orders o
using (customer_id) 
where o.status = 'completed';

-- 3️⃣ List customers who have placed orders in 2025.
select c.* from customers c inner join orders o using (customer_id)
where year(o.order_date) = 2025;

-- 4️⃣ Show customer name and total order amount (use INNER JOIN + GROUP BY).
select concat(first_name," ",last_name) as customer_name, sum(amount) as total from customers c join orders o 
using (customer_id)
group by customer_id;

-- 5️⃣ Retrieve order details along with customer country for orders above 3000.
select o.*, c.country from customers c join orders o using (customer_id)
where  o.amount > 3000;


-- 6️⃣ Get employees and their department name (if department table existed, assume join scenario).



-- ---

-- # 🟢 🔹 LEFT JOIN Exercises

-- 7️⃣ Retrieve all customers and their order details (include customers who have not placed any orders).
select c.* ,o.* from customers c left join orders o
using (customer_id);


-- 8️⃣ Get customers with no orders.
select c.* from customers c left join orders o 
using (customer_id) 
where o.order_id is null;

-- 9️⃣ Show all customers and count of orders placed by each.
select c.*,count(customer_id) as orders_placed from customers c left join orders o using (customer_id) 
group by customer_id;


-- 🔟 Retrieve all employees and show their department (include employees even if department is NULL).
-- select e1.*,e2.department from employees as e1  join employees as e2
-- on e1.department = e2.department where e2.department is null;

-- 1️⃣1️⃣ Get all customers along with total order amount (including those with NULL totals).
select c.*,sum(o.amount) as total from customers c left join orders o
using (customer_id)
group by customer_id;
-- ---

-- # 🟢 🔹 RIGHT JOIN Exercises

-- 1️⃣2️⃣ Retrieve all orders and corresponding customer details (include orders even if customer record is missing).
select o.*,c.* from customers c right join orders o using (customer_id); 

-- 1️⃣3️⃣ Show all orders with customer name, including orders with NULL customer info.
select o.*,concat(c.first_name," ",c.last_name) as Customer_name from orders o right join customers c using(customer_id); 

-- 1️⃣4️⃣ Get order details even if customer city information is missing.
select o.* from customers c right join orders o using (customer_id);
-- SELECT o.*, COALESCE(c.city, 'City Unknown') AS city
-- FROM orders o
-- LEFT JOIN customers c USING (customer_id);

-- ---

-- # 🟢 🔹 SELF JOIN Exercises (Employees table)

-- (Assume employees table has `manager_id` column referencing `employee_id`)
use classicmodels;
-- 1️⃣5️⃣ Retrieve employee name along with their manager name.
select concat(e.firstName," ",e.lastName) as employee,concat(m.firstName," ",m.lastName) as manager
from employees e join employees m
where m.employeeNumber = e.reportsTo;
-- 1️⃣6️⃣ Find employees who report to the same manager.
select concat(e.firstName," ",e.lastName) as employee,concat(m.firstName," ",m.lastName) as manager
from employees e join employees m
where m.employeeNumber = e.reportsTo
group by manager;
-- 1️⃣7️⃣ Get list of managers and count of employees reporting to each manager.

-- 1️⃣8️⃣ Retrieve employees who do not have a manager.

-- ---

-- # 🟢 🔹 CROSS JOIN Exercises

-- 1️⃣9️⃣ Generate all possible combinations of customers and employees.

-- 2️⃣0️⃣ Create all possible combinations of departments and order statuses.

-- 2️⃣1️⃣ Generate combinations of customers and available job titles.

-- ---

-- # 🟢 🔥 Mixed JOIN Challenge (Interview Level)

-- 2️⃣2️⃣ Retrieve customer name and total order amount sorted by highest total.

-- 2️⃣3️⃣ Get customers who placed more than 2 orders.

-- 2️⃣4️⃣ Find customers who never placed any completed order.

-- 2️⃣5️⃣ Retrieve top 3 customers based on total purchase amount.

-- 2️⃣6️⃣ Find employees whose salary is greater than the average salary of their department (using JOIN + subquery).

-- 2️⃣7️⃣ Get customers who placed the highest order amount.