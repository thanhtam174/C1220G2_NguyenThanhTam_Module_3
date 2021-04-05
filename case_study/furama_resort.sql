drop database if exists furama_resort;

create database furama_resort;

use furama_resort;

create table vi_tri (
    id_vi_tri int primary key auto_increment,
    ten_vi_tri varchar(45) not null
);

create table trinh_do (
    id_trinh_do int primary key auto_increment,
    trinh_do varchar(45) not null
);

create table bo_phan (
    id_bo_phan int primary key auto_increment,
    ten_bo_phan varchar(45) not null
);

create table dich_vu_di_kem (
    id_dich_vu_di_kem int primary key auto_increment,
    ten_dich_vu_di_kem varchar(45) not null,
    gia int not null,
    don_vi int not null
);

create table loai_khach (
    id_loai_khach int primary key auto_increment,
    ten_loai_khach varchar(45) not null
);

create table kieu_thue (
    id_kieu_thue int primary key auto_increment,
    ten_kieu_thue varchar(45) not null
);

create table loai_dich_vu (
    id_loai_dich_vu int primary key auto_increment,
    ten_loai_dich_vu varchar(45) not null
);

create table dich_vu (
    id_dich_vu int primary key auto_increment,
    ten_dich_vu varchar(45) not null,
    dien_tich float not null,
    so_tang int,
    so_nguoi_toi_da int,
    chi_phi_thue int not null,
    id_kieu_thue int not null,
    id_loai_dich_vu int not null,
    foreign key (id_kieu_thue)
        references kieu_thue (id_kieu_thue),
    foreign key (id_loai_dich_vu)
        references loai_dich_vu (id_loai_dich_vu)
);

create table nhan_vien (
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
    foreign key (id_vi_tri)
        references vi_tri (id_vi_tri),
    foreign key (id_trinh_do)
        references trinh_do (id_trinh_do),
    foreign key (id_bo_phan)
        references bo_phan (id_bo_phan)
);

create table khach_hang (
    id_khach_hang int primary key auto_increment,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    so_cmnd varchar(20) not null unique,
    so_dien_thoai varchar(20) unique,
    email varchar(100) unique,
    dia_chi varchar(45) not null,
    id_loai_khach int not null,
    foreign key (id_loai_khach)
        references loai_khach (id_loai_khach)
);


create table hop_dong (
    id_hop_dong int primary key auto_increment,
    id_nhan_vien int not null,
    id_khach_hang int not null,
    id_dich_vu int not null,
    ngay_lam_hop_dong date not null,
    ngay_ket_thuc date not null,
    tien_dat_coc int not null,
    foreign key (id_nhan_vien)
        references nhan_vien (id_nhan_vien),
    foreign key (id_khach_hang)
        references khach_hang (id_khach_hang)
        on delete cascade,
    foreign key (id_dich_vu)
        references dich_vu (id_dich_vu)
);

create table hop_dong_chi_tiet (
    id_hop_dong_chi_tiet int primary key auto_increment,
    id_hop_dong int not null,
    id_dich_vu_di_kem int not null,
    foreign key (id_hop_dong)
        references hop_dong (id_hop_dong)
        on delete cascade,
    foreign key (id_dich_vu_di_kem)
        references dich_vu_di_kem (id_dich_vu_di_kem)
);

-- ---------------------------Task 1-------------------------

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
('karaoke', 500000,4),
('thức ăn', 400000,20),
('nước uống', 100000, 20),
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
('House_normal',200,1,3,12000000,2,2),
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
('Nguyễn Thái Dương',5,1,3,'1991-08-09','184576320',5000000,'0915152439','nguyenduong@gmail.com','Hải Châu'),
('Trần Văn Trọng',5,1,3,'1992-07-19','171399212',5000000,'0915369236','trong.tran@gmail.com','Đà Nẵng'),
('Hoàng Như Uyên',5,1,3,'1996-04-23','184581396',5000000,'0907844255','nhu_uyen@gmail.com','Quảng Trị'),
('Trần Thị Trang',5,1,3,'1997-08-30','135624102',5000000,'0917523698','tran.trang@gmail.com','Quảng Nam');

insert into khach_hang(ho_ten,ngay_sinh,so_cmnd,so_dien_thoai,email,dia_chi,id_loai_khach)
values
('Trần Hoàng Danh','1989-10-23','152463263','0934252126','tran.danh@gmail.com','Quảng Trị',3),
('Nguyễn Hoàng Quân','1974-11-03','152124831','090621586','hoang.quan@gmail.com','Vinh',1),
('Trần Trung Thành','1981-07-20','152031566','0934257456','trung.thanh@gmail.com','Quảng Trị',1),
('Nguyễn An Khang','1989-10-23','152463201','0934254586','an.khang@gmail.com','Huế',5),
('Bùi Thành Tài','1980-01-03','102136584','0917023152','thanh.tai@gmail.com','Thái Bình',1),
('Hoàng Văn Hải','1990-02-27','154125632','0934144755','hoang.hai@gmail.com','Quảng Ninh',3),
('Mai An Tâm','1969-05-17','152201120','0935620011','maiantam@gmail.com','Đà Nẵng',2),
('Đỗ Thị Châu Loan','1995-10-31','152458882','0915442228','chau.loan@gmail.com','Quảng Ngãi',1),
('Trương Tấn Hải','1966-08-15','103256445','0234529883','hai.truong@gmail.com','Quảng Trị',5),
('Trương Tấn Hải','1966-08-15','103255258','0234526526','hai.truongtan@gmail.com','Quảng Trị',5),
('Hồ Anh Hùng','1989-06-16','135122363','0275136425','ho.anh.hung@gmail.com','Bình Định',5);

insert into hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc)
values
(2,3,2,'2020-02-21','2025-02-21',100000000),
(5,3,4,'2015-05-21','2015-12-21',30000000),
(2,5,1,'2019-03-01','2024-11-01',250000000),
(2,3,6,'2018-11-01','2024-11-01',250000000),
(2,5,1,'2018-07-01','2020-07-01',250000000),
(4,7,2,'2014-06-14','2020-06-14',25000000),
(10,10,7,'2020-04-14','2020-06-28',15000000),
(11,8,5,'2020-03-15','2020-08-21',10000000),
(11,4,5,'2019-12-12','2020-08-21',10000000),
(10,9,4,'2020-05-21','2025-12-21',20000000);

insert into hop_dong_chi_tiet(id_hop_dong, id_dich_vu_di_kem)
values
(1,1),
(1,2),
(2,3),
(1,4),
(3,3),
(3,1),
(4,2),
(5,1),
(6,5),
(7,1),
(7,2),
(7,3),
(9,3),
(10,2),
(8,2);
-- ----------------------------------Task 2---------------------------------
select 
    *
from
    nhan_vien
where
    (ho_ten like '%H%' or ho_ten like '%T%'
        or ho_ten like '%K%')
        and char_length(ho_ten) <= 15;

-- ----------------------------------Task 3---------------------------------
select 
    id_khach_hang,
    ho_ten,
    so_cmnd,
    so_dien_thoai,
    email,
    dia_chi,
    id_loai_khach,
    round(datediff(curdate(), ngay_sinh) / 365) as tuoi
from
    khach_hang
having tuoi >= 18 and tuoi <= 50;

-- ----------------------------------Task 4---------------------------------
select 
    kh.id_khach_hang,
    kh.ho_ten,
    kh.ngay_sinh,
    kh.so_cmnd,
    kh.so_dien_thoai,
    kh.email,
    kh.dia_chi,
    lk.ten_loai_khach,
    count(id_hop_dong) so_luong_hop_dong
from
    khach_hang kh
        inner join
    loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
        inner join
    hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
group by kh.id_khach_hang
having lk.ten_loai_khach = 'Diamond'
order by so_luong_hop_dong;

-- ----------------------------------Task 5---------------------------------
select 
    kh.id_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.id_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    dv.chi_phi_thue + dvk.don_vi * dvk.gia as tong_tien
from
    khach_hang kh
        left join
    hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
        left join
    hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
        left join
    loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
        left join
    dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
        left join
    dich_vu_di_kem dvk on dvk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem;

-- ----------------------------------Task 6---------------------------------
select distinct
    dv.id_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
from
    dich_vu dv
        inner join
    loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
        inner join
    hop_dong hd on hd.id_dich_vu = dv.id_dich_vu
where
    ((month(hd.ngay_lam_hop_dong) > 3
        and year(hd.ngay_lam_hop_dong) = 2019)
        or year(hd.ngay_lam_hop_dong) <> 2019)
        or hd.ngay_lam_hop_dong is null
order by dv.id_dich_vu;

-- ----------------------------------Task 7---------------------------------

select distinct
    dv.id_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
from
    dich_vu dv
        left join
    loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
        left join
    hop_dong hd on hd.id_dich_vu = dv.id_dich_vu
where
    dv.id_dich_vu in (select distinct
            id_dich_vu
        from
            hop_dong
        where
            year(ngay_lam_hop_dong) = 2018)
        and dv.id_dich_vu not in (select distinct
            id_dich_vu
        from
            hop_dong
        where
            year(ngay_lam_hop_dong) = 2019);

-- ----------------------------------Task 8---------------------------------

select distinct
    ho_ten
from
    khach_hang;

select 
    ho_ten
from
    khach_hang
group by ho_ten;

-- ----------------------------------Task 9---------------------------------

select 
    month(hd.ngay_lam_hop_dong) as thang,
    (dv.chi_phi_thue + dvk.don_vi * dvk.gia) as tong_tien
from
    hop_dong hd
        left join
    dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
        left join
    hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
        left join
    dich_vu_di_kem dvk on dvk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);

-- ----------------------------------Task 10---------------------------------

select 
    hd.id_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    count(hdct.id_hop_dong) as so_luong_dich_vu_di_kem
from
    hop_dong hd
        inner join
    hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
group by hdct.id_hop_dong;

-- ----------------------------------Task 11---------------------------------

select distinct
    dvk.id_dich_vu_di_kem,
    dvk.ten_dich_vu_di_kem,
    dvk.gia,
    dvk.don_vi
from
    dich_vu_di_kem dvk
        inner join
    hop_dong_chi_tiet hdct on hdct.id_dich_vu_di_kem = dvk.id_dich_vu_di_kem
        inner join
    hop_dong hd on hdct.id_hop_dong = hd.id_hop_dong
        inner join
    khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
        inner join
    loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
where
    lk.ten_loai_khach = 'Diamond'
        and (kh.dia_chi = 'Vinh'
        or kh.dia_chi = 'Quảng Ngãi');

-- ----------------------------------Task 12---------------------------------

select 
    hd.id_hop_dong,
    nv.ho_ten as ten_nhan_vien,
    kh.ho_ten as ten_khach_hang,
    kh.so_dien_thoai,
    dv.ten_dich_vu,
    count(hdct.id_dich_vu_di_kem) so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
from
    hop_dong hd
        inner join
    khach_hang kh on kh.id_khach_hang = hd.id_khach_hang
        inner join
    nhan_vien nv on nv.id_nhan_vien = hd.id_nhan_vien
        inner join
    dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
        inner join
    hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
where
    hd.id_hop_dong in (select 
            id_hop_dong
        from
            hop_dong
        where
            ngay_lam_hop_dong > '2019-10-01'
                and ngay_lam_hop_dong < '2019-12-31')
        and hd.id_hop_dong not in (select 
            id_hop_dong
        from
            hop_dong
        where
            ngay_lam_hop_dong > '2019-01-01'
                and ngay_lam_hop_dong < '2019-06-30')
group by hd.id_hop_dong;


-- ----------------------------------Task 13---------------------------------

create view so_lan_dat_cac_dich_vu as
    select 
        dvk.id_dich_vu_di_kem,
        dvk.ten_dich_vu_di_kem,
        dvk.gia,
        dvk.don_vi,
        count(hdct.id_dich_vu_di_kem) as so_lan_dat
    from
        dich_vu_di_kem dvk
            inner join
        hop_dong_chi_tiet hdct on dvk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
    group by dvk.id_dich_vu_di_kem;

select 
    *
from
    so_lan_dat_cac_dich_vu
where
    so_lan_dat in (select 
            max(so_lan_dat)
        from
            so_lan_dat_cac_dich_vu);

-- ----------------------------------Task 14---------------------------------

select 
    hd.id_hop_dong,
    ldv.ten_loai_dich_vu,
    dvk.ten_dich_vu_di_kem,
    count(hdct.id_dich_vu_di_kem) as so_lan_su_dung
from
    dich_vu_di_kem dvk
        inner join
    hop_dong_chi_tiet hdct on dvk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
        inner join
    hop_dong hd on hd.id_hop_dong = hdct.id_hop_dong
        inner join
    dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
        inner join
    loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
group by dvk.id_dich_vu_di_kem
having so_lan_su_dung = 1;

-- ----------------------------------Task 15---------------------------------

select 
    nv.id_nhan_vien,
    nv.ho_ten,
    td.trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    count(hd.id_hop_dong) so_luong_hop_dong
from
    nhan_vien nv
        inner join
    trinh_do td on td.id_trinh_do = nv.id_trinh_do
        inner join
    bo_phan bp on bp.id_bo_phan = nv.id_bo_phan
        left join
    hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
where
    year(hd.ngay_lam_hop_dong) in (2018 , 2019)
        or hd.ngay_lam_hop_dong is null
group by nv.id_nhan_vien
having so_luong_hop_dong <= 3
order by nv.id_nhan_vien;

-- ----------------------------------Task 16---------------------------------

delete from nhan_vien 
where
    id_nhan_vien in (select 
        ds.id_nhan_vien
    from
        (select 
            nv.id_nhan_vien, count(hd.id_hop_dong) so_luong_hop_dong
        from
            nhan_vien nv
        left join hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
        
        where
            year(hd.ngay_lam_hop_dong) in (2017 , 2018, 2019)
            or hd.ngay_lam_hop_dong is null
        group by nv.id_nhan_vien
        having so_luong_hop_dong = 0) as ds);

-- ----------------------------------Task 17---------------------------------

select 
    kh.id_khach_hang,
    kh.ho_ten,
    kh.ngay_sinh,
    kh.so_cmnd,
    kh.so_dien_thoai,
    kh.email,
    kh.dia_chi,
    kh.id_loai_khach,
    dv.chi_phi_thue + sum(dvk.don_vi * dvk.gia) as thanh_toan
from
    khach_hang kh
        inner join
    hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
        inner join
    hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
        inner join
    dich_vu_di_kem dvk on dvk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
        inner join
    dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
where
    kh.id_loai_khach <= 2
        and kh.id_khach_hang in (select 
            id_khach_hang
        from
            hop_dong
        where
            year(ngay_lam_hop_dong) = 2019
        group by id_khach_hang)
group by id_khach_hang
having thanh_toan > 10000000;

-- ----------------------------------Task 18---------------------------------

delete from khach_hang 
where
    id_khach_hang in (select 
        ds.id_khach_hang
    from
        (select distinct
            kh.id_khach_hang
        from
            hop_dong hd
        inner join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
        
        where
            year(hd.ngay_lam_hop_dong) < 2016) as ds);

-- ----------------------------------Task 19---------------------------------

update dich_vu_di_kem 
set 
    gia = gia * 2
where
    id_dich_vu_di_kem in (select 
            ds.id_dich_vu_di_kem
        from
            (select 
                dvk.id_dich_vu_di_kem,
                    count(hdct.id_dich_vu_di_kem) so_lan_su_dung
            from
                dich_vu_di_kem dvk
            inner join hop_dong_chi_tiet hdct on dvk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
            inner join hop_dong hd on hd.id_hop_dong = hdct.id_hop_dong
            where
                year(hd.ngay_lam_hop_dong) = 2019
            group by dvk.id_dich_vu_di_kem
            having so_lan_su_dung = 1) as ds);
-- ----------------------------------Task 20---------------------------------

select 
    id_nhan_vien,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
from
    nhan_vien 
union all select 
    id_khach_hang,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
from
    khach_hang;
    
-- ----------------------------------Task 21---------------------------------

create view v_nhan_vien as
    select distinct
        nv.id_nhan_vien,
        nv.ho_ten,
        vt.ten_vi_tri,
        td.trinh_do,
        bp.ten_bo_phan,
        nv.ngay_sinh,
        nv.so_cmnd,
        nv.luong,
        nv.so_dien_thoai,
        nv.email,
        nv.dia_chi
    from
        nhan_vien nv
            inner join
        hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
            inner join
        trinh_do td on td.id_trinh_do = nv.id_trinh_do
            inner join
        vi_tri vt on vt.id_vi_tri = nv.id_vi_tri
            inner join
        bo_phan bp on bp.id_bo_phan = nv.id_bo_phan
    where
        nv.dia_chi = 'Hải Châu'
            and hd.ngay_lam_hop_dong = '2019-12-12';

select 
    *
from
    v_nhan_vien;

-- ----------------------------------Task 22---------------------------------

update nhan_vien 
set 
    dia_chi = 'Liên Chiểu'
where
    id_nhan_vien in (select 
            id_nhan_vien
        from
            v_nhan_vien);

-- ----------------------------------Task 23---------------------------------