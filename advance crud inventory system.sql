-- THIS IS A SPRING CLEANING COMPANY
-- THEY ARE A SECOND HAND CLOTHING RETAIL COMPANY
-- You are required to do the following
-- 1. create a database called shirts_db
-- 2. create a table called shirts
-- 3. it will contain shirt_id, article, color, shirt_size, last_worn
-- 4. the primary key is the shirt_id

-- create the data base
-- CREATE DATABASE shirts_db;
USE shirts_db;

-- create table with all the necessary info
-- CREATE TABLE shirts (
--     shirt_id INT AUTO_INCREMENT PRIMARY KEY,
--     article VARCHAR(50),
--     color VARCHAR(50),
--     shirt_size VARCHAR(5),
--     last_worn INT
-- );
desc shirts;

-- insert the article of clothing
INSERT INTO shirts (article, color, shirt_size, last_worn)  
VALUES 
	('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);
    
-- insert a puple shirt
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt','purple', 'M', 50);
-- read the table
SELECT 
    *
FROM
    shirts;
-- select all execpt for article and colour
SELECT 
    article, color
FROM
    shirts;
-- select medium shirts and print out everything except shirt_id
SELECT 
    article, color, shirt_size, last_worn
FROM
    shirts
WHERE
    shirt_size = 'M';

-- update all polo shirts where size is load
SELECT 
    *
FROM
    shirts
WHERE
    article = 'polo shirt';
UPDATE shirts 
SET 
    shirt_size = 'L'
WHERE
    article = 'polo shirt';
SELECT 
    *
FROM
    shirts
WHERE
    article = 'polo shirt';

-- update whirt last worn 15 days ago to 0
SELECT 
    *
FROM
    shirts
WHERE
    last_worn = 15;
UPDATE shirts 
SET 
    last_worn = 0
WHERE
    last_worn = 15;
SELECT 
    *
FROM
    shirts;

-- update all white shirts to xs and color to off white
SELECT 
    *
FROM
    shirts
WHERE
    color = 'white';
UPDATE shirts 
SET 
    shirt_size = 'XS',
    color = 'off white'
WHERE
    color = 'white';
SELECT 
    *
FROM
    shirts;

-- delete shirts that are 200days old
SELECT 
    *
FROM
    shirts
WHERE
    last_worn = 200;
DELETE FROM shirts 
WHERE
    last_worn = 200;
SELECT 
    *
FROM
    shirts;

-- delete all tank tops
SELECT 
    *
FROM
    shirts
WHERE
    article = 'tank top';
DELETE FROM shirts 
WHERE
    article = 'tank top';
SELECT 
    *
FROM
    shirts;

-- delete the info in shirts table
DELETE FROM shirts;
SELECT 
    *
FROM
    shirts;

drop table shirts;

