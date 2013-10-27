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
}
?>