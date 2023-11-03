DROP TABLE tbl_disposisi;

CREATE TABLE `tbl_disposisi` (
  `id_disposisi` int(10) NOT NULL AUTO_INCREMENT,
  `tujuan` varchar(250) NOT NULL,
  `isi_disposisi` mediumtext NOT NULL,
  `sifat` varchar(100) NOT NULL,
  `batas_waktu` date NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `id_surat` int(10) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_disposisi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_disposisi VALUES("3","sekretaris","ditindaklanjuti","Biasa","2023-08-08","hvhv","3","1");
INSERT INTO tbl_disposisi VALUES("4","ketua","peminjaman gedung","Segera","2023-08-20","permintaan persetujuan ","4","1");
INSERT INTO tbl_disposisi VALUES("5","ketua","tindak lanjuti acara

nsahfuefhsavyfuuqe","Biasa","2023-08-15","amjsnihbjsjd","5","6");
INSERT INTO tbl_disposisi VALUES("6","ketua","hvyrdr","Segera","2023-08-17","perlu ditindaklanjuti","6","1");



DROP TABLE tbl_instansi;

CREATE TABLE `tbl_instansi` (
  `id_instansi` tinyint(1) NOT NULL,
  `institusi` varchar(150) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `ketua` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `website` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_instansi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_instansi VALUES("1","Pemerintah","Komisi Informasi Provinsi Riau","Jl. Gajah Mada Nomor 200, lantai 3","H Zufra Irwan, SE, MM","123456789","http://komisiinformasi.riau.go.id/","iteofficial@gmail.com","KI_LOGO.png","1");



DROP TABLE tbl_klasifikasi;

CREATE TABLE `tbl_klasifikasi` (
  `id_klasifikasi` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(30) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `uraian` mediumtext NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_klasifikasi`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_klasifikasi VALUES("7","007","Penghargaan","","1");
INSERT INTO tbl_klasifikasi VALUES("8","011","Gedung Kantor (Pinjam Tempat)","","1");
INSERT INTO tbl_klasifikasi VALUES("9","005","Undangan","","1");
INSERT INTO tbl_klasifikasi VALUES("11","028","Inventaris","","1");
INSERT INTO tbl_klasifikasi VALUES("12","042","Dokumentasi persidangan","","1");
INSERT INTO tbl_klasifikasi VALUES("14","073","riset","","1");



DROP TABLE tbl_sett;

CREATE TABLE `tbl_sett` (
  `id_sett` tinyint(1) NOT NULL,
  `surat_masuk` tinyint(2) NOT NULL,
  `surat_keluar` tinyint(2) NOT NULL,
  `referensi` tinyint(2) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_sett`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_sett VALUES("1","10","10","10","1");



DROP TABLE tbl_surat_keluar;

CREATE TABLE `tbl_surat_keluar` (
  `id_surat` int(10) NOT NULL AUTO_INCREMENT,
  `no_agenda` int(10) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `isi` mediumtext NOT NULL,
  `kode` varchar(30) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_catat` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_surat_keluar VALUES("2","1","uin suska","002/jasucv/sb","pemberitahuan persidangan","001","2023-08-08","2023-08-11","3313-Twibbon 17 Agustus Hut Republik Indonesia Merah Putih Instagram Post (1).png","1");
INSERT INTO tbl_surat_keluar VALUES("3","2","BPKAD","020/ki/ri/zyx","peminjaman gedung","011","2023-08-13","2023-08-13","1494-download surat.png","1");



DROP TABLE tbl_surat_masuk;

CREATE TABLE `tbl_surat_masuk` (
  `id_surat` int(10) NOT NULL AUTO_INCREMENT,
  `no_agenda` int(10) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `asal_surat` varchar(250) NOT NULL,
  `isi` mediumtext NOT NULL,
  `kode` varchar(30) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_diterima` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  `indeks` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_surat_masuk VALUES("3","1","002/jasucv/sb","kua","permohonan keterbukaan data","001","2023-07-31","2023-07-31","6965-pass e-arsipkthari.png","1","");
INSERT INTO tbl_surat_masuk VALUES("4","2","023/drp/ri/xyz","DPR","undangan diskusi","005","2023-08-13","2023-08-13","9384-Contoh-Surat-Masuk-Resmi-1.jpg","1","");
INSERT INTO tbl_surat_masuk VALUES("5","3","jsbauds/caushvdu","DPR","undangan","005","2023-08-13","2023-08-14","6096-Contoh-Surat-Masuk-Resmi-1.jpg","1","");
INSERT INTO tbl_surat_masuk VALUES("6","4","hby/ajhbsdfu/jzbc","diskominfo","undangan","005","2023-08-16","2023-08-16","1771-Contoh-Surat-Masuk-Resmi-1.jpg","1","");



DROP TABLE tbl_user;

CREATE TABLE `tbl_user` (
  `id_user` tinyint(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_user VALUES("1","admin","827ccb0eea8a706c4c34a16891f84e7b","Admin","123456789","1");
INSERT INTO tbl_user VALUES("6","ketua","827ccb0eea8a706c4c34a16891f84e7b","H Zufra Irwan, SE, MM","123456789","4");
INSERT INTO tbl_user VALUES("7","nelvi","827ccb0eea8a706c4c34a16891f84e7b","nelvi","0987654321","3");



