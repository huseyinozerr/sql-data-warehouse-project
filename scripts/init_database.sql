/*
=============================================================================
Create Database and Schemas
=============================================================================
Script Purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists
  If the database exists, it is dropped and recreated. Additionally, the script sets up 3 schemas in the database called 'bronze', 'silver' and 'gold'.

  WARNING: This script will drop the entire 'DataWarehouse' database if it already exists. All data in the database will be deleted permanently.
  Proceed with caution and ensure you have proper backups before running this scipt
*/

USE master;
GO 

--Drop and recreate the 'DataWarehouse' database
IF EXISTS  (Select 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO
  
--Create the DataWarehouse database
CREATE DATABASE DataWarehouse;
GO 
USE DataWarehouse;
GO
  
--Create Schemas  
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
