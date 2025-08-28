-- Patients With a Condition
-- /submissions/detail/1707825973/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 334 ms, Memory: 0.0B

# Write your MySQL query statement below
select * from patients 
where conditions like '% DIAB1%' or conditions like 'DIAB1%'

