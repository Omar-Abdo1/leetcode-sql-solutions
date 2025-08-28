-- Not Boring Movies
-- /submissions/detail/1697358328/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 256 ms, Memory: 0.0B

# Write your MySQL query statement below
select * from cinema 
where id%2=1 and description!='boring'
order by rating desc

