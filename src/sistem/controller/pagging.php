<?php if (!defined('IDENTITAS')) exit('No direct script access allowed');

/* FILE: pagging.php */

class pagging 
{
    // DATA MEMBER
    // -------------------------------------------------------------------------
	protected $SumOfSub;
	protected $requestURI;
	private $__sas;
	private $__connection;
	
    // CONSTRUCTOR
    // -------------------------------------------------------------------------
	public function __construct() 
	{
		global $sas,$connection;

		$this->__sas = $sas;
		$this->__connection = $connection;

		$this->routing();
		$this->jumlahSubFolderSistem();
		if($this->__sas['setting']['construction']) {
			$this->requestURI[$this->SumOfSub + 1] = 'construct';
		}
		$this->page_selection();
	}
    
    // INTERNAL METHOD
    // -------------------------------------------------------------------------
	protected function jumlahSubFolderSistem()
	{
		$this->SumOfSub = substr_count(HOME_URL,'/') - 3;
	}
	protected function routing()
	{
		$url = explode('/', $_SERVER['REQUEST_URI']);
		$i = 0;
		while (isset($url[$i])) {
			$this->requestURI[$i] = $url[$i];
			$i++;
		}
		$this->requestURI[$i] = NULL;
	}
	protected function page_selection()
	{
		switch ($this->requestURI[$this->SumOfSub + 1])
		{
			case NULL:
                include APPPATH."page/header.php";
                include APPPATH."page/home.php";
                include APPPATH."page/footer.php";
				break;
			case 'proses':
                $bucket = json_decode($_POST['data'], true);
                // $data = array("nama" => $_POST['name']);
                print json_encode($bucket);
				break;
			case 'NotFound': 
                include APPPATH."page/notfound.php";
				break;
			case 'NotSupport':
                print "<h1>Here... Not Support</h1>";
				break;
			case 'construct':
                print "<h1>Still Constructing</h1>";
				break;
			default:
                $this->redirects('NotFound/'); 
				break;
		}
	}
    
    // PUBLIC METHOD
    // -------------------------------------------------------------------------
	public function redirects($val)
	{
		header("Location: ".HOME_URL.$val);
	}
}

?>