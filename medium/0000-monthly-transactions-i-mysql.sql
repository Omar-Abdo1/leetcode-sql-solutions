-- Monthly Transactions I
-- /submissions/detail/1697691894/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 523 ms, Memory: 0.0B

# Write your MySQL query statement below
select month , country , count(month) as 'trans_count' , 
count(case when state='approved' then 1 end) as 'approved_count',
sum(amount) as 'trans_total_amount',
sum(case when state='approved' then amount else 0 end) as 'approved_total_amount'
from (
select DATE_FORMAT(trans_date, '%Y-%m') AS 'month',country,amount,state from Transactions  
) as newTable
group by month,country
 

