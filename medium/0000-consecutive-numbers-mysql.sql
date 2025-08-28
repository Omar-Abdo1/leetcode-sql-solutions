-- Consecutive Numbers
-- /submissions/detail/1702376584/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 597 ms, Memory: 0.0B

# Write your MySQL query statement below
select distinct l1.num as ConsecutiveNums 
from logs l1 cross join logs l2 
cross join logs l3 
where l1.num=l2.num and l2.num=l3.num
and l3.id-l2.id=1 and l2.id-l1.id=1

