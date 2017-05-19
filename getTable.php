<html>
<head>
    <style type="text/css">
    table {
        margin: 8px;
        font-family: "Trebuchet MS", Helvetica, sans-serif;

    }
    th {
          width: 300px;
          background-color: #2d2d30;
          color: white;
          padding: 2px;
          font-size:1.1em;
    }
    td {
          background-color: f5f5f5;
          color: black;
          padding: 2px;
          font-size: 1em;
    }
    </style>
</head>
<body>

<?php
   include 'connection.php';
   $gate = $_POST['gate'];
   $type = $_POST['type'];
   $province = $_POST['province'];
   $stationID = $_POST['station'];
  $connection = connect();
  if (mysqli_connect_errno())
        {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
      }
  if( $type == "All" ) {
    $sql = "SELECT bus.BusNo, bus.BusDesc, bus.BusType, bus.StationName, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
            FROM (SELECT Bus.BusNo, Bus.BusDesc, Bus.BusType, Station.StationName
                  FROM Bus CROSS JOIN Station
                  WHERE Bus.Gate='$gate' AND Station.StationID='$stationID' ) as bus
                  CROSS JOIN
                  (SELECT DISTINCT driver.BusNo as BusNo, driver.BusType as BusType, driver.FirstName as driverFirstName, driver.LastName as driverLastName, driver.StaffType as driverType, bag.FirstName as bagFirstName, bag.LastName as bagLastName, bag.StaffType as bagType
                              FROM (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                                    FROM Staff CROSS JOIN Enrollment
                                    WHERE Staff.StaffID=Enrollment.StaffID) as driver
                                    CROSS JOIN
                                   (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                                    FROM Staff CROSS JOIN Enrollment
                                    WHERE Staff.StaffID=Enrollment.StaffID) as bag
                              WHERE driver.BusNo=bag.BusNo AND driver.StaffType<>bag.StaffType AND driver.StaffType='Driver' AND driver.BusType=bag.BusType) as staff
            WHERE bus.BusNo=staff.BusNo AND staff.BusType=bus.BusType";
  } else {
    $sql = "SELECT bus.BusNo, bus.BusDesc, bus.BusType, bus.StationName, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
            FROM (SELECT Bus.BusNo, Bus.BusDesc, Bus.BusType, Station.StationName
                  FROM Bus CROSS JOIN Station
                  WHERE Bus.Gate='$gate' AND Bus.BusType='$type' AND Station.StationID='$stationID' ) as bus
                  CROSS JOIN
                  (SELECT DISTINCT driver.BusNo as BusNo, driver.BusType as BusType, driver.FirstName as driverFirstName, driver.LastName as driverLastName, driver.StaffType as driverType, bag.FirstName as bagFirstName, bag.LastName as bagLastName, bag.StaffType as bagType
                              FROM (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                                    FROM Staff CROSS JOIN Enrollment
                                    WHERE Staff.StaffID=Enrollment.StaffID) as driver
                                    CROSS JOIN
                                   (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                                    FROM Staff CROSS JOIN Enrollment
                                    WHERE Staff.StaffID=Enrollment.StaffID) as bag
                              WHERE driver.BusNo=bag.BusNo AND driver.StaffType<>bag.StaffType AND driver.StaffType='Driver' AND driver.BusType=bag.BusType) as staff
            WHERE bus.BusNo=staff.BusNo AND staff.BusType=bus.BusType";
  }
  $result = mysqli_query($connection, $sql);
  $table = "";
  $table .= "<table border=1>";
  $table .= "<tr><th>BusNo</th>";
  $table .= "<th>BusDesc</th>";
  $table .= "<th>BusType</th>";
  $table .= "<th>StationName</th>";
  $table .= "<th>FirstName</th>";
  $table .= "<th>LastName</th>";
  $table .= "<th>StaffType</th>";
  $table .= "<th>FirstName</th>";
  $table .= "<th>LastName</th>";
  $table .= "<th>StaffType</th></tr>";
  while( $row = mysqli_fetch_array($result) ) {
    $table .= "<tr><td>". $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td>" . $row[4] . "</td><td>" . $row[5] . "</td><td>" .
    $row[6] . "</td><td>" . $row[7] . "</td><td>" . $row[8] . "</td><td>" . $row[9] . "</td></tr>";
  }
  echo $table;
  disconnect( $connection );
 ?>

</body>
</html>

