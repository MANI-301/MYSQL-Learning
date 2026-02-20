# 🟢 🔹 SUBQUERY Exercises
use sql_practice;
### 1️⃣ Find employees earning more than the average salary.
select * from employees where salary >all(select avg(salary) from employees);

### 2️⃣ Get customers who have placed at least one order.
select * from customers where customer_id in(select customer_id from orders where order_id is not null);

### 3️⃣ Retrieve customers who have never placed any order.
select * from customers where customer_id not in (select customer_id from orders);

### 4️⃣ Find employees earning more than the highest salary in HR department.
select * from  employees where salary in (select max(salary) from employees where department = 'hr'); 

### 5️⃣ Get orders where the amount is greater than the average order amount.
select * from orders where amount >(select avg(amount) from orders);  

### 6️⃣ Retrieve employees who earn the same salary as any employee in Finance department.
select * from employees where salary in (select salary from employees where department = 'finance');
 
### 7️⃣ Find customers who placed orders worth more than 4000.
select * from customers where customer_id in(select customer_id from orders where amount > 4000);

### 8️⃣ Get the second highest salary from employees table.
select * from employees where salary in (select max(salary) from employees where salary <(select max(salary) from employees));

### 9️⃣ Retrieve employees hired after the most recently hired HR employee.
select * from employees where hire_date in (select max(hire_date) from employees );

### 🔟 Find customers who placed orders in 2025.
select * from customers where customer_id in(select customer_id from orders where order_date like '%2025%');
---

# 🟢 🔹 GROUP BY Exercises

### 1️⃣ Count number of employees in each department.
select department,count(*) as couting from employees
group by department;

### 2️⃣ Find total salary expense per department.
select department,max(salary) from employees
group by department;

### 3️⃣ Get average salary per department.
select department,avg(salary) from employees
group by department;

### 4️⃣ Count number of customers per country.
select country,count(*) from customers
group by country;

### 5️⃣ Find total order amount per customer.
select customer_id,sum(amount) as bill from orders
group by customer_id;

### 6️⃣ Get total number of orders per status.
select status,count(*) as order_count from orders 
group by status;

### 7️⃣ Find maximum salary in each department.
select department,max(salary) as sal from employees
group by department;

### 8️⃣ Get minimum order amount per year.
select year(order_date) as years,min(amount) as money  from orders 
group by year(order_date);

---

# 🟢 🔹 HAVING Exercises

### 9️⃣ Find departments where average salary is greater than 70,000.
select department from employees 
group by department
having avg(salary) > 70000;

### 🔟 Retrieve customers who have placed more than 1 order.
select * from customers where customer_id in
(select customer_id from orders group by customer_id having count(customer_id) > 1);
  
### 1️⃣1️⃣ Find countries having more than 2 customers.
select country from customers 
group by country
having count(country) > 2;

### 1️⃣2️⃣ Get departments where total salary expense is more than 200,000.
select department from employees
group by department 
having sum(salary) > 200000;

### 1️⃣3️⃣ Find customers whose total order amount exceeds 5,000.
select * from customers where customer_id in
(select customer_id from orders group by customer_id having sum(amount) > 5000);

### 1️⃣4️⃣ Retrieve order statuses having more than 3 orders.
select status from orders
group by status 
having count(status) > 3;

---

# 🟢 🔥 Mixed (Subquery + Group By + Having)

### 1️⃣5️⃣ Get customers whose total order amount is greater than the average total order amount of all customers.
select * from customers where customer_id in 
(select customer_id from orders group by customer_id 
having sum(amount) >all (select avg(amount) from orders group by customer_id having sum(amount)));
-- select customer_id from orders group by customer_id having sum(amount) 
-- <(select  avg(amount) from orders );

### 1️⃣6️⃣ Find departments whose average salary is greater than the overall average salary.
select department from employees group by department having avg(salary) >(select avg(salary) from employees);


### 1️⃣7️⃣ Retrieve employees who earn more than the average salary of their own department.
select * from employees e 
where salary > (
select avg(salary) from employees where department = department);



### 1️⃣8️⃣ Get customers who placed more orders than the average number of orders per customer.
 SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(order_id) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS customer_orders
);  


### 1️⃣9️⃣ Find department with the highest total salary expense.
select department from employees
group by department 
having sum(salary) = ( select max(total) from (select sum(salary) as total from employees group by department) as sum_sal);

### 2️⃣0️⃣ Retrieve customers who placed the highest single order amount
select * from customers where customer_id in 
(select customer_id from orders where amount in
(select max(amount) from orders));