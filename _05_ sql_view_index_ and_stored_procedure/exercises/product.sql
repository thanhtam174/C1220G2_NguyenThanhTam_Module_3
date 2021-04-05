drop database if exists demo;

create database demo;

use demo;

create table products(
id int primary key auto_increment,
product_code varchar(20) unique,
product_name varchar(50),
product_price int,
product_amount int,
product_description text,
product_status varchar(30)
);

insert into products(product_code, product_name,product_price,product_amount)
values
('SO0845','Sony Xperia Z',6400000,30),
('IP1139','IPhone 8 Plus',9500000,40),
('XI1207','Xiaomi Redmi Note 6',7300000,25),
('SS1002','SamSung Galaxy S7',8000000,21),
('XI0945','Xiaomi Note 4',5500000,43),
('IP1137','IPhone 6 Plus',7500000,56),
('SS1357','SamSung Galaxy S8',12500000,75);

alter table products add index idx_product_code(product_code);
explain select * from products
where product_code = 'IP1137' ;

create view product_views AS
select product_code, product_name, product_price, product_status
from products;

select * from product_views;

