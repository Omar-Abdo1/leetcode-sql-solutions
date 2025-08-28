-- Employee Bonus
-- /submissions/detail/1696431512/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 978 ms, Memory: 0.0B

# Write your MySQL query statement below
select name ,  bonus 
from employee left outer join bonus on employee.empid = bonus.empid
where bonus is null or bonus<1000

