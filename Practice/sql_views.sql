--Understanding views

CREATE VIEW  full_reviews AS
SELECT title , released_year , genre , rating , first_name , last_name
FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;


SELECT *
FROM full_reviews
WHERE genre = 'Animation';

DELETE FROM full_reviews
WHERE released_year = 2010;

--GROUP BY WITH ROLLUP

select released_year , AVG(rating)
FROM full_Reviews
GROUP BY released_year WITH ROLLUP;


SELECT released_year, AVG(rating)
FROM full_Reviews
GROUP BY GROUPING SETS ((released_year), ());

SELECT released_year, AVG(rating)
FROM full_Reviews
GROUP BY ROLLUP(released_year);


SELECT released_year, genre , AVG(rating)
FROM full_Reviews
GROUP BY ROLLUP(released_year , genre);


SELECT released_year, genre, AVG(rating)
FROM full_Reviews
GROUP BY GROUPING SETS ((released_year), (genre), ());


SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;