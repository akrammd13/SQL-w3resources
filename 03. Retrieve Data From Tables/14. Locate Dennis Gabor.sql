/*
14. Locate Dennis Gabor

From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject.

Sample table: nobel_win
*/

USE w3resources
GO

SELECT year, subject
FROM dbo.Nobel_win
WHERE winner = 'Dennis Gabor';
