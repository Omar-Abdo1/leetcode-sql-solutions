-- Replace Employee ID With The Unique Identifier
-- /submissions/detail/1688939001/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 1040 ms, Memory: 0.0B

/* Write your T-SQL query statement below */

select unique_id , name 
from Employees E left outer join EmployeeUNI EU
on E.id = EU.id 

