-- Count Salary Categories
-- /submissions/detail/1702793012/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 1433 ms, Memory: 0.0B

# Write your MySQL query statement below
select 'Low Salary' as category , (select count(account_id ) from accounts where income<20000) as accounts_count
union
select 'Average Salary' as category , (select count(account_id  ) from accounts where income between 20000 and 50000) as accounts_count
union  
select 'High Salary' as category , (select count(account_id) from accounts where income>50000) as accounts_count
    

