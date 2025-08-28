-- Classes With at Least 5 Students
-- /submissions/detail/1700191853/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 389 ms, Memory: 0.0B

# Write your MySQL query statement below
select class 
from courses
group by class
having count(student)>=5 

