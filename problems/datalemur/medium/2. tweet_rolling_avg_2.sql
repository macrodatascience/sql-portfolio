-- Problem: DataLemur: Tweet Rolling Average given a table where the same user can have multiple tweets on the same day, calculate the 3-day rolling average of tweets for each user.
-- Title: Calculate 3-Day Rolling Average of Tweets from a table with multiple tweets per day
-- Difficulty: Medium
-- Description: Given a table `tweets` with columns `user_id`, `tweet_date`, and `tweets`, write a SQL query to calculate the 3-day rolling average of tweets for each user.

WITH daily_counts AS (
    SELECT
        user_id,
        tweet_date,
        SUM(tweets) as tweet_count
    FROM tweets
    GROUP BY user_id, tweet_date
)

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
FROM daily_counts
ORDER BY user_id, tweet_date;