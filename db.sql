-- Adminer 5.3.0 MariaDB 11.7.2-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin` (
  `Id_Admin` varchar(50) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `DetailPesanan`;
CREATE TABLE `DetailPesanan` (
  `Id_Detail` varchar(50) NOT NULL,
  `Id_Pesanan` varchar(50) DEFAULT NULL,
  `Id_Menu` varchar(50) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Harga_sub` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Detail`),
  KEY `IXFK_DetailPesanan_Menu` (`Id_Menu`),
  CONSTRAINT `FK_DetailPesanan_Menu` FOREIGN KEY (`Id_Menu`) REFERENCES `Menu` (`Id_Menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Driver`;
CREATE TABLE `Driver` (
  `Id_Driver` varchar(50) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `No_HP` varchar(13) DEFAULT NULL,
  `Kendaraan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Driver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Konsumen`;
CREATE TABLE `Konsumen` (
  `Id_Konsumen` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Konsumen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Menu`;
CREATE TABLE `Menu` (
  `Id_Menu` varchar(50) NOT NULL,
  `Id_Penjual` varchar(50) DEFAULT NULL,
  `Nama_Menu` varchar(50) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`Id_Menu`),
  KEY `IXFK_Menu_Penjual` (`Id_Penjual`),
  CONSTRAINT `FK_Menu_Penjual` FOREIGN KEY (`Id_Penjual`) REFERENCES `Penjual` (`Id_Penjual`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Penjual`;
CREATE TABLE `Penjual` (
  `Id_Penjual` varchar(50) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Nama_Toko` varchar(50) DEFAULT NULL,
  `Alamat_Toko` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Penjual`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Pesanan`;
CREATE TABLE `Pesanan` (
  `Id_Pesanan` varchar(50) NOT NULL,
  `Id_Konsumen` varchar(50) DEFAULT NULL,
  `Id_Driver` varchar(50) DEFAULT NULL,
  `Tanggal_Order` datetime DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Total_Harga` int(11) DEFAULT NULL,
  `Id_Detail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Pesanan`),
  KEY `IXFK_Pesanan_DetailPesanan` (`Id_Detail`),
  KEY `IXFK_Pesanan_Driver` (`Id_Driver`),
  KEY `IXFK_Pesanan_Konsumen` (`Id_Konsumen`),
  CONSTRAINT `FK_Pesanan_DetailPesanan` FOREIGN KEY (`Id_Detail`) REFERENCES `DetailPesanan` (`Id_Detail`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pesanan_Driver` FOREIGN KEY (`Id_Driver`) REFERENCES `Driver` (`Id_Driver`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pesanan_Konsumen` FOREIGN KEY (`Id_Konsumen`) REFERENCES `Konsumen` (`Id_Konsumen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- 2025-05-26 14:44:46 UTC