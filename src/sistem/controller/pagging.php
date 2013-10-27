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
        if($this->requestURI[$this->SumOfSub + 1] == 'proses') {
            if($this->requestURI[$this->SumOfSub + 2] == null) {
                // $bucket = json_decode($_POST['data'], true);
                // $data = array("nama" => $_POST['name']);
                print json_encode($_POST['data']);
            } else if($this->requestURI[$this->SumOfSub + 2] == 'json' && 
                      $this->requestURI[$this->SumOfSub + 3] == null) {
                include SYSTEMPATH."library/jsonresponder.php";
                $bucket = json_decode($_POST['data'], true);
                $responder = new JsonResponder;
                if(method_exists($responder,$bucket['todo'])) {
                    $responder->$bucket['todo']($bucket['data']);
                } else {
                    print json_encode(array("data" => "Method salah"));
                }
            }
        } else {
            include SYSTEMPATH."controller/process.php";
            $proses = new process;
            include APPPATH."page/header.php";
            switch ($this->requestURI[$this->SumOfSub + 1])
            {
                case 'kat':
                case NULL:
                    include APPPATH."page/home.php";
                    break;
                case 'pendaftaran':
                    if($this->requestURI[$this->SumOfSub + 2] == null)
                        include APPPATH."page/pendaftaran.php";
                    else if($this->requestURI[$this->SumOfSub + 2] == "kartu")
                        include APPPATH."page/daftar_kartukredit.php";
                    else
                        $this->redirects('NotFound/');
                    break;
                case 'profil':
                    include APPPATH."page/profil_pelanggan.php";
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
            include APPPATH."page/footer.php";
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