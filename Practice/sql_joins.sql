--Question 1:

select *
From students;

select *
from papers;

--Question 2: (get first_name , title and  grade)
Select first_name , title , grade
From students 
JOIN papers
ON students.id = papers.student_id;


--Question 3:
Select first_name , title , grade
From students
LEFT JOIN papers
ON students.id = papers.student_id;


--Question 4:
Select first_name , coalesce(title,'MISSING') as title, coalesce(grade ,0) as grade
From students
LEFT JOIN papers
ON students.id = papers.student_id;


--Question 5:
select s.first_name , coalesce (ROUND(avg(p.grade),2), 0) as average
From students s
LEFT JOIN papers p
ON s.id = p.student_id
GROUP BY s.first_name;


--Question 6:
select s.first_name ,
	   coalesce (ROUND(avg(p.grade),2), 0) as average,
	   CASE
	   		WHEN coalesce (ROUND(avg(p.grade),2), 0) >= 75 THEN 'pass'
			ELSE 'fail'
			END AS passing_status
	   
From students s
LEFT JOIN papers p
ON s.id = p.student_id
GROUP BY s.first_name
ORDER BY average;

--Question 7
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviews
        INNER JOIN
    series ON reviews.series_id = series.id
        INNER JOIN
    reviewers ON reviews.reviewer_id = reviewers.id;







