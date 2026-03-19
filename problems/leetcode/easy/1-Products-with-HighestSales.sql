-- Problem: List product categories with the highest sales (EXCLUDE categories with NULL sales)
-- Title: List Product Categories with High Sales
-- Difficulty: Easy
-- Description: Given a table `products` with columns `product_id`, 'product_category', `total_sales`
--              write a SQL query to list product categories with the highest sales.

SELECT product_category, MAX(total_sales) AS total
FROM Products
GROUP BY product_category
HAVING MAX(total_sales) IS NOT NULL;