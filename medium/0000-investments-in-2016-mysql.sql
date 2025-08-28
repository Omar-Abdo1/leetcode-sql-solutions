-- Investments in 2016
-- /submissions/detail/1707820450/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 600 ms, Memory: 0.0B

# Write your MySQL query statement below
select round(1.0*sum(tiv_2016),2) as 'tiv_2016'
from Insurance 
where tiv_2015 in
(
    select tiv_2015 from Insurance
    group by tiv_2015 
    having count(*)>1
)
and (lat,lon) in 
(
    select lat,lon from Insurance 
    group by lat,lon
    having count(*)=1
)

