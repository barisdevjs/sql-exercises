SELECT h.hacker_id,h.name FROM Hackers h, Difficulty d, Submissions s, Challenges c
WHERE
h.hacker_id = s.hacker_id AND
d.difficulty_level = c.difficulty_level AND 
d.score = s.score AND 
s.challenge_id = c.challenge_id
GROUP BY  h.hacker_id,h.name 
HAVING COUNT(h.hacker_id) > 1 
ORDER BY COUNT(c.challenge_id) DESC, h.hacker_id;



SELECT H.hacker_id, H.name 
FROM Submissions AS S 
INNER JOIN Hackers AS H ON S.hacker_id = H.hacker_id 
INNER JOIN Challenges AS C ON S.challenge_id = C.challenge_id 
INNER JOIN Difficulty AS D ON C.difficulty_level = D.difficulty_level 
WHERE S.score = D.score 
GROUP BY H.hacker_id, H.name 
HAVING COUNT(S.score) > 1 
ORDER BY COUNT(*) DESC, H.hacker_id;



select hk.hacker_id, hk.name from Hackers hk
inner join Submissions sb on hk.hacker_id=sb.hacker_id 
inner join Challenges ch on sb.challenge_id=ch.challenge_id
inner join Difficulty df on df.difficulty_level=ch.difficulty_level
where sb.challenge_id=ch.challenge_id and ch.difficulty_level=df.difficulty_level and sb.score=df.score
group by hk.hacker_id, hk.name
having count(*)>1
order by count(*) desc, hk.hacker_id