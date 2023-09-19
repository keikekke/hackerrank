-- https://www.hackerrank.com/challenges/challenges/problem

WITH tmp AS (
    SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS cnt
    FROM Hackers h
    JOIN Challenges c
    ON c.hacker_id = h.hacker_id
    GROUP BY h.hacker_id, h.name
),
cnts AS (
    SELECT cnt, COUNT(cnt) AS cntcnt
    FROM tmp
    GROUP BY cnt
    HAVING cntcnt > 1
)
SELECT * FROM tmp
WHERE tmp.cnt = (SELECT MAX(tmp.cnt) FROM tmp) OR tmp.cnt NOT IN (SELECT cnt FROM cnts)
ORDER BY tmp.cnt DESC, tmp.hacker_id
