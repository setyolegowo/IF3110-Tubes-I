<?php if (!defined('IDENTITAS')) exit('No direct script access allowed');
/* FILE : session.php*/
class pas_session
{
	public function __buka($savePath,$sessionName)
	{
		global $sas,$connection;
		mysql_select_db($sas['mysql']['database'], $connection);
		return TRUE;
	}
	public function __tutup()
	{
		global $connection;
		mysql_close($connection);
		return TRUE;
	}
	public function __baca($id)
	{
		global $connection;
		
		$id = mysql_real_escape_string($id);
		$sql = "SELECT `session_data` FROM __session_handler 
                WHERE session_id = '".$id."';";
		if($query = mysql_query($sql,$connection))
		{
			if(mysql_num_rows($query) == 1)
			{
				$row = mysql_fetch_assoc($query);
				return $row['session_data'];
			}
			else
			{
				return '';
			}
		}
		else
		{
			return '';
		}
	}
	public function tulis_baru($id,$data)
	{
		global $connection;
		
		$id = mysql_real_escape_string($id);
		$tgl = mysql_real_escape_string(date('Y-m-d H:i:s'));
		$data = mysql_real_escape_string($data);
		
        $sql = "INSERT INTO __session_handler
                VALUES('".$id."',NULL,'".$tgl."','".time()."','".$data."');";
		mysql_query($sql,$connection) or die(mysql_error());
		
        return TRUE;
	}
	public function __tulis($id,$data)
	{
		global $connection;
		
		$id = mysql_real_escape_string($id);
		$tgl = date('Y-m-d H:i:s');
		$sql_cek = "SELECT * FROM __session_handler 
                    WHERE session_id = '".$id."';";
		$query = mysql_query($sql_cek,$connection) 
                 or trigger_error(mysql_error(), E_USER_ERROR);
		if(mysql_num_rows($query) > 0) {
			$record = mysql_fetch_array($query);
			if($record['user_id'] == NULL) {
				if(isset($_SESSION['NomorInduk'])) {
					$user_id = $_SESSION['NomorInduk'];
				} else {
					$user_id = NULL;
				}
			} else {
				$user_id = $record['user_id'];
			}
		} else {
			$user_id = NULL;
		}
        
		$sql = "REPLACE INTO __session_handler
                VALUES('".$id."','".$user_id."','".$tgl."','".time()."','".$data."');";
		$r = mysql_query($sql,$connection) or die(mysql_error());
		
        return is_resource($r);
	}
	public function __hancurkan($id)
	{
		global $connection;
		
		$id = mysql_real_escape_string($id);
		$sql = "DELETE FROM __session_handler WHERE session_id = '".$id."';";
		mysql_query($sql,$connection) or die(mysql_error());
		
        return true;
	}
	public function __pembersihan($max)
	{
		global $connection;
		
		$old = time() - $max;
		$old = mysql_real_escape_string($old);
		$sql = "DELETE FROM __session_handler WHERE access < '".$old."';";
		mysql_query($sql,$connection) or die(mysql_error());
		
        return true;
	}
}
$handler = new pas_session;
session_set_save_handler(
    array($handler, '__buka'),
    array($handler, '__tutup'),
    array($handler, '__baca'),
    array($handler, '__tulis'),
    array($handler, '__hancurkan'),
    array($handler, '__pembersihan')
    );
	
session_start();
?>