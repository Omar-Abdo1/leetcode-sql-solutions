-- Queries Quality and Percentage
-- /submissions/detail/1697473139/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 344 ms, Memory: 0.0B

# Write your MySQL query statement below
select query_name , round(avg(rating/position) ,2) as 'quality',
 round (100.0* count( case when rating<3 then 1 end)/ count(query_name),2 ) as 
'poor_query_percentage'
from queries
group by query_name



