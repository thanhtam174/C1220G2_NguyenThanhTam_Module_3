drop database if exists student_management;

create database student_management;

use student_management;

create table student(
id int primary key,
`name` varchar(50),
date_of_birth date,
email varchar(50)
);

insert into student(id,`name`,date_of_birth)
value
(1,'Quang Kha','1997-02-25'),
(2,'Thanh Cong','1989-07-15'),
(3,'Thanh Tai','1997-12-10'),
(4,'Quoc Tuan','1997-07-17');

select * from student;

select `name` from student
where id = 4;

delete from student
where `name` = 'Quoc Tuan';

select * from student
where `name` like '%Thanh%';

drop table student;

drop database student_management;