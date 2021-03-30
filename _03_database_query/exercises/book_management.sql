drop database if exists library_management;

create database library_management;

use library_management;

create table category(
id int primary key auto_increment,
category_name varchar(40)
);

create table book(
book_id int primary key,
`name` varchar(200),
author varchar(50),
publishing_company varchar(100),
catogory_id int not null,
foreign key(catogory_id) references category(id)
);

create table student(
card_number int primary key,
student_name varchar(45) not null,
birthday date not null,
address varchar(45) not null,
email varchar(100) unique,
phone varchar(20) not null unique
);

create table borrow_order(
id int auto_increment primary key,
card_number int not null,
book_id int not null,
date_borrowed date not null,
date_return date not null,
`status` bit not null,
foreign key(card_number) references student(card_number),
foreign key(book_id) references book(book_id)
);