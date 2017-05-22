<?php
include 'connection.php';
$no = $_POST['busNo'];
$staffType = $_POST['staffType'];
$busType = $_POST['busType'];

$connection = connect();

$sql = "SELECT Staff.FirstName, Staff.LastName
        FROM Staff INNER JOIN Enrollment
        WHERE Staff.StaffID=Enrollment.StaffID AND Enrollment.BusNo='$no'
              AND Enrollment.BusType='$busType' AND Enrollment.StaffType='$staffType'";
$result = mysqli_query($connection, $sql);
$span = "<span>";
$row = mysqli_fetch_array($result);
$span .= $row[0] . " " . $row[1];
$span .= "</span>";
echo $span;
disconnect($connection)
 ?>
