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