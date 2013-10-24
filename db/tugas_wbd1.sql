-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 24, 2013 at 05:27 PM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ruserba`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_data`
--

CREATE TABLE IF NOT EXISTS `barang_data` (
  `barang_id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kategori_id` int(3) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `image_url` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  PRIMARY KEY (`barang_id`),
  KEY `kategori_id` (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_data`
--

INSERT INTO `barang_data` (`barang_id`, `nama`, `kategori_id`, `harga`, `image_url`, `deskripsi`) VALUES
(1, 'Teh Susu', 1, '5500.00', NULL, 'Ini teh susu'),
(2, 'Air Refill', 1, '500.00', NULL, 'Air segar tanpa warna'),
(3, 'Bolpoin', 2, '2500.00', NULL, 'Bolpen hitam'),
(4, 'Headset Putih', 3, '56500.00', NULL, 'Headset kecil suara joss'),
(5, 'Kabel LAN', 3, '1500.00', NULL, 'Kabel yang biasa digunakan untuk jaringan komputer'),
(6, 'Daging Sapi', 1, '70000.00', NULL, 'Daging sapi emang enak'),
(7, 'Ikan Lele Segar', 1, '12000.00', NULL, 'Ikan lele emang murah'),
(8, 'Penghapus Hitam', 2, '5000.00', NULL, 'Penghapus hitam biasanya lebih bersih'),
(9, 'Samsung Galaxy Wow', 3, '7750000.00', NULL, 'Handphone Low End harga High End');

-- --------------------------------------------------------

--
-- Table structure for table `barang_kategori`
--

CREATE TABLE IF NOT EXISTS `barang_kategori` (
  `kategori_id` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_kategori`
--

INSERT INTO `barang_kategori` (`kategori_id`, `nama`) VALUES
(1, 'Makanan/Minuman'),
(2, 'Alat Tulis'),
(3, 'Elektronik');

-- --------------------------------------------------------

--
-- Table structure for table `barang_stok`
--

CREATE TABLE IF NOT EXISTS `barang_stok` (
  `barang_id` int(5) NOT NULL,
  `stok` int(5) NOT NULL,
  `satuan` int(2) NOT NULL,
  PRIMARY KEY (`barang_id`),
  KEY `satuan` (`satuan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_stok`
--

INSERT INTO `barang_stok` (`barang_id`, `stok`, `satuan`) VALUES
(1, 20, 1),
(2, 100, 1),
(3, 50, 2),
(4, 3, 1),
(5, 100, 4),
(6, 120, 3),
(7, 10, 3),
(8, 25, 1),
(9, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan_addr`
--

CREATE TABLE IF NOT EXISTS `pelanggan_addr` (
  `user_id` int(5) NOT NULL,
  `jalan` varchar(100) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `kodepos` int(5) NOT NULL,
  `user_phone` int(15) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan_addr`
--


-- --------------------------------------------------------

--
-- Table structure for table `pelanggan_card`
--

CREATE TABLE IF NOT EXISTS `pelanggan_card` (
  `user_id` int(5) NOT NULL,
  `card_number` int(16) NOT NULL,
  `card_name` varchar(50) NOT NULL,
  `card_expiry` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan_card`
--


-- --------------------------------------------------------

--
-- Table structure for table `pelanggan_id`
--

CREATE TABLE IF NOT EXISTS `pelanggan_id` (
  `user_id` int(5) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan_id`
--


-- --------------------------------------------------------

--
-- Table structure for table `ref_satuan_barang`
--

CREATE TABLE IF NOT EXISTS `ref_satuan_barang` (
  `id_satuan` int(2) NOT NULL,
  `nama_satuan` varchar(10) NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_satuan_barang`
--

INSERT INTO `ref_satuan_barang` (`id_satuan`, `nama_satuan`) VALUES
(1, 'Buah'),
(2, 'Liter'),
(3, 'Kilogram'),
(4, 'Meter');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `transaksi_id` int(8) NOT NULL,
  `barang_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `qty` float(3,3) NOT NULL,
  `request` varchar(100) NOT NULL,
  PRIMARY KEY (`transaksi_id`),
  UNIQUE KEY `transaksi_id` (`transaksi_id`,`barang_id`,`user_id`),
  KEY `barang_id` (`barang_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--


-- --------------------------------------------------------

--
-- Table structure for table `__session_handler`
--

CREATE TABLE IF NOT EXISTS `__session_handler` (
  `session_id` varchar(32) NOT NULL,
  `user_id` int(5) DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `access` int(10) unsigned NOT NULL,
  `session_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `__session_handler`
--

INSERT INTO `__session_handler` (`session_id`, `user_id`, `date_time`, `access`, `session_data`) VALUES
('16ptijgcioarj3b0vsoud0u6u4', 0, '2013-10-23 15:32:20', 1382517140, ''),
('739cs38ccu4v06d3rc0pqs5151', 0, '2013-10-23 14:29:40', 1382513380, ''),
('8jk9eauonu24kknpq5n2m836b4', 0, '2013-10-23 23:48:42', 1382546922, ''),
('a9hdna3vt6o4ree9eno91subp4', 0, '2013-10-20 06:44:08', 1382226248, ''),
('dbbt1olrcso00o4mfrfg4vpef4', 0, '2013-10-23 19:12:02', 1382530322, ''),
('giul0fnvki61mbq2peec4muvm4', 0, '2013-10-24 13:06:03', 1382594763, ''),
('l1ikdssdlbcp5qit8ht47td0o2', 0, '2013-10-23 21:30:55', 1382538655, ''),
('n4otk61pvrci16cccqt981vs85', 0, '2013-10-23 13:33:29', 1382510009, '');

-- --------------------------------------------------------

--
-- Table structure for table `__user_login`
--

CREATE TABLE IF NOT EXISTS `__user_login` (
  `user_id` int(5) NOT NULL,
  `nama_pengguna` varchar(30) NOT NULL,
  `kata_sandi` varchar(150) NOT NULL,
  `ic` char(2) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `__user_login`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_data`
--
ALTER TABLE `barang_data`
  ADD CONSTRAINT `barang_data_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `barang_kategori` (`kategori_id`) ON UPDATE CASCADE;

--
-- Constraints for table `barang_stok`
--
ALTER TABLE `barang_stok`
  ADD CONSTRAINT `barang_stok_ibfk_2` FOREIGN KEY (`satuan`) REFERENCES `ref_satuan_barang` (`id_satuan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_stok_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang_data` (`barang_id`) ON UPDATE CASCADE;

--
-- Constraints for table `pelanggan_addr`
--
ALTER TABLE `pelanggan_addr`
  ADD CONSTRAINT `pelanggan_addr_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pelanggan_id` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `pelanggan_card`
--
ALTER TABLE `pelanggan_card`
  ADD CONSTRAINT `pelanggan_card_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pelanggan_id` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `pelanggan_id` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang_data` (`barang_id`) ON UPDATE CASCADE;

--
-- Constraints for table `__user_login`
--
ALTER TABLE `__user_login`
  ADD CONSTRAINT `__user_login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pelanggan_id` (`user_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
