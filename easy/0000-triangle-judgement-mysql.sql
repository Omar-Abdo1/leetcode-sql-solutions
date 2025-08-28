-- Triangle Judgement
-- /submissions/detail/1701663976/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 259 ms, Memory: 0.0B

# Write your MySQL query statement below
select x,y,z, 
case
when x+y>z and x+z>y and y+z>x then 'Yes'
else 'No'
end
as 'triangle'
from triangle 

