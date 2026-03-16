-- Problem: DataLemur: Tweet Rolling Average
-- Title: Calculate 3-Day Rolling Average of Tweets
-- Difficulty: Medium
-- Description: Given a table `tweets` with columns `user_id`, `tweet_date`, and `tweet_count`, write a SQL query to calculate the 3-day rolling average of tweets for each user.

SELECT
    user_id,
    tweet_date,
    ROUND(
        AVG(tweet_count) OVER (
            PARTITION BY user_id
            ORDER BY tweet_date
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_avg_3d
FROM tweets
ORDER BY user_id, tweet_date;