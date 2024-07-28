use chicken;
show tables;
DROP TABLE cats;
CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 
desc cats;
-- Insert new cats
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
       -- reading and checking the table
SELECT 
    *
FROM
    cats;
       
       -- select name from cats
SELECT 
    name
FROM
    cats;
       
       -- select age from cats
SELECT 
    age
FROM
    cats;
       
       -- combine columns
SELECT 
    name, age
FROM
    cats;
       
SELECT 
    name, breed
FROM
    cats;
       
       -- all collums
SELECT 
    *
FROM
    cats;
       
       -- where expression is to narrow to rows
SELECT 
    *
FROM
    cats
WHERE
    age = 4;
       
       -- where selection of name and age
SELECT 
    name, age
FROM
    cats
WHERE
    age = 4;
       
       -- where select name where cats are 4yrs old
SELECT 
    name
FROM
    cats
WHERE
    age = 4;
       
       -- select cat name egg
SELECT 
    *
FROM
    cats
WHERE
    name = 'egg';
       
       -- select cat id for all the rows
SELECT 
    cat_id
FROM
    cats;
       
       -- select name and breed of all the cats
SELECT 
    name, breed
FROM
    cats;
       
       -- select the tabby cats output name and age
SELECT 
    name, age
FROM
    cats
WHERE
    breed = 'tabby';
       
       -- select the cat id and age where the cat id and age are the same
SELECT 
    cat_id, age
FROM
    cats
WHERE
    cat_id = age;
       
SELECT 
    *
FROM
    cats
WHERE
    cat_id = age;
       
       -- alisas
SELECT 
    cat_id AS id, name
FROM
    cats;
       
       -- do name as kitty name.
SELECT 
    name AS kittyName
FROM
    cats;
       
       -- ########## Update portion of Crud ###########################
UPDATE cats 
SET 
    breed = 'Shorthair'
WHERE
    breed = 'Tabby';
UPDATE cats 
SET 
    breed = 'Shorthair'
WHERE
    breed = 'Tabby';
       
       -- multiple update
UPDATE cats 
SET 
    age = 14
WHERE
    name = 'Misty';
UPDATE cats 
SET 
    age = 14
WHERE
    name = 'Misty';
SELECT 
    *
FROM
    cats;

-- change jackson name to jack
SELECT 
    *
FROM
    cats
WHERE
    name = 'jackson';
SET SQL_SAFE_UPDATES = 0;
UPDATE cats 
SET 
    name = 'Jack'
WHERE
    name = 'Jackson';
SELECT 
    *
FROM
    cats
WHERE
    name = 'jack';

-- change ringo breed to british short hair
SELECT 
    *
FROM
    cats
WHERE
    name = 'ringo';
UPDATE cats 
SET 
    breed = 'British Shorthair'
WHERE
    name = 'Ringo';
SELECT 
    *
FROM
    cats
WHERE
    name = 'ringo';
 
 -- update both main coons age to be 12
SELECT 
    *
FROM
    cats
WHERE
    breed = 'Maine Coon';
UPDATE cats 
SET 
    age = 12
WHERE
    breed = 'Maine Coon';
SELECT 
    *
FROM
    cats
WHERE
    breed = 'Maine Coon';
 -- turn on safe update
 SET SQL_SAFE_UPDATES = 1;
 -- check if update not possible.
UPDATE cats 
SET 
    age = 12
WHERE
    breed = 'Maine Coon';    
  
  -- ##### deletion of CRUD ##### -- 
  SET SQL_SAFE_UPDATES = 0;
DELETE FROM cats 
WHERE
    name = 'Egg';
SELECT 
    *
FROM
    cats;
  
  -- delete all 4 yrs old cats
SELECT 
    *
FROM
    cats
WHERE
    age = 4;
DELETE FROM cats 
WHERE
    age = 4;
SELECT 
    *
FROM
    cats;
  
  -- delete the cats where the age is same as cat id
SELECT 
    *
FROM
    cats
WHERE
    cat_id = age;
DELETE FROM cats 
WHERE
    cat_id = age;
SELECT 
    *
FROM
    cats;
  
  -- delete the contents of cat table
DELETE FROM cats;
  desc cats;
SELECT 
    *
FROM
    cats;
  use chicken;
  drop table shirts;
  
       

