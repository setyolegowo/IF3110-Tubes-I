<?php
/*
 * ----------------------------------------------
 * APLIKASI SISTEM RUKO SERBA ADA
 * -----------------------------------------------
 * Tugas Mata Kuliah Pengembangan Aplikasi berbasis Web
 */

	// Penyetelan timezone deFault
	date_default_timezone_set('Asia/Jakarta');

	// Memberi identitas untuk file ini
	define('IDENTITAS','aplikasi_robusa');
	
	// Nama URL lokasi server
	define('HOME_URL','http://localhost/tugas_wbd1/'); // harus diakhiri dengan garis miring '/'
	
	// System Path
	if(realpath('sistem') !== FALSE) {
		define('SYSTEMPATH','sistem/');
	}
	// Aplication Path
	if(realpath('aplikasi') !== FALSE) {
		define('APPPATH','aplikasi/');
	}
	
	// Memanggil file utama
	require_once SYSTEMPATH.'library/robusa.php';
	
// Hanya sampai disini
?>