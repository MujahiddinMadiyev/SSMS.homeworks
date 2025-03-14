--Easy Tasks (20)  

--Write a simple subquery to list all items in the Items table where the price is greater than the average price of all items.
select * from items where price>(select avg(price) from items);
--Create a query using an independent subquery to find staff members who have worked in a division that employs more than 10 people.
select * from staff where division_id in (select division_id from divisions 
where (select count(*) from staff where staff.division_id = divisions.division_id) > 10);
--Write a query that uses a correlated subquery to list all staff members whose salary exceeds the average salary in their respective division.
select * from staff a where salary>(select avg(salary) from staff b where a.division=b.division);
--Use a subquery to find all clients who have made a purchase in the Purchases table.
select * from Clients a where exists(select * from Purchases b where a.ClientID=b.ClientID);
--Write a query that uses the EXISTS operator to retrieve all purchases that include at least one detail in the PurchaseDetails table.
select * from Purchases a where exists(select 1 from purchasedetails b where a.id=b.id);
--Create a subquery to list all items that have been sold more than 100 times according to the PurchaseDetails table.
select * from items where item_id in (select item_id from purchasedetails 
group by item_id having count(*) > 100);
--Use a subquery to list all staff members who earn more than the overall company’s average salary.
select * from staff where salary>(select avg(salary) from staff);
--Write a subquery to find all vendors that supply items with a price below $50.
select * from vendors where vendor_id in (select vendor_id from items where price < 50);
--Use a subquery to determine the maximum item price in the Items table.
select * from items where price=(select max(price) from items);
--Write a query using an independent subquery to find the highest total purchase value in the Purchases table.
select * from clients where client_id not in (select distinct client_id from purchases);
--Write a subquery to list clients who have never made a purchase.
select * from clients a where not exists(select * from Purchases b where a.ClientID=b.ClientID);
--Use a subquery to list all items that belong to the category "Electronics."
select * from items where Category=(select distinct(Category) from items where category='Electronics');
--Write a subquery to list all purchases that were made after a specified date.
select * from purchases where purchasedate > (select * from purchases where PurchaseDate '2025-01-01');
--Create a subquery to calculate the total number of items sold in a particular purchase.
select purchase_id, sum(quantity) as total_items_sold from purchasedetails group by purchase_id;
--Write a query to list staff members who have been employed for more than 5 years.
select * from staff where hire_date < dateadd(year, -5, getdate());
--Use a correlated subquery to list staff members who earn more than the average salary in their division.
select * from staff a where salary>(select avg(salary) from staff b where a.division=b.division);
--Write a query using the EXISTS operator to list purchases that include an item from the Items table.
select * from purchases p where exists (select 1 from purchasedetails pd 
join items i on pd.item_id = i.item_id where pd.purchase_id = p.purchase_id);
--Create a subquery to find clients who have made a purchase within the last 30 days.
select * from clients where client_id in (select client_id from purchases 
where purchase_date >= dateadd(day, -30, getdate()));
--Write a query using a subquery to identify the oldest item in the Items table.
select item_id, added_datefrom items where added_date = (select min(added_date) from items);
--Write a query to list staff members who are not assigned to any division.
select * from staff where division_id is null;
