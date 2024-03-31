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
Select * from shirts;
-- select all execpt for article and colour
select article, color from shirts;
-- select medium shirts and print out everything except shirt_id
select article, color, shirt_size, last_worn from shirts where shirt_size ='M';

-- update all polo shirts where size is load
select * from shirts where article = 'polo shirt';
update shirts set shirt_size='L' where article = 'polo shirt';
select * from shirts where article = 'polo shirt';

-- update whirt last worn 15 days ago to 0
select * from shirts where last_worn = 15;
update shirts set last_worn=0 where last_worn=15;
select * from shirts;

-- update all white shirts to xs and color to off white
select * from shirts where color = 'white';
update shirts set shirt_size = 'XS', color='off white' where color = 'white';
select * from shirts;

-- delete shirts that are 200days old
select * from shirts where last_worn = 200;
delete from shirts where last_worn = 200;
select * from shirts;

-- delete all tank tops
select * from shirts where article = 'tank top';
delete from shirts where article = 'tank top';
select * from shirts;

-- delete the info in shirts table
delete from shirts;
select * from shirts;

drop table shirts;

