-- Exploration of dataset

-- VIEW TOP 25 $ PRODUCTS
SELECT product_id, category, sub_category, product_name, SUM(profit)
FROM superstore
GROUP BY product_id, category, sub_category, product_name
ORDER BY SUM(profit) DESC
LIMIT 25;

-- VIEW BOTTOM 25 $ PRODUCTS
SELECT product_id, category, sub_category, product_name, SUM(profit)
FROM superstore
GROUP BY product_id, category, sub_category, product_name
ORDER BY SUM(profit) ASC
LIMIT 25;

-- VIEW TOP 25 CUSTOMERS
SELECT customer_name, segment, SUM (profit)
FROM superstore
GROUP BY customer_name, segment
ORDER BY SUM(profit) DESC
LIMIT 25;

-- VIEW TOP 25 CORPORATE CUSTOMERS
SELECT customer_name, SUM (profit) as total_profit
FROM superstore
WHERE segment = 'Corporate'
GROUP BY customer_name
ORDER BY SUM(profit) DESC
LIMIT 25;

-- VIEW TOP 25 CONSUMER CUSTOMERS
SELECT customer_name, SUM (profit) as total_profit
FROM superstore
WHERE segment = 'Consumer'
GROUP BY customer_name
ORDER BY SUM(profit) DESC
LIMIT 25;

-- VIEW TOP 25 HOME OFFICE CUSTOMERS
SELECT customer_name, SUM (profit) as total_profit
FROM superstore
WHERE segment = 'Home Office'
GROUP BY customer_name
ORDER BY SUM(profit) DESC
LIMIT 25;

-- View total sales, quantities, & profits over the years
SELECT EXTRACT(year FROM order_date) AS order_year, SUM(sales) AS total_sales, SUM(Quantity) AS Total_Quantity, SUM(profit) AS Total_Profit
FROM superstore
GROUP BY 1
ORDER BY 1 ASC;
-- The store's sales and profit trends seems to be going in the right direction, profits and sales are increasing yearly

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Analysis for README

-- View entirety of data
SELECT * FROM superstore;

-- Total sales, discounts, and profits by state
SELECT state, SUM(sales) as total_sales, SUM(discount) AS total_discount, SUM(profit) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit DESC;
-- From the Tableau dashboard, it is clear that the East & West regions are the most profitable
-- From the prior query, Texas, Ohio, Pennsylvania, and Illinois are the lowest-profit-producing states (< -$10,000)
-- && California, New York, Washington, and Michigan are the highest-profit-producing states (> $20,000)

-- View total_profits by category and sub_category
SELECT category, sub_category, SUM(profit) as total_profit
FROM superstore
GROUP BY category, sub_category
ORDER BY total_profit;
-- Tables & Bookcases sub-categories in Furniture category have lost the company the most money
-- "Supplies" in Office Supplies have also lost money, need to do more digging into it
-- Copiers, Phones, and Accessories sub-categories in Technology category have generated the most profit
-- Binders, Paper, Storage, and Appliances in Office Supplies have also done well

-- View total_profits by region
SELECT region, category, SUM(profit) as total_profit
FROM superstore
GROUP BY region, category
ORDER BY region, category, total_profit;
-- Furniture category is lacking in profits compared to the others, and it is doing worse in Central > East > South > West

-- How has tables and bookcases fared by region?
SELECT region, category, sub_category, SUM(profit) as total_profit
FROM superstore
WHERE category = 'Furniture'
AND sub_category = 'Tables'
OR sub_category = 'Bookcases'
GROUP BY region, category, sub_category
ORDER BY region, total_profit;
-- Tables & Bookcases have not done well in ALL regions (across the board), best to remove them from store catalog/discontinue selling them

-- What specific items in tables/bookcases have not performed well?
SELECT product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Furniture'
AND sub_category IN ('Bookcases','Tables')
GROUP BY product_id, product_name
HAVING SUM(profit) < 0
AND COUNT(region)  = 4
ORDER BY SUM(profit);

-- Which items performed well?
SELECT product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Furniture'
AND sub_category IN ('Bookcases','Tables')
GROUP BY product_id, product_name
HAVING SUM(profit) > 0
AND COUNT(region)  = 4
ORDER BY SUM(profit) DESC;

-- Which Furniture items performed well across all 4 regions?
SELECT sub_category,product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Furniture'
GROUP BY sub_category, product_id, product_name
HAVING SUM(profit) > 0
AND COUNT(region)  = 4
ORDER BY sub_category, SUM(profit) DESC;

-- Which Furniture items did not perform well across all 4 regions?
SELECT sub_category, product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Furniture'
GROUP BY sub_category, product_id, product_name
HAVING SUM(profit) < 0
AND COUNT(region)  = 4
ORDER BY sub_category, SUM(profit);

-- Which Technology items performed well across all 4 regions?
SELECT sub_category,product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Technology'
GROUP BY sub_category, product_id, product_name
HAVING SUM(profit) > 0
AND COUNT(region)  = 4
ORDER BY sub_category, SUM(profit) DESC;

-- Which Technology items did not perform well across all 4 regions?
SELECT sub_category, product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Technology'
GROUP BY sub_category, product_id, product_name
HAVING SUM(profit) < 0
AND COUNT(region)  = 4
ORDER BY sub_category, SUM(profit);

-- Which Office Supplies items performed well across all 4 regions?
SELECT sub_category,product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Office Supplies'
GROUP BY sub_category, product_id, product_name
HAVING SUM(profit) > 0
AND COUNT(region)  = 4
ORDER BY sub_category, SUM(profit) DESC;

-- Which Office Supplies items did not perform well across all 4 regions?
SELECT sub_category, product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Office Supplies'
GROUP BY sub_category, product_id, product_name
HAVING SUM(profit) < 0
AND COUNT(region)  = 4
ORDER BY sub_category, SUM(profit);

-- What supplies in office supplies have done well/bad?
SELECT product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Office Supplies'
AND sub_category = 'Supplies'
GROUP BY product_name
ORDER BY total_profit;
-- Letter Openers across the board have negative profits, best to remove them from product catalog
-- This will put supplies in Office Supplies in the green again

-- How have copiers, phones, and accessories fared by region?
SELECT region, category, sub_category, SUM(profit) as total_profit
FROM superstore
WHERE category = 'Technology'
AND sub_category = 'Copiers'
OR sub_category = 'Phones'
OR sub_category = 'Accessories'
GROUP BY region, category, sub_category
ORDER BY region, total_profit;
-- Copiers, phones, and accessories have fared well across ALL regions, best to increase marketing/advertisement for these items

-- How have various office supplies fared by region?
SELECT region, category, sub_category, SUM(profit) as total_profit
FROM superstore
WHERE category = 'Furniture'
AND sub_category = 'Binders'
OR sub_category = 'Paper'
OR sub_category = 'Storage'
OR sub_category = 'Appliances'
GROUP BY region, category, sub_category
ORDER BY total_profit;
-- There is a small loss (-$2638) from appliances in office supplies in Central region, everything else is in the green

-- Technology - Machines by Region
SELECT region, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Technology'
AND sub_category = 'Machines'
GROUP BY region
ORDER BY total_profit;
-- losses overweigh profits in this sub_category in each region except for East

-- View total discounts per region
CREATE TABLE discount_profit_table AS
	SELECT region, SUM(discount) AS total_discount, SUM(profit) AS total_profit
	FROM superstore
	GROUP BY region
	ORDER BY region, SUM(discount), SUM(profit);
-- View created table	
SELECT * FROM discount_profit_table;
-- Describe the new table
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_name = 'discount_profit_table';
-- Drop row if it already exists
ALTER TABLE discount_profit_table
DROP COLUMN discount_profit_ratio;
-- Add column
ALTER TABLE discount_profit_table 
ADD COLUMN discount_profit_ratio FLOAT;
-- Set values in column
UPDATE discount_profit_table SET discount_profit_ratio=(total_discount/total_profit)*100;
-- View updated table	
SELECT region, total_discount, total_profit, ROUND(discount_profit_ratio::numeric,5) AS discount_profit_ratio
FROM discount_profit_table
ORDER BY discount_profit_ratio DESC;

-- Why are we losing money with furniture sales?
SELECT region, SUM(discount)/SUM(quantity) AS total_discount_per_sale, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Furniture'
GROUP BY region
ORDER BY region, SUM(profit);

-- Customer base by region
CREATE TABLE customer_table AS
	SELECT region, 
		COUNT(CASE WHEN segment='Consumer' THEN 1 END) AS consumer_count,
		COUNT(CASE WHEN segment='Corporate' THEN 1 END) AS corporate_count,
		COUNT(CASE WHEN segment='Home Office' THEN 1 END) AS homeoffice_count
	FROM superstore
	GROUP BY region;
-- View customer table
SELECT * FROM customer_table;
-- Describe customer table
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customer_table';
-- Drop column if it already exists
ALTER TABLE customer_table
DROP COLUMN total_customers;
-- Add column
ALTER TABLE customer_table
ADD COLUMN total_customers FLOAT;
-- Set values in new column
UPDATE customer_table SET total_customers = consumer_count + corporate_count + homeoffice_count;
-- View customer table
SELECT * FROM customer_table;


-- DROP TABLE if exists
DROP TABLE metrics_table_by_region;
-- numeric metrics descriptive table by region
CREATE TABLE metrics_table_by_region AS
	SELECT region, SUM(discount) AS total_discount, SUM(quantity) AS total_q_sold, 
	SUM(sales) AS total_sales, SUM(profit) AS total_profit
	FROM superstore
	GROUP BY region;
-- Create new column for profit ratio (PROFIT/SALES)
ALTER TABLE metrics_table_by_region
ADD COLUMN profit_ratio FLOAT;
-- Set values
UPDATE metrics_table_by_region
SET profit_ratio = total_profit/total_sales*100
-- View table
SELECT region, ROUND(total_discount::numeric,2) AS total_discount,
	total_q_sold,
	ROUND(total_sales::numeric,2) AS total_sales,
	ROUND(total_profit::numeric,2) AS total_profit,
	ROUND(profit_ratio::numeric,2) AS profit_ratio
FROM metrics_table_by_region
ORDER BY profit_ratio DESC;


-- Drop table if it exists
DROP TABLE customer_segment_table;
-- Discounts and profits per customer segment
CREATE TABLE customer_segment_table AS
	SELECT region, segment, COUNT(segment) as total_customers, SUM(discount) AS total_discount, SUM(quantity) AS total_q_sold, SUM(sales) as total_sales, SUM(profit) AS total_profit
	FROM superstore
	GROUP BY region, segment
	ORDER BY region, segment;
-- View table
SELECT * FROM customer_segment_table;
-- 

-- Ensure data quality
SELECT SUM(total_customers)
FROM customer_segment_table;
-- = 9994
SELECT SUM(total_customers)
FROM customer_table;
-- = 9994