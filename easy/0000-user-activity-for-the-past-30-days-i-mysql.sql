-- User Activity for the Past 30 Days I
-- /submissions/detail/1700176840/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 580 ms, Memory: 0.0B

# Write your MySQL query statement below
select activity_date as 'day' , count(distinct user_id) as 'active_users'
from activity
where  activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
group by activity_date 

-- DATE_SUB(start_date, INTERVAL expr unit)
/*

*/

