-- Percentage of Users Attended a Contest
-- /submissions/detail/1697421117/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 963 ms, Memory: 0.0B

# Write your MySQL query statement below
select contest_id ,  round( count(u.user_id)/(select count(user_id) from users)*100.0  ,2) as 'percentage'
from users u inner join register r 
on u.user_id = r.user_id
group by contest_id 
order by percentage desc , contest_id


