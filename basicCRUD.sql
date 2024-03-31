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
       select *  from cats;
       
       -- select name from cats
       select name from cats;
       
       -- select age from cats
       select age from cats;
       
       -- combine columns
       select name, age from cats;
       
       select name, breed from cats;
       
       -- all collums
       select * from cats;
       
       -- where expression is to narrow to rows
       select * from cats where age=4;
       
       -- where selection of name and age
       select name, age from cats where age=4;
       
       -- where select name where cats are 4yrs old
       select name from cats where age = 4;
       
       -- select cat name egg
       select * from cats where name = 'egg';
       
       -- select cat id for all the rows
       select cat_id from cats;
       
       -- select name and breed of all the cats
       select name, breed from cats;
       
       -- select the tabby cats output name and age
       select name, age from cats where breed = 'tabby';
       
       -- select the cat id and age where the cat id and age are the same
       select cat_id, age from cats where cat_id = age;
       
       select * from cats where cat_id = age;
       
       -- alisas
       --  rename cat id as id select the cat id and name
       select cat_id AS id, name from cats;
       
       -- do name as kitty name.
       select name as kittyName from cats;
       
       -- ########## Update portion of Crud ###########################
       -- Update cats where the tabby breeds are rename as shorthair.
       
       UPDATE cats SET breed='Shorthair' where breed = 'Tabby';
       UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
       
       -- multiple update
       -- UPDATE employess set current_status='laid-off', last_name='who cares';
update cats set age=14 where name='Misty';
UPDATE cats SET age=14 WHERE name='Misty';
select*from cats;

-- change jackson name to jack
select * from cats where name ='jackson';
SET SQL_SAFE_UPDATES = 0;
UPDATE cats SET name='Jack' WHERE name='Jackson';
select * from cats where name ='jack';

-- change ringo breed to british short hair
SELECT * FROM cats where name = 'ringo';
UPDATE cats SET breed='British Shorthair' Where name='Ringo';
 SELECT * FROM cats where name = 'ringo';      
 
 -- update both main coons age to be 12
 select * from cats where breed ='Maine Coon';
 update cats set age = 12 where breed ='Maine Coon';
 select * from cats where breed ='Maine Coon';
 -- turn on safe update
 SET SQL_SAFE_UPDATES = 1;
 -- check if update not possible.
  update cats set age = 12 where breed ='Maine Coon';    
  
  -- ##### deletion of CRUD ##### -- 
  SET SQL_SAFE_UPDATES = 0;
  DELETE FROM cats where name = 'Egg';
  select*from cats;
  
  -- delete all 4 yrs old cats
  select * from cats where age = 4;
  delete from cats where age = 4;
  select * from cats;
  
  -- delete the cats where the age is same as cat id
  select * from cats where cat_id = age;
  delete from cats where cat_id = age;
  select * from cats;
  
  -- delete the contents of cat table
  delete from cats;
  desc cats;
  select * from cats;
  use chicken;
  drop table shirts;
  
       

