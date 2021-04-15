drop database if exists users;

create database users;

use users;

create table users (
    id int(3) not null auto_increment,
    `name` varchar(120) not null,
    email varchar(220) not null unique,
    country varchar(120),
    primary key (id)
);

insert into users(name, email, country) 
values
('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia');

DELIMITER //
create procedure get_user_by_id(in user_id int)
begin
    select users.name, users.email, users.country
    from users
    where users.id = user_id;
end
// DELIMITER ;

DELIMITER //
create procedure insert_user(
in user_name varchar(50),
in user_email varchar(50),
in user_country varchar(50)
)
begin
    insert into users(name, email, country) values(user_name, user_email, user_country);
end
// DELIMITER ; 

create table Permision(
id int(11) primary key auto_increment,
name varchar(50)
);

create table User_Permision(
permision_id int(11),
user_id int(11),
foreign key(permision_id) references permision(id),
foreign key(user_id) references users(id)
);

insert into Permision(name) values('add');
insert into Permision(name) values('edit');
insert into Permision(name) values('delete');
insert into Permision(name) values('view');

DELIMITER //
create procedure display_users()
begin
select * from users;
end
// DELIMITER ;

DELIMITER //
create procedure update_user(
in user_id int(3),
in user_name varchar(50),
in user_email varchar(50),
in user_country varchar(50)
)
begin
update users
set 
`name`= user_name,
email = user_email,
country = user_country
where id = user_id;
end
// DELIMITER ;

DELIMITER //
create procedure delete_user(in user_id int(3))
begin
delete from users
where id = user_id;
end
// DELIMITER ;