-- Find Followers Count
-- /submissions/detail/1700193555/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 601 ms, Memory: 0.0B

# Write your MySQL query statement below
select user_id , count(follower_id) as 'followers_count'
from followers
group by user_id
order by user_id 

