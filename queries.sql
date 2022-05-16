-- View Table
SELECT * FROM superstore;

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
SELECT customer_name, SUM (profit), segment
FROM superstore
GROUP BY customer_name, segment
ORDER BY SUM(profit) DESC
LIMIT 25;

-- VIEW TOP 25 CORPORATE CUSTOMERS
SELECT customer_name, SUM (profit)
FROM superstore
WHERE segment = 'Corporate'
GROUP BY customer_name
ORDER BY SUM(profit) DESC
LIMIT 25;

-- VIEW TOP 25 CONSUMER CUSTOMERS
SELECT customer_name, SUM (profit)
FROM superstore
WHERE segment = 'Consumer'
GROUP BY customer_name
ORDER BY SUM(profit) DESC
LIMIT 25;

--------
--------


-- View entirety of data
SELECT * FROM superstore;

-- View total sales, quantities, & profits over the years
SELECT EXTRACT(year FROM order_date) AS order_year, SUM(sales) AS total_sales, SUM(Quantity) AS Total_Quantity, SUM(profit) AS Total_Profit
FROM superstore
GROUP BY 1
ORDER BY 1 ASC;
-- The store's sales and profit trends seems to be going in the right direction, profits and sales are increasing yearly

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

-- How has tables and bookcases fared by region?
SELECT region, category, sub_category, SUM(profit) as total_profit
FROM superstore
WHERE category = 'Furniture'
AND sub_category = 'Tables'
OR sub_category = 'Bookcases'
GROUP BY region, category, sub_category
ORDER BY region, total_profit;
-- Tables & Bookcases have not done well in ALL regions (across the board), best to remove them from store catalog/discontinue selling them

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

-- Why is Texas, Ohio, and Pennsylvania losing money?
SELECT category, sub_category, product_name, AVG(discount) as avg_discount, SUM(profit) as total_profit
FROM superstore
WHERE state IN ('Texas','Ohio','Pennsylvania')
GROUP BY category,sub_category, product_name
ORDER BY total_profit;
-- Compare to California, New York, and Michigan
SELECT category, sub_category, product_name, AVG(discount) as avg_discount, SUM(profit) as total_profit
FROM superstore
WHERE state IN ('California','New York','Michigan')
GROUP BY category,sub_category, product_name
ORDER BY total_profit;
-- we already know this, but losses for profitable states are mainly in Furniture (tables, bookcases, and chairs)
-- We give average of 0.3 discounts to profitable states
SELECT category, sub_category, product_name, AVG(discount) as avg_discount, SUM(profit) as total_profit
FROM superstore
WHERE state IN ('Texas','Ohio','Pennsylvania')
AND category NOT IN ('Furniture')
GROUP BY category,sub_category, product_name
ORDER BY total_profit;
-- losses for non-profitable states 
-- We have given an average or 0.65 discounts to non-profitable states

-- Technology - Machines by Region
SELECT region, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Technology'
AND sub_category = 'Machines'
GROUP BY region
ORDER BY total_profit;
-- losses overweigh profits in this sub_category in each region except for East

-- What products is the East selling that the West, Central, and South regions are not?
SELECT product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Technology'
AND sub_category = 'Machines'
AND region = 'East'
GROUP BY product_id, product_name
ORDER BY total_profit DESC;

-- How are these items faring in the other regions?
SELECT region, product_id, product_name, SUM(profit) AS total_profit
FROM superstore
WHERE product_id IN ('TEC-MA-10003979', 'TEC-MA-10001047', 'TEC-MA-10000045', 'TEC-MA-10001127', 'TEC-MA-10002927')
AND region NOT IN ('East')
GROUP BY region, product_id, product_name
ORDER BY total_profit DESC;
-- There have only been orders of one item "TEC-MA-10001127" in the South with a positive profit margin

-- Why are we losing money with furniture sales?

SELECT state
FROM superstore
WHERE region = 'West'
GROUP BY state;

