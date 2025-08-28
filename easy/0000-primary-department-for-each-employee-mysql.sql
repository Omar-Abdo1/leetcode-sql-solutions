-- Primary Department for Each Employee
-- /submissions/detail/1701654856/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 645 ms, Memory: 0.0B

# Write your MySQL query statement below
select employee_id,department_id
from
(select employee_id ,department_id from employee group by employee_id having count(employee_id)=1 ) as hdf1 
union 
select employee_id,department_id
from
(select employee_id ,department_id from employee where primary_flag!='N') as hdf1 

