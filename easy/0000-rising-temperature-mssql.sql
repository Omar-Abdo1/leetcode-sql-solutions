-- Rising Temperature
-- /submissions/detail/1690908660/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 1039 ms, Memory: 0.0B

/* Write your T-SQL query statement below */
select W2.id
from weather W1 , weather W2
where datediff(day,w1.recordDate ,w2.recordDate)=1 
and w2.temperature>w1.temperature
 

