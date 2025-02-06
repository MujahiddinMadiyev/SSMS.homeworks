create database [Boolean and Relational operators]

1. create table Customer 
(customer_id int, cust_name varchar(50), city varchar(50), grade int, salesman_id int)

insert into Customer values
(3002, 'Nick Rimando  ', 'New York  ', 100, 5001),
(3007, 'Brad Davis    ', 'New York  ', 200, 5001),
(3005, 'Graham Zusi   ', 'California', 200, 5002),
(3008, 'Julian Green  ', 'London    ', 300, 5002),
(3004, 'Fabian Johnson', 'Paris     ', 300, 5006),
(3009, 'Geoff Cameron ', 'Berlin    ', 100, 5003),
(3003, 'Jozy Altidor  ', 'Moscow    ', 200, 5007),
(3001, 'Brad Guzan    ', 'London    ', null, 5005)

select * from Customer

select * from Customer where grade > 100

2. select * from Customer where city='New York' and grade>100

3. Select * from Customer where city='New York' or grade>100

4. select * from Customer where city='New York' or grade<=100

5. select * from Customer where not city = 'New York' and not grade>100

select * from Customer where (city = 'New York' or grade > 100)

6. create table orders (ord_no int, purch_amt decimal(6,2), ord_date date, customer_id int,  salesman_id int)

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
(70011, 75.29  , '2012-08-17', 3003, 5007),
(70013, 3045.6 , '2012-04-25', 3002, 5001)

select * from orders

select * from orders where not ((ord_date = '2012-09-10' AND salesman_id > 5005) OR purch_amt > 1000.00)

7. create table salesman (salesman_id int, name varchar (50), city varchar(50), commission decimal (3,2))

insert into salesman
values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris   ', 0.13),
(5005, 'Pit Alex  ', 'London  ', 0.11),
(5006, 'Mc Lyon   ', 'Paris   ', 0.14),
(5007, 'Paul Adam ', 'Rome    ', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12)

select * from salesman

select * from salesman where commission between 0.10 and 0.12

8. select * from orders where purch_amt < 200 or not (ord_date >= '2012-02-10' and customer_id<3009)

9. select * from orders where not ((ord_date='2012-08-17' or customer_id>3005) and purch_amt<1000)

10. select ord_no, purch_amt, 
((100 * purch_amt) / 6000) as 'achieved',
(100 * (6000 - purch_amt) / 6000) as 'Unachieved'
from orders
where (100 * purch_amt) / 6000>50

11. create table emp_details (EMP_IDNO int, EMP_FNAME varchar(50), EMP_LNAME varchar(50), EMP_DEPT int)

insert into emp_details
values
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

select * from emp_details

select * from emp_details where EMP_LNAME = 'Dosni' or EMP_LNAME = 'Mardy'

12. select * from emp_details where EMP_DEPT = 47 or EMP_DEPT = 63














































