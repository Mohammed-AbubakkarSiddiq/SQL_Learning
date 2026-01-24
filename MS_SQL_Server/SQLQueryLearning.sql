use BikeStores;

--Crearing a database
create database BikeStores

--Deleting a database

--Closing outside connections
ALTER DATABASE Dummy
SET SINGLE_USER -- or RESTRICTED_USER
WITH ROLLBACK IMMEDIATE;
GO -- Separator  for running multiple queries

--Dropping a database
DROP DATABASE Dummy;
GO

-- Creating a table

create table production.pokemon(

id int identity(1,1) primary key,
name varchar(255) not null,
phone varchar(25),
email varchar(255)

);

-- Creating table with foreigh key

create table production.trainer (

id int identity(1,1) primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(255) not null unique,
phone varchar(40) not null, 
poke_id int not null
foreign key (poke_id)
	references production.pokemon (id)
	on delete cascade on update cascade
);

-- Insert statement

insert into production.pokemon (name, phone, email) 
	values ('Pikachu', '999-666-333', 'pikachu@gmail.com')

-- Implicitly

insert into production.pokemon values ('Bulbasar', '999-555-333', 'bulbasar@gmail.com') 

-- Excluding some columns if it is nullable

insert into production.pokemon (name, email) 
	values ('Pikachu', 'pikachu@gmail.com')


-- update statement

update production.pokemon set name = 'charizard', email = 'charizard@gmail.com' where id = 3

-- select statement


-- selecting particular columns with all rows.

select first_name, last_name, phone, email from sales.customers

-- selecting all columns only top 100 rows

select top 100 * from sales.customers 

-- selecting all columns with all rows.

select * from sales.customers 

-- aliasing

select first_name [first name], last_name as [last name], phone phone, email email, city city from sales.customers


-- where (filtering)

-- with equal to (=) operator

select * from sales.customers where state = 'ny'

select * from sales.customers where customer_id = 5

-- with not equal to (<>) operator

select * from sales.customers where customer_id <> 5

-- with and operator

select * from sales.customers where city = 'san diego' and customer_id = 91

-- or operator

select * from sales.customers where city = 'san diego' or city = 'los angeles'

-- and operator combiened with or

select * from sales.customers where (state = 'ny' or city = 'los angeles') and phone is not null

-- like operator

-- contains anywhere
select * from sales.customers where first_name like '%h%'

-- starts with
select * from sales.customers where first_name like 'p%'

-- ends with
select * from sales.customers where first_name like '%k'

-- null and not null values

select * from sales.customers where phone is null

select * from sales.customers where phone is not null

-- searching dates

select * from sales.orders where order_date = '01/14/2016'

select * from sales.orders where order_date = parse(('jan-14-2016') as date )

select * from sales.orders where order_date between '01-14-2016' and '01-18-2016'

-- Order By (Sorting)

-- Descending
select * from production.products order by model_year desc

-- Ascending
select * from production.products order by model_year asc

-- Ordinal (column's number)

select * from production.products order by 5 desc

-- Sorting by alias

select product_id, product_name as [Product Name] from production.products order by [Product Name] desc

-- Sorting by multiple columns

select * from production.products order by model_year, list_price asc

-- Joins

-- Inner join

-- Joining 2 tables

select * from production.products as p inner join production.brands as b on p.brand_id = b.brand_id

-- Joining 3 tables

select * from production.products as p inner join production.brands as b on p.brand_id = b.brand_id 
	inner join production.categories as c on p.category_id = c.category_id 

-- More clear table format

select product_id, product_name, model_year, list_price, brand_name, category_name from production.products as p inner join production.brands as b on p.brand_id = b.brand_id 
	inner join production.categories as c on p.category_id = c.category_id 


-- Left outer join or left join

select * from sales.stores as s left outer join sales.staffs as st on s.store_id = st.store_id

-- Right outer join or right join

select * from sales.staffs as s right outer join sales.stores as st on s.store_id = st.store_id

-- Full outer joins

select * from sales.staffs as s full outer join sales.stores as st on s.store_id = st.store_id

-- Aggregate functions

-- Sum

select sum(list_price) as TotalPrice from sales.order_items

-- Average

select avg(list_price) as Average from sales.order_items

-- Max

select max(list_price) as Maximum from sales.order_items

-- Min

select min(list_price) as Minimum from sales.order_items

-- Count

select count(*) as [Row Count] from sales.order_items

-- We can also have multiple aggregate function in select statement

select
	sum(list_price) as Sum,
	avg(list_price) as Average,
	max(list_price) as Maximum,
	min(list_price) as Minimum
	 from sales.order_items

-- Group By

select category_id, avg(list_price) as Average from production.products group by category_id

-- Group by multiple columns

select category_id, model_year, avg(list_price) as Average from production.products group by category_id, model_year

-- Having

select category_id, avg(list_price) as Average from production.products group by category_id 
	having avg(list_price) > 700

