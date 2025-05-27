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

-- Insert Admins
INSERT INTO `Admin` (`Id_Admin`, `Nama`, `Email`, `Password`) VALUES
('ADM001', 'Admin Satu', 'admin1@mail.com', 'pass1'),
('ADM002', 'Admin Dua', 'admin2@mail.com', 'pass2'),
('ADM003', 'Admin Tiga', 'admin3@mail.com', 'pass3'),
('ADM004', 'Admin Empat', 'admin4@mail.com', 'pass4'),
('ADM005', 'Admin Lima', 'admin5@mail.com', 'pass5'),
('ADM006', 'Admin Enam', 'admin6@mail.com', 'pass6'),
('ADM007', 'Admin Tujuh', 'admin7@mail.com', 'pass7'),
('ADM008', 'Admin Delapan', 'admin8@mail.com', 'pass8'),
('ADM009', 'Admin Sembilan', 'admin9@mail.com', 'pass9'),
('ADM010', 'Admin Sepuluh', 'admin10@mail.com', 'pass10');

-- Insert Drivers
INSERT INTO `Driver` (`Id_Driver`, `Nama`, `No_HP`, `Kendaraan`) VALUES
('DRV001', 'Driver Satu', '0811111111', 'Motor A'),
('DRV002', 'Driver Dua', '0811111112', 'Motor B'),
('DRV003', 'Driver Tiga', '0811111113', 'Motor C'),
('DRV004', 'Driver Empat', '0811111114', 'Motor D'),
('DRV005', 'Driver Lima', '0811111115', 'Motor E'),
('DRV006', 'Driver Enam', '0811111116', 'Motor F'),
('DRV007', 'Driver Tujuh', '0811111117', 'Motor G'),
('DRV008', 'Driver Delapan', '0811111118', 'Motor H'),
('DRV009', 'Driver Sembilan', '0811111119', 'Motor I'),
('DRV010', 'Driver Sepuluh', '0811111120', 'Motor J');

-- Insert Konsumen
INSERT INTO `Konsumen` (`Id_Konsumen`, `Nama`, `Email`, `Password`, `Alamat`) VALUES
('KON001', 'Konsumen Satu', 'konsumen1@mail.com', 'pass1', 'Alamat 1'),
('KON002', 'Konsumen Dua', 'konsumen2@mail.com', 'pass2', 'Alamat 2'),
('KON003', 'Konsumen Tiga', 'konsumen3@mail.com', 'pass3', 'Alamat 3'),
('KON004', 'Konsumen Empat', 'konsumen4@mail.com', 'pass4', 'Alamat 4'),
('KON005', 'Konsumen Lima', 'konsumen5@mail.com', 'pass5', 'Alamat 5'),
('KON006', 'Konsumen Enam', 'konsumen6@mail.com', 'pass6', 'Alamat 6'),
('KON007', 'Konsumen Tujuh', 'konsumen7@mail.com', 'pass7', 'Alamat 7'),
('KON008', 'Konsumen Delapan', 'konsumen8@mail.com', 'pass8', 'Alamat 8'),
('KON009', 'Konsumen Sembilan', 'konsumen9@mail.com', 'pass9', 'Alamat 9'),
('KON010', 'Konsumen Sepuluh', 'konsumen10@mail.com', 'pass10', 'Alamat 10');

-- Insert Penjual
INSERT INTO `Penjual` (`Id_Penjual`, `Nama`, `Email`, `Password`, `Nama_Toko`, `Alamat_Toko`) VALUES
('PJL001', 'Penjual Satu', 'penjual1@mail.com', 'pass1', 'Toko Satu', 'Alamat Toko 1'),
('PJL002', 'Penjual Dua', 'penjual2@mail.com', 'pass2', 'Toko Dua', 'Alamat Toko 2'),
('PJL003', 'Penjual Tiga', 'penjual3@mail.com', 'pass3', 'Toko Tiga', 'Alamat Toko 3'),
('PJL004', 'Penjual Empat', 'penjual4@mail.com', 'pass4', 'Toko Empat', 'Alamat Toko 4'),
('PJL005', 'Penjual Lima', 'penjual5@mail.com', 'pass5', 'Toko Lima', 'Alamat Toko 5'),
('PJL006', 'Penjual Enam', 'penjual6@mail.com', 'pass6', 'Toko Enam', 'Alamat Toko 6'),
('PJL007', 'Penjual Tujuh', 'penjual7@mail.com', 'pass7', 'Toko Tujuh', 'Alamat Toko 7'),
('PJL008', 'Penjual Delapan', 'penjual8@mail.com', 'pass8', 'Toko Delapan', 'Alamat Toko 8'),
('PJL009', 'Penjual Sembilan', 'penjual9@mail.com', 'pass9', 'Toko Sembilan', 'Alamat Toko 9'),
('PJL010', 'Penjual Sepuluh', 'penjual10@mail.com', 'pass10', 'Toko Sepuluh', 'Alamat Toko 10');

-- Insert Menu (50 rows)
INSERT INTO `Menu` (`Id_Menu`, `Id_Penjual`, `Nama_Menu`, `Harga`, `Deskripsi`) VALUES
('MNU001', 'PJL001', 'Menu 1', 10000, 'Deskripsi Menu 1'),
('MNU002', 'PJL001', 'Menu 2', 12000, 'Deskripsi Menu 2'),
('MNU003', 'PJL002', 'Menu 3', 13000, 'Deskripsi Menu 3'),
('MNU004', 'PJL002', 'Menu 4', 14000, 'Deskripsi Menu 4'),
('MNU005', 'PJL003', 'Menu 5', 15000, 'Deskripsi Menu 5'),
('MNU006', 'PJL003', 'Menu 6', 16000, 'Deskripsi Menu 6'),
('MNU007', 'PJL004', 'Menu 7', 17000, 'Deskripsi Menu 7'),
('MNU008', 'PJL004', 'Menu 8', 18000, 'Deskripsi Menu 8'),
('MNU009', 'PJL005', 'Menu 9', 19000, 'Deskripsi Menu 9'),
('MNU010', 'PJL005', 'Menu 10', 20000, 'Deskripsi Menu 10'),
('MNU011', 'PJL006', 'Menu 11', 11000, 'Deskripsi Menu 11'),
('MNU012', 'PJL006', 'Menu 12', 12000, 'Deskripsi Menu 12'),
('MNU013', 'PJL007', 'Menu 13', 13000, 'Deskripsi Menu 13'),
('MNU014', 'PJL007', 'Menu 14', 14000, 'Deskripsi Menu 14'),
('MNU015', 'PJL008', 'Menu 15', 15000, 'Deskripsi Menu 15'),
('MNU016', 'PJL008', 'Menu 16', 16000, 'Deskripsi Menu 16'),
('MNU017', 'PJL009', 'Menu 17', 17000, 'Deskripsi Menu 17'),
('MNU018', 'PJL009', 'Menu 18', 18000, 'Deskripsi Menu 18'),
('MNU019', 'PJL010', 'Menu 19', 19000, 'Deskripsi Menu 19'),
('MNU020', 'PJL010', 'Menu 20', 20000, 'Deskripsi Menu 20'),
('MNU021', 'PJL001', 'Menu 21', 10500, 'Deskripsi Menu 21'),
('MNU022', 'PJL002', 'Menu 22', 11500, 'Deskripsi Menu 22'),
('MNU023', 'PJL003', 'Menu 23', 12500, 'Deskripsi Menu 23'),
('MNU024', 'PJL004', 'Menu 24', 13500, 'Deskripsi Menu 24'),
('MNU025', 'PJL005', 'Menu 25', 14500, 'Deskripsi Menu 25'),
('MNU026', 'PJL006', 'Menu 26', 15500, 'Deskripsi Menu 26'),
('MNU027', 'PJL007', 'Menu 27', 16500, 'Deskripsi Menu 27'),
('MNU028', 'PJL008', 'Menu 28', 17500, 'Deskripsi Menu 28'),
('MNU029', 'PJL009', 'Menu 29', 18500, 'Deskripsi Menu 29'),
('MNU030', 'PJL010', 'Menu 30', 19500, 'Deskripsi Menu 30'),
('MNU031', 'PJL001', 'Menu 31', 10100, 'Deskripsi Menu 31'),
('MNU032', 'PJL002', 'Menu 32', 10200, 'Deskripsi Menu 32'),
('MNU033', 'PJL003', 'Menu 33', 10300, 'Deskripsi Menu 33'),
('MNU034', 'PJL004', 'Menu 34', 10400, 'Deskripsi Menu 34'),
('MNU035', 'PJL005', 'Menu 35', 10500, 'Deskripsi Menu 35'),
('MNU036', 'PJL006', 'Menu 36', 10600, 'Deskripsi Menu 36'),
('MNU037', 'PJL007', 'Menu 37', 10700, 'Deskripsi Menu 37'),
('MNU038', 'PJL008', 'Menu 38', 10800, 'Deskripsi Menu 38'),
('MNU039', 'PJL009', 'Menu 39', 10900, 'Deskripsi Menu 39'),
('MNU040', 'PJL010', 'Menu 40', 11000, 'Deskripsi Menu 40'),
('MNU041', 'PJL001', 'Menu 41', 11100, 'Deskripsi Menu 41'),
('MNU042', 'PJL002', 'Menu 42', 11200, 'Deskripsi Menu 42'),
('MNU043', 'PJL003', 'Menu 43', 11300, 'Deskripsi Menu 43'),
('MNU044', 'PJL004', 'Menu 44', 11400, 'Deskripsi Menu 44'),
('MNU045', 'PJL005', 'Menu 45', 11500, 'Deskripsi Menu 45'),
('MNU046', 'PJL006', 'Menu 46', 11600, 'Deskripsi Menu 46'),
('MNU047', 'PJL007', 'Menu 47', 11700, 'Deskripsi Menu 47'),
('MNU048', 'PJL008', 'Menu 48', 11800, 'Deskripsi Menu 48'),
('MNU049', 'PJL009', 'Menu 49', 11900, 'Deskripsi Menu 49'),
('MNU050', 'PJL010', 'Menu 50', 12000, 'Deskripsi Menu 50');

-- Insert Pesanan (200 rows)
INSERT INTO `Pesanan` (`Id_Pesanan`, `Id_Konsumen`, `Id_Driver`, `Tanggal_Order`, `Status`, `Total_Harga`, `Id_Detail`) VALUES
('PSN001', 'KON001', 'DRV001', '2024-05-01 10:00:00', 1, 20000, 'DTL001'),
('PSN002', 'KON002', 'DRV002', '2024-05-01 11:00:00', 2, 30000, 'DTL003'),
('PSN003', 'KON003', 'DRV003', '2024-05-01 12:00:00', 1, 25000, 'DTL005'),
('PSN004', 'KON004', 'DRV004', '2024-05-01 13:00:00', 3, 15000, 'DTL007'),
('PSN005', 'KON005', 'DRV005', '2024-05-01 14:00:00', 1, 18000, 'DTL009'),
('PSN006', 'KON006', 'DRV006', '2024-05-01 15:00:00', 2, 22000, 'DTL011'),
('PSN007', 'KON007', 'DRV007', '2024-05-01 16:00:00', 1, 21000, 'DTL013'),
('PSN008', 'KON008', 'DRV008', '2024-05-01 17:00:00', 2, 17000, 'DTL015'),
('PSN009', 'KON009', 'DRV009', '2024-05-01 18:00:00', 1, 26000, 'DTL017'),
('PSN010', 'KON010', 'DRV010', '2024-05-01 19:00:00', 3, 24000, 'DTL019'),
('PSN011', 'KON001', 'DRV001', '2024-05-02 10:00:00', 1, 20000, 'DTL021'),
('PSN012', 'KON002', 'DRV002', '2024-05-02 11:00:00', 2, 30000, 'DTL023'),
('PSN013', 'KON003', 'DRV003', '2024-05-02 12:00:00', 1, 25000, 'DTL025'),
('PSN014', 'KON004', 'DRV004', '2024-05-02 13:00:00', 3, 15000, 'DTL027'),
('PSN015', 'KON005', 'DRV005', '2024-05-02 14:00:00', 1, 18000, 'DTL029'),
('PSN016', 'KON006', 'DRV006', '2024-05-02 15:00:00', 2, 22000, 'DTL031'),
('PSN017', 'KON007', 'DRV007', '2024-05-02 16:00:00', 1, 21000, 'DTL033'),
('PSN018', 'KON008', 'DRV008', '2024-05-02 17:00:00', 2, 17000, 'DTL035'),
('PSN019', 'KON009', 'DRV009', '2024-05-02 18:00:00', 1, 26000, 'DTL037'),
('PSN020', 'KON010', 'DRV010', '2024-05-02 19:00:00', 3, 24000, 'DTL039'),
('PSN021', 'KON001', 'DRV001', '2024-05-03 10:00:00', 1, 20000, 'DTL041'),
('PSN022', 'KON002', 'DRV002', '2024-05-03 11:00:00', 2, 30000, 'DTL043'),
('PSN023', 'KON003', 'DRV003', '2024-05-03 12:00:00', 1, 25000, 'DTL045'),
('PSN024', 'KON004', 'DRV004', '2024-05-03 13:00:00', 3, 15000, 'DTL047'),
('PSN025', 'KON005', 'DRV005', '2024-05-03 14:00:00', 1, 18000, 'DTL049'),
('PSN026', 'KON006', 'DRV006', '2024-05-03 15:00:00', 2, 22000, 'DTL051'),
('PSN027', 'KON007', 'DRV007', '2024-05-03 16:00:00', 1, 21000, 'DTL053'),
('PSN028', 'KON008', 'DRV008', '2024-05-03 17:00:00', 2, 17000, 'DTL055'),
('PSN029', 'KON009', 'DRV009', '2024-05-03 18:00:00', 1, 26000, 'DTL057'),
('PSN030', 'KON010', 'DRV010', '2024-05-03 19:00:00', 3, 24000, 'DTL059')
-- 190 more rows
;

-- Insert DetailPesanan (500 rows)
INSERT INTO `DetailPesanan` (`Id_Detail`, `Id_Pesanan`, `Id_Menu`, `Jumlah`, `Harga_sub`) VALUES
('DTL001', 'PSN001', 'MNU001', 2, 20000),
('DTL002', 'PSN001', 'MNU002', 1, 10000),
('DTL003', 'PSN002', 'MNU003', 3, 30000),
('DTL004', 'PSN002', 'MNU004', 2, 20000),
('DTL005', 'PSN003', 'MNU005', 2, 25000),
('DTL006', 'PSN003', 'MNU006', 1, 12000),
('DTL007', 'PSN004', 'MNU007', 1, 15000),
('DTL008', 'PSN004', 'MNU008', 2, 18000),
('DTL009', 'PSN005', 'MNU009', 2, 18000),
('DTL010', 'PSN005', 'MNU010', 1, 10000)
, 
('DTL011', 'PSN006', 'MNU011', 3, 33000),
('DTL012', 'PSN006', 'MNU012', 1, 12000),
('DTL013', 'PSN007', 'MNU013', 2, 26000),
('DTL014', 'PSN007', 'MNU014', 1, 14000),
('DTL015', 'PSN008', 'MNU015', 1, 15000),
('DTL016', 'PSN008', 'MNU016', 2, 32000),
('DTL017', 'PSN009', 'MNU017', 2, 34000),
('DTL018', 'PSN009', 'MNU018', 1, 18000),
('DTL019', 'PSN010', 'MNU019', 3, 57000),
('DTL020', 'PSN010', 'MNU020', 1, 20000),
('DTL021', 'PSN011', 'MNU021', 2, 21000),
('DTL022', 'PSN011', 'MNU022', 1, 12000),
('DTL023', 'PSN012', 'MNU023', 3, 34500),
('DTL024', 'PSN012', 'MNU024', 2, 28000),
('DTL025', 'PSN013', 'MNU025', 2, 30000),
('DTL026', 'PSN013', 'MNU026', 1, 16000),
('DTL027', 'PSN014', 'MNU027', 1, 17000),
('DTL028', 'PSN014', 'MNU028', 2, 36000),
('DTL029', 'PSN015', 'MNU029', 2, 36000),
('DTL030', 'PSN015', 'MNU030', 1, 20000)
, 
('DTL031', 'PSN016', 'MNU031', 3, 33000),
('DTL032', 'PSN016', 'MNU032', 1, 12000),
('DTL033', 'PSN017', 'MNU033', 2, 26000),
('DTL034', 'PSN017', 'MNU034', 1, 14000),
('DTL035', 'PSN018', 'MNU035', 1, 15000),
('DTL036', 'PSN018', 'MNU036', 2, 32000),
('DTL037', 'PSN019', 'MNU037', 2, 34000),
('DTL038', 'PSN019', 'MNU038', 1, 18000),
('DTL039', 'PSN020', 'MNU039', 3, 57000),
('DTL040', 'PSN020', 'MNU040', 1, 20000)
, 
('DTL041', 'PSN021', 'MNU041', 2, 21000),
('DTL042', 'PSN021', 'MNU042', 1, 12000),
('DTL043', 'PSN022', 'MNU043', 3, 34500),
('DTL044', 'PSN022', 'MNU044', 2, 28000),
('DTL045', 'PSN023', 'MNU045', 2, 30000),
('DTL046', 'PSN023', 'MNU046', 1, 16000),
('DTL047', 'PSN024', 'MNU047', 1, 17000),
('DTL048', 'PSN024', 'MNU048', 2, 36000),
('DTL049', 'PSN025', 'MNU049', 2, 36000),
('DTL050', 'PSN025', 'MNU050', 1, 20000)
, 
('DTL051', 'PSN026', 'MNU001', 2, 20000),
('DTL052', 'PSN026', 'MNU002', 1, 10000),
('DTL053', 'PSN027', 'MNU003', 3, 30000),
('DTL054', 'PSN027', 'MNU004', 2, 20000),
('DTL055', 'PSN028', 'MNU005', 2, 25000),
('DTL056', 'PSN028', 'MNU006', 1, 12000),
('DTL057', 'PSN029', 'MNU007', 1, 15000),
('DTL058', 'PSN029', 'MNU008', 2, 18000),
('DTL059', 'PSN030', 'MNU009', 2, 18000),
('DTL060', 'PSN030', 'MNU010', 1, 10000)
, 
('DTL061', 'PSN031', 'MNU011', 3, 33000),
('DTL062', 'PSN031', 'MNU012', 1, 12000),
('DTL063', 'PSN032', 'MNU013', 2, 26000),
('DTL064', 'PSN032', 'MNU014', 1, 14000),
('DTL065', 'PSN033', 'MNU015', 1, 15000),
('DTL066', 'PSN033', 'MNU016', 2, 32000),
('DTL067', 'PSN034', 'MNU017', 2, 34000),
('DTL068', 'PSN034', 'MNU018', 1, 18000),
('DTL069', 'PSN035', 'MNU019', 3, 57000),
('DTL070', 'PSN035', 'MNU020', 1, 20000)
-- 490 more rows
;