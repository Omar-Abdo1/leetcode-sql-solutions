-- Number of Unique Subjects Taught by Each Teacher
-- /submissions/detail/1700165512/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 507 ms, Memory: 0.0B

# Write your MySQL query statement below
select teacher_id , count(distinct subject_id) as cnt from teacher  group by    teacher_id  

