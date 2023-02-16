SELECT IF(GRADE < 8, NULL, NAME), GRADE, MARKS
FROM STUDENTS JOIN GRADES
WHERE MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, NAME


SELECT IF (Grades.Grade > 7, Students.Name, NULL) AS Sname, Grades.Grade, Students.Marks FROM Students 
INNER JOIN Grades ON Students.Marks BETWEEN Grades.Min_Mark AND Max_Mark
ORDER BY Grades.Grade DESC, Sname ASC, Students.Marks ASC;



SELECT 
   IF(Grades.Grade < 8, 'NULL', Students.Name) AS Name, 
   Grades.Grade, 
   Students.Marks 
FROM Students 
INNER JOIN Grades 
ON Students.Marks >= Grades.Min_Mark 
AND Students.Marks <= Grades.Max_Mark 
GROUP BY Grades.Grade, Name, Marks
ORDER BY Grades.Grade DESC, Name ASC, Marks ASC;