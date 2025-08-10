-- Connect to the database (MySQL)
USE maven_advanced_sql;

-- View the Student Table
SELECT 
    *
FROM
    students;

-- The Big 6
SELECT grade_level, AVG(gpa) AS Avg_GPA
FROM
	students
WHERE school_lunch = "Yes"
GROUP BY grade_level
HAVING Avg_GPA < 3.2
ORDER BY grade_level;

-- Distinct
SELECT COUNT(DISTINCT
    (grade_level))
FROM
    students;

-- Max and Min
SELECT 
    MAX(gpa) - MIN(gpa) AS gpa_range
FROM
    students;
    
    
-- AND
SELECT 
    *
FROM
    students
WHERE
    grade_level < 12
        AND school_lunch = 'Yes';

-- IN 
SELECT 
    *
FROM
    students
WHERE
    grade_level IN (9,10,11)
        AND school_lunch = 'Yes';

-- IS NULL
SELECT 
    *
FROM
    students
WHERE
    email IS NULL;

-- Like
SELECT 
    *
FROM
    students
WHERE
    email LIKE '%.edu';
    
    
    
-- order by
SELECT *
FROM students
ORDER BY gpa DESC;


-- LIMIT
SELECT *
FROM students
ORDER BY gpa DESC
LIMIT 5;

-- Case statements
SELECT student_name, grade_level,

	CASE WHEN grade_level=9 THEN "Freshman"
    WHEN grade_level=10 THEN "Sophomore"
    WHEN grade_level=11 THEN "Junior"
    ELSE "Senior" END AS student_class
FROM students;