/*
===================================================================
Quality Checks
===================================================================

Script Overview:
    This script runs a series of validation checks to ensure the 
    integrity, consistency, and correctness of the Gold Layer. 
    These checks verify:
        - Surrogate keys in dimension tables are unique.
        - Fact tables correctly reference dimension tables.
        - All relationships in the data model are complete 
          and valid for analytical use.

Usage Guidelines:
    - Execute these checks after loading data into the Silver Layer.
    - Review and address any anomalies or mismatches identified 
      during the validation process.

===================================================================
*/

-- ===============================================================
-- Validating: 'gold.dim_customers'
-- ===============================================================

-- Purpose:
-- Verify that the surrogate key (customer_key) in gold.dim_customers 
-- is unique. Any duplicate values indicate a data integrity issue.
-- Expected Result: This query should return zero rows.

SELECT 
	customer_key,
	COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;


-- Purpose:
-- This query validates the logic used to derive the final gender 
-- value in the customer dimension. It compares the gender values 
-- from CRM (ci.cst_gndr) and ERP (ca.gen) sources to ensure the 
-- transformation rule is functioning as intended.
--
-- Logic Summary:
--   - CRM is considered the master source for gender information.
--   - If the CRM gender value is not 'n/a', it is used directly.
--   - Otherwise, the system falls back to the ERP gender value.
--   - If both values are missing, the result defaults to 'n/a'.
--
-- Expected Outcome:
--	 - All the different matchings of gender information from both tables
-- ===============================================================
SELECT DISTINCT

	ci.cst_gndr,
	ca.gen,
	CASE WHEN ci.cst_gndr !='n/a' THEN ci.cst_gndr --CRM is the master for gender Info
		 ELSE COALESCE(ca.gen,'n/a')
	END AS new_gen
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON ci.cst_key = la.cid
ORDER BY 1,2

-- ===============================================================
-- Checking 'gold.product_key'
-- ===============================================================

-- Check for Uniqueness of Product Key in gold.dim_products
-- Expectation: No results
SELECT
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


-- ===============================================================
-- Checking 'gold.fact_sales'
-- ===============================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL 
   OR c.customer_key IS NULL;


