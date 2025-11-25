/*
13. Literature Winner 1971

From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner.

Sample table: nobel_win
*/

SELECT winner
FROM dbo.Nobel_win
WHERE subject = 'Literature' and year = 1971;