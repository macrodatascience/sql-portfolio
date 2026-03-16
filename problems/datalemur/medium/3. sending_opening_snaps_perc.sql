-- Problem: DataLemur: Sending Opening Snaps Percentage
-- Title: time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group
-- Difficulty: Medium
-- Description: Given two tables, `activities` with columns `user_id`, `activity_type`, and `time_spent`, and `age_breakdown` with columns `user_id` and `age_bucket`, write a SQL query to calculate the percentage of time spent on sending snaps vs. opening snaps for each age group. The percentage should be calculated as (time spent on sending or opening snaps) / (total time spent on sending and opening snaps) * 100, rounded to 2 decimal places.

SELECT 
    ab.age_bucket,

    ROUND(SUM(CASE 
            WHEN a.activity_type = 'send' 
            THEN a.time_spent 
            ELSE 0 
        END) * 100.0
    /
    SUM(CASE 
            WHEN a.activity_type IN ('send','open') 
            THEN a.time_spent 
            ELSE 0 
        END),2) AS send_perc,

      ROUND(
      SUM(CASE 
            WHEN a.activity_type = 'open' 
            THEN a.time_spent 
            ELSE 0 
        END) * 100.0
    /
    SUM(CASE 
            WHEN a.activity_type IN ('send','open') 
            THEN a.time_spent 
            ELSE 0 
        END), 2) AS open_perc

FROM activities a
JOIN age_breakdown ab 
    ON a.user_id = ab.user_id

GROUP BY ab.age_bucket;