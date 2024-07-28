drop database instagram;
create database instagram;
use instagram;

-- create the user table
create table users(
	id int auto_increment primary key,
    username varchar(255) unique not null,
    created_at timestamp default now()
);

describe users;


-- create photos schema
create table photos(
	id int auto_increment primary key,
    image_url varchar(255) not null,
    user_id int not null,
    created_at timestamp default now(),
    foreign key(user_id) references users(id)
);

describe photos;

-- comments schema
Create table comments(
	id int auto_increment primary key,
    comment_text varchar(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
    foreign key(user_id) references users(id),
    foreign key(photo_id) references photos(id)
);
show tables;
describe comments;

-- create likes schema  a like is unique to a user id and tagged to a unique photo
create table likes(
	user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
    foreign key(photo_id) references photos(id),
    foreign key(user_id) references users(id),
    primary key(user_id, photo_id)
);
show tables;
describe likes;

-- followers schema use primary key to one follower to another user vice versa it has to be unique
create table followers(
	follower_id int not null,
    followee_id int not null,
    created_at timestamp default now(),
    foreign key(follower_id) references users(id),
    foreign key(followee_id) references users(id),
    primary key (follower_id,followee_id)
);
show tables;
describe followers;

-- hashtag methods for scheema option 3 two tables
create table tags(
	id int auto_increment primary key,
    tag_name varchar(255) unique,
    created_at timestamp default now()
);

create table photo_tags(
	photo_id int not null,
    tag_id int not null,
    foreign key(photo_id) references photos(id),
    foreign key(tag_id) references tags(id),
    primary key(photo_id,tag_id)
);

show tables;
describe tags;
describe photo_tags;

-- Insert into the respective tables
insert into users (username) values
('BlueTheCat'),
('CharlieBrown'),
('ColtSteele');

insert into photos (image_url, user_id) values
('/alskjgd', 1),
('/alskjg7', 2),
('/alskjg0', 3),
('/alskjg9', 1);

select * from photos;

-- Insert into comments table
insert into comments(comment_text, user_id, photo_id) values
('Meow!',1,2),
('Parta flip',2,4),
('I cry',3,3);

select * from comments;

-- create insert into likes

Insert into likes(user_id,photo_id) values
(1,1),
(2,1),
(2,2),
(1,2),
(1,3),
(3,3);

select * from likes;

-- insert into followers schema
insert into followers(follower_id,followee_id) values
(1,2),
(1,3),
(3,1),
(2,3);

select * from followers;

-- insert into tags
insert into tags(tag_name) values
('adorable'),
('wow'),
('can i haz cheeseburger');
select * from tags;

-- insert into photo tags
insert into photo_tags (photo_id, tag_id) values
(1,1),
(1,2),
(2,3),
(3,2);

select * from photo_tags;

-- select photos.image_url, users.username
-- from photos
-- join users
	-- on photos.user_id = users.id;
    

