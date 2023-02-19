SELECT concat(Name,"(",SUBSTR(Occupation,1,1),")") AS result
FROM OCCUPATIONS
UNION ALL
SELECT concat('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.') AS result
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY result ASC;

SELECT CONCAT(NAME, '(', LEFT(OCCUPATION, 1), ')') as col
FROM  OCCUPATIONS
UNION ALL
SELECT CONCAT('There are a total of ', COUNT(OCCUPATION), ' ', lower(OCCUPATION), 's.') as col
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY col;