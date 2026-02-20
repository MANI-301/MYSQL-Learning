# 🟢 1️⃣ Create Database

```sql
CREATE DATABASE sql_practice;
USE sql_practice;
```

---

# 🟢 2️⃣ Create Tables

## 📌 Customers Table

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);
```

## 📌 Employees Table

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
```

## 📌 Orders Table

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

---

# 🟢 3️⃣ Insert Sample Data

## 📌 Insert Customers

```sql
INSERT INTO customers (first_name, last_name, email, city, country) VALUES
('Amit', 'Sharma', 'amit@gmail.com', 'Pune', 'India'),
('Neha', 'Verma', 'neha@gmail.com', 'Mumbai', 'India'),
('John', 'Doe', 'john@gmail.com', 'New York', 'USA'),
('Sara', 'Smith', 'sara@gmail.com', 'London', 'UK'),
('Rahul', 'Patil', 'rahul@gmail.com', 'Pune', 'India'),
('Priya', 'Kulkarni', 'priya@gmail.com', 'Delhi', 'India'),
('David', 'Brown', 'david@gmail.com', 'Chicago', 'USA'),
('Anita', 'Desai', 'anita@gmail.com', 'Bangalore', 'India'),
('Michael', 'Johnson', 'michael@gmail.com', 'Toronto', 'Canada'),
('Rohan', 'Mehta', 'rohan@gmail.com', 'Ahmedabad', 'India');
```

---

## 📌 Insert Employees

```sql
INSERT INTO employees (first_name, last_name, department, job_title, salary, hire_date) VALUES
('Raj', 'Malhotra', 'IT', 'Developer', 75000, '2022-01-15'),
('Simran', 'Kaur', 'HR', 'HR Manager', 65000, '2021-06-10'),
('Arjun', 'Reddy', 'IT', 'Backend Developer', 85000, '2023-03-20'),
('Sneha', 'Joshi', 'Finance', 'Accountant', 55000, '2020-09-12'),
('Vikram', 'Singh', 'IT', 'DevOps Engineer', 95000, '2024-02-01'),
('Meera', 'Nair', 'Marketing', 'Marketing Lead', 70000, '2021-11-05'),
('Karan', 'Shah', 'Finance', 'Financial Analyst', 60000, '2022-07-19'),
('Pooja', 'Iyer', 'IT', 'Frontend Developer', 72000, '2023-08-25'),
('Aman', 'Gupta', 'Sales', 'Sales Manager', 68000, '2021-04-18'),
('Nidhi', 'Bansal', 'HR', 'Recruiter', 50000, '2022-12-30');
```

---

## 📌 Insert Orders

```sql
INSERT INTO orders (customer_id, order_date, amount, status) VALUES
(1, '2024-01-10', 1500.00, 'Completed'),
(2, '2024-02-15', 2500.00, 'Completed'),
(3, '2024-03-20', 1800.00, 'Pending'),
(4, '2024-04-05', 3200.00, 'Completed'),
(5, '2024-05-18', 2100.00, 'Cancelled'),
(1, '2024-06-22', 4000.00, 'Completed'),
(6, '2024-07-30', 2700.00, 'Pending'),
(7, '2024-08-14', 3500.00, 'Completed'),
(8, '2024-09-01', 2900.00, 'Completed'),
(9, '2024-10-10', 5000.00, 'Completed'),
(10, '2025-01-12', 4500.00, 'Pending'),
(2, '2025-02-05', 3800.00, 'Completed');
```

---

# 🟢 Now You Can Practice

1. Get all customers from India.
2. Get top 3 highest paid employees.
3. Find distinct order statuses.
4. Get latest 5 orders.
5. Get 3 employees after skipping first 2.
6. Get customers from Pune ordered by first name.
