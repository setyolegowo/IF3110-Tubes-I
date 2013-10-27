<?php if (!defined('IDENTITAS')) exit('No direct script access allowed');

/* FILENAME: process.php */

class process
{
    // DATA MEMBER
    // -------------------------------------------------------------------------
    private $__connection;
    private $__sas;
    private $__id_num;

    // CONSTRUCTOR
    // -------------------------------------------------------------------------
    public function __construct() {
        global $connection, $sas;
        $this->__connection = $connection;
        $this->__sas = $sas;
    }
    
    // INTERNAL METHOD
    // -------------------------------------------------------------------------
    
    
    // PUBLIC METHOD
    // -------------------------------------------------------------------------
    public function pendaftaranNew($nama_pengguna, $kata_sandi, $nama_lengkap, $email) {
        // new data in pelanggan_id
        $sql = "SELECT (user_id + 1) AS num FROM pelanggan_id GROUP BY user_id DESC LIMIT 0, 1";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        $row = mysql_fetch_array($query);
        $new_number = $row['num'];
        
        // save to DB
        $sql = "INSERT INTO pelanggan_id VALUES (";
        $sql .= mysql_real_escape_string($new_number).", ";
        $sql .= "'".mysql_real_escape_string($nama_lengkap)."', ";
        $sql .= "'".mysql_real_escape_string($email)."'";
        $sql .=");";
        mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        
        // new data login
        include SYSTEMPATH."controller/authentication.php";
        $ologin = new Authentication($nama_pengguna, $kata_sandi);
        $ologin->save($new_number);
        
        $this->__id_num = $new_number;
        
        return true;
    }
    public function getUserID() {
        return $this->__id_num;
    }
}
?>