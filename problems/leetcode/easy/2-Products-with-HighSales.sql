-- Problem: List product categories where the highest sale exceeds 50,000
-- Title: List Product Categories with High Sales
-- Difficulty: Easy
-- Description: Given a table `products` with columns `product_id`, 'product_category', `total_sales`
--              write a SQL query to list product categories where the highest sale exceeds 50,000.

SELECT product_category, MAX(total_sales) AS total
FROM Products
GROUP BY product_category
HAVING MAX(total_sales)>50000;