-- Problem: DataLemur: Duplicate Job Listings
-- Title: Count of companies with duplicate job listings
-- Difficulty: Easy
-- Description: Given a table `job_listings` with columns `company_id` and `title`, write a SQL query to find the count of companies that have duplicate job listings (i.e., the same job title, description listed more than once).  

WITH duplicate_job_listings AS (
    SELECT company_id
      FROM job_listings
    GROUP BY company_id, title, description
    HAVING COUNT(*) > 1
)
SELECT COUNT(DISTINCT company_id)
FROM duplicate_job_listings;
