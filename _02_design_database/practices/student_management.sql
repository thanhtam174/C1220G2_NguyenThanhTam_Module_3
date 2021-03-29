drop database if exists student_management;

create database student_management;

use student_management;


create table type_of_class (
	id int primary key,
    `name` char(8)
);

create table account_james (
	`account` varchar(50) primary key,
    `password` varchar(30)
);

create table instructor (
	id int primary key,
    `name` varchar(50) not null,
    date_of_birth date
);

create table class (
	id int,
    `name` varchar(50),
    type_of_class_id int,
    
    foreign key (type_of_class_id) references type_of_class (id),
    primary key (id)
);

create table student (
	id int primary key,
    `name` varchar(50) not null,
    date_of_birth date,
    account_james_account varchar(50),
    class_id int,
    
    constraint fk_student_account_james
		foreign key (account_james_account) references account_james (`account`),
	foreign key (class_id) references class (id)
);

create table instructor_teach_class (
	class_id int,
    instructor_id int,
    
    primary key (class_id, instructor_id),
    foreign key (class_id) references class (id),
    foreign key (instructor_id) references instructor (id)
);

insert into type_of_class
values
(1,'fulltime'),
(2,'partime');

insert into class
values
(1,'C1220G1',1),
(2,'C1120G1',2),
(3,'C1020G1',2),
(4,'C0221G1',1);

insert into student(id,`name`,date_of_birth,class_id)
values
(1,'Quang Kha','1997-02-25',1),
(2,'Thanh Cong','1989-07-15',2),
(3,'Thanh Tai','1997-12-10',3),
(4,'Quoc Tuan','1997-07-17',null);

select * from student left join class
on student.class_id=class.id;