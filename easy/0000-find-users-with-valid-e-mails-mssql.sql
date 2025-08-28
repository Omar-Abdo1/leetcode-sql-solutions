-- Find Users With Valid E-Mails
-- /submissions/detail/1707869215/
-- Difficulty: Easy
-- Database: MSSQL
-- Runtime: 805 ms, Memory: 0.0B

SELECT *
FROM Users
WHERE 
    -- Starts with a letter (case insensitive)
    mail LIKE '[a-zA-Z]%'
    
    -- Contains only valid characters before @
    AND mail NOT LIKE '%[^a-zA-Z0-9_.-]%@leetcode.com'
    
    -- Ends with @leetcode.com (case sensitive check using BINARY_CHECKSUM)
    AND BINARY_CHECKSUM(RIGHT(mail, 13)) = BINARY_CHECKSUM('@leetcode.com')
    
    

