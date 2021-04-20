drop database if exists furama_managerment;

create database furama_managerment;

use furama_managerment;

create table positions(
id int primary key auto_increment,
position_name varchar(50)
);

create table education_degree(
id int primary key auto_increment,
education_degree_name varchar(50)
);

create table division(
id int primary key auto_increment,
division_name varchar(50)
);

create table customer_type(
id int primary key auto_increment,
customer_type_name varchar(50)
);

create table service_type(
id int primary key auto_increment,
service_type_name varchar(50)
);

create table rent_type(
id int primary key auto_increment,
rent_type_name varchar(50),
rent_type_cost double
);

create table attach_service(
id int primary key auto_increment,
attach_service_name varchar(50),
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(50)
);

create table roles(
id int primary key auto_increment,
role_name varchar(255)
);

create table users(
user_name varchar(255) primary key,
`password` varchar(255)
);

create table user_role(
user_roler_id int primary key,
role_id int,
user_name varchar(255),
foreign key(role_id) references roles(id),
foreign key(user_name) references users(user_name)
);

create table employee(
employee_id int primary key auto_increment,
employee_name varchar(50),
employee_birthday date,
employee_gender bit(1),
employee_id_card varchar(20),
employee_salary double,
employee_phone varchar(20),
employee_email varchar(100),
employee_address varchar(255),
position_id int,
education_degree_id int,
division_id int,
user_name varchar(255),

foreign key(position_id) references positions(id),
foreign key(education_degree_id) references education_degree(id),
foreign key(division_id) references division(id),
foreign key(user_name) references users(user_name)
);

create table customer(
customer_id int primary key auto_increment,
customer_type_id int not null,
customer_name varchar(50),
customer_birthday date,
customer_gender bit(1),
customer_id_card varchar(20),
customer_phone varchar(20),
customer_email varchar(100),
customer_address varchar(255),

foreign key(customer_type_id) references customer_type(id)
);

create table service(
service_id int primary key auto_increment,
service_name varchar(50),
service_area double,
service_cost double,
service_max_people int,
rent_type_id int,
service_type_id int,
standard_room varchar(50),
description_other_convenience text,
pool_area double,
number_of_floor int(3),

foreign key(rent_type_id) references rent_type(id),
foreign key(service_type_id) references service_type(id)
);

create table contract(
contract_id int primary key auto_increment,
contract_start_date date,
contract_end_date date,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id int,
service_id int,

foreign key(employee_id) references employee(employee_id),
foreign key(customer_id) references customer(customer_id),
foreign key(service_id) references service(service_id)
);

create table contract_detail(
contract_detail_id int primary key auto_increment,
contract_id int,
attach_service_id int,
quantity int,

foreign key(contract_id) references contract(contract_id),
foreign key(attach_service_id) references attach_service(id)
);