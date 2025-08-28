-- Friend Requests II: Who Has the Most Friends
-- /submissions/detail/1707811491/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 311 ms, Memory: 0.0B

# Write your MySQL query statement below
with all_ID as ( -- CTE
    select requester_id as 'id' from RequestAccepted 
    union all
    select accepter_id   from RequestAccepted
) 

select id , count(*) as 'num' from all_id
group by id
order by count(*) desc 
limit 1 



