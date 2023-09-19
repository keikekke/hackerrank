-- https://www.hackerrank.com/challenges/occupations/problem

WITH PIVOT AS (
    SELECT
        CASE WHEN Occupation = 'Doctor' THEN Name END AS Doctor,
        CASE WHEN Occupation = 'Professor' THEN Name END AS Professor,
        CASE WHEN Occupation = 'Singer' THEN Name END AS Singer,
        CASE WHEN Occupation = 'Actor' THEN Name END AS Actor,
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS RN
    FROM Occupations
)
SELECT
    MAX(Doctor) AS Doctor,
    MAX(Professor) AS Professor,
    MAX(Singer) AS Singer,
    MAX(Actor) AS Actor
FROM PIVOT
GROUP BY RN
ORDER BY RN
