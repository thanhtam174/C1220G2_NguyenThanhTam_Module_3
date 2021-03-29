drop database if exists bank_management;

create database bank_management;

use bank_management;

create table account_type(
id int auto_increment primary key,
`name` varchar(30) not null
);

create table accounts(
account_number char(14) primary key,
account_type_id int,
`date` date not null,
balance bigint default(0),
foreign key(account_type_id) references account_type(id)
);

create table customers(
customer_number char(14) primary key,
fullname varchar(50) not null,
address varchar(50) not null,
email varchar(50) unique,
phone varchar(15) unique,
accounts_account_number char(14) not null,
foreign key (accounts_account_number) references accounts(account_number)
);

create table transactions(
tran_number char(14) primary key,
accounts_account_number char(14) ,
`date` date not null,
amounts bigint,
descriptions text,
foreign key(accounts_account_number) references accounts(account_number)
);