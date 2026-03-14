sql_patterns/
├─ 01_time_series.sql
```sql
-- Pattern: TIME SERIES
-- Daily Active Users (DAU)
SELECT login_date,
       COUNT(DISTINCT user_id) AS dau
FROM user_logins
GROUP BY login_date
ORDER BY login_date;
```

├─ 02_window_ratio.sql
```sql
-- Pattern: WINDOW RATIO
-- Product sales as a percentage of total revenue
SELECT product_id,
       sales * 100.0 / SUM(sales) OVER () AS pct
FROM product_sales;

-- Percentage hires per year
SELECT year,
       hires,
       hires * 100.0 / SUM(hires) OVER () AS pct_hires
FROM table;
```

├─ 03_row_number.sql
```sql
-- Pattern: ROW_NUMBER
-- Keep only the most recent salary per employee
WITH ranked_salaries AS (
    SELECT employee,
           salary,
           ROW_NUMBER() OVER (PARTITION BY employee ORDER BY date DESC) AS rn
    FROM employees
)
SELECT employee, salary
FROM ranked_salaries
WHERE rn = 1;
```

├─ 04_min_max_agg.sql
```sql
-- Pattern: MIN/MAX AGG
-- First and last order date per customer
SELECT customer_id,
       MIN(order_date) AS first_order,
       MAX(order_date) AS last_order
FROM orders
GROUP BY customer_id;
```

├─ 05_window_sum.sql
```sql
-- Pattern: WINDOW SUM
-- Cumulative hires over years
SELECT year,
       hires,
       SUM(hires) OVER (ORDER BY year) AS cumulative_hires
FROM table;

-- Total hires (whole table)
SELECT year,
       hires,
       SUM(hires) OVER () AS total_hires
FROM table;
```

├─ 06_conditional_agg.sql
```sql
-- Pattern: CONDITIONAL AGG
-- Active vs Inactive users
SELECT SUM(CASE WHEN status='Active' THEN 1 ELSE 0 END) AS active_users,
       SUM(CASE WHEN status='Inactive' THEN 1 ELSE 0 END) AS inactive_users
FROM users;

-- Users who viewed before buying
SELECT user_id
FROM events
GROUP BY user_id
HAVING MIN(CASE WHEN event='View' THEN ts END) < MIN(CASE WHEN event='Buy' THEN ts END);
```

├─ 07_string_agg.sql
```sql
-- Pattern: STRING AGG
-- Comma-separated list of products bought by each user (MySQL)
SELECT user_id,
       GROUP_CONCAT(product ORDER BY product) AS purchased_products
FROM orders
GROUP BY user_id;
```

├─ 08_pivot_case.sql
```sql
-- Pattern: PIVOT / CASE
-- User active/inactive pivot
SELECT SUM(CASE WHEN status='Active' THEN 1 ELSE 0 END) AS active_users,
       SUM(CASE WHEN status='Inactive' THEN 1 ELSE 0 END) AS inactive_users
FROM users;
```

├─ 09_subquery_offset.sql
```sql
-- Pattern: SUBQUERY / OFFSET
-- Find missing IDs in sequence
SELECT t1.id + 1 AS missing_id
FROM invoices t1
LEFT JOIN invoices t2 ON t1.id + 1 = t2.id
WHERE t2.id IS NULL
  AND t1.id < (SELECT MAX(id) FROM invoices);
```

├─ 10_self_join.sql
```sql
-- Pattern: SELF JOIN
-- Users who viewed before buying (self join version)
SELECT DISTINCT u1.user
FROM users u1
JOIN users u2 ON u1.user = u2.user
              AND u1.event = 'View'
              AND u2.event = 'Buy'
              AND u1.time < u2.time;
```

├─ 11_date_logic.sql
```sql
-- Pattern: DATE LOGIC
-- Compare timestamps of events
SELECT user_id
FROM events
GROUP BY user_id
HAVING MIN(CASE WHEN event='View' THEN ts END) < MIN(CASE WHEN event='Buy' THEN ts END);
```

├─ 12_moving_avg.sql
```sql
-- Pattern: MOVING AVG
-- Month-over-month sales growth
SELECT month,
       (sales - LAG(sales) OVER (ORDER BY month)) * 100.0 / LAG(sales) OVER (ORDER BY month) AS pct_change
FROM monthly_sales;
```

├─ 13_ranking.sql
```sql
-- Pattern: RANKING
-- Highest paid employee in each department
SELECT dept, salary
FROM (
    SELECT *,
           RANK() OVER(PARTITION BY dept ORDER BY salary DESC) AS rnk
    FROM employees
) sub
WHERE rnk = 1;
```

├─ 14_lag_growth.sql
```sql
-- Pattern: LAG / GROWTH
-- Month-over-month percentage change
SELECT month,
       sales,
       (sales - LAG(sales) OVER (ORDER BY month)) / LAG(sales) OVER (ORDER BY month) * 100 AS pct_change
FROM monthly_sales;
```

├─ 15_recursive_cte.sql
```sql
-- Pattern: RECURSIVE CTE
WITH RECURSIVE cte AS (
    SELECT id, parent_id, name
    FROM categories
    WHERE parent_id IS NULL
    UNION ALL
    SELECT c.id, c.parent_id, c.name
    FROM categories c
    JOIN cte ON c.parent_id = cte.id
)
SELECT * FROM cte;
```

├─ 16_anti_join.sql
```sql
-- Pattern: ANTI-JOIN
-- Find users with no purchases
SELECT u.user_id
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.user_id IS NULL;
```

├─ 17_text_parsing.sql
```sql
-- Pattern: TEXT PARSING
-- Extract email domain
SELECT SUBSTRING_INDEX(email, '@', -1) AS domain
FROM users;
```

├─ 18_coalesce.sql
```sql
-- Pattern: COALESCE
-- Replace NULL department names
SELECT id,
       COALESCE(dept, 'Not Assigned') AS department
FROM employees;
```

├─ 19_having_filter.sql
```sql
-- Pattern: HAVING FILTER
-- Departments with total salary > 150
SELECT dept
FROM employees
GROUP BY dept
HAVING SUM(salary) > 150;
```

├─ 20_cross_join.sql
```sql
-- Pattern: CROSS JOIN
-- Team matchups (non-equijoin)
SELECT a.team AS Team_A, b.team AS Team_B
FROM teams a
JOIN teams b ON a.team < b.team;
```

