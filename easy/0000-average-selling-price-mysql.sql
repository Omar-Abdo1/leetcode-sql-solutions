-- Average Selling Price
-- /submissions/detail/1697389451/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 793 ms, Memory: 0.0B

# Write your MySQL query statement below
select P.product_id , 
round( case when sum(U.units) is null or sum(U.units) =0 then 0.00 else sum(U.units*P.price)/sum(U.units) end  , 2) as 'average_price'  
from prices P  left outer join unitssold U 
on P.product_id = U.product_id and U.purchase_date between P.start_date and P.end_date 
group by P.product_id



