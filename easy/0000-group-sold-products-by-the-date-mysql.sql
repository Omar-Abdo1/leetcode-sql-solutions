-- Group Sold Products By The Date
-- /submissions/detail/1707840014/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 469 ms, Memory: 0.0B

# Write your MySQL query statement below
select sell_date , count(distinct product) as 'num_sold',
group_concat(distinct product order by product separator',') as 'products'
from Activities
group by sell_date
order by sell_Date

