-- Department Top Three Salaries
-- /submissions/detail/1707816867/
-- Difficulty: Hard
-- Database: MYSQL
-- Runtime: 898 ms, Memory: 0.0B

# Write your MySQL query statement below
select Department  , Employee , Salary
from
(
    select Employee.name as 'Employee' , Department.name as 'Department' , salary , 
    DENSE_RANK() over (partition by Department.id order by salary desc) as dr
    from
    Employee inner join Department on Employee.departmentId=Department.id
) as hdf
where dr<=3

