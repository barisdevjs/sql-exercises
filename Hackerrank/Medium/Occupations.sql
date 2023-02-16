--The PADS
SELECT CONCAT(name, CONCAT('(', (SELECT LEFT(occupation,1)),')'))
FROM OCCUPATIONS ORDER BY name ASC;
SELECT CONCAT('There are a total of ', COUNT(occupation), ' ',LOWER(occupation),'s.') as X
FROM OCCUPATIONS GROUP BY occupation ORDER BY X ASC;

--Occupations
set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation='Doctor' then (@r1:=@r1+1)
    when Occupation='Professor' then (@r2:=@r2+1)
    when Occupation='Singer' then (@r3:=@r3+1)
    when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
    ) AS temp
group by RowNumber;



SELECT 
MIN(CASE WHEN OCCUPATION = 'DOCTOR'      THEN NAME ELSE NULL END) ,
MIN(CASE WHEN OCCUPATION = 'PROFESSOR'   THEN NAME ELSE NULL END) ,
MIN(CASE WHEN OCCUPATION = 'SINGER'      THEN NAME ELSE NULL END) ,
MIN(CASE WHEN OCCUPATION = 'ACTOR'       THEN NAME ELSE NULL END)
FROM
(SELECT OCCUPATION, NAME, ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS X
FROM OCCUPATIONS) AS T
GROUP BY X