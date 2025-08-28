-- Managers with at Least 5 Direct Reports
-- /submissions/detail/1696462683/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 309 ms, Memory: 0.0B

# Write your MySQL query statement below
select Y.name 
from employee X inner join employee Y
on Y.id=X.managerid
group by Y.id
having count(X.id)>=5 

