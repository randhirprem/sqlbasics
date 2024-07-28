use book_shop;
show tables;
-- Not eaqual
SELECT 
    *
FROM
    books
WHERE
    released_year != 2017;

SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname != 'Gaiman';

-- Not Like
SELECT 
    title
FROM
    books
WHERE
    title LIKE '% %';
SELECT 
    title
FROM
    books
WHERE
    title NOT LIKE '% %';
SELECT 
    title, author_fname, author_lname
FROM
    books
WHERE
    author_fname LIKE 'da%';
SELECT 
    title, author_fname, author_lname
FROM
    books
WHERE
    author_fname NOT LIKE 'da%';
SELECT 
    title
FROM
    books
WHERE
    title NOT LIKE '%e%';
SELECT 
    title
FROM
    books
WHERE
    title NOT LIKE '%a%';

-- Greater than > -- operator
SELECT 
    *
FROM
    books
WHERE
    released_year > 2000;
SELECT 
    *
FROM
    books
WHERE
    pages > 500;


-- less than or equal to

SELECT 
    title, released_year
FROM
    books
WHERE
    released_year < 2000;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year < 2000
ORDER BY released_year;
SELECT 
    title, pages
FROM
    books
WHERE
    pages < 200;

-- greater than or equal to less than or equal to
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year > 2010;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year > 2009;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year >= 2010;

SELECT 
    title, released_year
FROM
    books
WHERE
    released_year >= 2010
ORDER BY released_year;

SELECT 
    title, released_year
FROM
    books
WHERE
    released_year < 1985
ORDER BY released_year;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year <= 1985
ORDER BY released_year;

SELECT * FROM books
WHERE pages < 200;
 
SELECT * FROM books
WHERE released_year < 2000;
 
SELECT * FROM books
WHERE released_year <= 1985;

-- Logical operators
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Eggers';

SELECT 
    *
FROM
    books
WHERE
    released_year > 2010;

SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Eggers'
        AND released_year > 2010;
        
select title, author_lname, released_year from books
where released_year > 2010
and author_lname = 'Eggers';

SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    released_year > 2010
        AND author_lname = 'Eggers';
        
SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    released_year > 2010
        AND author_lname = 'Eggers'
        AND title LIKE '%novel%';       

SELECT 
    title, author_fname, author_lname, released_year
FROM
    books
WHERE
    released_year > 2010
        AND author_lname = 'Eggers'
        AND title LIKE '%novel%';       

SELECT 
    title, pages, CHAR_LENGTH(title)
FROM
    books
WHERE
    CHAR_LENGTH(title) > 30 AND pages > 500;
    
SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    released_year > 2010
        AND author_lname = 'Eggers';
 
SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    released_year > 2010
        AND author_lname = 'Eggers'
        AND title LIKE '%novel%';
        
-- Logical or
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname = 'Eggers'
        AND released_year > 2010;

SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname = 'Eggers'
        OR released_year > 2010;
        

SELECT 
    title, pages
FROM
    books
WHERE
    pages < 200 OR title LIKE '%stories%';
    
SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;
 
SELECT title, author_lname FROM books
WHERE author_lname='Eggers' AND
released_year > 2010;
 
SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR
released_year > 2010;
 
 
SELECT title, pages FROM books
WHERE pages < 200 
OR title LIKE '%stories%';

-- between
select title, released_year from books where released_year >= 2004 and released_year <= 2015;

-- alternative with between.
select title, pages from books where pages between 200 and 300;

select title, pages from books where pages between 200 and 300 order by pages;

SELECT title, released_year FROM books
WHERE released_year <= 2015
AND released_year >= 2004;

-- not between
select title, pages from books where pages not between 200 and 300 order by pages;
 
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;


-- compare date-time operations
SELECT * FROM people;
-- method 1
select * from people where birthdate < '2005-01-01';
-- method 2
select * from people where year(birthdate) < 2005;

-- someone born after 9
select * from people where birthtime > '09:00:00';

-- someone born after 12 pm
select * from people where birthtime > '12:00:00';

-- alternative
select * from people where hour(birthtime) > '09:00:00';

-- cast
select cast('09:00:00' as time);

select * from people where birthtime between '12:00:00' and '23:00:00';

select * from people where birthtime between cast('12:00' as time) and cast('23:00' as time);

select * from people where hour(birthtime) between 12 and 23;

SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);
 
 
SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;

-- in operator
select title, author_lname from books where author_lname = 'Carver'
or author_lname ='Lahiri'
or author_lname = 'Smith';

-- alternative
select title, author_lname from books where author_lname in ('Carver', 'Lahiri', 'Smith');
select title, author_lname from books where author_lname not in ('Carver', 'Lahiri', 'Smith');

select title, released_year from books where released_year >= 2000 and released_year % 2 != 0;

select title, released_year from books where released_year >= 2000 and released_year % 2 = 1;

SELECT title, author_lname FROM books
WHERE author_lname = 'Carver' 
OR author_lname = 'Lahiri'
OR author_lname = 'Smith';
 
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
 
SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');
 
 
SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year % 2 = 1;

-- case statements
select title, released_year,
		case
			when released_year >= 2000 then 'Modern Lit'
            else '20th Century Lit'
		end as GENRE
	FROM books;

select title, stock_quantity,
	case
		when stock_quantity between 0 and 50 then '*'
        when stock_quantity between 51 and 100 then '**'
        else '***'
	end as STOCK
FROM books;

-- alternative

select title, stock_quantity,
	case
		when stock_quantity <= 50 then '*'
        when stock_quantity <= 100 then '**'
        else '***'
	end as STOCK
FROM books;

sELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit' 
END AS genre
FROM books;
 
 
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
 
 
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
    
-- Is NULL
SELECT * FROM books where author_lname is null;
SELECT * FROM books where author_lname is not null;
select * from books;

SELECT * FROM books WHERE released_year < 1980;
 
SELECT * FROM books 
WHERE author_lname = 'Eggers'
OR author_lname = 'Chabon';
 
SELECT * FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;
 
SELECT * FROM books
WHERE pages >= 100 
AND pages <= 200;
 
SELECT * FROM books
WHERE pages BETWEEN 100 and 200;
 
SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';
 
SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');
 
SELECT title, author_lname,
CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' THEN 'Memoir' 
    WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
    ELSE 'Novel'
END AS type
FROM books;
 
 
SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;
 
