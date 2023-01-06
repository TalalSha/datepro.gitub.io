<html xmlns="http://www.w3.org/1999/xhtml">  
   <head>  
   <title>Date Formats....</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">  
    <script src="https://cdn.jsdelivr.net/gh/dubrox/Multiple-Dates-Picker-for-jQuery-UI@master/jquery-ui.multidatespicker.js"></script>
   
</head>

<div class="container">
  <h1>diffrent date format...</h1>
   <h2>Pushed to github...</h2>
  <div class="float-right">
   <label>To Date</label><br>
  <input type="text" id="txtTo" />
</div>
<div class="float-right">
  <label>From Date</label><br>
<input type="text" id="txtFrom" />
  </div><br><br>
  <select  class="form-select"  style="width: 150px">
<?php 
$start = '01/01/2019 20:00:00';
$end = '01/02/2019 08:00:00';

$time = strtotime($start);
$timeStop = strtotime($end);
?>
<?php
while ($time<$timeStop) {?>

<option><?php   echo date('H:i', $time);
    $time = strtotime('+1 hours', $time);
    echo ' - ' . date('H:i', $time) . '<br/>'; ?></option>
   
 <?php } ?>

  </select>
  <div class="float-right">
   <label>Weekend off</label><br>
  <input type="text" id="txtDate" >
</div>
<div class="float-right">
  <label>Multiple Dates</label><br>
   <input type="text" id="datePick" > 
  </div>
 
  <form>
   <select name="year"   class="form-select"  style="width: 150px" required>
      <option value="Year" selected="" class="hidden">Future Dates</option>
      <?php
      $date = date('Y-m-d'); //today date
      $weekdays = array();
      for($i =1; $i <= 7; $i++){
         $date = date('Y-m-d', strtotime('+1 day', strtotime($date)));
         $weekdays[] = date('l : Y-m-d', strtotime($date));
         // print_r($weekdays);
        }  ?>
      <?php foreach($weekdays as $days){
 
  ?>
      <option value=""><?= $days ?></option>
      <?php 
      
   }
      
      ?>
   </select>

<select class="form-select" style="width: 150px">
   
<?php 
 $start = date('H:i a'); //you can write here 00:00:00 but not need to it
 $end = "24:00";

 $tStart = strtotime($start);
 $tEnd = strtotime($end);
 $tNow = $tStart;

 while($tNow <= $tEnd){
   echo '<option value="'.date("H:i a",$tNow).'">'.date("H:i a",$tNow).'</option>';
   $tNow = strtotime('+1 hours',$tNow);
}

?>


</select>
</form>
   
   <table border="1" class="table">  
   <thead class="thead-dark"> 
         <tr>  
            <th>Id</th>  
            <th>Date...</th>  
            <th>Date format 1</th>
            <th>Date format 2</th>
            <th>Date format 3</th>
            <th>past weeks</th>
            <th>Number of weeks</th>
            <th>Number of Days</th>
            <th>Number of Months</th>
         </tr>  
</thead>
<tbody>
         <?php  
         foreach ($h as $row)  
         {  
            ?><tr>  
            <td><?php echo $row->id;?></td>  
            <td><?php echo $row->date;?></td>  
            <td><?php echo changeDateFormat($row->date); ?></td> 
            <td><?php echo changeDateFormat($row->date); ?></td> 
           <td><?php 
             $now = new Datetime;
            //  print_r($now);
            $last = new DateTime($row->date);
            $diff = $now->diff($last);
            $weeks = $diff->w = floor($diff->d / 7);
            // print_r($weeks);
            // exit;

          

            $interval = $last->diff($now);
            // print_r($interval);


            $years = (int)$interval->format('%Y');
            // print_r($years);
            $months = (int)$interval->format('%m');
           
            $days = (int)$interval->format('%d');
            $hours = (int)$interval->format('%H');
            $minutes = (int)$interval->format('%i');
            // print_r($days);


            
            if($years > 0)
            {
            echo $years.' Years ago ' ;
            }else if($months > 0)
            {
            echo $months.' Months ago ';
            }
            else if($weeks > 0 && $days >= 8 )
                                 {
                                 echo $weeks.' Weeks Ago   ';
                                 }
                                
            else if($days > 0 && $days <= 7)
            {
            echo $days.' Days ago ' ;
            }
            else if($hours > 0)
            {
            echo  $hours.' Hours ago ' ;
            }
            else
            {
            echo $minutes.' minutes ago.' ;
            }
           
          
           ?>


           </td>
           <td><?php
             $now = new Datetime;
             //  print_r($now);
             $last = new DateTime($row->date);
            //  $diff = $now->diff($last);
           
             $lastweeks = $now->diff($last)->days / 7;
            // print_r($lastweeks);
             
              echo (int)$lastweeks.'pastweeks';


           
           ?></td>
           <td><?php
           
           $date = new DateTime($row->date);
           $noweek = $date->format("W");

           echo (int)$noweek.'number of weeks';
           
           
           ?></td>


             <td><?php
         $now = new Datetime;
         //  print_r($now);
         $last = new DateTime($row->date);
        //  $diff = $now->diff($last);
       
         $pastdays = $now->diff($last)->format("%a");
        // print_r($lastweeks);
         
          echo (int)$pastdays.'No of past days';
           
           
           ?></td>

<td><?php
       $date1 = $row->date;
       $date2 =  date('M d ,Y');
       
       $ts1 = strtotime($date1);
       $ts2 = strtotime($date2);
       
       $year1 = date('Y', $ts1);
       $year2 = date('Y', $ts2);
       
       $month1 = date('m', $ts1);
       $month2 = date('m', $ts2);
       
       $monthno = (($year2 - $year1) * 12) + ($month2 - $month1);

       echo (int)$monthno.'No of Months';

       
           
           
           ?></td>
            </tr>  
         <?php }  
         ?>  
      </tbody>  
   </table>  
         </div>
<body>  
</body>  
</html>  
<script type="text/javascript">
        $(function () {
            $("#txtDate").datepicker({
                defaultDate: "+1w",
                beforeShowDay: $.datepicker.noWeekends
            });
        });
    </script>

<script type="text/javascript">
$('#datePick').multiDatesPicker({
   // appendText:"(yy-mm-dd)",  
               dateFormat:"DD, d MM, yy"
               // altField: "#datePick",  
               // altFormat: "DD, d MM, yy" 

});

</script>
<script type="text/javascript">
$("#txtFrom").datepicker({
        numberOfMonths: 2,
        minDate: 0,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate() + 1);
            $("#txtTo").datepicker("option", "minDate", dt);
        }
    });
    $("#txtTo").datepicker({
        numberOfMonths: 2,
        minDate: 0,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate() - 1);
            $("#txtFrom").datepicker("option", "maxDate", dt);
        }
    });
</script>
<!-- $('#datePick').mobiscroll().datepicker({
    controls: ['calendar'],
    selectMultiple: true,
    selectMin: 1
    selectCounter: true
});  -->