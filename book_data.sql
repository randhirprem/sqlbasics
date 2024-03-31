-- create database book_shop;
-- use book_shop;
CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY (book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- check if the data is working
SELECT 
    *
FROM
    books;

-- Concat - combining stings together.

SELECT CONCAT('h', 'e', 'l', 'l');

-- from book data create author full name

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS 'author name'
FROM
    books;

-- concat_ws concat with seperator.
SELECT 
    CONCAT_WS(' ', author_fname, author_lname) AS 'author name'
FROM
    books;

-- creating a unique url slug 
SELECT 
    CONCAT_WS('-', title, author_fname, author_lname) AS 'URL SLUG'
FROM
    books;

-- substring larger piece of text return smaller set
-- Example
SELECT SUBSTRING('hello world', 1, 4);

-- Example
SELECT SUBSTRING('hello world', 1, 6);

-- example
SELECT SUBSTRING('hello world', 7);

-- example
SELECT SUBSTRING('hello world', - 3);

-- just the last string
SELECT SUBSTRING('hello world', - 1);

-- from books data
SELECT 
    title
FROM
    books;

SELECT 
    SUBSTRING(title, 1, 15)
FROM
    books;

SELECT 
    SUBSTR(title, 1, 15)
FROM
    books;

SELECT 
    SUBSTR(author_lname, 1, 1) AS 'initial', author_lname
FROM
    books;

-- combine cocat and substring
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title
FROM
    books;

-- author initial
SELECT 
    CONCAT(SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS author_initials
FROM
    books;
    
-- replace
-- example 
SELECT REPLACE('Hello world', 'Hell', '@#$%');

-- example
SELECT 
    REPLACE('cheese bread coffee milk',
        ' ',
        ' and ');
        
-- example
SELECT 
    *
FROM
    books;
SELECT 
    REPLACE(title, ' ', '-')
FROM
    books;
    
-- Reverse
-- example
SELECT REVERSE('hello world');

-- example
SELECT 
    REVERSE(author_fname)
FROM
    books;

-- example
SELECT 
    CONCAT(author_fname, REVERSE(author_fname))
FROM
    books;
    
-- Char_length
SELECT CHAR_LENGTH('hello world');

-- example
SELECT 
    CHAR_LENGTH(title) AS len, title
FROM
    books;

-- Upper & lower case
SELECT UPPER('hello world');

-- EXAMPLE
SELECT LOWER('HELLO');

-- EXAMPLE
SELECT 
    UCASE(title)
FROM
    books;
SELECT 
    CONCAT('I LOVE ', UCASE(title), ' !!!') AS Declaration
FROM
    books;
    
-- EXAMPLE INSERT
SELECT INSERT('HELLO BOBBY',6,0,' THERE');

-- lEFT & RIGHT
SELECT LEFT('OMGHAHAHALOL!', 3);
SELECT RIGHT('HAHAHAHA', 1);
SELECT 
    LEFT(author_lname, 1) AS initials
FROM
    books;

-- repeat
SELECT REPEAT('HA', 4);

-- TRIM
SELECT TRIM('   BOSTON ');

SELECT TRIM(LEADING '.' FROM '...BOSTON..');
SELECT TRIM(TRAILING '.' FROM '...BOSTON..');
SELECT TRIM(BOTH '.' FROM '...BOSTON..');

-- EXERCISE
SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

SELECT REPLACE(title, ' ', '->') AS title FROM books;
 
SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;
    
 
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;
 
 
SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;
 
SELECT title, CHAR_LENGTH(title) AS character_count FROM books;
 
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;


    
    






