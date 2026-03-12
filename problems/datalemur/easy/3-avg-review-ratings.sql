-- Problem: DataLemur: Average Review Ratings by Month and Product
-- Title: Average Review Ratings by Month and Product
-- Difficulty: Easy
-- Description: Given a table `reviews` with columns `submit_date`, `product_id`, and `stars`, 
--              write a SQL query to find the average review ratings by month and product.


SELECT EXTRACT(MONTH FROM submit_date) AS mth,
       product_id,
       ROUND(AVG(stars),2) as avg_stars 

  FROM reviews
  GROUP BY mth, product_id
  ORDER BY mth, product_id

