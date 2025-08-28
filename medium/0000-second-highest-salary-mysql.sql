-- Second Highest Salary
-- /submissions/detail/1707837363/
-- Difficulty: Medium
-- Database: MYSQL
-- Runtime: 299 ms, Memory: 0.0B

SELECT
    IFNULL(
        (SELECT DISTINCT salary
         FROM employee
         ORDER BY salary DESC
         LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary

