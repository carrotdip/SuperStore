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

-- 

-- View entirety of data
SELECT * FROM superstore;

-- Total sales, discounts, and profits by state
SELECT state, SUM(sales) as total_sales, SUM(discount) as total_discount, SUM(profit) as total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit DESC;
-- From the Tableau dashboard, it is clear that 
-- Texas, Ohio, Pennsylvania, and Illinois are the lowest-profit-producing states (< -$10,000)
-- California, New York, Washington, and Michigan are the highest-profit-producing states (> $20,000)

-- View category and sub_category by total_profits
SELECT category, sub_category, SUM(profit) as total_profit
FROM superstore
GROUP BY category, sub_category
ORDER BY total_profit;
-- Tables & Bookcases sub-categories in Furniture category have lost the company the most money
-- Copiers, Phones, and Accessories sub-categories in Technology category have generated the most profit

-- How has tables and bookcases fared by region?
SELECT region, category, sub_category, SUM(profit) as total_profit
FROM superstore
WHERE category = 'Furniture'
AND sub_category = 'Tables'
OR sub_category = 'Bookcases'
GROUP BY region, category, sub_category
ORDER BY region, total_profit;
-- Tables & Bookcases have not done well in all regions, best to remove this from store catalog

-- How have copiers, phones, and accessories fared by region?
SELECT region, category, sub_category, SUM(profit) as total_profit
FROM superstore
WHERE category = 'Technology'
AND sub_category = 'Copiers'
OR sub_category = 'Phones'
OR sub_category = 'Accessories'
GROUP BY region, category, sub_category
ORDER BY region, total_profit;
-- Increase marketing/advertisement for these items

