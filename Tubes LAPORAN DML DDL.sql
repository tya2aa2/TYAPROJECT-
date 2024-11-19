create database library;
use library

CREATE TABLE `Library`.`pengunjung` (
	`IDPengunjung` int NOT NULL,
	`Nama` VARCHAR(45) NOT NULL,
	`Alamat` VARCHAR(45) NOT NULL, 
	`no_hp` INT NOT NULL,
	`Pelanggantype` VARCHAR(45) NOT NULL,
    constraint pengunjung_pk primary key (`IdPengunjung`));
select * from pengunjung;

CREATE TABLE `library`.`member` (
	`IDPengunjung` INT NOT NULL,
	`Idmember` INT NOT NULL,
	`Nama` VARCHAR(45) NOT NULL,
	constraint member_pk primary key (`Idmember`),
    constraint member_fk foreign key (`IDPengunjung`) references `pengunjung`(`IDPengunjung`)
    );
select * from member;

CREATE TABLE `library`.`pengunjungumum` (
	`IDPengunjung` INT NOT NULL,
	`nopengunjungumum` INT NOT NULL,
	`Nama` Varchar(45) not null,
	constraint pengunjungumum_pk primary key (`nopengunjungumum`),
    constraint pengunjungumum_fk foreign key (`IDPengunjung`) references `pengunjung`(`IDPengunjung`)
    );
select * from pengunjungumum;

CREATE TABLE `Library`.`peminjaman`(
	`Id_peminjaman` INT NOT NULL,
	`tgl_pinjam` varchar(45) NOT NULL,
	`tgl_kembali` varchar(45) NOT NULL,
	`ID_Buku` INT NOT NULL,
	`Idmember` INT NOT NULL,
	`Idpetugas` INT NOT NULL,
	`Denda` INT NOT NULL,
	constraint peminjaman_pk primary key (`id_peminjaman`) ,
	constraint peminjaman1_fk foreign key (`ID_Buku`) references `buku`(`ID_Buku`),
    constraint peminjaman2_fk foreign key (`Idmember`) references `member`(`Idmember`),
    constraint peminjaman3_fk foreign key (`Idpetugas`) references `petugas`(`idpetugas`)
	);
select * from peminjaman;

CREATE TABLE `Library`.`petugas`(
`Idpetugas` INT NOT NULL,
`Nama` Varchar(45) not null,
`Password` INT NOT NULL,
 constraint petugas_pk primary key (`Idpetugas`)
 );
select * from petugas;
ALTER TABLE petugas MODIFY Password VARCHAR(45) NOT NULL;

CREATE TABLE `Library`.`buku`(
`ID_Buku` INT NOT NULL,
`Judul_buku` Varchar(45) not null,
`Pengarang` Varchar(45) not null,
`Kategori` Varchar(45) not null,
`Penerbit` Varchar(45) not null,
`Tahun` INT NOT NULL,
`Kode_Rak` INT NOT NULL,
`IDPengunjung` int NOT NULL,
constraint buku_pk primary key (`ID_Buku`),
constraint buku_fk foreign key (`Kode_Rak`) references `rak`(`Kode_Rak`),
constraint bukuu_fk foreign key (`IDPengunjung`) references `pengunjung`(`IDPengunjung`)
);
select * from buku;



CREATE TABLE `Library`.`rak`(
`Kode_Rak` INT NOT NULL,
`Lokasi` Varchar(45) not null,
constraint rak_pk primary key (`Kode_Rak`)
);
select * from rak;


DML
Pengunjung
insert into `Pengunjung` values (001, 'Alfi', 'Jln sudirman', 0822365864, 'Member');
insert into `Pengunjung` values (002, 'Zaidan', 'Jln raya', 0822334663, 'Member');
insert into `Pengunjung` values (003, 'Rizky', 'Jln sudirman', 0823236864, 'Member');
insert into `Pengunjung` values (004, 'Ikhsan', 'Jln Cendana', 0822335464, 'Bukan Member');
insert into `Pengunjung` values (005, 'Arya', 'Jln jakarta', 0832375866, 'Member');
insert into `Pengunjung` values (006, 'Kamil', 'Jln jogja', 0822365864, 'Member');
insert into `Pengunjung` values (007, 'Qais', 'Jln timur', 0822945564, 'Bukan Member');
insert into `Pengunjung` values (008, '	Fauzan', 'Jln cendrawasih', 0822435564, 'Member');
insert into `Pengunjung` values (009, 'Mega', 'Jln Cirebon', 082345834, 'Member');
insert into `Pengunjung` values (010, 'Azzahra', 'Jln nuri', 0824323864, 'Member');
insert into `Pengunjung` values (011, 'Fitri', 'Jln Cempaka', 0823175904, 'Bukan Member');
insert into `Pengunjung` values (012, 'Dufa', 'Jln sudirman', 0821663864, 'Member');
insert into `Pengunjung` values (013, 'Melani', 'Jln Sumpah pemuda', 0812365464, 'Bukan Member');
insert into `Pengunjung` values (014, 'Nafi', 'Jln palembang', 0823448864, 'Member');
insert into `Pengunjung` values (015, 'Risma', 'Jln sudirman', 0821985064, 'Member');
select * from pengunjung

update pengunjung 
set `Pelanggantype` = 'bukan member'
where IDPengunjung = 015;

MEMBER
insert into `Member` values (001, 001, 'Alfi');
insert into `Member` values (002, 002, 'Zaidan');
insert into `Member` values (003, 003, 'Rizky');
insert into `Member` values (005, 004, 'Arya');
insert into `Member` values (006, 005, 'Kamil');
insert into `Member` values (008, 006, 'Fauzan');
insert into `Member` values (009, 007, 'Mega');
insert into `Member` values (010, 008, 'Azzahra');
insert into `Member` values (012, 009, 'Dufa');
insert into `Member` values (014, 010, 'Nafi');
select * from member

pengunjung umum
insert into `pengunjungumum` values (004, 001, 'Iksan');
insert into `pengunjungumum` values (007, 002, 'Qais');
insert into `pengunjungumum` values (011, 003, 'Fitri');
insert into `pengunjungumum` values (013, 004, 'Melani');
insert into `pengunjungumum` values (015, 005, 'Risma');
select * from `pengunjungumum`

Buku
insert into `buku` values (01, "Pengenalan Teknologi Informasi", 'Kurniadi Adi', 'Non-Fiksi', 'Andi offset', 2005, 06, 007);
insert into `buku` values (02, "Basis Data", 'Fathansyah', 'Non-fiksi', 'Informatika Bandung', 2007, 05, 001 );
insert into `buku` values (03, "Etika Komputer", 'Ferdinan Yuda', 'Non-Fiksi',  'Informatika Bandung', 2009, 06, 002 );
insert into `buku` values (04, "Detektif Konan", 'Hanici', 'Fiksi',  'Pustaka media', 2010, 02, 004);
insert into `buku` values (05, "Pengenalan Komputer", 'Eko subeksti', 'Non-Fiksi',  'Bsi Press', 2009, 06, 008);
insert into `buku` values (06, "Sistem Basis Data", 'Hartanto Sri', 'Non-Fiksi',  'Informatika Bandung', 2006, 06, 010);
insert into `buku` values (07, "Pengantar Logika dan Algoritma", 'Edo Sulistya', 'Non-Fiksi',  'Informatika Bandung', 2009, 06, 013);
insert into `buku` values (08, "Sejarah komputer", 'Ferdinan Yuda', 'Non-Fiksi',  'Informatika Bandung', 2009, 03, 012);
insert into `buku` values (09, "Jaringan Komputer", 'Suarna, nana', 'Non-Fiksi',  'Informatika Bandung', 2016, 06, 011);
insert into `buku` values (10, "Memahami Sistem Informasi", 'Ferdinan Yuda', 'Non-Fiksi',  'Informatika Bandung', 2018, 06, 006 );
insert into `buku` values (11, "Ketika Cinta Bertasbih", 'Lusia devi', 'Fiksi',  'Cempaka bandung', 2011, 01, 014);
insert into `buku` values (12, "Pemrograman Berorientasi Objek", 'Nugroho Adi', 'Non-Fiksi',  'Press media', 2015, 06, 015);
insert into `buku` values (13, "Bulan Terbelah di Langit Amerika", 'Hanum Salsabila Rais', 'Fiksi',  'Gramedia Pustaka Utama', 2014, 01 , 002);
insert into `buku` values (14, "Selena", 'Tere-liye', 'Fiksi',  'Gramedia Pustaka Utama', 2020, 01, 015);
insert into `buku` values (15, "Habibie Ainun", 'Bacharuddin Jusuf Habibie', 'Viksi',  'PT THC Mandiri ', 2010, 01, 013);
Select * from buku

Petugas
insert into `Petugas` values (111, "Laras Lestari", 'Laras111');
insert into `Petugas` values (122, "Maimunah yusuf", 'Mae122');
insert into `Petugas` values (133, "Rahma Andi", 'Rah133');
insert into `Petugas` values (144, "Cindy mud", 'Cin144');
insert into `Petugas` values (155, "Ria Harun", 'Ri155');
insert into `Petugas` values (166, "Lutfiah", 'Lut166');
Select * from petugas


Peminjaman
insert into `peminjaman` values (20, '22-06-2021', '29-06-2021', 02, 002,  155, 0);
insert into `peminjaman` values (21, '20-06-2021', '27-06-2021', 10, 003,  111, 1);
insert into `peminjaman` values (22, '15-06-2021', '22-06-2021', 03, 005,  166, 0);
insert into `peminjaman` values (23, '1-06-2021', '7-06-2021', 08, 006,  111, 2);
insert into `peminjaman` values (24, '5-06-2021', '12-06-2021', 01, 008,  144, 3);
insert into `peminjaman` values (25, '4-06-2021', '11-06-2021', 09, 009,  166, 0);
insert into `peminjaman` values (26, '16-06-2021', '23-06-2021', 01, 010,  133, 1);
insert into `peminjaman` values (27, '21-06-2021', '28-06-2021', 13, 014,  133, 0);
insert into `peminjaman` values (28, '10-06-2021', '17-06-2021', 09, 003,  122, 1);
insert into `peminjaman` values (29, '8-06-2021', '14-06-2021', 05, 008,  111, 0);
insert into `peminjaman` values (30, '21-06-2021', '28-06-2021', 03, 009,  133, 0);
insert into `peminjaman` values (31, '2-06-2021', '9-06-2021', 09, 005, 144, 0);
insert into `peminjaman` values (33, '3-06-2021', '10-06-2021', 13, 010,  166, 0);
insert into `peminjaman` values (34, '14-06-2021', '21-06-2021', 12, 014,  155, 0);
insert into `peminjaman` values (35, '12-06-2021', '19-06-2021', 11, 012,  111, 0);
select * from peminjaman

Rak
insert into `rak` values (01, 'fiksi');
insert into `rak` values (02, 'ensiklopedia');
insert into `rak` values (03, 'biografi');
insert into `rak` values (04, 'majalah');
insert into `rak` values (05, 'karya ilmiah');
insert into `rak` values (06, 'Komputer');
select * from rak;







