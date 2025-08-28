-- Big Countries
-- /submissions/detail/1688740169/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 558 ms, Memory: 0.0B

/* Write your T-SQL query statement below */
select name , population , area  from  World
where population>=25000000 or area>=3000000 

