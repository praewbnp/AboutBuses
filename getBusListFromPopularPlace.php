
<?php
include 'connection.php';
$name = $_POST['stationName'];
$connection = connect();

$sql = "SELECT Station.BusNo
        FROM Station
        WHERE Station.StationName='$name'";
$result = mysqli_query($connection, $sql);
$name .= "<br>";
$span = "<br><span>";
while( $row = mysqli_fetch_array($result) ) {
  $span .= $row[0] . " ";
}
$span .= "</span>";
echo $name;
echo $span;
disconnect($connection) ?>