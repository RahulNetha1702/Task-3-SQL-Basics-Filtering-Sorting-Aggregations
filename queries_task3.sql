
-- Task 3: SQL Basics – Filtering, Sorting, Aggregations
-- Dataset: Superstore Sales (example schema)

-- 1. View all records
SELECT * FROM superstore_sales;

-- 2. Count total records (verification after import)
SELECT COUNT(*) AS total_records FROM superstore_sales;

-- 3. Filter by category
SELECT *
FROM superstore_sales
WHERE category = 'Technology';

-- 4. Top 10 products by sales
SELECT product_name, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- 5. Sales and profit summary by category
SELECT 
    category,
    SUM(sales) AS total_sales,
    AVG(profit) AS avg_profit
FROM superstore_sales
GROUP BY category;

-- 6. Sales summary by region
SELECT 
    region,
    SUM(sales) AS total_sales,
    COUNT(*) AS order_count
FROM superstore_sales
GROUP BY region;

-- 7. Categories with sales greater than 100000
SELECT 
    category,
    SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY category
HAVING SUM(sales) > 100000;

-- 8. Monthly sales report using date range
SELECT 
    order_date,
    SUM(sales) AS daily_sales
FROM superstore_sales
WHERE order_date BETWEEN '2017-01-01' AND '2017-01-31'
GROUP BY order_date
ORDER BY order_date;

-- 9. Customer name pattern search
SELECT *
FROM superstore_sales
WHERE customer_name LIKE 'A%';
