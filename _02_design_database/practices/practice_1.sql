drop database if exists practices;

create database practices;

use practices;

create table contacts(
contact_id int(11) not null auto_increment primary key,
birthday date,
constraint contacts_pk primary key (contact_id)
);

create table suppliers
( supplier_id int(11) not null auto_increment,
  supplier_name varchar(50) not null,
  account_rep varchar(30) not null default 'TBD',
  constraint suppliers_pk primary key (supplier_id)
);

alter table contacts
  add last_name varchar(40) not null
	after contact_id,
  add first_name varchar(35) null
    after last_name;
    
alter table contacts
  modify last_name varchar(50) null;
  
alter table contacts
  change column contact_id id
    int(11) not null;
    
alter table contacts
  rename to people;

