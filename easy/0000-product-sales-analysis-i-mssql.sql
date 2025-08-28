-- Product Sales Analysis I
-- /submissions/detail/1688940048/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 2947 ms, Memory: 0.0B

/* Write your T-SQL query statement below */

select product_name ,  year  , price 
from Sales S inner join Product P 
on S.product_id=P.product_id

