-- https://www.hackerrank.com/challenges/full-score/problem

SELECT h.hacker_id, h.name FROM Hackers h
JOIN Submissions s ON h.hacker_id = s.hacker_id
JOIN Challenges c ON s.challenge_id = c.challenge_id
JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(c.challenge_id) > 1
ORDER BY COUNT(c.challenge_id) DESC, h.hacker_id;
