--# SQL Homework Tasks: Window Functions and Ranking

--This document contains SQL homework tasks focusing on window functions (such as ROW_NUMBER, RANK, DENSE_RANK, NTILE, LEAD, and LAG) and cumulative calculations. The tasks are divided into three difficulty levels: **Easy**, **Medium**, and **Difficult**.

-----

--## Easy Tasks (20)


--1. Write a query to assign a row number to each employee in the **Employees** table ordered by their Salary.
select *, ROW_NUMBER() over(order by id) from employees;
--2. Create a query to rank all products based on their Price in descending order.
select *, rank() over(order by price desc) from products;
--3. Use the **DENSE_RANK()** function to rank employees by Salary in the **Employees** table.
select *, DENSE_RANK() over(order by salary) from employees;
--4. Write a query to display the next (lead) salary for each employee in the same department using the **LEAD()** function.
select *, lead(salary) over(partition by department_id) from employees;
--5. Use **ROW_NUMBER()** to assign a unique number to each order in the **Orders** table.
select *, ROW_NUMBER() over(order by id) from orders;
--6. Create a query using **RANK()** to identify the highest and second-highest salaries in the **Employees** table.
with cte as (select *, rank() over (order by salary desc) as top from employees)
select * from cte where top<=2;
--7. Write a query to show the previous (lagged) salary for each employee in the **Employees** table using the **LAG()** function.
select *, lag(salary) over (order by id) from employees; 
--8. Use **NTILE(4)** to divide employees into 4 groups based on their Salary.
select *, NTILE(4) over(order by salary) from Employee;
--9. Write a query to partition employees by **DepartmentID** and assign a row number within each department.
select *, row_number() over(partition by departmentID) from Employee;
--10. Use **DENSE_RANK()** to rank products by Price in ascending order.
select *, DENSE_RANK() over(order by price asc) from Employee;
--11. Write a query to calculate the moving average of Price in the **Products** table using window functions.
select *, LEAD(avg(price)) over(order by id) from Products;
--12. Use the **LEAD()** function to display the salary of the next employee for each row in the **Employees** table.
select *, lead(salary) over(order by id) from Employee;
--13. Create a query to compute the cumulative sum of **SalesAmount** in the **Sales** table.
select *, SUM(salesamount) OVER (ORDER BY sales_id) from sales;
--14. Use **ROW_NUMBER()** to identify the top 5 most expensive products in the **Products** table.
with cte as (select *, ROW_NUMBER() over(order by product_id) as top from products)
select * from cte where top<=5;
--15. Write a query to partition the **Orders** table by **CustomerID** and calculate the total **OrderAmount** per customer.
SELECT customerid, SUM(orderamount) OVER (PARTITION BY customerid) AS total_orderamount FROM Orders;
--16. Use **RANK()** to rank orders in the **Orders** table based on their **OrderAmount**.
select *, RANK() over(order by orderamount) from orders;
--17. Write a query to compute the percentage contribution of **SalesAmount** by **ProductCategory** in the **Sales** table.
SELECT productcategory, SUM(salesamount) AS total_sales_by_category, SUM(salesamount) * 100.0 / SUM(SUM(salesamount)) OVER () AS percentage_contribution
FROM Sales GROUP BY productcategory;
--18. Use the **LEAD()** function to retrieve the next order date for each order in the **Orders** table.
SELECT *, LEAD(order_date) OVER (ORDER BY order_date) FROM Orders;
--19. Write a query using **NTILE(3)** to divide employees into 3 groups based on their Age.
select *, ntile(3) over (order by age);
--20. Use **ROW_NUMBER()** to list the most recently hired employees from the **Employees** table.
select *, ROW_NUMBER() over(order by date) from employee;

