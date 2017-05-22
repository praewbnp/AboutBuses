<?php
include 'connection.php';
$no = $_POST['busNo'];
$busType = $_POST['busType'];

$connection = connect();

$sql = "SELECT Bus.BusDesc, Garage.GarageNo, Garage.GarageDesc, Schedule.FirstTime, Schedule.LastTime, Price.Price
        FROM Bus INNER JOIN Garage INNER JOIN Schedule INNER JOIN Price
        WHERE Garage.BusNo='$no' AND Schedule.BusNo='$no' AND Price.BusNo='$no' AND Bus.BusNo='$no'
              AND Garage.BusType='$busType' AND Schedule.BusType='$busType' AND Price.BusType='$busType' AND Bus.BusType='$busType'";
$result = mysqli_query($connection, $sql);
$span = "<span>";
$span .= "Bus No.: " . $no . "</span><br><span>";
$span .= "Bus Type: " . $busType . "</span><br><span>";
$row = mysqli_fetch_array($result);
$span .= "Way: " . $row[0] . "</span><br><span>";
$span .= "Garage: " . $row[2] . "-(" . $row[1] . ")" . "</span><br><span>";
$span .= "Schedule: " . $row[3] . "A.M. - " . $row[4] . "P.M.</span><br><span>";
$span .= "Price: " . $row[5] . "Baht</span><br><span>";
$span .= "Station: ";

$station_sql = "SELECT Station.StationName
        FROM Station
        WHERE Station.BusNo='$no'";
$second_result = mysqli_query($connection, $station_sql);
while($row = mysqli_fetch_array($second_result)) {
  $span .= $row[0] . " ";
}
$span .= "</span>";
echo $span;
disconnect($connection)
 ?>
