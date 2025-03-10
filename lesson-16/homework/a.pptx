--Easy Tasks (20)

--Write a simple SELECT statement using a view named vwStaff to list all staff members from the Staff table.
select * from vwstaff;
--Create a view vwItemPrices that displays all items along with their prices from the Items table.
create view vwitemprices as select item, price from items;
--Write a query to create a temporary table called #TempPurchases and insert sample data into it.
create table #tempPurchases (id int, purchaseid varchar(50))
insert into #tempPurchases (id, purchaseid)
values (1, 7),
	   (2, 13),
	   (3, 27);
--Declare a temporary variable @currentRevenue to store the total revenue for the current month.
DECLARE @currentRevenue DECIMAL(18, 2);
--Write a scalar function named fnSquare that accepts a numeric input and returns its square.
create function fnsquare (@number int)
returns int
as
begin
    return @number * @number;
end;
--Create a stored procedure spGetClients to return the list of all clients from the Clients table.
create procedure spgetclients
as
begin
    select * from clients;
end;
--Write a query that uses the MERGE statement to combine data from Purchases and Clients.
merge purchases as P
Using Clients as C
on P.id=C.id
when matched then update set P.name = C.name, P.age=C.age
when not matched by target then 
	insert (id, name, age)
	values (C.id, C.name, C.age)
when not matched by source then delete
--Create a temporary table #StaffInfo to hold staff details and insert sample rows into it.
create table #staffinfo ( staffid int, staffname nvarchar(50), department nvarchar(50));
insert into #staffinfo (staffid, staffname, department)
values (1, 'jasur', 'hr'),
       (2, 'javohir', 'finance');
--Write a function fnEvenOdd that takes a numeric parameter and returns a string indicating whether the number is "Even" or "Odd."
create function fnEvenodd (@num int)
returns nvarchar(4)
as
begin
    return case when @num % 2 = 0 then 'even' else 'odd' end;
end;
--Create a stored procedure spMonthlyRevenue that calculates the total revenue for a specified month and year.
create procedure spmonthlyrevenue (@year int, @month int)
as
begin
    select sum(totalrevenue) as monthlyrevenue
    from sales
    where year(saledate) = @year and month(saledate) = @month;
end;
--Write a query to create a view vwRecentItemSales that shows the total sales per item for the last month.
create view vwrecentitemsales as
select itemid, sum(quantity) as totalsales
from sales
where saledate >= dateadd(month, -1, getdate())
group by itemid;
--Declare a temporary variable @currentDate to hold the current date and then print it.
declare @currentdate date;
set @currentdate = getdate();
print @currentdate;
--Create a view vwHighQuantityItems that lists items with quantities greater than 100 from the Items table.
create view vwhighquantityitems as
select itemid, itemname, quantity
from items
where quantity > 100;
--Write a query to create a temporary table #ClientOrders and join it with the Purchases table to display client orders.
create table #clientorders ( orderid int, clientid int, orderdate date);
insert into #clientorders (orderid, clientid, orderdate)
values (1, 101, '2025-03-10'),
       (2, 102, '2025-03-11');
select a.orderid, a.clientid, a.orderdate, b.itemid, b.quantity
from #clientorders a
join purchases b on a.clientid = b.clientid;
--Create a stored procedure spStaffDetails that takes a staff ID as a parameter and returns the staff member’s name and department.
create procedure spstaffdetails (@staffid int)
as
begin
    select staffname, department
    from staff
    where staffid = @staffid;
end;
--Write a simple function fnAddNumbers that takes two numeric parameters and returns their sum.
create function fnaddnumbers (@num1 int, @num2 int)
returns int
as
begin
    return @num1 + @num2;
end;
--Write a MERGE statement to update the Items table with new pricing data sourced from a temporary table #NewItemPrices.
merge into items as a
using (select itemid, newprice from #newitemprices) as b
on (a.itemid = b.itemid)
when matched then
    update set a.price = b.newprice;
--Create a view vwStaffSalaries that displays staff names along with their salaries.
create view vwstaffsalaries as
select staffname, salary
from staff;
--Write a stored procedure spClientPurchases that returns all purchases for a specific client given the client ID.
create procedure spclientpurchases (@clientid int)
as
begin
    select * from purchases
    where clientid = @clientid;
end;
--Write a function fnStringLength that returns the length of a given string parameter.
create function fnstringlength (@inputstring varchar(50))
returns int
as
begin
    return len(@inputstring);
end;


--Medium Tasks (20)

--Create a view vwClientOrderHistory that shows all purchases made by a specific client, including the purchase dates.
create view vwclientorderhistory as
select clientid, purchaseid, purchasedate
from purchases;
--Write a query to create a temporary table #YearlyItemSales that stores item sales data for the current year.
create table #yearlyitemsales (
    itemid int,
    saledate date,
    quantity int
);

insert into #yearlyitemsales (itemid, saledate, quantity)
select itemid, saledate, quantity
from sales
where year(saledate) = year(getdate());
--Develop a stored procedure spUpdatePurchaseStatus that accepts a purchase ID and updates its status.
create procedure spupdatepurchasestatus (@purchaseid int, @newstatus nvarchar(50))
as
begin
    update purchases
    set status = @newstatus
    where purchaseid = @purchaseid;
end;
--Write a MERGE statement to insert new records into the Purchases table if they don’t exist, or update them if they do.
merge into purchases as a
using (values (1, '2025-03-10', 2), (2, '2025-03-11', 1)) as b (purchaseid, purchasedate, quantity)
on (a.purchaseid = b.purchaseid)
when matched then
    update set
        a.purchasedate = b.purchasedate,
        a.quantity = b.quantity
when not matched then
    insert (purchaseid, purchasedate, quantity)
    values (b.purchaseid, b.purchasedate, b.quantity);
--Declare a temporary variable @avgItemSale that stores the average sale amount for a particular item.
declare @avgitemsale decimal(18, 2);
--Create a view vwItemOrderDetails that combines data from Purchases and Items to display item names and quantities ordered.
create view vwitemorderdetails as
select p.purchaseid, p.quantity, i.itemname
from purchases p
join items i on p.itemid = i.itemid;
--Write a function fnCalcDiscount that computes a discount amount based on a given percentage for an order.
create function fncalcdiscount (@orderamount decimal(18, 2), @discountpercentage float)
returns decimal(18, 2)
as
begin
    return @orderamount * (@discountpercentage / 100);
end;
--Create a stored procedure spDeleteOldPurchases to delete records of purchases older than a specified date.
create procedure spdeleteoldpurchases (@cutoffdate date)
as
begin
    delete from purchases
    where purchasedate < @cutoffdate;
end;
--Write a MERGE statement that updates staff salaries in the Staff table based on new data from a temporary table #SalaryUpdates.
merge into staff as target
using (select staffid, newsalary from #salaryupdates) as source
on (target.staffid = source.staffid)
when matched then
    update set target.salary = source.newsalary;
--Create a view vwStaffRevenue that displays the total revenue per staff member by joining the Staff and Sales (or Revenue) tables.
create view vwstaffrevenue as
select s.staffid, s.staffname, sum(r.revenue) as totalrevenue
from staff s
join sales r on s.staffid = r.staffid
group by s.staffid, s.staffname;
--Write a function fnWeekdayName that takes a date as input and returns the corresponding weekday.
create function fnweekdayname (@inputdate date)
returns nvarchar(10)
as
begin
    return datename(weekday, @inputdate);
end;
--Create a temporary table #TempStaff to store staff data and use an INSERT INTO ... SELECT statement to populate it from another table.
create table #tempstaff as
select * from staff;
--Write a query that uses a temporary variable to store and then display a client's total number of purchases.
declare @totalpurchases int;

select @totalpurchases = count(*)
from purchases
where clientid = 1;

print @totalpurchases;
--Create a stored procedure spClientDetails that accepts a client ID and returns full details of the client along with their purchase history
create procedure spclientdetails (@clientid int)
as
begin
    select * from clients
    where clientid = @clientid;

    select * from purchases
    where clientid = @clientid;
end;
--Write a MERGE statement to update stock quantities in the Items table based on incoming data from a Delivery table.
merge into items as target
using (select itemid, stockquantity from delivery) as source
on (target.itemid = source.itemid)
when matched then
   update set target.quantity = source.stockquantity;
--Create a stored procedure spMultiply that takes two numeric parameters, calculates their product, and returns the result.
create procedure spmultiply (@num1 float, @num2 float)
as
begin
    return @num1 * @num2;
end;
--Write a function fnCalcTax to compute the sales tax for a given purchase amount.
create function fncalctax (@amount decimal(18, 2), @taxrate float)
returns decimal(18, 2)
as
begin
    return @amount * (@taxrate / 100);
end;
--Create a view vwTopPerformingStaff that combines staff and purchase data to show which staff members have fulfilled the most orders.
create view vwtopperformingstaff as
select s.staffid, s.staffname, count(p.purchaseid) as totalorders
from staff s
join purchases p on s.staffid = p.staffid
group by s.staffid, s.staffname
order by totalorders desc;
--Write a MERGE statement to synchronize the Clients table with new records from a temporary data source #ClientDataTemp.
merge into clients as target
using (select * from #clientdatatemp) as source
on (target.clientid = source.clientid)
when matched then
    update set target.clientname = source.clientname
when not matched then
    insert (clientid, clientname)
    values (source.clientid, source.clientname);
--Create a stored procedure spTopItems to return the top 5 best-selling items.
create procedure sptopitems
as
begin
    select top 5 itemid, sum(quantity) as totalquantity
    from sales
    group by itemid
    order by totalquantity desc;
end;


--Difficult Tasks (20)

--Write a stored procedure spTopSalesStaff to determine the staff member with the highest total revenue in a given year.
create procedure sptopsalesstaff (@year int)
as
begin
    select top 1 s.staffid, s.staffname, sum(r.revenue) as totalrevenue
    from staff s
    join sales r on s.staffid = r.staffid
    where year(r.saledate) = @year
    group by s.staffid, s.staffname
    order by totalrevenue desc;
end;
--Create a view vwClientOrderStats that shows the number of purchases per client and the total purchase value.
create view vwclientorderstats as
select clientid, count(purchaseid) as totalpurchases, sum(totalamount) as totalpurchasevalue
from purchases
group by clientid;
--Write a MERGE statement to synchronize two tables, Purchases and Items, with both updates and inserts based on the latest sales data.
merge into purchases as target
using (select purchaseid, itemid, purchasedate, quantity from items) as source
on (target.purchaseid = source.purchaseid)
when matched then
    update set
        target.itemid = source.itemid,
        target.purchasedate = source.purchasedate,
        target.quantity = source.quantity
when not matched then
    insert (purchaseid, itemid, purchasedate, quantity)
    values (source.purchaseid, source.itemid, source.purchasedate, source.quantity);
--Create a function fnMonthlyRevenue that returns the total revenue for a specific year and month.
create function fnmonthlyrevenue (@year int, @month int)
returns decimal(18, 2)
as
begin
    declare @totalrevenue decimal(18, 2);
    select @totalrevenue = sum(revenue)
    from sales
    where year(saledate) = @year and month(saledate) = @month;
    return @totalrevenue;
end;
--Write a complex stored procedure spProcessOrderTotals that accepts multiple parameters, calculates order totals, and then updates the order status accordingly.
create procedure spprocessordertotals (@orderid int, @quantity int, @price decimal(18, 2), @status nvarchar(50))
as
begin
    declare @ordertotal decimal(18, 2);
    set @ordertotal = @quantity * @price;

    update orders
    set totalamount = @ordertotal,
        status = @status
    where orderid = @orderid;
end;
--Create a temporary table #StaffSalesData that joins staff records with their respective sales figures and use it in a subsequent calculation.
create table #staffsalesdata (
    staffid int,
    staffname nvarchar(50),
    totalrevenue decimal(18, 2)
);

insert into #staffsalesdata
select s.staffid, s.staffname, sum(r.revenue)
from staff s
join sales r on s.staffid = r.staffid
group by s.staffid, s.staffname;
--Write a MERGE statement to manage updates and deletions from a temporary table #SalesTemp into the main Sales table.
merge into sales as target
using (select saleid, itemid, saledate, quantity, revenue from #salestemp) as source
on (target.saleid = source.saleid)
when matched then
    update set
        target.itemid = source.itemid,
        target.saledate = source.saledate,
        target.quantity = source.quantity,
        target.revenue = source.revenue
when not matched by target then
    insert (saleid, itemid, saledate, quantity, revenue)
    values (source.saleid, source.itemid, source.saledate, source.quantity, source.revenue)
when not matched by source then
    delete;
--Create a stored procedure spOrdersByDateRange that accepts a start and end date, returning all purchases made within that period.
create procedure spordersbydaterange (@startdate date, @enddate date)
as
begin
    select * from purchases
    where purchasedate between @startdate and @enddate;
end;
--Write a function fnCompoundInterest to calculate compound interest for an investment given a rate, principal, and time period.
create function fncompoundinterest (@principal decimal(18, 2), @rate float, @time int)
returns decimal(18, 2)
as
begin
    declare @amount decimal(18, 2);
    set @amount = @principal * power((1 + @rate / 100), @time);
    return @amount - @principal;
end;
--Create a view vwQuotaExceeders that lists all staff members who have exceeded their sales quotas, along with their total sales.
create view vwquotaexceeders as
select s.staffid, s.staffname, sum(r.revenue) as totalsales
from staff s
join sales r on s.staffid = r.staffid
group by s.staffid, s.staffname
having sum(r.revenue) > (select quota from quotas where quotas.staffid = s.staffid);
--Write a stored procedure spSyncProductStock that merges two tables—one containing product details and one with stock levels—and updates stock quantities based on new inputs.
create procedure spsyncproductstock
as
begin
    merge into products as target
    using (select productid, stocklevel from stocklevels) as source
    on (target.productid = source.productid)
    when matched then
        update set target.stockquantity = source.stocklevel;
end;
--Write a MERGE statement to update staff records by comparing current data with new information provided in an external data file.
merge into staff as target
using (select staffid, staffname, department from #staffupdates) as source
on (target.staffid = source.staffid)
when matched then
    update set
        target.staffname = source.staffname,
        target.department = source.department;
--Create a function fnDateDiffDays that accepts two dates and returns the number of days between them.
create function fndatediffdays (@date1 date, @date2 date)
returns int
as
begin
    return datediff(day, @date1, @date2);
end;
--Write a complex stored procedure spUpdateItemPrices that adjusts product prices based on sales data, and then returns the updated price list.
create procedure spupdateitemprices
as
begin
    update items
    set price = (select avg(revenue / quantity) from sales where sales.itemid = items.itemid)
    where items.itemid in (select itemid from sales);
    
    select itemid, price from items;
end;
--Write a MERGE statement that compares client data and synchronizes the Clients table with a temporary data source.
merge into clients as target
using (select * from #clientdatatemp) as source
on (target.clientid = source.clientid)
when matched then
    update set target.clientname = source.clientname
when not matched then
    insert (clientid, clientname)
    values (source.clientid, source.clientname);
--Create a stored procedure spRegionalSalesReport that returns a summary report of total revenue per region, including average sales and sales per staff member.
create procedure spregionalsalesreport
as
begin
    select region, sum(revenue) as totalrevenue, avg(revenue) as averagerevenue, count(distinct staffid) as salesperstaff
    from sales
    group by region;
end;
--Write a function fnProfitMargin that calculates the profit margin for each item in a purchase.
create function fnprofitmargin (@cost decimal(18, 2), @revenue decimal(18, 2))
returns decimal(18, 2)
as
begin
    return (@revenue - @cost) / @revenue * 100;
end;
--Create a temporary table #TempStaffMerge and write a query to merge its data into the Staff table based on matching staff IDs.
create table #tempstaffmerge (
    staffid int,
    staffname nvarchar(50),
    department nvarchar(50)
);

merge into staff as target
using (select staffid, staffname, department from #tempstaffmerge) as source
on (target.staffid = source.staffid)
when matched then
    update set
        target.staffname = source.staffname,
        target.department = source.department
when not matched then
    insert (staffid, staffname, department)
    values (source.staffid, source.staffname, source.department);
--Write a stored procedure spBackupData to create backup copies of critical data from one table to another before performing deletions.
create procedure spbackupdata
as
begin
    select * into backup_purchases
    from purchases;

    select * into backup_clients
    from clients;
end;
--Create a stored procedure spTopSalesReport that generates a ranked report of the top 10 staff members based on sales performance, including both their ranking and total sales.
create procedure sptopsalesreport
as
begin
    select top 10 s.staffid, s.staffname, sum(r.revenue) as totalsales
    from staff s
    join sales r on s.staffid = r.staffid
    group by s.staffid, s.staffname
    order by totalsales desc;
end;
