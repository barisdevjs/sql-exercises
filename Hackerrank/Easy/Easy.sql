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

--Weather Observation Station 2
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2) FROM STATION;

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

SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT REGEXP '^[aeiouAEIOU]'
AND CITY NOT REGEXP '[aeiouAEIOU]$'

--Higher Than 75 Marks
SELECT NAME FROM STUDENTS WHERE MARKS > 75 
ORDER BY RIGHT(NAME,3), ID ASC

SELECT Name
FROM Students
WHERE Marks > 75
ORDER BY SUBSTRING(Name, - 3), Id ASC;

--Employee Names
SELECT NAME FROM EMPLOYEE ORDER BY NAME ASC;

--Employee Salaries
SELECT NAME FROM EMPLOYEE WHERE salary > 2000 and months < 10  ORDER BY employee_id ASC;

--Type of Triangle
SELECT CASE 
WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle' 
WHEN A = B AND B = C THEN 'Equilateral' 
WHEN A = B OR B = C OR A = C THEN 'Isosceles' 
ELSE 'Scalene' 
END 
FROM TRIANGLES;

SELECT CASE             
            WHEN A + B > C AND B + C > A AND A + C > B THEN
                CASE 
                    WHEN A = B AND B = C THEN 'Equilateral'
                    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
                    ELSE 'Scalene'
                END
            ELSE 'Not A Triangle'
        END
FROM TRIANGLES;

--Revising Aggregations - The Sum Function
SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT='California';

--Revising Aggregations - Averages
SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT='California';

--Average Population
SELECT ROUND(AVG(POPULATION)) FROM CITY;
SELECT FLOOR(AVG(POPULATION)) FROM CITY;

--Japan Population
SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE ='JPN';

--Population Density Difference
SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY;

--The Blunder
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;

--Top Earners
SELECT salary * months AS earnings, COUNT(*) 
FROM Employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;

--Weather Observation Station 13
SELECT ROUND(SUM(LAT_N), 4) 
FROM STATION 
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;

SELECT ROUND(SUM(LAT_N), 4) 
FROM STATION 
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

--Weather Observation Station 14
SELECT TRUNCATE(MAX(LAT_N), 4)  /* TRUNCATE OR ROUND */
FROM STATION 
WHERE  LAT_N < 137.2345
ORDER BY LAT_N DESC LIMIT 1;

SELECT ROUND(LAT_N,4) FROM STATION 
WHERE LAT_N IN ( SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345 );

--Weather Observation Station 15
SELECT ROUND(LONG_W,4) FROM STATION 
WHERE LAT_N IN ( SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345 );

--Weather Observation Station 16
SELECT ROUND(LAT_N,4) FROM STATION 
WHERE LAT_N IN ( SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780 );

--Weather Observation Station 17
SELECT ROUND(LONG_W,4) FROM STATION 
WHERE LAT_N IN ( SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780 );

SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N>38.7780 ORDER BY LAT_N LIMIT 1;

--Population Census
SELECT SUM(CITY.POPULATION) 
FROM CITY
JOIN COUNTRY 
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent ='Asia';

SELECT SUM(CITY.POPULATION) 
FROM CITY, COUNTRY
WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND COUNTRY.CONTINENT = 'Asia';

--African Cities
SELECT CITY.NAME 
FROM CITY, COUNTRY
WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND COUNTRY.CONTINENT = 'Africa';

SELECT CITY.NAME  
FROM CITY
JOIN COUNTRY 
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent ='Africa';

--
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM CITY INNER JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;

SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION)) FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE GROUP BY COUNTRY.CONTINENT;

SELECT COUNTRY.Continent, ROUND(AVG(CITY.Population) - 0.5)
FROM COUNTRY JOIN CITY 
ON COUNTRY.Code = CITY.CountryCode GROUP BY COUNTRY.Continent; 

--Draw The Triangle 1
set @number = 21;
select repeat('* ', @number := @number - 1) from information_schema.tables;

WITH RECURSIVE rnum(n)
    AS (SELECT 20
            UNION ALL
            SELECT n-1
            FROM rnum
            WHERE n > 1)
SELECT REPEAT('* ', n)
FROM rnum;

--Draw The Triangle 2
WITH RECURSIVE rnum(n)
    AS (SELECT 1
            UNION ALL
            SELECT n+1
            FROM rnum
            WHERE n < 20)
SELECT REPEAT('* ', n)
FROM rnum;

SET @number = 0;
SELECT REPEAT('* ', @number := @number + 1) 
FROM information_schema.tables 
WHERE (@number < 20);

SET @number = 0;
SELECT REPEAT('* ', @number := @number + 1)
FROM information_schema.tables LIMIT 20;

--Revising Aggregations - The Count Function
SELECT COUNT(NAME) FROM CITY WHERE POPULATION > 100000;
select count(*) from city where population > 100000;