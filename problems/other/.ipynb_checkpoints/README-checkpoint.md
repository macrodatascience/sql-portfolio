# SQL Patterns Repository

This folder contains **20 SQL pattern scripts** that demonstrate common SQL techniques, window functions, aggregations, joins, and text parsing. Each file corresponds to a specific pattern and includes annotated example queries for reference and practice.

## Folder Structure

```
20_common_patterns.sql/
├─ 01_time_series.sql        # Time series queries (e.g., daily active users)
├─ 02_window_ratio.sql       # Window ratio queries (individual / global sums)
├─ 03_row_number.sql         # ROW_NUMBER usage (dedup, latest rows)
├─ 04_min_max_agg.sql        # MIN/MAX aggregation patterns
├─ 05_window_sum.sql         # Cumulative and total sums using window functions
├─ 06_conditional_agg.sql    # Conditional aggregation queries
├─ 07_string_agg.sql         # String aggregation (GROUP_CONCAT / STRING_AGG)
├─ 08_pivot_case.sql         # Pivot tables using CASE statements
├─ 09_subquery_offset.sql    # Subqueries and offsets (e.g., missing IDs)
├─ 10_self_join.sql          # Self-join patterns
├─ 11_date_logic.sql         # Date comparison and logic queries
├─ 12_moving_avg.sql         # Moving averages and growth calculations
├─ 13_ranking.sql            # RANK(), DENSE_RANK() examples
├─ 14_lag_growth.sql         # LAG() and growth calculations
├─ 15_recursive_cte.sql      # Recursive CTE examples
├─ 16_anti_join.sql          # Anti-join patterns (finding missing data)
├─ 17_text_parsing.sql       # Text parsing and substring extraction
├─ 18_coalesce.sql           # Handling NULLs using COALESCE
├─ 19_having_filter.sql      # HAVING clause filters on aggregated data
├─ 20_cross_join.sql         # CROSS JOIN and non-equijoin examples
```

## How to Use

1. Open your SQL environment (MySQL, PostgreSQL, etc.).
2. Navigate to the `sql_patterns` folder.
3. Open the 20_common_patterns.sql file, and execute the code snippet corresponding to the pattern you want to practice or reuse.
4. Execute the queries and modify table/column names as needed.

## Notes

* The script is annotated with comments to explain the query and pattern.
* Window function snippets include examples of `OVER()`, `PARTITION BY`, and `ORDER BY` usage.
* Code snippets are meant to serve as reusable templates for real-world SQL analysis.

---

Maintaining these snippets will help you quickly reference and apply SQL patterns for reporting, analytics, and data transformation tasks.
