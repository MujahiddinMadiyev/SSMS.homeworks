create database [SQL Functions and Group by]

create table orders (ord_no int,
purch_amt decimal (6,2),
ord_date date,
customer_id int,
salesman_id int)

insert into orders
values
(70001, 150.5  , '2012-10-05', 3005, 5002),
(70009, 270.65 , '2012-09-10', 3001, 5005),
(70002, 65.26  , '2012-10-05', 3002, 5001),
(70004, 110.5  , '2012-08-17', 3009, 5003),
(70007, 948.5  , '2012-09-10', 3005, 5002),
(70005, 2400.6 , '2012-07-27', 3007, 5001),
(70008, 5760   , '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4 , '2012-10-10', 3009, 5003),
(70012, 250.45 , '2012-06-27', 3008, 5002),
(70013, 3045.6 , '2012-04-25', 3002, 5001),
(70011, 75.29  , '2012-08-17', 3003, 5007)

create table customer (customer_id int,
cust_name varchar(50),
city varchar(50),
grade int,
salesman_id int)

insert into customer values
(3002, 'Nick Rimando  ', 'New York  ', 100, 5001),
(3007, 'Brad Davis    ', 'New York  ', 200, 5001),
(3005, 'Graham Zusi   ', 'California', 200, 5002),
(3008, 'Julian Green  ', 'London    ', 300, 5002),
(3004, 'Fabian Johnson', 'Paris     ', 300, 5006),
(3009, 'Geoff Cameron ', 'Berlin    ', 100, 5003),
(3003, 'Jozy Altidor  ', 'Moscow    ', 200, 5007),
(3001, 'Brad Guzan    ', 'London    ', null, 5005)

create table salesman (salesman_id int,
name varchar(50),
city varchar(50),
commission decimal(3,2))

insert into salesman values

(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris   ', 0.13),
(5005, 'Pit Alex  ', 'London  ', 0.11),
(5006, 'Mc Lyon   ', 'Paris   ', 0.14),
(5007, 'Paul Adam ', 'Rome    ', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12)

create table item_mast
(PRO_ID int,
PRO_NAME varchar(50),
PRO_PRICE decimal(6,2),
PRO_COM int)

insert into item_mast values
(101, 'Mother Board    ', 3200.00, 15),
(102, 'Key Board       ',  450.00, 16),
(103, 'ZIP drive       ',  250.00, 14),
(104, 'Speaker         ',  550.00, 16),
(105, 'Monitor         ', 5000.00, 11),
(106, 'DVD drive       ',  900.00, 12),
(107, 'CD drive        ',  800.00, 12),
(108, 'Printer         ', 2600.00, 13),
(109, 'Refill cartridge',  350.00, 13),
(110, 'Mouse           ',  250.00, 12)

create table emp_department
(DPT_CODE int,
DPT_NAME varchar(50),
DPT_ALLOTMENT int)

insert into emp_department values

(57, 'IT     ',  65000),
(63, 'Finance',  15000),
(47, 'HR     ', 240000),
(27, 'RD     ',  55000),
(89, 'QC     ',  75000)

create table emp_details
(EMP_IDNO int,
EMP_FNAME varchar(50),
EMP_LNAME varchar(50),
EMP_DEPT int)

insert into emp_details values

(127323, 'Michale ', 'Robbin   ', 57),
(526689, 'Carlos  ', 'Snares   ', 63),
(843795, 'Enric   ', 'Dosio    ', 57),
(328717, 'Jhon    ', 'Snares   ', 63),
(444527, 'Joseph  ', 'Dosni    ', 47),
(659831, 'Zanifer ', 'Emily    ', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey  ', 'Gabriel  ', 47),
(555935, 'Alex    ', 'Manuel   ', 57),
(539569, 'George  ', 'Mardy    ', 27),
(733843, 'Mario   ', 'Saule    ', 63),
(631548, 'Alan    ', 'Snappy   ', 27),
(839139, 'Maria   ', 'Foster   ', 57)


1. select sum(purch_amt) as sum from orders

2. select avg(purch_amt) as avg from orders

3. select count(distinct salesman_id) as count from orders

4. select count(customer_id) as count from customer

5. select count(customer_id) as count from customer where grade is not null

6. select max(purch_amt) as max from orders

7. select min(purch_amt) as min from orders

8. select city, max(grade) as max from customer group by city

9. select customer_id, max(purch_amt) as max from orders group by customer_id

10. select customer_id, ord_date, max(purch_amt) as max from orders group by customer_id, ord_date

11. select salesman_id, max(purch_amt) as max from orders where ord_date = '2012-08-17' group by salesman_id

12. select customer_id, ord_date, max(purch_amt) as max from orders 
where purch_amt>2000 group by customer_id, ord_date

13. select customer_id, ord_date, max(purch_amt) as max from orders
where purch_amt between 2000 and 6000 group by customer_id, ord_date

14. select customer_id, ord_date, max(purch_amt) as max from orders
group by customer_id, ord_date
having max(purch_amt) in (2000, 3000, 5760, 6000)

15. select customer_id, max(purch_amt) as max from orders
where customer_id between 3002 and 3007 group by customer_id

16. select customer_id, max(purch_amt) as max from orders 
where customer_id between 3002 and 3007 group by customer_id
having max(purch_amt)>1000

17. select salesman_id, max(purch_amt) as max from orders 
group by salesman_id
having salesman_id between 5003 and 5008

18. select count(ord_no) as count from orders
where ord_date = '2012-08-17'

19. select count(salesman_id) as count from salesman
where city is not null

20. select ord_date, salesman_id, count(*) as count from orders
group by ord_date, salesman_id

21. select avg(pro_price) as 'Average Price' from item_mast

22. select count(*) as 'Number of Products' from item_mast
where PRO_PRICE >= 350

23. select avg(pro_price) as 'Average Price', pro_com as 'Company iD' from item_mast
group by PRO_COM

24. select sum(dpt_allotment) as sum from emp_department

25. select emp_dept, count(*) as count from emp_details
group by emp_dept







