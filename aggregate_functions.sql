-- Use book shop database aggregate functions
use book_shop;

-- Count Function
-- count the number of rows in the books DB
SELECT 
    COUNT(*)
FROM
    books;

-- Count the number of author_fname

SELECT 
    COUNT(author_fname)
FROM
    books;

-- count the distinct author_fname from books

SELECT 
    COUNT(DISTINCT author_fname)
FROM
    books;
    




-- count the number of distinct years books have been release

SELECT 
    COUNT(DISTINCT released_year)
FROM
    books;

-- count the distinct author_lname from books
SELECT 
    COUNT(DISTINCT author_lname)
FROM
    books;

-- count the number of books with the word the in the title
SELECT 
    COUNT(*)
FROM
    books
WHERE
    title LIKE '%the%';

-- GROUP BY ---
SELECT 
    author_lname, COUNT(*)
FROM
    books
GROUP BY author_lname;

SELECT 
    author_lname, COUNT(*) AS books_written
FROM
    books
GROUP BY author_lname
ORDER BY books_written DESC;

SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year;

-- MIN and MAX

SELECT 
    MIN(released_year)
FROM
    books;

-- max pages from books
SELECT 
    MAX(pages)
FROM
    books;

-- find the shorrtest author_lname
SELECT 
    MIN(author_lname), MAX(author_lname)
FROM
    books;

-- subqueries
SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;

-- this is prefered
SELECT 
    *
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);

-- title of the book released earlies
SELECT 
    MIN(released_year)
FROM
    books;

SELECT 
    title, released_year
FROM
    books
WHERE
    released_year = (SELECT 
            MIN(released_year)
        FROM
            books);

SELECT 
    title,
    released_year,
    CONCAT(author_fname, ' ', author_lname),
    pages
FROM
    books
WHERE
    released_year = (SELECT 
            MIN(released_year)
        FROM
            books);

-- grouping by multiple columns

SELECT 
    author_fname, author_lname
FROM
    books;

SELECT 
    author_lname, COUNT(*)
FROM
    books
GROUP BY author_lname , author_fname;

SELECT 
    author_fname, author_lname, COUNT(*)
FROM
    books
GROUP BY author_lname , author_fname;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*)
FROM
    books
GROUP BY author;

-- GROUP BY min Max
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    COUNT(*) AS book_count,
    MIN(released_year) AS earliest_release,
    MAX(released_year) AS latest_release,
    MAX(pages) AS page_count
FROM
    books
GROUP BY author;

SELECT 
    author_lname, MIN(released_year)
FROM
    books
GROUP BY author_lname;
 
SELECT 
    author_lname, MAX(released_year), MIN(released_year)
FROM
    books
GROUP BY author_lname;
 
SELECT 
    author_lname,
    COUNT(*) AS books_written,
    MAX(released_year) AS latest_release,
    MIN(released_year) AS earliest_release,
    MAX(pages) AS longest_page_count
FROM
    books
GROUP BY author_lname;
 
 
SELECT 
    author_lname,
    author_fname,
    COUNT(*) AS books_written,
    MAX(released_year) AS latest_release,
    MIN(released_year) AS earliest_release
FROM
    books
GROUP BY author_lname , author_fname;


-- SUM

SELECT 
    SUM(pages)
FROM
    books;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    SUM(pages) AS total_pages
FROM
    books
GROUP BY author;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    COUNT(*) AS number_of_books,
    SUM(pages) AS total_pages
FROM
    books
GROUP BY author;

-- STUPID QUERY
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    COUNT(*) AS number_of_books,
    SUM(released_year) AS stupid_label
FROM
    books
GROUP BY author;

SELECT 
    SUM(pages)
FROM
    books;
 
 
SELECT 
    author_lname, COUNT(*), SUM(pages)
FROM
    books
GROUP BY author_lname;

-- avg

SELECT 
    AVG(released_year)
FROM
    books;

SELECT 
    AVG(pages)
FROM
    books;

SELECT 
    AVG(stock_quantity)
FROM
    books;

-- Average quantity of books by release year

SELECT 
    AVG(stock_quantity), released_year, COUNT(*)
FROM
    books
GROUP BY released_year;

SELECT 
    AVG(pages)
FROM
    books;
 
SELECT 
    AVG(released_year)
FROM
    books;
 
SELECT 
    released_year, AVG(stock_quantity), COUNT(*)
FROM
    books
GROUP BY released_year;

-- exercise
SELECT 
    COUNT(*)
FROM
    books;

SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year;

SELECT 
    SUM(stock_quantity)
FROM
    books;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    AVG(released_year)
FROM
    books
GROUP BY author;

SELECT 
    MAX(pages)
FROM
    books;

SELECT 
    released_year AS 'year',
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM
    books
GROUP BY released_year
ORDER BY released_year;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, pages
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;


















