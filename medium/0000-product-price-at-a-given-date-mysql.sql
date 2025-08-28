-- Product Price at a Given Date
-- /submissions/detail/1702439896/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 479 ms, Memory: 0.0B

# Write your MySQL query statement below
select hdf1.product_id , ifnull(new_price,10)  as 'price'
from (
  select  product_id  , new_price , row_number() over (partition by product_id order by change_date desc)  as rn  from products 
  where change_date<='2019-08-16'
) as hdf 
 right outer join (select distinct product_id from products) as hdf1
 on hdf.product_id=hdf1.product_id and rn=1



