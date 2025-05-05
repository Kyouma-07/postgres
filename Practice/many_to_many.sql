select *
from reviewers;

select *
from reviews;

select *
from series;


--question1 Every review for every title of tv show.
--what we need is title, and rating
--title will be obtained from series and ratings from neviews.

Select s.title , r.rating
FROM series s
JOIN reviews r
ON s.id = r.series_id;


--Question 2 ( get title and avg rating for all the series in the series table )
--title will be obtained from series table , ratings from reviews 
--using the group by and agg avg function we can calculate the avg ratings of each show.

select s.title , ROUND(avg(r.rating),2) as avg_rating
FROM series s
JOIN reviews r
ON s.id = r.series_id
GROUP by s.title
ORDER by avg_rating ASC;


--Question 3 ( Matchup first and last name of every reviewers with any review they have made for any show)
--first name and last name can be gathered from reviewers table , ratings from reviews table 
--we can match each user with their id in both tables.

select CONCAT(a.first_name ,'-', a.last_name)  as Full_Name , b.rating as  rating
fROM reviewers a
JOIN reviews b
ON a.id = b.reviewer_id;

--Question 4 ( get the series tha has no reviews)
--get a left join and get the null values for their ratings.

Select s.title as unreviewed_series
FROM series s
LEFT JOIN reviews  r
ON s.id = r.series_id
WHERE r.rating is NULL;


--Question 5 ( genre and avg rating)
--JOIN series and  reviews table  and GROUP by genre and then we can calculate the avg)

Select s.genre , ROUND(AVG(r.rating),2) as avg_rating
FROM series s 
JOIN reviews r
ON s.id = r.series_id
GROUP BY s.genre
ORDER BY avg_rating ASC;


--Question 6 ( first_name , last_name , COUNT , min , max AVG , status)
--first_name, last_name from reviewers table ,  count is the number of ratings per user , MIN is their min rating and MAX is their MAX rating , AVG is avg rating and status indicates that whether or not they have left a review or not.

Select 
	a.first_name , 
	a.last_name ,
	COUNT(b.rating) ,
	COALESCE(MIN(b.rating),0) as  MIN,
	COALESCE(MAX(b.rating),0) as MAX,
	COALESCE(ROUND(AVG(b.rating)),0) as AVG,
	CASE
		WHEN COUNT(b.rating) = 0 THEN 'Inactive'
		ELSE 'active'
		END AS activity_status

FROM reviewers a
LEFT JOIN  reviews b
ON a.id = b.reviewer_id
GROUP BY a.first_name , a.last_name
ORDER BY COUNT(b.rating);

--Question 7 ( title , rating and reviewer)

SELECT a.title , b.rating , CONCAT(c.first_name,' ',last_name)
FROM series a
JOIN reviews b 
ON a.id = b.series_id
JOIN reviewers c
ON b.reviewer_id = c.id;


SELECT  *
FROM series a 
JOIN reviews b 
ON a.id = b.series_id
JOIN reviewers c
ON b.reviewer_id = c.id;

