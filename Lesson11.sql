
-- unique constraints
create table contacts(
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO contacts (name, phone)
values ('billybob', '8781213455');

INSERT INTO contacts (name, phone)
values ('timmytimtim', '8781213455');

select * from contacts;

-- check constraints
create table users (
	username varchar(20) not null,
    age int check (age > 0)
);

insert into users (username, age)
values ('bluethecat', 50);

insert into users (username, age)
values ('coltsteele', -3);

select * from users;

-- check examples

create table palindromes (
	word varchar(100) check(reverse(word) = word)
);

insert into palindromes (word) values ('racecar');
insert into palindromes (word) values ('home');

-- name constraint
create table users2 (
	username varchar(20) not null,
    age int,
    CONSTRAINT age_not_negative check (age >= 0)
);

insert into users2 (username, age)
values ('bluethecat', 50);

insert into users2 (username, age)
values ('coltsteele', -3);

create table palindromes2 (
	word varchar(100) 
    CONSTRAINT word_is_pal check(reverse(word) = word)
);

insert into palindromes2 (word) values ('racecar');
insert into palindromes2 (word) values ('home');

CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);
 
CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

CREATE TABLE companies (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT name_address UNIQUE (name , address)
);

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
insert into companies(name,address)
values ('blackbird auto', '123 spruce');

insert into companies(name,address)
values ('luigis pies', '123 spruce');

insert into companies(name,address)
values ('luigis pies', '123 spruce');

create table houses (
	purchase_price int not null,
    sales_price int not null,
    constraint sprice_gt_pprice check (sales_price >= purchase_price)
); 
insert into houses (purchase_price, sales_price)
values (100,120);
insert into houses (purchase_price, sales_price)
values (100,90);

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
 
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

-- Alter column
alter table companies
add column phone varchar(15);

-- Alter column
alter table companies
add column employee_count int not null default 1;

ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);
 
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- drop columns
alter table companies
drop column phone;

select * from companies;

alter table companies
drop column employee_count;


-- rename table
rename table companies to suppliers;

select * from suppliers;

-- by alter table
alter table suppliers
rename to companies;

select * from companies;
alter table companies
rename column name to company_name;

select * from companies;

reNAME TABLE companies to suppliers;


ALTER TABLE suppliers RENAME TO companies;


ALTER TABLE companies
RENAME COLUMN name TO company_name;

alter table companies
modify company_name varchar(100) default 'unknown';

desc companies;

ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';


ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);

alter table houses add constraint positive_pprice check(purchase_price >= 0);
alter table houses drop constraint positive_pprice;

ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);


ALTER TABLE houses DROP CONSTRAINT positive_pprice;
