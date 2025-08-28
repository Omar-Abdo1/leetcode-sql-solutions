-- Article Views I
-- /submissions/detail/1688745545/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 914 ms, Memory: 0.0B

/* Write your T-SQL query statement below */
select distinct author_id as [id] from Views 
where author_id=viewer_id
order by author_id

