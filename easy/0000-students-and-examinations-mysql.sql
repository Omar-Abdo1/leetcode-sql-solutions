-- Students and Examinations
-- /submissions/detail/1696454034/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 954 ms, Memory: 0.0B

# Write your MySQL query statement below
select S.student_id  ,student_name , SS.subject_name , count(E.student_id) as 'attended_exams'
from (students S cross join subjects SS)
left outer join Examinations E 
on E.student_id=S.student_id  and E.subject_name=SS.subject_name
group by S.student_id ,SS.subject_name,student_name
order by S.student_id ,SS.subject_name

