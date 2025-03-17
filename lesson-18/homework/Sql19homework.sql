--Level 1: Basic Subqueries

--Find Employees with Minimum Salary
--Task: Retrieve employees who earn the minimum salary in the company.

--Tables: employees (columns: id, name, salary)

--DDL and DML:

--CREATE TABLE employees ( id INT PRIMARY KEY, name VARCHAR(100), salary DECIMAL(10, 2) );

--INSERT INTO employees (id, name, salary) VALUES (1, 'Alice', 50000), (2, 'Bob', 60000), (3, 'Charlie', 50000);

--Find Products Above Average Price
--Task: Retrieve products priced above the average price.

--Tables: products (columns: id, product_name, price)

--DDL and DML:

--CREATE TABLE products ( id INT PRIMARY KEY, product_name VARCHAR(100), price DECIMAL(10, 2) );

--INSERT INTO products (id, product_name, price) VALUES (1, 'Laptop', 1200), (2, 'Tablet', 400), (3, 'Smartphone', 800), (4, 'Monitor', 300);

--select * from employees

--select * from products 

select * from employees where salary in(select min(salary) from employees);

select * from products where price>(select avg(price) from products);

--Level 2: Nested Subqueries with Conditions

--Find Employees in Sales Department
--Task: Retrieve employees who work in the "Sales" department.

--Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)

--DDL and DML:

--CREATE TABLE departments ( id INT PRIMARY KEY, department_name VARCHAR(100) );

--CREATE TABLE employees ( id INT PRIMARY KEY, name VARCHAR(100), department_id INT, FOREIGN KEY (department_id) REFERENCES departments(id) );

--INSERT INTO departments (id, department_name) VALUES (1, 'Sales'), (2, 'HR');

--INSERT INTO employees (id, name, department_id) VALUES (1, 'David', 1), (2, 'Eve', 2), (3, 'Frank', 1);

--Find Customers with No Orders
--Task: Retrieve customers who have not placed any orders.

--Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)

--DDL and DML:

--CREATE TABLE customers ( customer_id INT PRIMARY KEY, name VARCHAR(100) );

--CREATE TABLE orders ( order_id INT PRIMARY KEY, customer_id INT, FOREIGN KEY (customer_id) REFERENCES customers(customer_id) );

--INSERT INTO customers (customer_id, name) VALUES (1, 'Grace'), (2, 'Heidi'), (3, 'Ivan');

--INSERT INTO orders (order_id, customer_id) VALUES (1, 1), (2, 1);

--select * from employees

--select * from departments

Select * from employees a 
where exists(select 1 from departments b where a.department_id=b.id and department_name='Sales');

--select * from customers

--select * from orders

select * from customers a 
where not exists(select 1 from orders b where a.customer_id=b.customer_id);

--Level 3: Aggregation and Grouping in Subqueries

--Find Products with Max Price in Each Category
--Task: Retrieve products with the highest price in each category.

--Tables: products (columns: id, product_name, price, category_id)

--DDL and DML:

--CREATE TABLE products ( id INT PRIMARY KEY, product_name VARCHAR(100), price DECIMAL(10, 2), category_id INT );

--INSERT INTO products (id, product_name, price, category_id) VALUES (1, 'Tablet', 400, 1), (2, 'Laptop', 1500, 1), (3, 'Headphones', 200, 2), (4, 'Speakers', 300, 2);

--Find Employees in Department with Highest Average Salary
--Task: Retrieve employees working in the department with the highest average salary.

--Tables: employees (columns: id, name, salary, department_id), departments (columns: id, department_name)

--DDL and DML:

--CREATE TABLE departments ( id INT PRIMARY KEY, department_name VARCHAR(100) );

--CREATE TABLE employees ( id INT PRIMARY KEY, name VARCHAR(100), salary DECIMAL(10, 2), department_id INT, FOREIGN KEY (department_id) REFERENCES departments(id) );

--INSERT INTO departments (id, department_name) VALUES (1, 'IT'), (2, 'Sales');

--INSERT INTO employees (id, name, salary, department_id) VALUES (1, 'Jack', 80000, 1), (2, 'Karen', 70000, 1), (3, 'Leo', 60000, 2);

Select * from products a 
where price=(select max(price) from products b where a.category_id=b.category_id);

--select * from employees

--select * from departments

select * from employees where department_id=(select top 1 department_id from employees
group by department_id order by avg(salary) desc);

--Level 4: Correlated Subqueries

--Find Employees Earning Above Department Average
--Task: Retrieve employees earning more than the average salary in their department.

--Tables: employees (columns: id, name, salary, department_id)

--DDL and DML:

--CREATE TABLE employees ( id INT PRIMARY KEY, name VARCHAR(100), salary DECIMAL(10, 2), department_id INT );

--INSERT INTO employees (id, name, salary, department_id) VALUES (1, 'Mike', 50000, 1), (2, 'Nina', 75000, 1), (3, 'Olivia', 40000, 2), (4, 'Paul', 55000, 2);

--Find Students with Highest Grade per Course
--Task: Retrieve students who received the highest grade in each course.

--Tables: students (columns: student_id, name), grades (columns: student_id, course_id, grade)

--DDL and DML:

--CREATE TABLE students ( student_id INT PRIMARY KEY, name VARCHAR(100) );

--CREATE TABLE grades ( student_id INT, course_id INT, grade DECIMAL(4, 2), FOREIGN KEY (student_id) REFERENCES students(student_id) );

--INSERT INTO students (student_id, name) VALUES (1, 'Sarah'), (2, 'Tom'), (3, 'Uma');

--INSERT INTO grades (student_id, course_id, grade) VALUES (1, 101, 95), (2, 101, 85), (3, 102, 90), (1, 102, 80);

--select * from employees

select * from employees a where salary>(select avg(salary) from employees b 
where a.department_id=b.department_id group by department_id);

--select * from students

--select * from grades

select * from grades a where grade=(select max(grade) from grades b 
where a.course_id=b.course_id group by course_id);

--Level 5: Subqueries with Ranking and Complex Conditions

--Find Third-Highest Price per Category
--Task: Retrieve products with the third-highest price in each category.

--Tables: products (columns: id, product_name, price, category_id)

--DDL and DML:

--CREATE TABLE products ( id INT PRIMARY KEY, product_name VARCHAR(100), price DECIMAL(10, 2), category_id INT );

--INSERT INTO products (id, product_name, price, category_id) VALUES (1, 'Phone', 800, 1), (2, 'Laptop', 1500, 1), (3, 'Tablet', 600, 1), (4, 'Smartwatch', 300, 1), (5, 'Headphones', 200, 2), (6, 'Speakers', 300, 2), (7, 'Earbuds', 100, 2);

--Find Employees Between Company Average and Department Max Salary
--Task: Retrieve employees with salaries above the company average but below the maximum in their department.

--Tables: employees (columns: id, name, salary, department_id)

--DDL and DML:

--CREATE TABLE employees ( id INT PRIMARY KEY, name VARCHAR(100), salary DECIMAL(10, 2), department_id INT );

--INSERT INTO employees (id, name, salary, department_id) VALUES (1, 'Alex', 70000, 1), (2, 'Blake', 90000, 1), (3, 'Casey', 50000, 2), (4, 'Dana', 60000, 2), (5, 'Evan', 75000, 1);

--select * from products

with cte as (select * from products a where price in  
(select top 3 price from products b
where a.category_id=b.category_id 
group by category_id, price))
select * from cte a where price in
(select top 1 price from cte b where a.category_id=b.category_id
group by category_id, price order by price desc); 

--select * from employees

select * from employees a where salary>
(select avg(salary) from employees b
where a.department_id=b.department_id
group by department_id) and salary<>
(select max(salary) from employees c
where a.department_id=c.department_id
group by department_id)






