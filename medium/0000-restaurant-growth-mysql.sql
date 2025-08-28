-- Restaurant Growth
-- /submissions/detail/1707808279/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 341 ms, Memory: 0.0B

# Write your MySQL query statement below
select c1.visited_on,sum(amount) as amount , round(sum(amount)/7.0  ,2) as 'average_amount' 
from     
(select distinct visited_on from customer ) as c1
cross join customer c2 
on datediff(c1.visited_on,c2.visited_on) between 0 and 6
group by c1.visited_on
having count(distinct c2.visited_on)=7
order by c1.visited_on


