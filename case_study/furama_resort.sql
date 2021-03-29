drop database if exists furama_resort;

create database furama_resort;

use furama_resort;

create table vi_tri(
id_vi_tri int,
ten_vi_tri varchar(45)
);

create table trinh_do(
id_trinh_do int,
trinh_do varchar(45)
);

create table bo_phan(
id_bo_phan int,
ten_bo_phan varchar(45)
);

create table dich_vu_di_kem(
id_dich_vu_di_kem int,
ten_dich_vu_di_kem varchar(45),
gia int,
don_vi int,
trang_thai_kha_dung varchar(45)
);

create table loai_khach(
id_loai_khach int,
ten_loai_khach varchar(45)
);

create table kieu_thue(
id_kieu_thue int,
ten_kieu_thue varchar(45),
gia int
);

create table loai_dich_vu(
id_loai_dich_vu int,
ten_loai_dich_vu varchar(45)
);

create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int
);

create table nhan_vien(
id_nhan_vien int,
ho_ten varchar(45),
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,

);

create table hop_dong(

);