-- Find Customer Referee
-- /submissions/detail/1688738021/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 2455 ms, Memory: 0.0B

/* Write your T-SQL query statement below */
select name from Customer 
where referee_id is null or  referee_id !=2

