-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: tugas_wbd1
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__session_handler`
--

DROP TABLE IF EXISTS `__session_handler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__session_handler` (
  `session_id` varchar(32) NOT NULL,
  `user_id` int(5) DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `access` int(10) unsigned NOT NULL,
  `session_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__session_handler`
--

LOCK TABLES `__session_handler` WRITE;
/*!40000 ALTER TABLE `__session_handler` DISABLE KEYS */;
INSERT INTO `__session_handler` VALUES ('0mrebr09r6oea814s22dpr1me5',0,'2013-10-28 06:18:45',1382915925,''),('3vjj6jsj70faf8b2ign1bcmrc5',0,'2013-10-28 08:11:53',1382922713,'shopping_bag|s:92:\"{\"data\":[{\"id_barang\":\"1\",\"qty\":3},{\"id_barang\":\"7\",\"qty\":\"2\"},{\"id_barang\":\"8\",\"qty\":\"2\"}]}\";'),('8qede0fk1v2jn0rh9hr08vlhs2',0,'2013-10-28 06:23:00',1382916180,'shopping_bag|s:38:\"{\"data\":[{\"id_barang\":\"1\",\"qty\":\"1\"}]}\";'),('idjt0ouf7j98mm1cqc6ppfvou0',0,'2013-10-28 06:13:10',1382915590,'shopping_bag|s:38:\"{\"data\":[{\"id_barang\":\"1\",\"qty\":\"1\"}]}\";'),('jbf8cm9f515qrdebhp7oucscc7',0,'2013-10-28 06:23:20',1382916200,''),('vbikuv6ltu2b2gl458jt8n1d06',0,'2013-10-28 06:21:57',1382916117,'');
/*!40000 ALTER TABLE `__session_handler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__user_login`
--

DROP TABLE IF EXISTS `__user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__user_login` (
  `user_id` int(5) NOT NULL,
  `nama_pengguna` varchar(30) NOT NULL,
  `kata_sandi` varchar(150) NOT NULL,
  `ic` char(2) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `__user_login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pelanggan_id` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__user_login`
--

LOCK TABLES `__user_login` WRITE;
/*!40000 ALTER TABLE `__user_login` DISABLE KEYS */;
INSERT INTO `__user_login` VALUES (1,'setyolegowo','fe5916e1ab60e1c7b56a726925cf06f6ff3ae64f:46cef8674d46c9f93034a569477cf19a4cb22499c2c432c86ec500981b5e395c','av'),(2,'dummysatu','c570f15a705b79d2703dbd7927feadb0b63387a2:02ef4a160fee0ae85fdbd0c3ca05d7280a327aed7e706a47e69318f6474ebfe4','av'),(3,'dummydua','c570f15a705b79d2703dbd7927feadb0b63387a2:02ef4a160fee0ae85fdbd0c3ca05d7280a327aed7e706a47e69318f6474ebfe4','av');
/*!40000 ALTER TABLE `__user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barang_data`
--

DROP TABLE IF EXISTS `barang_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang_data` (
  `barang_id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kategori_id` int(3) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `image_url` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  PRIMARY KEY (`barang_id`),
  KEY `kategori_id` (`kategori_id`),
  CONSTRAINT `barang_data_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `barang_kategori` (`kategori_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_data`
--

LOCK TABLES `barang_data` WRITE;
/*!40000 ALTER TABLE `barang_data` DISABLE KEYS */;
INSERT INTO `barang_data` VALUES (1,'Teh Susu',1,5500.00,NULL,'Ini teh susu'),(2,'Air Refill',1,500.00,NULL,'Air segar tanpa warna'),(3,'Bolpoin',2,2500.00,NULL,'Bolpen hitam'),(4,'Headset Putih',3,56500.00,NULL,'Headset kecil suara joss'),(5,'Kabel LAN',3,1500.00,NULL,'Kabel yang biasa digunakan untuk jaringan komputer'),(6,'Daging Sapi',1,70000.00,NULL,'Daging sapi emang enak'),(7,'Ikan Lele Segar',1,12000.00,NULL,'Ikan lele emang murah'),(8,'Penghapus Hitam',2,5000.00,NULL,'Penghapus hitam biasanya lebih bersih'),(9,'Samsung Galaxy Wow',3,7750000.00,NULL,'Handphone Low End harga High End');
/*!40000 ALTER TABLE `barang_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barang_kategori`
--

DROP TABLE IF EXISTS `barang_kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang_kategori` (
  `kategori_id` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_kategori`
--

LOCK TABLES `barang_kategori` WRITE;
/*!40000 ALTER TABLE `barang_kategori` DISABLE KEYS */;
INSERT INTO `barang_kategori` VALUES (1,'Makanan/Minuman'),(2,'Alat Tulis'),(3,'Elektronik');
/*!40000 ALTER TABLE `barang_kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barang_stok`
--

DROP TABLE IF EXISTS `barang_stok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang_stok` (
  `barang_id` int(5) NOT NULL,
  `stok` int(5) NOT NULL,
  `satuan` int(2) NOT NULL,
  PRIMARY KEY (`barang_id`),
  KEY `satuan` (`satuan`),
  CONSTRAINT `barang_stok_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang_data` (`barang_id`) ON UPDATE CASCADE,
  CONSTRAINT `barang_stok_ibfk_2` FOREIGN KEY (`satuan`) REFERENCES `ref_satuan_barang` (`id_satuan`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_stok`
--

LOCK TABLES `barang_stok` WRITE;
/*!40000 ALTER TABLE `barang_stok` DISABLE KEYS */;
INSERT INTO `barang_stok` VALUES (1,20,1),(2,100,1),(3,50,2),(4,3,1),(5,100,4),(6,120,3),(7,10,3),(8,25,1),(9,5,1);
/*!40000 ALTER TABLE `barang_stok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan_addr`
--

DROP TABLE IF EXISTS `pelanggan_addr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan_addr` (
  `user_id` int(5) NOT NULL,
  `jalan` varchar(100) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `kodepos` int(5) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `pelanggan_addr_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pelanggan_id` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan_addr`
--

LOCK TABLES `pelanggan_addr` WRITE;
/*!40000 ALTER TABLE `pelanggan_addr` DISABLE KEYS */;
INSERT INTO `pelanggan_addr` VALUES (1,'Jalan','Jawa','Bandung',40132,'085210637097');
/*!40000 ALTER TABLE `pelanggan_addr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan_card`
--

DROP TABLE IF EXISTS `pelanggan_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan_card` (
  `user_id` int(5) NOT NULL,
  `card_number` varchar(22) NOT NULL,
  `card_name` varchar(50) NOT NULL,
  `card_expiry` date NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `pelanggan_card_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pelanggan_id` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan_card`
--

LOCK TABLES `pelanggan_card` WRITE;
/*!40000 ALTER TABLE `pelanggan_card` DISABLE KEYS */;
INSERT INTO `pelanggan_card` VALUES (1,'4539-3937-3970-1127','Setyo Legowo','2014-01-01');
/*!40000 ALTER TABLE `pelanggan_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan_id`
--

DROP TABLE IF EXISTS `pelanggan_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan_id` (
  `user_id` int(5) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan_id`
--

LOCK TABLES `pelanggan_id` WRITE;
/*!40000 ALTER TABLE `pelanggan_id` DISABLE KEYS */;
INSERT INTO `pelanggan_id` VALUES (1,'Setyo Legowo','email@email.com'),(2,'Dummy Satu','dummy1@mail.com'),(3,'Setyo Dummy','setyo@dummymail.com');
/*!40000 ALTER TABLE `pelanggan_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_satuan_barang`
--

DROP TABLE IF EXISTS `ref_satuan_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_satuan_barang` (
  `id_satuan` int(2) NOT NULL,
  `nama_satuan` varchar(10) NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_satuan_barang`
--

LOCK TABLES `ref_satuan_barang` WRITE;
/*!40000 ALTER TABLE `ref_satuan_barang` DISABLE KEYS */;
INSERT INTO `ref_satuan_barang` VALUES (1,'Buah'),(2,'Liter'),(3,'Kilogram'),(4,'Meter');
/*!40000 ALTER TABLE `ref_satuan_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `transaksi_id` int(8) NOT NULL,
  `barang_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `qty` float(3,3) NOT NULL,
  `request` varchar(100) NOT NULL,
  PRIMARY KEY (`transaksi_id`),
  UNIQUE KEY `transaksi_id` (`transaksi_id`,`barang_id`,`user_id`),
  KEY `barang_id` (`barang_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang_data` (`barang_id`) ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `pelanggan_id` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-28  8:15:40
