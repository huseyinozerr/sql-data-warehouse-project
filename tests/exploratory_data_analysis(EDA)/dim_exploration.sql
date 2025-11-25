/*
--DATABASE EXPLORATION

--Explore all objects in the database 
SELECT * FROM INFORMATION_SCHEMA.TABLES

--Explore all columns on the database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'

--DIMENSION EXPLORATION

--Explore all countries our customers come from
SELECT DISTINCT 
country
FROM gold.dim_customers

--Explore all categories 'The major divisions'
SELECT DISTINCT
category,
subcategory,
product_name
FROM gold.dim_products
ORDER BY 1,2,3
*/
--DATE EXPLORATION

--Find the date of the first and last order
--How many years of sales are available
SELECT 
MIN(order_date) first_order_date,
MAX(order_date) last_order_date,
DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_in_years
FROM gold.fact_sales

--Find the oldest and youngest customers
SELECT 
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(year,MIN(birthdate),GETDATE())AS oldest_customer,
MAX(birthdate) AS youngest_birthdate,
DATEDIFF(year,MAX(birthdate),GETDATE())AS youngest_customer
FROM gold.dim_customers