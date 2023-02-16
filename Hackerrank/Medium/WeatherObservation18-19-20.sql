--18 Distance
SELECT ROUND(ABS(MIN(LAT_N)-MAX(LAT_N)) + ABS(MIN(LONG_W)-MAX(LONG_W)), 4) FROM STATION;

select round(abs(p.c-p.a)+abs(p.d-p.b),4) from 
(select max(s.LAT_N) as c, min(s.LAT_N) as a,
 max(s.LONG_W) as d,min(s.LONG_W) as b from station as s ) as p;

SET @a = (SELECT MIN(lat_n) FROM station);
SET @b = (SELECT MAX(lat_n) FROM station);
SET @c = (SELECT MIN(long_w) FROM station);
SET @d = (SELECT MAX(long_w) FROM station);
SET @distance = ABS(@a - @b) + ABS(@c - @d);
SELECT FORMAT(@distance, 4);                                        


--19 Euclidian
SELECT ROUND(SQRT(POW(ABS(MIN(LAT_N)-MAX(LAT_N)), 2) + POW(ABS(MIN(LONG_W)-MAX(LONG_W)), 2)), 4) 
FROM STATION;

SET @a = (SELECT MIN(lat_n) FROM station);
SET @b = (SELECT MAX(lat_n) FROM station);
SET @c = (SELECT MIN(long_w) FROM station);
SET @d = (SELECT MAX(long_w) FROM station);
SET @distance = SQRT(POW(ABS(@a - @b), 2) + POW(ABS(@c - @d), 2));
SELECT FORMAT(@distance, 4);  /* SELECT ROUND(@distance, 4);  */


--20 Median
SELECT ROUND(AVG(lat_n),4)
FROM (
  SELECT lat_n, ROW_NUMBER() OVER (ORDER BY lat_n) AS RowNum, COUNT(*) OVER () AS TotalRows
  FROM STATION 
) AS subquery
WHERE RowNum IN ((TotalRows + 1) / 2, (TotalRows + 2) / 2);


set @rowindex := -1; 
select round(avg(lat_n),4)
from
(select @rowindex:=@rowindex+1 as rowindex, lat_n 
from station
order by lat_n) as l 
where l.rowindex in (floor(@rowindex/2), ceil(@rowindex/2));