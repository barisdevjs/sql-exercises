SELECT Start_Date, MIN(End_Date) FROM
(SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) AS s,
(SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) AS e
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY DATEDIFF(MIN(End_Date), Start_Date), Start_Date; 


with
t1 as 
(select start_date, row_number() over(order by start_date) rn1
from projects
where start_date not in (select end_date from projects)),

t2 as 
(select end_date, row_number() over(order by end_date) rn2
from projects
where end_date not in (select start_date from projects))

select t1.start_date, t2.end_date
from t1 join t2 
on t1.rn1 = t2.rn2
order by (t2.end_date-t1.start_date), start_date




