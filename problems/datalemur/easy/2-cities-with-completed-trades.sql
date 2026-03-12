-- Problem: DataLemur: Cities With Completed Trades
-- Title: Top 3 Cities With Most Completed Trades
-- Difficulty: Easy
-- Description: Given tables `trades` and `users`, write a SQL query to find the top 3 cities with the most completed trades.

SELECT u.city, 
       count(*) as total_orders
  FROM trades t 
  JOIN users u on t.user_id = u.user_id
  WHERE t.status = 'Completed'
  GROUP BY u.city 
  ORDER BY total_orders DESC
  LIMIT 3