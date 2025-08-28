-- Invalid Tweets
-- /submissions/detail/1688747746/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 878 ms, Memory: 0.0B

/* Write your T-SQL query statement below */
select tweet_id from Tweets
where len(content)>15

