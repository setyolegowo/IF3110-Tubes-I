-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2013 at 01:06 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tugas_wbd1`
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
(1, 'Teh Susu', 1, '5500.00', 'assets/image/teh_susu.png', 'Teh manis dikombinasikan dengan campuran dari susu ibu, susu sapi, susu ambing, untuk memberikan cita rasa yang khas. Baik untuk Anda yang ingin mencoba untuk membesarkan "diri" Anda'),
(2, 'Air Refill', 1, '500.00', 'assets/image/water.png', 'Air bening yang diciduk dari sumber air mata gunung kembar yang memastikan kenikmatan rasa aslinya.'),
(3, 'Ballpoint', 2, '2500.00', 'assets/image/ballpoint.png', 'Pulpen standar warna hitam dengan ketebalan tinta 2mm dan dapat digunakan untuk menulis "saya tidak akan terlambat lagi" sebanyak 3000 kali tanpa habis.'),
(4, 'Headset Tenor 330HR', 3, '565000.00', 'assets/image/headset.png', 'Headset full size dengan warna putih, dengan jangkauan Frekuensi dari 2 Hz hingga 19 Mhz untuk memberikan kualitas suara yang menggelegar.'),
(5, 'Kabel LAN', 3, '1500.00', 'assets/image/cable.png', 'Kabel yang biasa digunakan untuk jaringan komputer, bisa digunakan untuk membentuk jaringan bawah laut, untuk jaringan dua komputer, hingga hiasan perabotan rumah anda.'),
(6, 'Daging Sapi', 1, '70000.00', 'assets/image/beef.png', 'Daging sapi australia yang dijamin tidak terjangkit anthrax dan aman dari penyakit AIDS dan sudah disuntikkan air untuk menjaga konsistensi dagingnya.'),
(7, 'Ikan Lele Segar', 1, '12000.00', 'assets/image/lele.png', 'Ikan lele budidaya sendiri dengan menggunakan bibit unggul yang dipilih dari lele lele yang memiliki kumis paling panjang.'),
(8, 'Penghapus Hitam BOXY BBXXYY', 2, '5000.00', 'assets/image/eraser.png', 'Penghapus hitam biasanya lebih bersih, untukmengapus segala noda, baik itu pensil, pulpen, spidol, jerawat, hingga luka hati paling dalam.'),
(9, 'SamS Galaxy Wow', 3, '7750000.00', 'assets/image/samsungwow.png', 'Handphone 9'' dengan ketebalan 2mm untuk memberikan Anda ketidaknyamanan dalam pengoperasiannya. Handphone ini dibuat untuk mendorong setiap individu untuk mengurangi penggunaan handphone.'),
(10, 'Kertas lembar', 2, '100.00', 'assets/image/paper.png', 'Kertas HVS 80gr standar, baik untuk diprint, ditulis, dilipat, digunting, dibungkus, dirobek, dibakar, hingga diinjak.'),
(11, 'Penggaris', 2, '2500.00', 'assets/image/ruler.png', 'Penggaris plastik 30 cm, dapat dilipat sehingga ukurannya dapat mengecil hingga berukuran 3 cm. Baik untuk Anda yang memrioritaskan  kemobilitasan dibandingkan ketelitian.'),
(12, 'Mouse Logitech G7', 3, '320000.00', 'assets/image/mouse.png', 'Mouse wireless dengan akurasi 200 DPI. Bonus mouse pad Logitech MW120'),
(13, 'Printer Kodak ASP 3.2 All-in-One Printer', 3, '1120000.00', 'assets/image/printer.png', 'Printer all-in-one dengan fasilitas print, copy dan scan.'),
(14, 'Karpet Turki 2x2m', 4, '1200000.00', NULL, 'Karpet asli turki, 2x2 meter'),
(15, 'Gitar Yamaha GX450', 5, '940000.00', NULL, 'Gitar akustik Yamaha, made in Indonesia'),
(16, 'Kotak Pensil Vay', 2, '5800.00', NULL, 'Kotak pensil berbahan dasar bulu jenggot yang sudah dikeringkan, sehingga baik untuk digunakan pada kegiatan outdoor.'),
(17, 'Oki Drink Juice', 1, '1500.00', NULL, 'Air rasa jeruk dengan nata de coco untuk memenuhi dahaga Anda'),
(18, 'Kursi Kayu ', 4, '130000.00', NULL, 'Kursi terbuat dari kayu jati, yang sudah dijamin kekuatannya. GARANSI 10 tahun'),
(19, 'Harmonika Yamaha YY3100', 5, '200000.00', NULL, 'Harmonika dengan range 3 oktaf, dan dengan adjustable pitch. BONUS tas Yamaha'),
(20, 'Laptop Asus NCUS300', 3, '18120000.00', NULL, 'Laptop 14'' dengan prosesor 4Ghz dan memori DDR5 32GB'),
(21, 'Okky Choki', 1, '1000.00', NULL, 'Alternatif dari Choki-choki, biasa dikenal dengan julukan "coklat, panjang dan asik"'),
(22, 'Susu Kental Manis Flag', 1, '7000.00', NULL, 'Cairan kental berwarna putih, dengan rasa manis lengket-lengket. Baik untuk dikonsumsi saat pagi, siang atau malam, sesuai keinginan anda'),
(23, 'Radio FM/AM Sonny SL135', 3, '230000.00', NULL, 'Radio FM/AM dengan Fixed Channel dan dilengkapi dengan slot disket untuk menjalankan musik dari file eksternal. '),
(24, 'Piano Kawaii KW20', 5, '70000000.00', NULL, 'Grand Piano yang dilengkapi dengan fitur auto-play, dimana Piano ini dapat diprogram dengan bahasa F# sehingga dapat memainkan musik secara sendirinya. Naik untuk Anda yang baru belajar musik'),
(25, 'Flash Disk UDISK 8GB', 3, '100000.00', NULL, 'Flash disk tipis, laris tapi miris. Desainnya bagius, dilengkapi dengan casing yang luar biasa, namun dilengkapi dengan fitur auto-corrupt untuk mencegah pencurian data'),
(26, 'Lemari Olympico JEL3X', 4, '1100000.00', NULL, 'Lemari kayu standar,4 pintu, dibagi menjadi 4 segmen tiap pintunya, dan memiliki 4 laci tiap segmennya. GARANSI 1 tahun kerusakan laci'),
(27, 'Kacamata Hitam DBR00', 3, '20000.00', NULL, 'Kacamata yang sedang menjadi trend dikalangan mas mas jomblo di bandung. Memungkinkan and untuk mencari-cari "target" tanpa diketahui oleh "target" itu sendiri. Dilengkapi dengan fitur "see me" yang membuat Anda segera dilihat oleh orang disekitar Anda.'),
(28, 'Roti Tawar Sarah Roti', 1, '8500.00', NULL, 'Roti tawar gandum, tanpa tambahan pengawet atau perasa. Nikmatilah rasa roti terbaik dari Roti Tawar sarah roti.'),
(29, 'Kripik Sale', 1, '12500.00', NULL, 'Kripik sale asli dari Solo. Rasa manis gula, 350 gr.'),
(30, 'Kue Tart 30cm', 1, '200000.00', NULL, 'Kue tart coklat, dengan taburan saus vanilla dan stroberi. Ukuran diameter 30 cm.'),
(31, 'Teh Bulat', 1, '4000.00', NULL, 'Teh manis, diambil dari daun teh muda paling pucuk, memberikan rasa teh yang sesungguhnya.'),
(32, 'Sosis Sapi Sussy', 1, '6000.00', NULL, 'Sosis sapi dengan rasa daging asap, dan didalamnya diberi lapisan keju. 6 buah per bungkus'),
(33, 'Rautan Roto', 2, '500.00', NULL, 'Rautan standar, hanya dapat meraut pensil 2B dan 3B saja. Tidak dapat dikunakan untuk meraut pensil mekanik'),
(34, 'Pensil Mekanik Poko', 2, '4500.00', NULL, 'Pensil mekanik dengan isi pensil 2B atau HB. Dapat menampung maksimal 30 isi pensil.'),
(35, 'Spidol Snowboy', 2, '35000.00', NULL, 'Satu set spidol terdiri dari 30 jenis warna sesuai pilihan dari berbagai ketebalan dan bentuk'),
(36, 'Pensil HB', 2, '2000.00', NULL, 'Pensil kayu, dapat diraut dengan rautan ROTO baik untuk melakukan sketch gambar'),
(37, 'Pensil 2B', 2, '2000.00', NULL, 'Pensil 2B, computer scenner verified, verified for SNMPTN'),
(38, 'Tablet Epad 10''', 3, '8000000.00', NULL, 'Tablet 10 inchi dengan prosesor Octa core, dengan 3GB memori dan 32 GB memori internal. Menggunakan sistem operasi aOS'),
(39, 'Power Bang MASS150', 3, '240000.00', NULL, 'Kapasitas 15000 mAH, dilengkapi dengan konektor universal yang dapat digunakan di sebagian besar device.'),
(40, 'LED LGi 40''', 3, '40000000.00', NULL, 'TV dengan layar LED berukuran 40 inci, dilengkapi dengan fitur SmartTV dan juga difasilitasi dengan port HDMI, VGA, DVI dan slot USB dan SD Card untuk memudahkan penggunaan'),
(41, 'Clarinet Namaha', 5, '1275000.00', NULL, 'Clarinet standar dengan 20 tuts dan dengan peredam suara.'),
(42, 'Kecapi Senar Putus', 5, '1970000.00', NULL, 'Kecapi yang dibuat oleh pengrajin kenamaan asal Kudus dengan senar bening bak air sungai.'),
(43, 'Ukulele Dumbo', 5, '2200000.00', NULL, 'Ukulele yang terbuat dari lele legendaris dari sungai Kumis Nasir. Siapapun yang mendengar suara indah ukulele ini akan diberkati dengan ribuan   kasih sayang.'),
(44, 'Drum Badumtess 3X5X', 5, '4670000.00', NULL, 'Drum yang hanya bisa dimainkan dengan derajat kebinalan lebih dari 43 derajat Fahrenheit.'),
(45, 'Meja Bundar KMB', 4, '1100000.00', NULL, 'Meja berdiameter 1 meter, berbentuk oval menyerupai dengan meja yang digunakan saat konferensi meja bundar, dibuat dari kayu mahogani'),
(46, 'Keyboard Quicksilver', 3, '205000.00', NULL, 'Keyboard US dengan tambahan 5 tombol yang dapat dikustomisasi sesuai kebutuhan. Tidak termasuk mouse. Menggunakan interface USB untuk menghubungkan dengan komputer.'),
(47, 'Stabillo Kuning', 2, '5500.00', NULL, 'Penanda marker berwarna kuning untuk digunakan menandari poin poin penting pada sebuah teks.'),
(48, 'Lemari Serbaguna SB', 4, '750000.00', NULL, 'Lemari kayu yang ditujukan sebagai tempat menyimpan berbagai benda. Made in Indonesia'),
(49, 'Seprei Sepray', 4, '300000.00', NULL, 'Sprei premium dengan kelembutan maksimal untuk kenyamanan tidur anda yang optimum. Tidak termasuk bed cover'),
(50, 'Jangka JK', 2, '2500.00', NULL, 'Jangka untuk membuat gambar lingkaran sederhana. Maksimal ukuran lingkaran 10 cm jari-jari. Tersedia isi pensilnya');

-- --------------------------------------------------------

--
-- Table structure for table `barang_kategori`
--

CREATE TABLE IF NOT EXISTS `barang_kategori` (
  `kategori_id` int(3) NOT NULL,
  `kategori_nama` varchar(50) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_kategori`
--

INSERT INTO `barang_kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Makanan/Minuman'),
(2, 'Alat Tulis'),
(3, 'Elektronik'),
(4, 'Perabotan'),
(5, 'Alat Musik');

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
(1, 15, 1),
(2, 74, 2),
(3, 49, 1),
(4, 3, 1),
(5, 100, 4),
(6, 0, 3),
(7, 10, 3),
(8, 25, 1),
(9, 4, 1),
(10, 4980, 1),
(11, 21, 1),
(12, 15, 1),
(13, 6, 1),
(14, 1, 1),
(15, 3, 1),
(47, 20, 1),
(49, 5, 1);

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
  `user_phone` varchar(15) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan_card`
--

CREATE TABLE IF NOT EXISTS `pelanggan_card` (
  `user_id` int(5) NOT NULL,
  `card_number` varchar(22) NOT NULL,
  `card_name` varchar(50) NOT NULL,
  `card_expiry` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan_card`
--

INSERT INTO `pelanggan_card` (`user_id`, `card_number`, `card_name`, `card_expiry`) VALUES
(2, '0028-2345-6789-9888', 'Renusa Andra', '2045-02-01'),
(3, '2345-6789-9879-098', 'Dudu asa', '2050-01-01'),
(4, '2345-7755-9876-9864', 'Sayas asd', '2050-01-01'),
(5, '3459-8656-9754-8754', 'Ans as', '2050-01-01');

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

INSERT INTO `pelanggan_id` (`user_id`, `nama_lengkap`, `email`) VALUES
(1, 'Setyo Legowo', 'email@email.com'),
(2, 'Renusa Andra', 'andra@gmail.com'),
(3, 'Renusa and', 'aaa@x.ci'),
(4, 'Adad asd', 'e@gm.sdp'),
(5, 'Vans asd', 'c@g.xo');

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
  `qty` decimal(5,2) NOT NULL,
  PRIMARY KEY (`transaksi_id`),
  UNIQUE KEY `transaksi_id` (`transaksi_id`,`barang_id`),
  KEY `barang_id` (`barang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `barang_id`, `qty`) VALUES
(1, 2, '3.00'),
(2, 9, '1.00'),
(3, 13, '1.00'),
(4, 11, '1.00'),
(5, 14, '1.00'),
(6, 6, '2.00'),
(7, 6, '2.00'),
(8, 6, '2.00'),
(9, 6, '2.00'),
(10, 6, '2.00'),
(11, 6, '2.00'),
(12, 6, '2.00'),
(13, 6, '2.00'),
(14, 6, '2.00'),
(15, 6, '2.00'),
(16, 6, '2.00'),
(17, 6, '2.00'),
(18, 6, '2.00'),
(19, 6, '2.00'),
(20, 6, '2.00'),
(21, 6, '2.00'),
(22, 6, '2.00'),
(23, 6, '2.00'),
(24, 6, '2.00'),
(25, 6, '2.00'),
(26, 6, '2.00'),
(27, 6, '2.00'),
(28, 6, '2.00'),
(29, 6, '2.00'),
(30, 6, '2.00'),
(31, 6, '2.00'),
(32, 6, '2.00'),
(33, 6, '2.00'),
(34, 6, '2.00'),
(35, 6, '2.00'),
(36, 6, '2.00'),
(37, 6, '2.00'),
(38, 6, '2.00'),
(39, 6, '2.00'),
(40, 6, '2.00'),
(41, 6, '2.00'),
(42, 6, '2.00'),
(43, 6, '2.00'),
(44, 6, '2.00'),
(45, 6, '2.00'),
(46, 6, '2.00'),
(47, 6, '2.00'),
(48, 6, '2.00'),
(49, 6, '2.00'),
(50, 6, '2.00'),
(51, 6, '2.00'),
(52, 6, '2.00'),
(53, 6, '2.00'),
(54, 6, '2.00'),
(55, 6, '2.00'),
(56, 6, '2.00'),
(57, 6, '2.00'),
(58, 6, '2.00'),
(59, 6, '2.00'),
(60, 6, '2.00'),
(61, 6, '2.00'),
(62, 6, '2.00'),
(63, 6, '2.00'),
(64, 6, '2.00'),
(65, 6, '2.00'),
(66, 2, '1.00'),
(67, 10, '20.00'),
(68, 2, '20.00'),
(69, 2, '2.00'),
(70, 3, '1.00'),
(71, 1, '1.00'),
(72, 1, '3.00'),
(73, 1, '1.00');

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
('gvlbr8h8perdv5e73gq89ts7l7', 0, '2013-10-29 18:15:10', 1383045310, 'info|a:2:{i:4;b:0;i:2;b:0;}');

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

INSERT INTO `__user_login` (`user_id`, `nama_pengguna`, `kata_sandi`, `ic`) VALUES
(1, 'setyolegowo', '24a03362d59fe2daf54ec4413c7d290b9b931a55:ab0040fcd28e4364bc2c29f9306ae36e546acd6925358fb400ee3fac7d690d14', 'hr'),
(2, 'andra', '8f9ba180f0333a994fc9cebf485ee06edae7125f:d6ec8dccac1d69a27a5fd36b523762d3b14d04a35ceb10c5776973a3f5495db1', 'gv'),
(3, 'qwerty', '8f9ba180f0333a994fc9cebf485ee06edae7125f:d6ec8dccac1d69a27a5fd36b523762d3b14d04a35ceb10c5776973a3f5495db1', 'gv'),
(4, 'asdfg', '8f9ba180f0333a994fc9cebf485ee06edae7125f:d6ec8dccac1d69a27a5fd36b523762d3b14d04a35ceb10c5776973a3f5495db1', 'gv'),
(5, 'vayans', '8f9ba180f0333a994fc9cebf485ee06edae7125f:d6ec8dccac1d69a27a5fd36b523762d3b14d04a35ceb10c5776973a3f5495db1', 'gv');

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
  ADD CONSTRAINT `barang_stok_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang_data` (`barang_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_stok_ibfk_2` FOREIGN KEY (`satuan`) REFERENCES `ref_satuan_barang` (`id_satuan`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang_data` (`barang_id`) ON UPDATE CASCADE;

--
-- Constraints for table `__user_login`
--
ALTER TABLE `__user_login`
  ADD CONSTRAINT `__user_login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pelanggan_id` (`user_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
