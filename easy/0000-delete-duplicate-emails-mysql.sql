-- Delete Duplicate Emails
-- /submissions/detail/1707829533/
-- Difficulty: Easy
-- Database: MYSQL
-- Runtime: 579 ms, Memory: 0.0B

DELETE FROM Person
WHERE id NOT IN (
    SELECT * FROM (
        SELECT MIN(id)
        FROM Person
        GROUP BY email
    ) AS t
);

