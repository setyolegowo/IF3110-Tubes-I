<?php if (!defined('IDENTITAS')) exit('No direct script access allowed');

/* FILENAME : connection.php */

$connection = mysql_pconnect($sas['mysql']['host'], 
                             $sas['mysql']['username'],
                             $sas['mysql']['password']) 
              or die('Tidak dapat membuat koneksi');

?>