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