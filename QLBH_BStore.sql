create database QLBH_BStore
use QLBH_BStore
go
create table  NhanVien
(
MaNV nvarchar(5) NOT NULL CONSTRAINT PK_Ma_NV PRIMARY KEY (MaNV),
HoTenNV nvarchar(30)NOT NULL,
GioiTinh nvarchar(5) NOT NULL CONSTRAINT CK_GioiTinh_NV CHECK (gioitinh in (N'Nam', N'Nữ',N'khác')),
DiaChiNV nvarchar(50) NOT NULL CONSTRAINT DF_DiaChi_NV DEFAULT N'chưa có thông tin',
NgaySinh DATETIME NOT NULL,
DienThoai nvarchar(15),
NoiSinh nvarchar(20) NOT NULL CONSTRAINT DF_NoiSinh_NV DEFAULT N'chưa có thông tin',
NgayVaoLam DATETIME
)
go
create table KhachHang 
(
MaKH nvarchar(5) NOT NULL CONSTRAINT PK_Ma_KH PRIMARY KEY (MaKH),
TenKH nvarchar(30) NOT NULL,
DiaChiKH nvarchar(50) CONSTRAINT DF_DiaChi_KH DEFAULT N'chưa có thông tin',
SODT nvarchar(15)
)
go
create table NhaCungCap
(
MaNCC nvarchar(5) NOT NULL CONSTRAINT PK_Ma_NCC PRIMARY KEY (MaNCC),
TenNCC nvarchar(50) NOT NULL,
DiaChi nvarchar(50) NOT NULL CONSTRAINT DF_DiaChi_NCC DEFAULT N'chưa có thông tin',
DienThoai nvarchar(15) NOT NULL,
Email NTEXT,
Website nvarchar(30)
)
go
create table LoaiSanPham 
(
MaLoaiSP nvarchar(4) NOT NULL CONSTRAINT PK_MA_LSP PRIMARY KEY (MaLoaiSP),
TenLoaiSP nvarchar(30) NOT NULL,
GhiChu nvarchar(100),
MaNCC nvarchar(5) Constraint FK_MaNCC_LSP References NhaCungCap(MaNCC)
)
go
create table SanPham
(
MaSP nvarchar(4) NOT NULL CONSTRAINT PK_Ma_SP PRIMARY KEY (MaSP),
MaLoaiSP nvarchar(4) NOT NULL Constraint FK_MaLoaiSP_SANPHAM References LoaiSanPham(MaLoaiSP),
TenSP nvarchar(50) NOT NULL,
SLTon nvarchar(10) NOT NULL,
Ghichu nvarchar(100)
)
go
create table HoaDon
(
MaHD nvarchar (5) NOT NULL CONSTRAINT PK_Ma_HD PRIMARY KEY (MaHD),
MaKH nvarchar(5) not null Constraint FK_MaKH_HD References KhachHang(MaKH),
MaNV nvarchar (5) not null Constraint FK_MaNV_HD References NhanVien(MaNV),
MaSP nvarchar (4) not null Constraint FK_MaSP_HD References SanPham(MaSP),
NgayDH datetime2 (7) not null,
NgayDKNH datetime2 (7) not null,
SLDat int,
DgBan float,
PTTT nvarchar (100)
)
create table CTHoaDon
(
MaHD nvarchar (5),
MaSP nvarchar (4)not null Constraint FK_MaSP_CTHD References SanPham(MaSP),
SLDat int,
DgBan float,
primary key (MaHD, MaSP)
)
