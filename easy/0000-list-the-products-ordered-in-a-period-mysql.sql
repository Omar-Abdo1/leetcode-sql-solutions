-- List the Products Ordered in a Period
-- /submissions/detail/1707841676/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 671 ms, Memory: 0.0B

# Write your MySQL query statement below
select product_name , sum(unit) as unit
from Products inner join Orders 
on products.product_id=orders.product_id
where order_date between '2020-02-01' and '2020-02-29'
group by orders.product_id
having sum(unit)>=100


