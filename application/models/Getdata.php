<?php  
   class Getdata extends CI_Model  
   {  
      function __construct()  
      {  
         // Call the Model constructor  
         parent::__construct();  
      }  
      //we will use the select function  
      public function select()  
      {  
         //data is retrive from this query  
         $query = $this->db->get('dates');  
         $res = $query->result();
         return $res;
      }  
   }  
?>  