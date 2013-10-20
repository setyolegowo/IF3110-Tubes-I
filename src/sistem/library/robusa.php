<?php if (!defined('IDENTITAS')) exit('No direct script access allowed');

/* FILENAME: robusa.php */

/**
 * APLIKASI SISTEM RUKO SERBA ADA
 * -----------------------------------------------------------------------------
 * Aplikasi sistem Ruko Serba Ada untuk tugas mata kuliah pengembangan aplikasi
 * berbasis Web
 *
 * @author "Setyo Legowo"
 * @school "Institut Teknologi Bandung"
 *
 */

// -----------------------------------------------------------------------------
/*
 * USING LIBRARY AND CONTROLLER
 */
	require SYSTEMPATH.'configuration.php';
	require SYSTEMPATH.'library/connection.php';
	require SYSTEMPATH.'library/session.php';
	require SYSTEMPATH.'controller/pagging.php';
 
// -----------------------------------------------------------------------------
/*
 * Start paging controller
 */
 
	$robusa = new pagging;
?>