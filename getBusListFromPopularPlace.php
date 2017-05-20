<?php
include 'connection.php';
$name = $_POST['stationName'];
$connection = connect();

$sql = "SELECT Station.BusNo
        FROM Station
        WHERE Station.StationName='$name'";
$result = mysqli_query($connection, $sql);
$span = "<span>";
while( $row = mysqli_fetch_array($result) ) {
  $span .= $row[0] . " ";
}
$span .= "</span>";
echo $span;
disconnect($connection)
 ?>
