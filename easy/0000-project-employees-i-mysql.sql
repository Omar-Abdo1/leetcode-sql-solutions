-- Project Employees I
-- /submissions/detail/1697413281/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 495 ms, Memory: 0.0B

# Write your MySQL query statement below
select P.project_id , round(avg(experience_years ),2)
as 'average_years'
from project p inner join employee e
on p.employee_id = e.employee_id
group by p.project_id


