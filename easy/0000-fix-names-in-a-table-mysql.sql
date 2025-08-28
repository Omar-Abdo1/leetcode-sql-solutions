-- Fix Names in a Table
-- /submissions/detail/1707831984/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 584 ms, Memory: 0.0B

# Write your MySQL query statement below
select user_id , concat(upper(SUBSTRING(name,1,1)) , lower(SUBSTRING(name,2)))
as 'name'
 from users 
 order by user_id

