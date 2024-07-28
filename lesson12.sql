-- relationships and joints.
drop table customers;
drop table orders;
create database shop;
use shop; 
-- Relationship basics

-- One to one relationship.
-- username to customer details table.


-- One To many relationship
-- customer id to oders, relationship of book to reviews, Author can have many books

-- Customers to orders example for one to many.
-- We Want To Store...
-- A customer's first and last name
-- A customer's email
-- The date of the purchase
-- The price of the order

-- Table A
-- Customers
-- • customer_id ( the key) primary and foregin
-- • first_name
-- • last_name
-- • email

-- Table B
-- Orders
-- • order_id primary key 
-- • order_date
-- • amount
-- .customer_id (the key) foregin key

CREATE TABLE customers (
id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(50), 
last_name VARCHAR(50) , 
email VARCHAR(50)
);

insert into customers ( first_name, last_name, email)
values('Boy','George','geroge@gmail.com'),
	  ('George','Michael','gm@gmail.com'),
      ('David','Bowie','david@gmail.com'),
      ('Blue','Steele','blue@gmail.com'),
      ('Bette','Davis','bette@gmail.com');

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT, 
order_date DATE, 
amount DECIMAL (8,2),
customer_id	int,
FOREIGN KEY (customer_id) references customers(id)
);

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1), 
('2017-11-11', 35.50, 1), 
('2014-12-12', 800.67, 2), 
('2015-01-03', 12.50, 2), 
('1999-04-11', 450.25, 5);

-- check
select * from customers;
select * from orders;

-- Joints
-- Method 1
select id from customers where last_name = 'George';
select * from orders where customer_id = 1;

-- Sub query method
select * from orders where customer_id = (select id from customers where last_name = 'George');

-- cross join (not recommended)
select * from customers, orders;

-- inner joins
select * from customers;
select * from orders;

select * from customers
join orders
	on customers.id = orders.customer_id;

select first_name, last_name, order_date, amount from customers
join orders
	on customers.id = orders.customer_id;
    
select * from orders
join customers on customers.id = orders.customer_id;

-- Our first inner join!
SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;
 
SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON orders.customer_id = customers.id;
 
-- The order doesn't matter here:
SELECT * FROM orders
JOIN customers ON customers.id = orders.customer_id;

select first_name, last_name, order_date, amount from customers
join orders on orders.customer_id = customers.id;

select first_name, last_name, sum(amount) as total from customers
join orders on orders.customer_id = customers.id
group by first_name, last_name
order by total desc;

SELECT 
    first_name, last_name, SUM(amount) AS total
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
ORDER BY total;

-- left join
select first_name, last_name, order_date, amount from customers
left join orders on orders.customer_id = customers.id;

SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        LEFT JOIN
    orders ON orders.customer_id = customers.id;
 
 
SELECT 
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;

select first_name, last_name, ifnull(sum(amount),0) as money_spent from customers
left join orders on customers.id = orders.customer_id
group by first_name, last_name
order by money_spent desc;

SELECT 
    first_name, 
    last_name, 
    IFNULL(SUM(amount), 0) AS money_spent
FROM
    customers
        LEFT JOIN
    orders ON customers.id = orders.customer_id
GROUP BY first_name , last_name;

-- right join
select first_name, last_name, order_date, amount from customers
right join orders on customers.id = orders.customer_id;

-- on delete cascade
CREATE TABLE customers (
id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(50), 
last_name VARCHAR(50) , 
email VARCHAR(50)
);

insert into customers ( first_name, last_name, email)
values('Boy','George','geroge@gmail.com'),
	  ('George','Michael','gm@gmail.com'),
      ('David','Bowie','david@gmail.com'),
      ('Blue','Steele','blue@gmail.com'),
      ('Bette','Davis','bette@gmail.com');

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT, 
order_date DATE, 
amount DECIMAL (8,2),
customer_id	int,
FOREIGN KEY (customer_id) references customers(id) on delete cascade
);

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1), 
('2017-11-11', 35.50, 1), 
('2014-12-12', 800.67, 2), 
('2015-01-03', 12.50, 2), 
('1999-04-11', 450.25, 5);

select * from orders;
-- remove safe update
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
-- delete customer last_name 'George'
delete from customers where last_name = 'George';
select * from orders;

-- challenge
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);
 
 
CREATE TABLE papers (
    title VARCHAR(50),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students (id)
);
 
 
SELECT 
    first_name, title, grade
FROM
    students
        JOIN
    papers ON papers.student_id = students.id
ORDER BY grade DESC;
 
 
 
SELECT 
    first_name, title, grade
FROM
    students
        LEFT JOIN
    papers ON papers.student_id = students.id;
 
 
 
SELECT 
    first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM
    students
        LEFT JOIN
    papers ON papers.student_id = students.id;
 
 
 
SELECT 
    first_name, IFNULL(AVG(grade), 0) AS average
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;
 
 
 
SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'passing'
        ELSE 'failing'
    END AS passing_status
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

-- Many to many relationship
-- Books can have many authors.

-- Reviewers 
-- id 
-- first_name 
-- last_name

-- Series
-- id
-- title
-- released_year
-- genre

-- Reviewer
-- id
-- rating
-- series_id
-- reviewer_id

create database tv_db;
use tv_db;

CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
 
CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    released_year YEAR,
    genre VARCHAR(100)
);
 
CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2 , 1 ),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id)
        REFERENCES series (id),
    FOREIGN KEY (reviewer_id)
        REFERENCES reviewers (id)
);
 
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

show tables;

-- Join title and ratings
SELECT 
    title, rating
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_id;
    
-- Average rating and sorted by titles
SELECT 
    title, ROUND(AVG(rating), 2) AS avg_rating
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_id
GROUP BY title
ORDER BY avg_rating;

-- macth up every review with every raiting
SELECT 
    first_name, last_name, rating
FROM
    reviewers
        JOIN
    reviews ON reviews.reviewer_id = reviewers.id;

-- identify series that has no reviews
select title as unreviewed_series
from series
left join reviews on series.id = reviews.series_id
where rating is NULL;

select title as unreviewed_series
from reviews
right join series on series.id = reviews.series_id
where rating is NULL;

-- average raiting for the genre
select genre, round(avg(rating),2) as avg_rating from series
join reviews on series.id = reviews.series_id
group by genre;

-- each review by number of reviews and their stats and status
select first_name, last_name, 
count(rating)as count,
ifnull(min(rating),0)as min,
ifnull(max(rating),0)as max,
round(ifnull(avg(rating),0),2) as average,
case
	when count(rating) > 0 then 'ACTIVE'
    ELSE 'INACTIVE'
END AS status
from reviewers
left join reviews on reviewers.id = reviews.reviewer_id
group by first_name, last_name;

-- alternative
select first_name, last_name, 
count(rating)as count,
ifnull(min(rating),0)as min,
ifnull(max(rating),0)as max,
round(ifnull(avg(rating),0),2) as average,
if(count(rating) > 0, 'ACTIVE', 'INACTIVE') as status
from reviewers
left join reviews on reviewers.id = reviews.reviewer_id
group by first_name, last_name;

-- USING CASE 
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS count,
    IFNULL(MIN(rating), 0) AS min,
    IFNULL(MAX(rating), 0) AS max,
    ROUND(IFNULL(AVG(rating), 0), 2) AS average,
    CASE
        WHEN COUNT(rating) >= 10 THEN 'POWERUSER'
        WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    END AS status
FROM
    reviewers
        LEFT JOIN
    reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name , last_name;
 
-- USING IF 
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS count,
    IFNULL(MIN(rating), 0) AS min,
    IFNULL(MAX(rating), 0) AS max,
    ROUND(IFNULL(AVG(rating), 0), 2) AS average,
    IF(COUNT(rating) > 0,
        'ACTIVE',
        'INACTIVE') AS status
FROM
    reviewers
        LEFT JOIN
    reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name , last_name;

-- final
select title , rating from reviews
join series on reviews.series_id = series.id;

select * from reviews
join series on reviews.series_id = series.id;

select * from reviews
join series on reviews.series_id = series.id
inner join reviewers on reviews.reviewer_id = reviewers.id;

select title, rating, concat(first_name,' ',last_name)as reviewer from reviews
join series on reviews.series_id = series.id
inner join reviewers on reviews.reviewer_id = reviewers.id;

SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviews
        INNER JOIN
    series ON reviews.series_id = series.id
        INNER JOIN
    reviewers ON reviews.reviewer_id = reviewers.id;
 
 
 
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    series
        INNER JOIN
    reviews ON reviews.series_id = series.id
        INNER JOIN
    reviewers ON reviews.reviewer_id = reviewers.id;
 
 
 
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviewers
        INNER JOIN
    reviews ON reviews.reviewer_id = reviewers.id
        INNER JOIN
    series ON reviews.series_id = series.id;


