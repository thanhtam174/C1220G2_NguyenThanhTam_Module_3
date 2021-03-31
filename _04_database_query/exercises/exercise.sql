drop database if exists exercises;

create database exercises;

use  exercises;

create table student(
id int auto_increment primary key,
ten varchar(30),
tuoi int(3),
khoa_hoc varchar(30),
so_tien int
);

insert into student(ten, tuoi, khoa_hoc, so_tien)
values
('Hoang',21,'CNTT',400000),
('Viet',19,'DTVT',320000),
('Thanh',18,'KTDN',400000),
('Nhan',19,'CK',450000),
('Huong',20,'TCNH',500000),
('Huong',20,'TCNH',200000);

select * from student
where ten = 'Huong';

select sum(so_tien) from student
where ten = 'Huong';

select distinct ten from student;