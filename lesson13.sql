-- INSTEAD OF TYPING THIS QUERY ALL THE TIME...
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    reviews
        JOIN
    series ON series.id = reviews.series_id
        JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;
 
-- WE CAN CREATE A VIEW:
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
 
-- NOW WE CAN TREAT THAT VIEW AS A VIRTUAL TABLE 
-- (AT LEAST WHEN IT COMES TO SELECTING)
SELECT * FROM full_reviews;

create view ordered_series as
select * from series order by released_year;

create or replace view ordered_series as
select * from series order by released_year desc;

alter view ordered_series as
select * from series order by released_year;

select * from ordered_series;
DROP VIEW ordered_series;

-- having
SELECT title, avg(rating) FROM full_reviews group by title;

SELECT title, avg(rating),
count(rating) as review_count
FROM full_reviews group by title having count(rating) > 1;

-- roll up
select title, avg(rating) from full_reviews group by title with rollup;

select title, count(rating) from full_reviews group by title with rollup;

select released_year,genre, avg(rating) from full_reviews group by released_year, genre with rollup;
SELECT 
    title, AVG(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;
 
 
SELECT 
    title, COUNT(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;
 
 
SELECT 
    first_name, released_year, genre, AVG(rating)
FROM
    full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;

select @@global.sql_mode;
select @@session.sql_mode;
-- To View Modes:
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;
 
-- To Set Them:
-- SET GLOBAL sql_mode = 'modes';
-- SET SESSION sql_mode = 'modes';

