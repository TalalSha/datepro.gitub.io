<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class MY_Controller extends CI_Controller
{
    public $data = array();

    public function __construct()
    {
        parent::__construct();
        $this->data['site_settings'] = $this->getSiteSettings();
        
    }
    
    function sendMessage($mem_data,$subject,$emailto,$admin=false)        {
        $settings = $this->getSiteSettings();
                 
        $from = $settings->site_noreply_email;
        // $emailto=$settings->site_email_send;
         
        $this->load->library('email');
        $this->email->set_mailtype("html"); 
        $this->email->set_newline("\r\n"); 
        $this->email->from($from,$settings->site_name);    
        $this->email->to($emailto);
        if($admin){
            $this->email->cc($settings->site_email_cc);
        }
        $this->email->subject($subject);          
        $this->data['email_body']=$mem_data;
        $this->data['email_subject']=$subject;
        $this->data['settings']=$settings;
        $message = $this->load->view('includes/contact_template',$this->data,TRUE); 
        // pr($message);
        $this->email->message($message); 
        if($this->email->send()){
            return true;            
        }            
        else{ 
            $error=$this->email->print_debugger();
            print_r($this->email->print_debugger());die;
            return $error;
        }        
    }
    
    

    function getSiteSettings()
    {
        return $this->master->getRow("siteadmin", array('site_id' => '1'));
    }
    
    
}

class Admin_Controller extends CI_Controller
{

    protected $data = array();

    public function __construct()
    {
        parent::__construct();
        $this->data['adminsite_setting'] = $this->getAdmineSettings();
    }

    public function isLogged()
    {
        if ($this->session->loged_in < 1) {
            $this->session->set_userdata('admin_redirect_url', currentURL());
            redirect(ADMIN . '/login', 'refresh');
            exit;
        }
    }

    public function logged()
    {
        if ($this->session->loged_in > 0) {
            redirect(ADMIN , 'refresh');
            exit;
        }
    }

    function getAdmineSettings()
    {
        return $this->master->getRow("siteadmin", array('site_id' => '1'));
    }
}
?>