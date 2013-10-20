<?php if (!defined('IDENTITAS')) exit('No direct script access allowed');

/* FILE : singinoutProcess.php */

class signinout
{
	// DATA MEMBER
    // -------------------------------------------------------------------------
    public $returning;
	private $__sas, $__connection;
    protected $id_num, $sebagai;

    // CONSTRUCTOR
    // -------------------------------------------------------------------------
	public function __construct()
	{
		global $sas, $connection;

		$this->__sas = $sas;
		$this->__connection = $connection;
        $this->id_num = NULL;
        $this->sebagai = NULL;
	}
    
    // INTERNAL METHOD
    // -------------------------------------------------------------------------
	protected function CheckResult()
	{
		$result = TRUE; //TRUE jika hasil checknya valid
        if(!$this->isValidInput()) $result = FALSE;
        if(!$this->isMemberExist() && $result)
            $result = FALSE;
        else {
            if(!$this->isKeywordPass() && $result) $result = FALSE;
        }
		return $result;
	}
	protected function isValidInput()
	{
		$result = TRUE;
		if(!isset($_POST['nama_pengguna']) and (!isset($_POST['kata_sandi']))) {
			$_SESSION['info'][1] = FALSE;
			$result = FALSE;
		} elseif(($_POST['nama_pengguna'] == NULL) and ($_POST['kata_sandi'] == NULL)) {
			$_SESSION['info'][1] = FALSE;
			$result = FALSE;
		} elseif(!preg_match("/^[a-zA-Z_.]+$/",$_POST['nama_pengguna'])) {
            $_SESSION['info'][3] = FALSE;
			$result = FALSE;
        } elseif((strlen($_POST['nama_pengguna']) < 8) || (strlen($_POST['nama_pengguna']) > 16) || (strlen($_POST['kata_sandi']) < 6) || (strlen($_POST['kata_sandi']) > 18))  {
            $_SESSION['info'][4] = FALSE;
			$result = FALSE;
        }
		return $result;
	}
	protected function isMemberExist()
	{
		mysql_select_db($this->__sas['mysql']['database'],$this->__connection);
		$sql = "SELECT id_num, sebagai FROM __user_login 
                WHERE nama_pengguna = '".mysql_real_escape_string($_POST['nama_pengguna'])."' AND is_tutup = '0';";
		$query = mysql_query($sql,$this->__connection) 
                 or trigger_error(mysql_error(),E_USER_ERROR);

		if(mysql_num_rows($query) == 0) {
			$_SESSION['info'][2] = FALSE;
			return FALSE;
		} else {
            $row = mysql_fetch_array($query);
            $this->id_num = $row['user_id'];
			return TRUE;
        }
	}
	protected function isKeywordPass()
	{
		mysql_select_db($this->__sas['mysql']['database'],$this->__connection);
		$sql = "SELECT `sandi_pengguna`,`ic` FROM __user_login
                WHERE nama_pengguna = '".mysql_real_escape_string($_POST['nama_pengguna'])."';";
		$query = mysql_query($sql,$this->__connection)
                 or trigger_error(mysql_error(),E_USER_ERROR);
		$record = mysql_fetch_array($query);
		
        // Pembentukan password
		$iv_string = $record['ic'];
		$jmlCharSandi = strlen($_POST['kata_sandi']);
		$sandi_kiri = substr($_POST['kata_sandi'],0,floor($jmlCharSandi / 2));
		$sandi_kanan = substr($_POST['kata_sandi'],floor($jmlCharSandi / 2)+1,$jmlCharSandi - floor($jmlCharSandi / 2));
		$salt_kiri = substr($this->__sas['setting']['static_salt'],0,3);
		$salt_kanan = substr($this->__sas['setting']['static_salt'],3,3);
		$pattern_1 = $iv_string.$sandi_kiri.$sandi_kanan.$salt_kiri;
		$pattern_2 = $sandi_kanan.$iv_string.$salt_kanan.$sandi_kiri;
		
        // Pilih metode hash
        $sandi['a1'] = hash('sha1',$pattern_1);
		$sandi['a2'] = hash('sha256',$pattern_2);
		
        // Pemecah password yang disimpan dalam database
		$cek_sandi = explode(':',$record['kata_sandi']);
		
        // Membandingkan password
		if(($sandi['a1'] == $cek_sandi[0]) and ($sandi['a2'] == $cek_sandi[1])) {
			return TRUE;
		} else {
			$_SESSION['info'][2] = FALSE;
			return FALSE;
		}
	}
    
    // PUBLIC METHOD
    // -------------------------------------------------------------------------
    public function login_do() {
		if($this->CheckResult()) {
            // TODO CONVERT TO LOCAL STORAGE
			$_SESSION[NameUser] = $this->getFullName();
            $_SESSION[IDUser] = $this->id_num;
			$_SESSION['posisi'] = 'home';
		} else {
			$_SESSION['posisi'] = NULL;
		}
    }
}
?>