-- Confirmation Rate
-- /submissions/detail/1696482838/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 662 ms, Memory: 0.0B

SELECT 
  s.user_id,
  case 
  when count(c.user_id)=0 then 0.00
  else round( 1.0 * SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END)/count(c.user_id)  , 2)
  end as 'confirmation_rate'
FROM 
  Signups s
  LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY 
  s.user_id;


