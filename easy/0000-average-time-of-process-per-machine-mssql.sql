-- Average Time of Process per Machine
-- /submissions/detail/1692063612/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 380 ms, Memory: 0.0B

/* Write your T-SQL query statement below */

select x.machine_id , round(avg(y.timestamp-x.timestamp),3) as processing_time
from activity X , activity Y 
where  x.machine_id=y.machine_id and  x.process_id=y.process_id and y.activity_type='end' and x.activity_type='start'
group by x.machine_id 

