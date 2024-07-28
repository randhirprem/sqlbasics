use book_shop;
SELECT 
    *
FROM
    books;
-- insert new books to bookshop.
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
-- check if the books have been added
SELECT 
    *
FROM
    books;

-- distinct clause this prevents duplicates in a query
-- example without distinct

SELECT 
    author_lname
FROM
    books;
-- see that gaiman, eggers carver and etc are repeated more than once

SELECT DISTINCT
    (author_lname)
FROM
    books;

-- check year
SELECT 
    released_year
FROM
    books;
SELECT DISTINCT
    released_year
FROM
    books;

-- distinct author full name from books
SELECT DISTINCT
    CONCAT(author_fname, ' ', author_lname)
FROM
    books;

SELECT DISTINCT
    author_fname, author_lname
FROM
    books;

-- order by for
SELECT 
    book_id, title, author_lname
FROM
    books;

SELECT 
    book_id, author_fname, author_lname
FROM
    books;

SELECT 
    book_id, author_fname, author_lname
FROM
    books
ORDER BY author_lname;

SELECT 
    book_id, author_fname, author_lname
FROM
    books
ORDER BY author_lname DESC;

SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC;

SELECT 
    title, pages
FROM
    books
ORDER BY released_year DESC;

SELECT 
    book_id, author_fname, author_lname, pages
FROM
    books
ORDER BY 2 DESC;

SELECT 
    author_lname, released_year, title
FROM
    books
ORDER BY author_lname , released_year DESC;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author
FROM
    books
ORDER BY author DESC;

-- Limit

SELECT 
    book_id, title, released_year
FROM
    books
LIMIT 5;

SELECT 
    book_id, title, released_year
FROM
    books
ORDER BY released_year
LIMIT 5; -- the count we can do desc also

SELECT 
    book_id, title, released_year
FROM
    books
ORDER BY released_year
LIMIT 3,2; -- starting number and count 3,2

-- like operator
SELECT 
    title, author_fname, author_lname
FROM
    books
WHERE
    author_fname = 'David';

SELECT 
    title, author_fname, author_lname
FROM
    books
WHERE
    author_fname LIKE '%da%';-- '%da%' 

SELECT 
    *
FROM
    books
WHERE
    title LIKE '%:%';
    
SELECT 
    *
FROM
    books
WHERE
    author_fname LIKE '____';




SELECT 
    *
FROM
    books
WHERE
    author_fname LIKE '%n';
    
-- escaping wild card
SELECT 
    *
FROM
    books
WHERE
    title LIKE '%\%%';
    
    
-- To select books with an underscore '_' in title:
SELECT 
    *
FROM
    books
WHERE
    title LIKE '%\_%';
    
-- Exercise
SELECT 
    title
FROM
    books
WHERE
    title LIKE '%stories%';

SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;

SELECT 
    CONCAT(title, ' - ', released_year) AS summary
FROM
    books
ORDER BY released_year DESC
LIMIT 3;

SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE '% %';

SELECT 
    title, released_year, stock_quantity
FROM
    books
ORDER BY stock_quantity
LIMIT 3;

SELECT 
    title, author_lname
FROM
    books
ORDER BY author_lname , title;

SELECT 
    CONCAT('MY FAVOURITE AUTHOR IS ',
            UPPER(author_fname),
            ' ',
            UPPER(author_lname)) AS yell
FROM
    books
ORDER BY author_lname;
    
    










