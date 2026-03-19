-- Problem: Find the highest sale per product category
-- Title: Find the highest sale per product category
-- Difficulty: Medium
-- Description: Given a table `products` with columns `product_id`, 'product_category', `total_sales`
--              write a SQL query to calculate the highest sales in each product category.

-- Solution using GROUP BY
SELECT product_category, MAX(total_sales) AS highest_sale
FROM Products
GROUP BY product_category;

-- Solution using GROUP BY and HAVING to filter categories with highest sale exceeding 50,000
SELECT product_category, MAX(total_sales) AS highest_sale
FROM Products
GROUP BY product_category
HAVING MAX(total_sales) > 50000;

-- Alternative solution using window functions
SELECT * 
FROM (
    SELECT *, 
           MAX(total_sales) OVER (PARTITION BY product_category) AS highest_sale
    FROM Products
     ) AS subquery
WHERE total_sales = highest_sale;
 