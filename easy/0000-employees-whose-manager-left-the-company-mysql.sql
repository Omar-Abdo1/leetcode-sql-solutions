-- Employees Whose Manager Left the Company
-- /submissions/detail/1703385697/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 318 ms, Memory: 0.0B

# Write your MySQL query statement below
select employee_id 
from Employees 
where salary<30000
and manager_id  not in (select employee_id  from Employees )
order by employee_id 

