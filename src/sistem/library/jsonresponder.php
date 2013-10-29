<?php if (!defined('IDENTITAS')) exit('No direct script access allowed');

class JsonResponder
{
    // DATA MEMBER
    // -------------------------------------------------------------------------
    private $__sas;
	private $__connection;
    
    // CONSTRUCTOR
    // -------------------------------------------------------------------------
	public function __construct() 
	{
		global $sas,$connection;

		$this->__sas = $sas;
		$this->__connection = $connection;
    }
    
    // INTERNAL METHOD
    // -------------------------------------------------------------------------
    protected function is_valid_luhn($number) {
        // settype($number, 'string');
        $sumTable = array(
            array(0,1,2,3,4,5,6,7,8,9),
            array(0,2,4,6,8,1,3,5,7,9));
        $sum = 0;
        $flip = 0;
        for ($i = strlen($number) - 1; $i >= 0; $i--) {
            $sum += $sumTable[$flip++ & 0x1][$number[$i]];
        }
        return $sum % 10 === 0;
    }
    
    // PUBLIC METHOD
    // -------------------------------------------------------------------------
    public function subkategori($param) {
        $data = array();
    
        $sql = "SELECT * FROM barang_kategori;";
        $query = mysql_query($sql, $this->__connection) or trigger_error("Mysql Error:<br />".mysql_error(), E_USER_NOTICE);
        if(mysql_num_rows($query) > 0) {
            $data['status'] = "success";
            while($row = mysql_fetch_assoc($query)) {
                $data['data'][] = $row['nama'];
            }
        } else {
            $data['status'] = "failed";
            $data['data'] = "Tidak ada kategori di dalam basis data";
        }
        print json_encode($data);
    }
    public function searching($param) {
        $data = array("data" => "Waw, nyampe");
        print json_encode($data);
    }
    public function login($param) {
        $username = $param[0]['nama_pengguna'];
        $password = $param[0]['kata_sandi'];
        include SYSTEMPATH."controller/authentication.php";
        $ologin = new Authentication($username, $password);
        if($ologin->CheckResultLogin()) {
            $ari = $ologin->GetNameUser();
            $data = array("status" => "success", 
                "data" => array(
                    "nama_lengkap" => $ari['nama_lengkap'], 
                    "email" => $ari['email'],
                    "user_id" => $ologin->getUserID()
                )
            );
        } else {
            $data = array("status" => "failed");
        }
        print json_encode($data);
    }
    public function pendaftaran($param) {
        $sql = "";
        switch($param[0]['check_field']) {
            case 'username': 
                $sql = "SELECT nama_pengguna FROM __user_login WHERE nama_pengguna = '".mysql_real_escape_string($param[0]['value'])."'";
                break;
            case 'email':
                $sql = "SELECT email FROM pelanggan_id WHERE email = '".mysql_real_escape_string($param[0]['value'])."'";
                break;
            default: break;
        }
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        if(mysql_num_rows($query) == 0) {
            $data = array("status" => "valid", "data" => "");
        } else {
            $data = array("status" => "invalid", "data" => "Ada dalam basis data.");
        }
        print json_encode($data);
    }
    public function submitPendaftaran($param) {
        include SYSTEMPATH."controller/process.php";
        $proses = new process;
        $proses->pendaftaranNew($param[0]['nama_pengguna'], $param[0]['kata_sandi'], $param[0]['nama_lengkap'], $param[0]['email']);
        $data = array("status" => "success", "data" => array ("nama_lengkap" => $param[0]['nama_lengkap'], "email" => $param[0]['email'], "user_id" => $proses->getUserID()));
        print json_encode($data);
    }
    public function getIdentity($param) {
        $sql = "SELECT * FROM pelanggan_addr WHERE user_id = ".mysql_real_escape_string($param[0]['user_id']).";";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        if(mysql_num_rows($query) == 1) {
            $row = mysql_fetch_assoc($query);
            $data = array("status" => "success", "data" => array(
                    "user_id" => $row['user_id'],
                    "alamat" => $row['jalan'],
                    "provinsi" => $row['provinsi'],
                    "kabupaten" => $row['kabupaten'],
                    "kodepos" => $row['kodepos'],
                    "user_phone" => $row['user_phone']
                ));
        } else {
            $data = array("status" => "failed", "data" => "Data tidak ditemukan.");
        }
        print json_encode($data);
    }
    public function changeIdentity($param) {
        // check is data available on DB
        $sql = "SELECT user_id FROM pelanggan_addr WHERE user_id = ".mysql_real_escape_string($param[0]['user_id']).";";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        if(mysql_num_rows($query) == 1) {
            $sql = "UPDATE pelanggan_addr SET ";
            $sql .= "jalan = '".mysql_real_escape_string($param[0]['alamat'])."', ";
            $sql .= "provinsi = '".mysql_real_escape_string($param[0]['provinsi'])."', ";
            $sql .= "kabupaten = '".mysql_real_escape_string($param[0]['kabupaten'])."', ";
            $sql .= "kodepos = ".mysql_real_escape_string($param[0]['kodepos']).", ";
            $sql .= "user_phone = '".mysql_real_escape_string($param[0]['no_hp'])."' ";
            $sql .= "WHERE user_id = ".mysql_real_escape_string($param[0]['user_id']).";";
        } else {
            $sql = "INSERT INTO pelanggan_addr VALUES (";
            $sql .= mysql_real_escape_string($param[0]['user_id']).", ";
            $sql .= "'".mysql_real_escape_string($param[0]['alamat'])."', ";
            $sql .= "'".mysql_real_escape_string($param[0]['provinsi'])."', ";
            $sql .= "'".mysql_real_escape_string($param[0]['kabupaten'])."', ";
            $sql .= mysql_real_escape_string($param[0]['kodepos']).", ";
            $sql .= "'".mysql_real_escape_string($param[0]['no_hp'])."'";
            $sql .= ");";
        }
        mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        
        // Change full name
        $sql = "UPDATE pelanggan_id SET ";
        $sql .= "nama_lengkap = '".mysql_real_escape_string($param[0]['nama_lengkap'])."' ";
        $sql .= "WHERE user_id = ".mysql_real_escape_string($param[0]['user_id']).";";
        
        mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        
        // Change password or not
        if($param[0]['kata_sandi'] != "") {
            // get username
            $sql = "SELECT nama_pengguna FROM __user_login WHERE user_id = ".mysql_real_escape_string($param[0]['user_id']).";";
            $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
            $row = mysql_fetch_array($query);
            $username = $row['nama_pengguna'];
            
            include SYSTEMPATH."controller/authentication.php";
            $ologin = new Authentication($username, $param[0]['kata_sandi']);
            $ologin->update($param[0]['user_id']);
        }
        
        $data = array("status" => "success", "data" => array(
            "user_id" => $param[0]['user_id'],
            "alamat" => $param[0]['alamat'],
            "provinsi" => $param[0]['provinsi'],
            "kabupaten" => $param[0]['kabupaten'],
            "kodepos" => $param[0]['kodepos'],
            "user_phone" => $param[0]['no_hp']
        ));
        
        print json_encode($data);
    }
    public function addToShoppingBag($param) {
        $isStokAvailable = true;
        // Check barang
        $sql = "SELECT barang_data.nama, barang_data.harga, barang_stok.stok FROM barang_data INNER JOIN barang_stok ON barang_data.barang_id = barang_stok.barang_id WHERE barang_data.barang_id = ".mysql_real_escape_string($param[0]['id_barang'])." AND stok > ".$param[0]['qty'].";";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        if(mysql_num_rows($query) == 1) {        
            if(isset($_SESSION['shopping_bag'])) {
                $found = false;
                $barang = json_decode($_SESSION['shopping_bag'], true);
                for($i = 0; $i < count($barang['data']); $i++) {
                    if($barang['data'][$i]['id_barang'] == $param[0]['id_barang']) {
                        $barang['data'][$i]['qty'] += $param[0]['qty'];
                        if($param[0]['detail_tambahan'] != "") $barang['data'][$i]['detail_tambahan'] += "<br>".$param[0]['detail_tambahan'];
                        $found = true;
                        break;
                    }
                }
                if(!$found) {
                    $barang['data'][] = $param[0];
                }
            } else {
                $barang = array("data" => array());
                $barang['data'][] = $param[0];
            }
            $_SESSION['shopping_bag'] = json_encode($barang);
            
            $row = mysql_fetch_array($query);
            $data = array("status" => "success", "data" => array(
                "nama_barang" => $row['nama'],
                "harga" => $row['harga'],
                "qty" => $param[0]['qty'],
                "total_barang_keranjang" => count($barang['data'])
            ));
            
            print json_encode($data);
        } else {
            $data = array("status" => "failed", "data" => "Barang id tidak ada atau stok kami kurang dari ".$param[0]['qty'].".");
            print json_encode($data);
        }
    }
    public function saveToShoppingBag($param) {
        $barang = json_decode($_SESSION['shopping_bag'], true);
        for($i = 0; $i < count($barang['data']); $i++) {
            for($j = 0; $j < count($param); $j++) {
                if($barang['data'][$i]['id_barang'] == $param[$j]['barang_id']) {
                    $barang['data'][$i]['qty'] = $param[$j]['qty'];
                    break;
                }
            }
        }
        $result = array("data" => array());
        foreach($barang['data'] as $elemen) {
            if($elemen['qty'] > 0) {
                $result['data'][] = $elemen;
            }
        }
        $_SESSION['shopping_bag'] = json_encode($result);
        
        print json_encode(array("status" => "success", "data" => ""));
    }
    public function buy($param) {
        $result = array("data" => array());
        foreach($param as $elemen) {
            if($elemen['qty'] > 0) {
                $result['data'][] = $elemen;
            }
        }
        $barang = $result;
        
        $ids_barang = array();
        foreach($barang['data'] as $elemen) {
            $ids_barang[] = $elemen['id_barang'];
        }
        
        // CHECK STOCK
        $sql = "SELECT barang_id, stok FROM barang_stok WHERE barang_id IN (".implode(',',$ids_barang).") GROUP BY barang_id ASC;";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        
        // Check Quantity
        $found_lesttqty = false;
        for($i = 0; !$found_lesttqty && $row = mysql_fetch_assoc($query); $i++) {
            foreach($barang['data'] as $elemen) {
                if($row['barang_id'] == $elemen['id_barang']) {
                    if($row['stok'] < $elemen['qty']) 
                        $found_lesttqty = true;
                    break;
                }
            }
        }
        if($found_lesttqty) {
            $_SESSION['shopping_bag'] = json_encode($barang);
            
            print json_encode(array("status" => "failed", "data" => "Ada barang stoknya kurang"));
        } else {
            // get new transaksi_id
            $sql = "SELECT (transaksi_id + 1) AS new_transaksiid FROM transaksi GROUP BY transaksi_id DESC LIMIT 0, 1;";
            $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
            if(mysql_num_rows($query) != 0) {
                $row = mysql_fetch_array($query);
                $new_transaksiid = $row['new_transaksiid'];
            } else {
                $new_transaksiid = 1;
            }
            
            // INSERT
            $sql = "INSERT INTO transaksi VALUES ";
            for($i = 0; $i < count($barang['data']); $i++) {
                $sql .= "(".mysql_real_escape_string($new_transaksiid).", ".mysql_real_escape_string($barang['data'][$i]['id_barang']).", ".mysql_real_escape_string($barang['data'][$i]['qty']).")";
                if($i + 1 < count($barang['data'])) {
                    $sql .= ", ";
                } else {
                    $sql .= ";";
                }
            }
            mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
            
            // UPDATE STOK
            foreach($barang['data'] as $elemen) {
                $sql = "UPDATE barang_stok SET stok = stok - ".$elemen['qty']." WHERE barang_id = ".$elemen['id_barang'].";";
                mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
            }
            
            unset($_SESSION['shopping_bag']);
            
            print json_encode(array("status" => "success", "data" => "Anda telah berhasil beli."));
        }
    }
    public function checkCreditCardNumber($param) {
        $number = str_replace("-","",$param);
        if($this->is_valid_luhn($number)) {
            $data = array("status" => "valid", "data" => "");
        } else {
            $data = array("status" => "invalid", "data" => "");
        }
        print json_encode($data);
    }
    public function daftarCreditCard($param) {
        if(($param['bulan'] > Date("n") && $param['tahun'] >= Date("Y")) || ($param['tahun'] > Date("Y"))) {
            include SYSTEMPATH."controller/process.php";
            $proses = new process;
            $proses->daftarKartuKredit($param['user_id'], $param['nomor_kartu'], $param['nama_pemilik'], $param['bulan'], $param['tahun']);
            $data = array("status" => "success");
        } else {
            $data = array("status" => "failed", "data" => "Date is not valid.");
        }
        print json_encode($data);
    }
    public function checkCard($param){
		$query = sprintf("SELECT card_number FROM pelanggan_card JOIN pelanggan_id ON 
		pelanggan_id.user_id = pelanggan_card.user_id WHERE pelanggan_id.user_id ='%d'",
		$param['user_id']);
		
		$result = mysql_query($query, $this->__connection);
		$result_table = mysql_fetch_array($result);
		
		if ($result_table['card_number'] == NULL){
			$data = 0;
		} else {
			$data = 1;
		}
		print ($data);
	}
}
?>