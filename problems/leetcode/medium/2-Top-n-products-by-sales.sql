-- Problem: Find the Top n products by sales
-- Title: Find the Top n products by sales
-- Difficulty: Medium
-- Description: Given a table `products` with columns `product_id`, 'product_category', `total_sales`
--              write a SQL query to calculate the top 2 products by sales in each product category.

-- Solution using ROW_NUMBER() to rank products within each category
SELECT product_id, product_category, total_sales
FROM (
    SELECT product_id, product_category, total_sales,
           ROW_NUMBER() OVER (PARTITION BY product_category ORDER BY total_sales DESC) AS sales_rank
    FROM Products
) AS ranked_products
WHERE sales_rank <= 2


-- Alternative solution using DENSE_RANK() to handle ties in sales
SELECT product_id, product_category, total_sales
FROM (
    SELECT product_id, product_category, total_sales,
           DENSE_RANK() OVER (PARTITION BY product_category ORDER BY total_sales DESC) AS sales_rank
    FROM Products
) AS ranked_products
WHERE sales_rank <= 2   

-- Alternative solution using RANK() to handle ties in sales
SELECT product_id, product_category, total_sales
FROM (
    SELECT product_id, product_category, total_sales,
           RANK() OVER (PARTITION BY product_category ORDER BY total_sales DESC) AS sales_rank
    FROM Products
) AS ranked_products
WHERE sales_rank <= 2;