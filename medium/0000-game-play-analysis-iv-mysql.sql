-- Game Play Analysis IV
-- /submissions/detail/1700047858/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 947 ms, Memory: 0.0B

# Write your MySQL query statement below
SELECT 
  ROUND(
    COUNT(DISTINCT player_id) / 
    (SELECT COUNT(DISTINCT player_id) FROM activity),2) AS fraction
FROM activity
WHERE (player_id, event_date) IN (
  SELECT 
    player_id,  DATE_ADD(MIN(event_date), INTERVAL 1 DAY)
  FROM activity
  GROUP BY player_id
);

