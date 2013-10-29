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
        $this->__id_num = 0;
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
    public function showKategoriNonFilter($kategori_id, $parameter) {
        $params = substr($parameter, 1);
        $elemen = explode('=', $params);
        $page = (int) $elemen[1];
        
		$base = ($page-1)*10;
		$limit = 10;
		if ($base < 0) $base = 0;
		if ($limit < 0) $limit = 1;
		
		
		$result = array();
        $this->__kategori_id = $kategori_id;
        
		
		// select category name from DB
        $sql = "SELECT kategori_nama FROM barang_kategori WHERE kategori_id = ".mysql_real_escape_string($kategori_id).";";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        $row = mysql_fetch_array($query);
        $result['nama_kategori'] = $row['kategori_nama'];
        
        // select good from DB
        $sql = "SELECT barang_id, nama, harga, image_url FROM barang_data WHERE kategori_id = ".mysql_real_escape_string($kategori_id)." LIMIT ".$base.",".$limit.";";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        while($row = mysql_fetch_assoc($query)) {
            $result['data'][] = $row;
        }
        
        return $result;
    }
    public function showBarang($barang) {
        $result = array();
        
        // select good from DB
        $sql = "SELECT barang_id, nama, harga, image_url, deskripsi FROM barang_data WHERE barang_id = ".mysql_real_escape_string($barang).";";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        while($row = mysql_fetch_assoc($query)) {
            $result = $row;
        }
        
        return $result;
    }
    public function showKategoriWithFilter($kategori_id, $parameter) {
        $params = substr($parameter, 1);
        $each = explode('&', $params);
        $elemen = explode('=', $each[0]);
        $by = $elemen[1];
        $elemen = explode('=', $each[1]);
        $sort = $elemen[1];
		$elemen = explode('=',$each[2]);
		$page = (int) $elemen[1];
        $result = array();
        $this->__kategori_id = $kategori_id;
        
		$base = ($page-1)*10;
		$limit = 10;
		if ($base < 0) $base = 0;
		if ($limit < 0) $limit = 1;
		
        // select category name from DB
        $sql = "SELECT kategori_nama FROM barang_kategori WHERE kategori_id = ".mysql_real_escape_string($kategori_id).";";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        $row = mysql_fetch_array($query);
        $result['nama_kategori'] = $row['kategori_nama'];
        
        // select good from DB
        $sql = "SELECT barang_id, nama, harga, image_url FROM barang_data WHERE kategori_id = ".mysql_real_escape_string($kategori_id);
        $sql .= " ORDER BY ".mysql_real_escape_string($by)." ".mysql_real_escape_string($sort)." LIMIT ".$base.",".$limit.";";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        while($row = mysql_fetch_assoc($query)) {
            $result['data'][] = $row;
        }
        
        return $result;
    }
    public function showShoppingBag() {
        if(!isset($_SESSION['shopping_bag'])) {
            return null;
        } else {
            $temp1 = json_decode($_SESSION['shopping_bag'], true);
            if(count($temp1['data']) > 0) {
                $ids_barang = array();
                foreach($temp1['data'] as $elemen) {
                    $ids_barang[] = $elemen['id_barang'];
                }
                
                // select barang
                $sql = "SELECT barang_id, nama, harga, image_url, deskripsi FROM barang_data WHERE barang_id IN (".implode(',',$ids_barang).") GROUP BY barang_id ASC;";
                $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
                $result['total'] = 0;
                for($i = 0; $row = mysql_fetch_assoc($query); $i++) {
                    $result['data'][$i] = $row;
                    for($j = 0; $j < count($temp1['data']); $j++) {
                        if($row['barang_id'] == $temp1['data'][$j]['id_barang']) {
                            $result['data'][$i]['qty'] = $temp1['data'][$j]['qty'];
                            $result['data'][$i]['detail_tambahan'] = $temp1['data'][$j]['detail_tambahan'];
                        }
                    }
                    $result['total'] += $result['data'][$i]['qty']*$result['data'][$i]['harga'];
                }
                return $result;
            } else {
                return null;
            }
        }
    }
    public function daftarKartuKredit($user_id, $nomor_kartu, $pemilik, $bulan_exp, $tahun_exp) {
        $date = $tahun_exp."-".$bulan_exp."-01";
        // Check udah ada atau belum
        $sql = "SELECT user_id FROM pelanggan_card WHERE user_id = ".mysql_real_escape_string($user_id).";";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        if(mysql_num_rows($query) == 0) {        
            // Langsung masukin saja
            $sql  = "INSERT INTO pelanggan_card VALUES (";
            $sql .= mysql_real_escape_string($user_id).", ";
            $sql .= "'".mysql_real_escape_string($nomor_kartu)."', ";
            $sql .= "'".mysql_real_escape_string($pemilik)."', ";
            $sql .= "'".mysql_real_escape_string($date)."'";
            $sql .= ");";
        } else {
            $sql  = "UPDATE pelanggan_card SET ";
            $sql .= "card_number = '".mysql_real_escape_string($nomor_kartu)."', ";
            $sql .= "card_name = '".mysql_real_escape_string($pemilik)."', ";
            $sql .= "card_expiry = '".mysql_real_escape_string($date)."'";
            $sql .= ";";
        }
        
        mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
    }
}
?>