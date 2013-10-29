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
INSERT INTO `__session_handler` VALUES ('dvfmu1khovh5da85us1jf7gn80',0,'2013-10-29 19:42:28',1383050548,''),('gvlbr8h8perdv5e73gq89ts7l7',0,'2013-10-29 19:38:35',1383050315,'info|a:2:{i:4;b:0;i:2;b:0;}');
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
INSERT INTO `__user_login` VALUES (1,'setyolegowo','24a03362d59fe2daf54ec4413c7d290b9b931a55:ab0040fcd28e4364bc2c29f9306ae36e546acd6925358fb400ee3fac7d690d14','hr'),(2,'andra','8f9ba180f0333a994fc9cebf485ee06edae7125f:d6ec8dccac1d69a27a5fd36b523762d3b14d04a35ceb10c5776973a3f5495db1','gv'),(3,'qwerty','8f9ba180f0333a994fc9cebf485ee06edae7125f:d6ec8dccac1d69a27a5fd36b523762d3b14d04a35ceb10c5776973a3f5495db1','gv'),(4,'asdfg','8f9ba180f0333a994fc9cebf485ee06edae7125f:d6ec8dccac1d69a27a5fd36b523762d3b14d04a35ceb10c5776973a3f5495db1','gv'),(5,'vayans','8f9ba180f0333a994fc9cebf485ee06edae7125f:d6ec8dccac1d69a27a5fd36b523762d3b14d04a35ceb10c5776973a3f5495db1','gv');
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
INSERT INTO `barang_data` VALUES (1,'Teh Susu',1,5500.00,'assets/image/teh_susu.png','Teh manis dikombinasikan dengan campuran dari susu ibu, susu sapi, susu ambing, untuk memberikan cita rasa yang khas. Baik untuk Anda yang ingin mencoba untuk membesarkan \"diri\" Anda'),(2,'Air Refill',1,500.00,'assets/image/water.png','Air bening yang diciduk dari sumber air mata gunung kembar yang memastikan kenikmatan rasa aslinya.'),(3,'Ballpoint',2,2500.00,'assets/image/ballpoint.png','Pulpen standar warna hitam dengan ketebalan tinta 2mm dan dapat digunakan untuk menulis \"saya tidak akan terlambat lagi\" sebanyak 3000 kali tanpa habis.'),(4,'Headset Tenor 330HR',3,565000.00,'assets/image/headset.png','Headset full size dengan warna putih, dengan jangkauan Frekuensi dari 2 Hz hingga 19 Mhz untuk memberikan kualitas suara yang menggelegar.'),(5,'Kabel LAN',3,1500.00,'assets/image/cable.png','Kabel yang biasa digunakan untuk jaringan komputer, bisa digunakan untuk membentuk jaringan bawah laut, untuk jaringan dua komputer, hingga hiasan perabotan rumah anda.'),(6,'Daging Sapi',1,70000.00,'assets/image/beef.png','Daging sapi australia yang dijamin tidak terjangkit anthrax dan aman dari penyakit AIDS dan sudah disuntikkan air untuk menjaga konsistensi dagingnya.'),(7,'Ikan Lele Segar',1,12000.00,'assets/image/lele.png','Ikan lele budidaya sendiri dengan menggunakan bibit unggul yang dipilih dari lele lele yang memiliki kumis paling panjang.'),(8,'Penghapus Hitam BOXY BBXXYY',2,5000.00,'assets/image/eraser.png','Penghapus hitam biasanya lebih bersih, untukmengapus segala noda, baik itu pensil, pulpen, spidol, jerawat, hingga luka hati paling dalam.'),(9,'SamS Galaxy Wow',3,7750000.00,'assets/image/samsungwow.png','Handphone 9\' dengan ketebalan 2mm untuk memberikan Anda ketidaknyamanan dalam pengoperasiannya. Handphone ini dibuat untuk mendorong setiap individu untuk mengurangi penggunaan handphone.'),(10,'Kertas lembar',2,100.00,'assets/image/paper.png','Kertas HVS 80gr standar, baik untuk diprint, ditulis, dilipat, digunting, dibungkus, dirobek, dibakar, hingga diinjak.'),(11,'Penggaris',2,2500.00,'assets/image/ruler.png','Penggaris plastik 30 cm, dapat dilipat sehingga ukurannya dapat mengecil hingga berukuran 3 cm. Baik untuk Anda yang memrioritaskan  kemobilitasan dibandingkan ketelitian.'),(12,'Mouse Logitech G7',3,320000.00,'assets/image/mouse.png','Mouse wireless dengan akurasi 200 DPI. Bonus mouse pad Logitech MW120'),(13,'Printer Kodak ASP 3.2 All-in-One Printer',3,1120000.00,'assets/image/printer.png','Printer all-in-one dengan fasilitas print, copy dan scan.'),(14,'Karpet Turki 2x2m',4,1200000.00,'assets/image/1.jpg','Karpet asli turki, 2x2 meter'),(15,'Gitar Yamaha GX450',5,940000.00,'assets/image/2.jpg','Gitar akustik Yamaha, made in Indonesia'),(16,'Kotak Pensil Vay',2,5800.00,'assets/image/3.jpg','Kotak pensil berbahan dasar bulu jenggot yang sudah dikeringkan, sehingga baik untuk digunakan pada kegiatan outdoor.'),(17,'Oki Drink Juice',1,1500.00,'assets/image/4.jpg','Air rasa jeruk dengan nata de coco untuk memenuhi dahaga Anda'),(18,'Kursi Kayu ',4,130000.00,'assets/image/5.jpg','Kursi terbuat dari kayu jati, yang sudah dijamin kekuatannya. GARANSI 10 tahun'),(19,'Harmonika Yamaha YY3100',5,200000.00,'assets/image/6.jpg','Harmonika dengan range 3 oktaf, dan dengan adjustable pitch. BONUS tas Yamaha'),(20,'Laptop Asus NCUS300',3,18120000.00,'assets/image/7.jpg','Laptop 14\' dengan prosesor 4Ghz dan memori DDR5 32GB'),(21,'Okky Choki',1,1000.00,'assets/image/8.jpg','Alternatif dari Choki-choki, biasa dikenal dengan julukan \"coklat, panjang dan asik\"'),(22,'Susu Kental Manis Flag',1,7000.00,'assets/image/9.jpg','Cairan kental berwarna putih, dengan rasa manis lengket-lengket. Baik untuk dikonsumsi saat pagi, siang atau malam, sesuai keinginan anda'),(23,'Radio FM/AM Sonny SL135',3,230000.00,'assets/image/10.png','Radio FM/AM dengan Fixed Channel dan dilengkapi dengan slot disket untuk menjalankan musik dari file eksternal. '),(24,'Piano Kawaii KW20',5,70000000.00,'assets/image/11.jpg','Grand Piano yang dilengkapi dengan fitur auto-play, dimana Piano ini dapat diprogram dengan bahasa F# sehingga dapat memainkan musik secara sendirinya. Naik untuk Anda yang baru belajar musik'),(25,'Flash Disk UDISK 8GB',3,100000.00,'assets/image/12.jpg','Flash disk tipis, laris tapi miris. Desainnya bagius, dilengkapi dengan casing yang luar biasa, namun dilengkapi dengan fitur auto-corrupt untuk mencegah pencurian data'),(26,'Lemari Olympico JEL3X',4,1100000.00,'assets/image/13.jpg','Lemari kayu standar,4 pintu, dibagi menjadi 4 segmen tiap pintunya, dan memiliki 4 laci tiap segmennya. GARANSI 1 tahun kerusakan laci'),(27,'Kacamata Hitam DBR00',3,20000.00,'assets/image/14.jpg','Kacamata yang sedang menjadi trend dikalangan mas mas jomblo di bandung. Memungkinkan and untuk mencari-cari \"target\" tanpa diketahui oleh \"target\" itu sendiri. Dilengkapi dengan fitur \"see me\" yang membuat Anda segera dilihat oleh orang disekitar Anda.'),(28,'Roti Tawar Sarah Roti',1,8500.00,'assets/image/15.jpg','Roti tawar gandum, tanpa tambahan pengawet atau perasa. Nikmatilah rasa roti terbaik dari Roti Tawar sarah roti.'),(29,'Kripik Sale',1,12500.00,'assets/image/16.jpg','Kripik sale asli dari Solo. Rasa manis gula, 350 gr.'),(30,'Kue Tart 30cm',1,200000.00,'assets/image/17.jpg','Kue tart coklat, dengan taburan saus vanilla dan stroberi. Ukuran diameter 30 cm.'),(31,'Teh Bulat',1,4000.00,'assets/image/18.jpg','Teh manis, diambil dari daun teh muda paling pucuk, memberikan rasa teh yang sesungguhnya.'),(32,'Sosis Sapi Sussy',1,6000.00,'assets/image/19.jpg','Sosis sapi dengan rasa daging asap, dan didalamnya diberi lapisan keju. 6 buah per bungkus'),(33,'Rautan Roto',2,500.00,'assets/image/20.jpg','Rautan standar, hanya dapat meraut pensil 2B dan 3B saja. Tidak dapat dikunakan untuk meraut pensil mekanik'),(34,'Pensil Mekanik Poko',2,4500.00,'assets/image/21.jpg','Pensil mekanik dengan isi pensil 2B atau HB. Dapat menampung maksimal 30 isi pensil.'),(35,'Spidol Snowboy',2,35000.00,'assets/image/22.jpg','Satu set spidol terdiri dari 30 jenis warna sesuai pilihan dari berbagai ketebalan dan bentuk'),(36,'Pensil HB',2,2000.00,'assets/image/23.jpg','Pensil kayu, dapat diraut dengan rautan ROTO baik untuk melakukan sketch gambar'),(37,'Pensil 2B',2,2000.00,'assets/image/24.jpg','Pensil 2B, computer scenner verified, verified for SNMPTN'),(38,'Tablet Epad 10\'',3,8000000.00,'assets/image/25.jpg','Tablet 10 inchi dengan prosesor Octa core, dengan 3GB memori dan 32 GB memori internal. Menggunakan sistem operasi aOS'),(39,'Power Bang MASS150',3,240000.00,'assets/image/26.jpg','Kapasitas 15000 mAH, dilengkapi dengan konektor universal yang dapat digunakan di sebagian besar device.'),(40,'LED LGi 40\'',3,40000000.00,'assets/image/27.jpg','TV dengan layar LED berukuran 40 inci, dilengkapi dengan fitur SmartTV dan juga difasilitasi dengan port HDMI, VGA, DVI dan slot USB dan SD Card untuk memudahkan penggunaan'),(41,'Clarinet Namaha',5,1275000.00,'assets/image/28.jpg','Clarinet standar dengan 20 tuts dan dengan peredam suara.'),(42,'Kecapi Senar Putus',5,1970000.00,'assets/image/29.jpg','Kecapi yang dibuat oleh pengrajin kenamaan asal Kudus dengan senar bening bak air sungai.'),(43,'Ukulele Dumbo',5,2200000.00,'assets/image/30.jpg','Ukulele yang terbuat dari lele legendaris dari sungai Kumis Nasir. Siapapun yang mendengar suara indah ukulele ini akan diberkati dengan ribuan   kasih sayang.'),(44,'Drum Badumtess 3X5X',5,4670000.00,'assets/image/31.jpg','Drum yang hanya bisa dimainkan dengan derajat kebinalan lebih dari 43 derajat Fahrenheit.'),(45,'Meja Bundar KMB',4,1100000.00,'assets/image/32.jpg','Meja berdiameter 1 meter, berbentuk oval menyerupai dengan meja yang digunakan saat konferensi meja bundar, dibuat dari kayu mahogani'),(46,'Keyboard Quicksilver',3,205000.00,'assets/image/33.jpg','Keyboard US dengan tambahan 5 tombol yang dapat dikustomisasi sesuai kebutuhan. Tidak termasuk mouse. Menggunakan interface USB untuk menghubungkan dengan komputer.'),(47,'Stabillo Kuning',2,5500.00,'assets/image/34.jpg','Penanda marker berwarna kuning untuk digunakan menandari poin poin penting pada sebuah teks.'),(48,'Lemari Serbaguna SB',4,750000.00,'assets/image/35.jpg','Lemari kayu yang ditujukan sebagai tempat menyimpan berbagai benda. Made in Indonesia'),(49,'Seprei Sepray',4,300000.00,'assets/image/36.jpg','Sprei premium dengan kelembutan maksimal untuk kenyamanan tidur anda yang optimum. Tidak termasuk bed cover'),(50,'Jangka JK',2,2500.00,'assets/image/37.png','Jangka untuk membuat gambar lingkaran sederhana. Maksimal ukuran lingkaran 10 cm jari-jari. Tersedia isi pensilnya');
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
  `kategori_nama` varchar(50) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_kategori`
--

LOCK TABLES `barang_kategori` WRITE;
/*!40000 ALTER TABLE `barang_kategori` DISABLE KEYS */;
INSERT INTO `barang_kategori` VALUES (1,'Makanan/Minuman'),(2,'Alat Tulis'),(3,'Elektronik'),(4,'Perabotan'),(5,'Alat Musik');
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
INSERT INTO `barang_stok` VALUES (1,15,1),(2,74,2),(3,49,1),(4,3,1),(5,100,4),(6,0,3),(7,10,3),(8,25,1),(9,4,1),(10,4980,1),(11,21,1),(12,15,1),(13,6,1),(14,1,1),(15,3,1),(47,20,1),(49,5,1);
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
INSERT INTO `pelanggan_card` VALUES (2,'0028-2345-6789-9888','Renusa Andra','2045-02-01'),(3,'2345-6789-9879-098','Dudu asa','2050-01-01'),(4,'2345-7755-9876-9864','Sayas asd','2050-01-01'),(5,'3459-8656-9754-8754','Ans as','2050-01-01');
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
INSERT INTO `pelanggan_id` VALUES (1,'Setyo Legowo','email@email.com'),(2,'Renusa Andra','andra@gmail.com'),(3,'Renusa and','aaa@x.ci'),(4,'Adad asd','e@gm.sdp'),(5,'Vans asd','c@g.xo');
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
  `qty` decimal(5,2) NOT NULL,
  PRIMARY KEY (`transaksi_id`),
  UNIQUE KEY `transaksi_id` (`transaksi_id`,`barang_id`),
  KEY `barang_id` (`barang_id`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang_data` (`barang_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES (1,2,3.00),(2,9,1.00),(3,13,1.00),(4,11,1.00),(5,14,1.00),(6,6,2.00),(7,6,2.00),(8,6,2.00),(9,6,2.00),(10,6,2.00),(11,6,2.00),(12,6,2.00),(13,6,2.00),(14,6,2.00),(15,6,2.00),(16,6,2.00),(17,6,2.00),(18,6,2.00),(19,6,2.00),(20,6,2.00),(21,6,2.00),(22,6,2.00),(23,6,2.00),(24,6,2.00),(25,6,2.00),(26,6,2.00),(27,6,2.00),(28,6,2.00),(29,6,2.00),(30,6,2.00),(31,6,2.00),(32,6,2.00),(33,6,2.00),(34,6,2.00),(35,6,2.00),(36,6,2.00),(37,6,2.00),(38,6,2.00),(39,6,2.00),(40,6,2.00),(41,6,2.00),(42,6,2.00),(43,6,2.00),(44,6,2.00),(45,6,2.00),(46,6,2.00),(47,6,2.00),(48,6,2.00),(49,6,2.00),(50,6,2.00),(51,6,2.00),(52,6,2.00),(53,6,2.00),(54,6,2.00),(55,6,2.00),(56,6,2.00),(57,6,2.00),(58,6,2.00),(59,6,2.00),(60,6,2.00),(61,6,2.00),(62,6,2.00),(63,6,2.00),(64,6,2.00),(65,6,2.00),(66,2,1.00),(67,10,20.00),(68,2,20.00),(69,2,2.00),(70,3,1.00),(71,1,1.00),(72,1,3.00),(73,1,1.00);
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

-- Dump completed on 2013-10-29 19:43:29
