-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

SELECT w.id, tmp.age, tmp.coins_needed, tmp.power
FROM (
    SELECT wp.age, w.power, MIN(w.coins_needed) AS coins_needed
    FROM Wands as w
    JOIN Wands_Property AS wp ON w.code = wp.code
    WHERE wp.is_evil = 0
    GROUP BY wp.age, w.power
) AS tmp
JOIN Wands AS w ON w.coins_needed = tmp.coins_needed AND w.power = tmp.power
JOIN Wands_Property AS wp ON w.code = wp.code AND tmp.age = wp.age
ORDER BY tmp.power DESC, tmp.age DESC
