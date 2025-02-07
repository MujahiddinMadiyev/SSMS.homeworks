create database [Wildcard and Special operators]

create table salesman (salesman_id int, name  varchar(50), city varchar (50),  commission decimal(3,2))

insert into salesman
values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris   ', 0.13),
(5005, 'Pit Alex  ', 'London  ', 0.11),
(5006, 'Mc Lyon   ', 'Paris   ', 0.14),
(5007, 'Paul Adam ', 'Rome    ', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12)

create table customer (customer_id int, cust_name varchar(50), city varchar(50), grade int, salesman_id int)

insert into customer
values
(3002, 'Nick Rimando  ', 'New York  ', 100 , 5001),
(3007, 'Brad Davis    ', 'New York  ', 200 , 5001),
(3005, 'Graham Zusi   ', 'California', 200 , 5002),
(3008, 'Julian Green  ', 'London    ', 300 , 5002),
(3004, 'Fabian Johnson', 'Paris     ', 300 , 5006),
(3009, 'Geoff Cameron ', 'Berlin    ', 100 , 5003),
(3003, 'Jozy Altidor  ', 'Moscow    ', 200 , 5007),
(3001, 'Brad Guzan    ', 'London    ', null, 5005)

create table orders (ord_no int,     purch_amt decimal(6,2),   ord_date date,   customer_id int,  salesman_id int)

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

create table testtable (col1 varchar(100))

insert into testtable
values
('A001/DJ-402\44_/100/2015 '),
('A001_\DJ-402\44_/100/2015'),
('A001_DJ-402-2014-2015	   '),
('A002_DJ-401-2014-2015	   '),
('A001/DJ_401			   '),
('A001/DJ_402\44		   '),
('A001/DJ_402\44\2015	   '),
('A001/DJ-402%45\2015/200  '),
('A001/DJ_402\45\2015%100  '),
('A001/DJ_402%45\2015/300  '),
('A001/DJ-402\44		   ')

create table emp_details (EMP_IDNO int, EMP_FNAME varchar(50),        EMP_LNAME varchar (50),          EMP_DEPT int)

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

1. select * from salesman where city='paris' or city='rome'

2. select * from salesman where city='paris' or city='rome'

3. select * from salesman where not (city='paris' or city='rome')

4. select * from customer where customer_id in(3007, 3008, 3009)

5. select * from salesman where commission between 0.12 and 0.14

6. select * from orders where (purch_amt between 500 and 4000) and not purch_amt in(948.50, 1983.43)

7. select * from salesman where name between 'a' and 'l'

8. select * from salesman where not name between 'a' and 'm'

9. select * from customer where cust_name like 'b%'

10. select * from customer where cust_name like '%n'

11. select * from salesman where name like 'n__l%'

12. select * from testtable where col1 like '%!_%' escape '!'

13. select * from testtable where col1 not like '%!_%' escape '!'

14. select * from testtable where col1 like '%!/%' escape '!'

15. select * from testtable where col1 not like '%!/%' escape '!'

16. select * from testtable where col1 like '%!_!/%' escape '!'

17. select * from testtable where col1 not like '%!_!/%' escape '!'

18. select * from testtable where col1 like '%!%%' escape '!'

19. select * from testtable where col1 not like '%!%%' escape '!'

20. select * from customer where grade is null

21. select * from customer where grade is not null

22. select * from emp_details where EMP_LNAME like 'd%'
