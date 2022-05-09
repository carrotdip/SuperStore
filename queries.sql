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