-- Revising the select query I
SELECT * FROM CITY WHERE COUNTRYCODE='USA' AND POPULATION >  100000;

-- Revising the select query II
SELECT NAME FROM CITY WHERE COUNTRYCODE='USA' AND POPULATION >  120000;

-- Select All
SELECT * FROM CITY;

--Select By ID
SELECT * FROM CITY WHERE ID ='1661';

--Japanese Cities' Attributes
SELECT * FROM CITY WHERE COUNTRYCODE='JPN';

--Weather Observation Station 1
SELECT CITY,STATE FROM STATION;

-----------------------------------------------------------------
--Weather Observation Station 2

--Weather Observation Station 3
SELECT DISTINCT(CITY) FROM STATION WHERE (ID%2)=0;

--Weather Observation Station 4
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;

--Weather Observation Station 5
SELECT CITY, LENGTH(CITY) as city_length
FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY) as city_length
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;

--Weather Observation Station 6
SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[aeiouAEIOU]';
SELECT DISTINCT city FROM station WHERE city REGEXP "^[aeiou].*";
SELECT DISTINCT(CITY) FROM STATION WHERE LEFT(LOWER(CITY), 1) IN ('a', 'e', 'i', 'o', 'u');

--Weather Observation Station 7
SELECT DISTINCT(CITY) FROM STATION WHERE RIGHT(LOWER(CITY), 1) IN ('a', 'e', 'i', 'o', 'u');
SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '[aeiouAEIOU]$';

--Weather Observation Station 8
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) REGEXP '[aeiouAEIOU]'
AND RIGHT(CITY, 1) REGEXP '[aeiouAEIOU]';

SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '^[aeiou].*[aeiou]$';

select city from station where substr(city,1,1) in ('A', 'E', 'I', 'O', 'U') and substr(city,-1,1) in ('a', 'e', 'i', 'o', 'u');

--Weather Observation Station 9
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT REGEXP '^[aeiouAEIOU]';

SELECT DISTINCT CITY FROM STATION WHERE 
LEFT(CITY, 1)
NOT IN ('a','e','i','o','u');

SELECT DISTINCT CITY FROM STATION WHERE 
SUBSTR(CITY,1,1)
NOT IN ('a','e','i','o','u');

SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[^aeiou]';

--Weather Observation Station 10
SELECT DISTINCT CITY FROM STATION WHERE 
SUBSTR(CITY,-1,1)
NOT IN ('a','e','i','o','u');

--Weather Observation Station 11
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
OR RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');

SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(CITY, 1,1) NOT IN ('a', 'e', 'i', 'o', 'u')
OR SUBSTR(CITY, -1,1) NOT IN ('a', 'e', 'i', 'o', 'u');

SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT REGEXP '^[aeiouAEIOU]'
OR CITY NOT REGEXP '[aeiouAEIOU]$';

--Weather Observation Station 12






