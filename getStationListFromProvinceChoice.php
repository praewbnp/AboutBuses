<?php
include 'connection.php';
$province = $_POST['province'];
$connection = connect();
if (mysqli_connect_errno())
     {
     echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
$sql = "SELECT DISTINCT StationName, StationID FROM Station WHERE Province = '$province'";
$result = mysqli_query($connection, $sql);
$select = "";
$select .= "<select class='classic' id='bus_station' onchange='setStation(this.value)'>";
$select .= "<option value=station select>Select Bus Station</option>";
$table=[];
$list=[];
while( $row = mysqli_fetch_array($result) ) {
    $table[] = $row['StationName'];
    $list[] = $row['StationID'];
}
for( $i = 0; $i < count($table) ; $i++ ) {
  # code...
  $select .= "<option value='$list[$i]'>". $table[$i]. "</option>";
}
$select .= "</select><br/>";
echo $select;
disconnect( $connection );
 ?>