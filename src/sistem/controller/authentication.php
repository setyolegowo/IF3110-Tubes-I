<?php if (!defined('IDENTITAS')) exit('No direct script access allowed');

/* FILE : singinoutProcess.php */

class Authentication
{
	// DATA MEMBER
    // -------------------------------------------------------------------------
    public $returning;
	private $__sas, $__connection, $__username, $__password;
    protected $id_num, $sebagai;

    // CONSTRUCTOR
    // -------------------------------------------------------------------------
	public function __construct($username, $password)
	{
		global $sas, $connection;

		$this->__sas = $sas;
		$this->__connection = $connection;
        $this->__username = $username;
        $this->__password = $password;
        $this->id_num = NULL;
        $this->sebagai = NULL;
	}
    
    // INTERNAL METHOD
    // -------------------------------------------------------------------------
	protected function isValidInput()
	{
		$result = TRUE;
		if(!isset($this->__username) and (!isset($this->__password))) {
			$_SESSION['info'][1] = FALSE;
			$result = FALSE;
		} elseif(($this->__username == NULL) and ($this->__password == NULL)) {
			$_SESSION['info'][1] = FALSE;
			$result = FALSE;
		} elseif(!preg_match("/^[a-zA-Z_.]+$/",$this->__username)) {
            $_SESSION['info'][3] = FALSE;
			$result = FALSE;
        } elseif((strlen($this->__username) < 8) || (strlen($this->__username) > 16) || (strlen($this->__password) < 6) || (strlen($this->__password) > 18))  {
            $_SESSION['info'][4] = FALSE;
			$result = FALSE;
        }
		return $result;
	}
	protected function isMemberExist()
	{
		mysql_select_db($this->__sas['mysql']['database'],$this->__connection);
		$sql = "SELECT user_id FROM __user_login 
                WHERE nama_pengguna = '".mysql_real_escape_string($this->__username)."';";
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
		$sql = "SELECT `kata_sandi`,`ic` FROM __user_login
                WHERE nama_pengguna = '".mysql_real_escape_string($this->__username)."';";
		$query = mysql_query($sql,$this->__connection)
                 or trigger_error(mysql_error(),E_USER_ERROR);
		$record = mysql_fetch_array($query);
		
        $sandi = $this->password_generator($record['ic'], $this->__password);
		
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
    protected function password_generator($ic, $inputsandi) {
        // Pembentukan password
		$iv_string = $ic;
		$jmlCharSandi = strlen($inputsandi);
		$sandi_kiri = substr($inputsandi,0,floor($jmlCharSandi / 2));
		$sandi_kanan = substr($inputsandi,floor($jmlCharSandi / 2)+1,$jmlCharSandi - floor($jmlCharSandi / 2));
		$salt_kiri = substr($this->__sas['setting']['static_salt'],0,3);
		$salt_kanan = substr($this->__sas['setting']['static_salt'],3,3);
		$pattern_1 = $iv_string.$sandi_kiri.$sandi_kanan.$salt_kiri;
		$pattern_2 = $sandi_kanan.$iv_string.$salt_kanan.$sandi_kiri;
		
        // Pilih metode hash
        $sandi['a1'] = hash('sha1',$pattern_1);
		$sandi['a2'] = hash('sha256',$pattern_2);
        
        return $sandi;
    }
    
    // PUBLIC METHOD
    // -------------------------------------------------------------------------
    public function CheckResultLogin()
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
    public function GetNameUser() {
        if($this->id_num != null) {
            $sql = "SELECT nama_lengkap, email FROM pelanggan_id WHERE user_id = '".$this->id_num."';";
            $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
            if(mysql_num_rows($query) == 1) {
                $row = mysql_fetch_array($query);
                return $row;
            } else
                return null;
        } else 
            return null;
    }
    public function getUserID() {
        return $this->id_num;
    }
    public function save($id_num) {
        $this->id_num = $id_num;
        $ic = substr(session_id(), 0, 2);
        $sandi = $this->password_generator($ic, $this->__password);
        $lsandi = $sandi['a1'].":".$sandi['a2'];
        
        $sql = "INSERT INTO __user_login VALUES (";
        $sql .= mysql_real_escape_string($this->id_num).", ";
        $sql .= "'".mysql_real_escape_string($this->__username)."', ";
        $sql .= "'".$lsandi."', ";
        $sql .= "'".mysql_real_escape_string($ic)."'";
        $sql .= ")";
        
        mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
    }
    public function update($id_num) {
        $this->id_num = $id_num;
        $ic = substr(session_id(), 0, 2);
        $sandi = $this->password_generator($ic, $this->__password);
        $lsandi = $sandi['a1'].":".$sandi['a2'];
        
        $sql = "UPDATE __user_login SET ";
        $sql .= "nama_pengguna = '".mysql_real_escape_string($this->__username)."', ";
        $sql .= "kata_sandi = '".mysql_real_escape_string($lsandi)."', ";
        $sql .= "ic = '".mysql_real_escape_string($ic)."' ";
        $sql .= "WHERE user_id = ".mysql_real_escape_string($this->id_num).";";
        
        mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
    }
}
?>