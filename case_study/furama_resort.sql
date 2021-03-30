drop database if exists furama_resort;

create database furama_resort;

use furama_resort;

create table vi_tri(
id_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45) not null
);

create table trinh_do(
id_trinh_do int primary key auto_increment,
trinh_do varchar(45) not null
);

create table bo_phan(
id_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45) not null
);

create table dich_vu_di_kem(
id_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45) not null,
gia int not null,
don_vi int not null
);

create table loai_khach(
id_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45) not null
);

create table kieu_thue(
id_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45) not null
);

create table loai_dich_vu(
id_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45) not null
);

create table dich_vu(
id_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45) not null,
dien_tich float not null,
so_tang int,
so_nguoi_toi_da int,
chi_phi_thue int not null,
id_kieu_thue int not null,
id_loai_dich_vu int not null,
foreign key(id_kieu_thue) references kieu_thue(id_kieu_thue),
foreign key(id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);

create table nhan_vien(
id_nhan_vien int primary key auto_increment,
ho_ten varchar(45) not null,
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,
ngay_sinh date not null,
so_cmnd varchar(20) not null unique,
luong int,
so_dien_thoai varchar(20) unique,
email varchar(100) not null unique,
dia_chi varchar(45) not null,
foreign key(id_vi_tri) references vi_tri(id_vi_tri),
foreign key(id_trinh_do) references trinh_do(id_trinh_do),
foreign key(id_bo_phan) references bo_phan(id_bo_phan)
);

create table khach_hang(
id_khach_hang int primary key auto_increment,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(20) not null unique,
so_dien_thoai varchar(20) unique,
email varchar(100) unique,
dia_chi varchar(45) not null,
id_loai_khach int not null,
foreign key(id_loai_khach) references loai_khach(id_loai_khach)
);


create table hop_dong(
id_hop_dong int primary key auto_increment,
id_nhan_vien int not null,
id_khach_hang int not null,
id_dich_vu int not null,
ngay_lam_hop_dong date not null,
ngay_ket_thuc date not null,
tien_dat_coc int not null,
tong_tien int,
foreign key(id_nhan_vien) references nhan_vien(id_nhan_vien),
foreign key(id_khach_hang) references khach_hang(id_khach_hang),
foreign key(id_dich_vu) references dich_vu(id_dich_vu)
);

create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int primary key auto_increment,
id_hop_dong int not null,
id_dich_vu_di_kem int not null,
so_luong int not null,
foreign key(id_hop_dong) references hop_dong(id_hop_dong),
foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);

insert into vi_tri(ten_vi_tri)
values
('Giám Đốc'),
('Quản lí'),
('Giám sát'),
('Chuyên viên'),
('Phục vụ'),
('Lễ tân');

insert into trinh_do(trinh_do)
values
('Trung cấp'),
('Cao đẳng'),
('Đại học '),
('Sau đại học');

insert into bo_phan(ten_bo_phan)
values
('Sale – Marketing'),
('Hành Chính'),
('Phục vụ'),
('Quản lý');

insert into loai_khach(ten_loai_khach)
values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into loai_dich_vu(ten_loai_dich_vu)
values
('Villa'),
('House'),
('Room');

insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi)
values
('massage', 500000,7),
('karaoke', 500000,10),
('thức ăn', 400000,20),
('nước uống', 100000, 50),
('thuê xe di chuyển tham quan resort', 150000,4);

insert into kieu_thue(ten_kieu_thue)
values
('Năm'),
('Tháng'),
('Ngày'),
('Giờ');

insert into dich_vu(ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue,id_loai_dich_vu)
values
('Villa_special',1500,5,12,500000000,1,1),
('Villa_normal',600,3,6,300000000,1,1),
('House_special',400,2,4,20000000,2,2),
('House_nỏrmal',200,1,3,12000000,2,2),
('Room_business',85,null,1,4000000,3,3),
('Room_normal',50,null,1,2500000,1,1),
('Room_special',100,null,1,6000000,1,1);

insert into nhan_vien(ho_ten,id_vi_tri,id_trinh_do,id_bo_phan,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi)
values
('Nguyễn Thành Tiến',1,3,4,'1984-12-04','102154789',70000000,'0903686838','thanh_tien@gmail.com','Đà Nẵng'),
('Trương Quang Khải',2,3,4,'1989-05-15','125781364',45000000,'0917455127','quang_khai@gmail.com','Đà Nẵng'),
('Hoàng Tiến Công',3,3,4,'1987-11-24','324012578',25000000,'0912034152','htcong_17@gmail.com','Quảng Nam'),
('Nguyễn Văn Khoa',3,3,2,'1992-09-07','125423698',21000000,'0962458751','nv_khoa_furama@gmail.com','Huế'),
('Trần Trung Quân',4,3,1,'1994-05-19','125482103',17000000,'0903542369','tran_quan@gmail.com','Quảng Nam'),
('Hoàng Yên Nhiên',4,2,1,'1996-04-29','123548620',9000000,'0915369520','yen_nhien_hoang@gmail.com','Đà Nẵng'),
('Đặng Thu Yến',4,2,1,'1997-06-14','156201458',8500000,'0901568794','yen_dang_thu@gmail.com','Huế'),
('Nguyễn Văn Quyền',5,1,3,'1997-10-09','184569235',5000000,'0907845621','nguyenvanquyen@gmail.com','Đà Nẵng'),
('Nguyễn Thị Như Ngọc',6,2,3,'1994-01-26','123526310',6000000,'0917458620','nguyennhungoc@gmail.com','Nghệ An'),
('Nguyễn Thu Huyền',6,2,3,'1995-02-24','126548320',6000000,'0917542610','nguyenhuyen_furama@gmail.com','Quảng Trị'),
('Nguyễn Thái Dương',5,1,3,'1991-08-09','184576320',5000000,'0915152439','nguyenduong@gmail.com','Đà Nẵng'),
('Trần Văn Trọng',5,1,3,'1992-07-19','171399212',5000000,'0915369236','trong.tran@gmail.com','Đà Nẵng'),
('Hoàng Như Uyên',5,1,3,'1996-04-23','184581396',5000000,'0907844255','nhu_uyen@gmail.com','Quảng Trị'),
('Trần Thị Trang',5,1,3,'1997-08-30','135624102',5000000,'0917523698','tran.trang@gmail.com','Quảng Nam');

insert into khach_hang(ho_ten,ngay_sinh,so_cmnd,so_dien_thoai,email,dia_chi,id_loai_khach)
values
('Trần Hoàng Danh','1989-10-23','152463263','0934252126','tran.danh@gmail.com','Quảng Trị',3),
('Nguyễn Hoàng Quân','1974-11-03','152124831','090621586','hoang.quan@gmail.com','Đà Nẵng',2),
('Trần Trung Thành','1981-07-20','152031566','0934257456','trung.thanh@gmail.com','Quảng Trị',1),
('Nguyễn An Khang','1989-10-23','152463201','0934254586','an.khang@gmail.com','Huế',1),
('Bùi Thành Tài','1980-01-03','102136584','0917023152','thanh.tai@gmail.com','Thái Bình',5),
('Hoàng Văn Hải','1990-02-27','154125632','0934144755','hoang.hai@gmail.com','Quảng Ninh',3),
('Mai An Tâm','1969-05-17','152201120','0935620011','maiantam@gmail.com','Đà Nẵng',2),
('Đỗ Thị Châu Loan','1995-10-31','152458882','0915442228','chau.loan@gmail.com','Nghệ An',2),
('Trương Tấn Hải','1966-08-15','103256445','0234529883','hai.truong@gmail.com','Quảng Trị',5),
('Hồ Anh Hùng','1989-06-16','135122363','0275136425','ho.anh.hung@gmail.com','Bình Định',5);

insert into hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc)
values
(2,3,2,'2020-05-21','2025-05-21',100000000),
(2,5,1,'2018-07-01','2024-07-01',250000000),
(4,7,2,'2014-05-14','2020-05-14',25000000),
(10,10,7,'2020-05-14','2020-06-28',15000000),
(11,8,5,'2020-07-15','2020-08-21',10000000),
(10,9,4,'2020-05-21','2025-12-21',20000000);


select * from nhan_vien
where (ho_ten like '%H%' or ho_ten like '%T%' or ho_ten like '%K%') and char_length(ho_ten) <= 15;

select id_khach_hang,ho_ten,so_cmnd,so_dien_thoai,email,dia_chi,id_loai_khach,round(datediff(curdate(),ngay_sinh)/365) as tuoi
from khach_hang
having tuoi >= 18 and tuoi <=50;