-- The Number of Employees Which Report to Each Employee
-- /submissions/detail/1701639816/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 733 ms, Memory: 0.0B

# Write your MySQL query statement below
select Y.employee_id  ,Y.name , count(X.employee_id) as 'reports_count',
round(avg(X.age))  as 'average_age'
from
employees X inner join employees Y on X.reports_to=Y.employee_id
group by Y.employee_id 
order by Y.employee_id 



