create database QLTK
use QLTK
create table CHINHANH(
	MACN nchar(5) primary key,
	TENCN nvarchar(50) unique,
	DIACHI nvarchar(80) not null
)
create table DICHVU(
	MADV nchar(5) primary key,
	KYHAN int not null check(KYHAN >=0),
	TENDV nvarchar(30) not null
)
create table LAISUAT(
	MADV nchar(5),
	NGAYAD Date,
	LAISUAT real,
	primary key(MADV,NGAYAD),
	foreign key (MADV) references DICHVU(MADV)
)
create table KHACHHANG(
	HOTEN nvarchar(50) not null,
	DIACHI nvarchar(100) not null,
	CMND nchar(9) primary key,
	NGAYCAP date not null,
	MACN nchar(5),
	foreign key (MACN) references CHINHANH(MACN)
)
create table GIAODICHVIEN(
	HOTEN nvarchar(50) not null,
	DIACHI nvarchar(100) not null,
	MAGDV nchar(9) primary key,
	MACN nchar(5),
	foreign key (MACN) references CHINHANH(MACN)
)
create table PHIEU(
	MAPHIEU char(9) primary key,
	CMND nchar(9) not null,
	MADV nchar(5) not null,
	NGAYGUI datetime not null default(getdate()),
	LAISUAT real not null,
	SOTIEN_GUI money not null default(100000) check(SOTIEN_GUI >= 100000),
	NGAYDENNHAN datetime not null,
	MAGDV_LPG nchar(9),
	NGAYRUT datetime,
	TIENLAI money default(0),
	MAGDV_LPR nchar(9),
	foreign key (CMND) references KHACHHANG(CMND),
	foreign key (MADV) references DICHVU(MADV),
	foreign key (MAGDV_LPG) references GIAODICHVIEN(MAGDV),
	foreign key (MAGDV_LPR) references GIAODICHVIEN(MAGDV),
)