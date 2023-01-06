<?php  
   class Date extends CI_Controller  
   {  
    public function __construct()
    {
        parent::__construct();
    }

      public function index()  
      {  
         //load the database  
         $this->load->database();  
         //load the model  
         $this->load->model('Getdata');  
         //load the method of model  
         $data['h']=$this->Getdata->select();  
         // pr($data['h']);
         // exit;
         //return the data in view  
         $this->load->view('date_view', $data);  
      }  
   }  
?>  