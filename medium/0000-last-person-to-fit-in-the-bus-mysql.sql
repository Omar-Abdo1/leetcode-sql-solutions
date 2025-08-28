-- Last Person to Fit in the Bus
-- /submissions/detail/1702804671/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 1579 ms, Memory: 0.0B

# Write your MySQL query statement below
select  X.person_name
from queue X cross join queue Y 
where X.turn>=Y.turn
group by X.turn 
having sum(Y.weight)<=1000
order by X.turn desc
limit 1 -- same as top(1)
/*
x       y
6  -> 1,2,3,4,5,6
5 -> 1,2,3,4,5  
4 -> 1,2,3,4  
3 -> 1,2,3  
2 -> 1,2  
1 -> 1  
*/

