drop database if exists classsicmodels;

create database classsicmodels;

use classsicmodels;

create table customers(
id int primary key,
customer_name varchar(50),
phone varchar(15),
city varchar(30),
country varchar(30)
);

insert into customers
values
(1,'Kenny','02134568','Los Angieles','America'),
(2,'Kenny','7252592','Chicago','America'),
(3,'Xiao Long','1235558','Shang Hai','China'),
(4,'Kirito','72384582','Tokyo','Japan'),
(5,'Peter','02535865','Chicago','America'),
(6,'Misaki','25235265','Kyoto','Japan'),
(7,'Thanh Cong','51223945','Ho Chi Minh','Viet Nam'),
(8,'Hoang Vu','75922623','Ha Noi','Viet Nam'),
(9,'Chloe','1255256','Singapore','Singapore');

select * from customers;

select customer_name, phone, city, country from customers;

select * from customers
where customer_name = 'Kirito';

select * from customers
where customer_name like '%a%';

select * from customers
where city in ('Chicago', 'Ha Noi', 'Shang Hai');

drop table customers;

drop database classsicmodels;

 