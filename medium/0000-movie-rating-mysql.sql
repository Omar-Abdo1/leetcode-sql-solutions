-- Movie Rating
-- /submissions/detail/1707253136/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 1150 ms, Memory: 0.0B


(
select name as 'results'
from users u inner join movierating m on u.user_id=m.user_id
group by m.user_id , name
order by count(*) desc , name asc 
limit 1
)
union all
(
select title as 'results'
from movies ms inner join movierating m on ms.movie_id=m.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
group by m.movie_id , title
order by avg(rating) desc , title asc 
limit 1
)

