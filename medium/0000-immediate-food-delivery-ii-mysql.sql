-- Immediate Food Delivery II
-- /submissions/detail/1700026715/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 595 ms, Memory: 0.0B

# Write your MySQL query statement below
select round(100.0*count(case when order_date=customer_pref_delivery_date then 1 end)/count(*),2)
as 'immediate_percentage'
 from
(
 select Delivery.* , row_number() over (partition by customer_id order by order_date) as rn from Delivery 
) as newhdf
where rn=1

