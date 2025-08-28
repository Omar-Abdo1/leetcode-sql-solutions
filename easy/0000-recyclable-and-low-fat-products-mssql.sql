-- Recyclable and Low Fat Products
-- /submissions/detail/1688735530/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 500 ms, Memory: 0.0B

/* Write your T-SQL query statement below */
select product_id   from Products 
where low_fats = 'Y' and recyclable ='Y'

