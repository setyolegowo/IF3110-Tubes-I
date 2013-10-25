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
                    "email" => $ari['email']
                )
            );
        } else {
            $data = array("status" => "failed");
        }
        print json_encode($data);
    }
}
?>