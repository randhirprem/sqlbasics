-- Data Types
use book_shop;

show tables;
drop table firends;
show tables;
drop table friends;
show tables;
-- char and varchar

CREATE TABLE friends (
    name VARCHAR(10)
);

insert into friends (name) values ('tom'), ('juan pablo'), ('james');

SELECT 
    *
FROM
    friends;

-- decimals
drop table products;
CREATE TABLE products (
    price DECIMAL(5 , 2 )
);
insert into products (price) values(4.50);
SELECT 
    *
FROM
    products;
insert into products (price) values(456.99);
SELECT 
    *
FROM
    products;

CREATE TABLE nums (
    x FLOAT,
    y DOUBLE
);
insert into nums (x,y) values (1.123, 1.123)

SELECT * from nums;

-- date and times
CREATE  TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

select * from people;

SELECT CURTIME();
 
SELECT CURDATE();
 
SELECT NOW();
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());
USE people;
select birthdate , DAY(birthdate) from people;
SELECT 
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM people;
 
SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;

SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime)
FROM people;
 
SELECT 
    birthdt,
    MONTH(birthdt),
    DAY(birthdt),
    HOUR(birthdt),
    MINUTE(birthdt)
FROM people;

select day(birthdate), monthname(birthdate), year(birthdate) from people;

select concat(day(birthdate), monthname(birthdate), year(birthdate)) from people;

select concat(day(birthdate), ' ', monthname(birthdate),' ', year(birthdate)) from people;

SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

SELECT birthdate, datediff(curdate(), birthdate) from people;

SELECT birthdate, datediff(curdate(), birthdt) from people;

select date_add(curdate(), interval 1 year);

select date_sub(curdate(), interval 1 year);

select birthdate,date_add(birthdate, interval 18 year) from people;

select timediff(curtime(), '07:00:00');

select now() - interval 18 year;

select name, birthdate, year(birthdate + interval 21 year)as will_be_21 from people;

-- timestamp
CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);

insert into captions (text) values ('fuck');
select * from captions;
 
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

insert into captions2 (text) values ('i love');
select * from captions2;
SET SQL_SAFE_UPDATES = 0;
update captions2 set text='fucker';

select * from captions2;

