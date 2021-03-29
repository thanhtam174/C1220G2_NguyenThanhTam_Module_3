drop database if exists cars_store_management;

create database cars_store_management;

use cars_store_management;

create table product_line(
product_line varchar(50) primary key,
text_description text not null,
image varchar(500)
);

create table offices(
office_code varchar(10) primary key,
city varchar(50) not null,
address_line1 varchar(50) not null,
address_line2 varchar(50),
phone varchar(50) not null unique,
state varchar(50) not null,
country varchar(50) not null,
postal_code varchar(15) not null
);

create table product(
product_code varchar(15) primary key,
product_name varchar(70) not null,
product_scale varchar(10) not null,
product_vendor varchar(50) not null,
product_description text not null,
quantity_in_stock int not null,
buy_price double not null,
msrp double not null,
product_line varchar(30) not null,
foreign key(product_line) references product_line(product_line)
);

create table employees(
employee_number int primary key,
last_name varchar(50) not null,
first_name varchar(50) not null,
email varchar(100) not null unique,
job_title varchar(50),
report_to int not null,
office_code varchar(30),
foreign key(report_to) references employees(employee_number),
foreign key(office_code) references offices(office_code)
);

create table customers(
customer_number int primary key,
customer_name varchar(50) not null,
contact_last_name varchar(50) not null,
contact_first_name varchar(50) not null,
phone varchar(50) not null unique,
address_line1 varchar(50) not null,
address_line2 varchar(50),
city varchar(50) not null,
state varchar(50) not null,
postal_code varchar(15) not null,
country varchar(50) not null,
credit_limit double,
sales_rep_employee_number int not null,
foreign key(sales_rep_employee_number) references employees(employee_number)
);

create table orders(
order_number int primary key,
order_date date not null,
required_date date not null,
shipped_date date not null,
`status` varchar(15) not null,
comments text,
quantity_ordered int not null,
price_each double not null,
customer_number int not null,
foreign key(customer_number) references customers(customer_number)
);

create table payments(
check_number varchar(50) primary key,
customer_number int not null,
payment_date date not null,
amount double not null,
foreign key(customer_number) references customers(customer_number)
);

create table order_details(
id int auto_increment primary key,
product_code varchar(15) not null,  
order_number int not null,
foreign key(product_code) references product(product_code),
foreign key(order_number) references orders(order_number)
);