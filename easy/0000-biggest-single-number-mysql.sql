-- Biggest Single Number
-- /submissions/detail/1700198167/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 401 ms, Memory: 0.0B

# Write your MySQL query statement below
select max(num) as num
from
(
select num
from mynumbers     
group by num
having count(num)=1
) as hdf


