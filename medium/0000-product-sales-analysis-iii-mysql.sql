-- Product Sales Analysis III
-- /submissions/detail/1700183596/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 716 ms, Memory: 0.0B

# Write your MySQL query statement below
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
)

-- or using row_number()

