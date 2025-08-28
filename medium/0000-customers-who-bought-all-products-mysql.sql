-- Customers Who Bought All Products
-- /submissions/detail/1700202855/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 606 ms, Memory: 0.0B

# Write your MySQL query statement below
select customer_id
from customer 
group by customer_id
having count( distinct product_key) = (select count(*) from product) 

