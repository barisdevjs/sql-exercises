-- Lesson 10 Queries with aggregates (Pt. 1)

-- Find the longest time that an employee has been at the studio
SELECT MAX(Years_employed) FROM employees;

-- For each role, find the average number of years employed by employees in that role
SELECT Role, AVG(Years_employed) FROM employees GROUP BY Role;

-- Find the total number of employee years worked in each building
SELECT Building,SUM(Years_employed) FROM employees GROUP BY Building;  



-- Lesson 11: Queries with aggregates (Pt. 2)

--Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(Role) FROM employees WHERE Role='Artist';

-- Find the number of Employees of each role in the studio
SELECT Role,COUNT(Name) FROM employees GROUP BY Role;

--Find the total number of years employed by all Engineers
SELECT SUM(Years_employed) FROM employees WHERE Role='Engineer';


-- Lesson 12: Order of execution of a Query

--Find the number of movies each director has directed 
SELECT COUNT(Title), Director FROM movies GROUP BY Director;

--Find the total domestic and international sales that can be attributed to each director
SELECT Director, SUM(Domestic_sales +International_sales) as XX
FROM Boxoffice LEFT JOIN Movies 
WHERE Boxoffice.Movie_id = Movies.id
GROUP BY Director; 

-- Lesson 13: Inserting rows

--Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO Movies (Id,Title, Director,Year,Length_minutes)
VALUES (50000,'Toy Story 4','Brad Bird','2010','22');

--Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically
-- and 270 million internationally. Add the record to the BoxOffice table.
INSERT INTO Boxoffice  (Movie_id,Rating, Domestic_sales,International_sales)
VALUES (50000,8.7,340000000,270000000 );


-- Lesson 14: Updating rows

--The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
UPDATE movies
SET Director = 'John Lasseter' 
WHERE Title = 'A Bug''s Life';

--The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE movies
SET Year = 1999 
WHERE Title = 'Toy Story 2';

--Both the title and director for Toy Story 8 is incorrect! 
--The title should be "Toy Story 3" and it was directed by Lee Unkrich
UPDATE movies
SET Director = 'Lee Unkrich',
Title = 'Toy Story 3'
WHERE Title = 'Toy Story 8';


-- Lesson 15: Deleting rows

--This database is getting too big, lets remove all movies that were released before 2005.
DELETE FROM Movies
WHERE Year < 2005

--Andrew Stanton has also left the studio, so please remove all movies directed by him.
DELETE FROM Movies
WHERE Director='Andrew Stanton'



-- Lesson 16: Creating tables

--Create a new table named Database with the following columns:
-- Name A string (text)  Version A number (floating point)   Download_count An integer count 

CREATE TABLE  Database  (
    name TEXT,
    version FLOAT,  
    download_count INTEGER
)


-- Lesson 17: Altering tables

--Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in.
ALTER TABLE Movies ADD COLUMN  Aspect_ratio FLOAT;
SELECT * FROM movies;

--Add another column named Language with a TEXT data type to store the language that the movie was released in.
-- Ensure that the default for this language is English.
ALTER TABLE Movies ADD Language TEXT NOT NULL DEFAULT 'English';
SELECT * FROM movies;



--Lesson 18: Dropping tables

--We've sadly reached the end of our lessons, lets clean up by removing the Movies table
DROP TABLE Movies

--And drop the BoxOffice table as well 
DROP TABLE BoxOffice



