<html>
<head>
    <style type="text/css">
    table {
        width: 100%;
        font-family: "Trebuchet MS", Helvetica, sans-serif;
    }
    th {

          color: white;
          padding: 3px;
          font-size:1.1em;
          border-width: thin;
          border-color: #white;
          z-index: 100;
    }
    td {
          background-color: #ffffff;
          color: black;
          padding: 2px;
          font-size: 1em;
          border-width: thin;
          border-color: lightgray;
          z-index: 100;
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
    $check = 0;
    if( $type == "All" && $gate != "" && $province != "" && $stationID != "") { //check
      $sql = "SELECT DISTINCT bus.BusNo, bus.BusDesc, bus.BusType, bus.StationName, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
              FROM (SELECT DISTINCT Bus.BusNo as BusNo, Bus.BusDesc as BusDesc, Bus.BusType as BusType, Station.StationName as StationName
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
    } else if($gate == "" && $province == "" && $type == "All" && $stationID == "") { //check
      $sql = "SELECT DISTINCT bus.BusNo, bus.BusDesc, bus.BusType, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
              FROM (SELECT DISTINCT driver.BusNo as BusNo, driver.BusType as BusType, driver.FirstName as driverFirstName, driver.LastName as driverLastName, driver.StaffType as driverType, bag.FirstName as bagFirstName, bag.LastName as bagLastName, bag.StaffType as bagType
                    FROM (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                          FROM Staff CROSS JOIN Enrollment
                          WHERE Staff.StaffID=Enrollment.StaffID) as driver
                          CROSS JOIN
                          (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                           FROM Staff CROSS JOIN Enrollment
                           WHERE Staff.StaffID=Enrollment.StaffID) as bag
                     WHERE driver.BusNo=bag.BusNo AND driver.StaffType<>bag.StaffType AND driver.StaffType='Driver' AND driver.BusType=bag.BusType) as staff
                     LEFT JOIN Bus as bus ON bus.BusNo=staff.BusNo AND bus.BusType=staff.BusType";
      $check = 1;
    } else if($gate == "" && $province == "" && $type != "All" && $stationID == "") { //check
      $sql = "SELECT DISTINCT bus.BusNo, bus.BusDesc, bus.BusType, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
              FROM  (SELECT DISTINCT driver.BusNo as BusNo, driver.BusType as BusType, driver.FirstName as driverFirstName, driver.LastName as driverLastName, driver.StaffType as driverType, bag.FirstName as bagFirstName, bag.LastName as bagLastName, bag.StaffType as bagType
                    FROM (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                          FROM Staff CROSS JOIN Enrollment
                          WHERE Staff.StaffID=Enrollment.StaffID) as driver
                          CROSS JOIN
                          (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                           FROM Staff CROSS JOIN Enrollment
                           WHERE Staff.StaffID=Enrollment.StaffID) as bag
                     WHERE driver.BusNo=bag.BusNo AND driver.StaffType<>bag.StaffType AND driver.StaffType='Driver' AND driver.BusType=bag.BusType) as staff
                     RIGHT JOIN (SELECT Bus.BusNo as BusNo, Bus.BusDesc as BusDesc, Bus.BusType as BusType
                                 FROM Bus
                                 WHERE Bus.BusType='$type') as bus
                     ON bus.BusNo=staff.BusNo AND bus.BusType=staff.BusType";
      $check = 1;
    } else if($gate != "" && $province == "" && $type != "All" && $stationID == "") {//check
      $sql = "SELECT DISTINCT bus.BusNo, bus.BusDesc, bus.BusType, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
              FROM  (SELECT DISTINCT driver.BusNo as BusNo, driver.BusType as BusType, driver.FirstName as driverFirstName, driver.LastName as driverLastName, driver.StaffType as driverType, bag.FirstName as bagFirstName, bag.LastName as bagLastName, bag.StaffType as bagType
                    FROM (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                          FROM Staff CROSS JOIN Enrollment
                          WHERE Staff.StaffID=Enrollment.StaffID) as driver
                          CROSS JOIN
                          (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                           FROM Staff CROSS JOIN Enrollment
                           WHERE Staff.StaffID=Enrollment.StaffID) as bag
                     WHERE driver.BusNo=bag.BusNo AND driver.StaffType<>bag.StaffType AND driver.StaffType='Driver' AND driver.BusType=bag.BusType) as staff
                     RIGHT JOIN (SELECT Bus.BusNo as BusNo, Bus.BusDesc as BusDesc, Bus.BusType as BusType
                                 FROM Bus
                                 WHERE Bus.Gate='$gate' AND Bus.BusType='$type') as bus
                     ON bus.BusNo=staff.BusNo AND bus.BusType=staff.BusType";
      $check = 1;
    } else if($gate != "" && $province == "" && $type == "All" && $stationID == "") {//check
      $sql = "SELECT DISTINCT bus.BusNo, bus.BusDesc, bus.BusType, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
              FROM  (SELECT DISTINCT driver.BusNo as BusNo, driver.BusType as BusType, driver.FirstName as driverFirstName, driver.LastName as driverLastName, driver.StaffType as driverType, bag.FirstName as bagFirstName, bag.LastName as bagLastName, bag.StaffType as bagType
                    FROM (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                          FROM Staff CROSS JOIN Enrollment
                          WHERE Staff.StaffID=Enrollment.StaffID) as driver
                          CROSS JOIN
                          (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                           FROM Staff CROSS JOIN Enrollment
                           WHERE Staff.StaffID=Enrollment.StaffID) as bag
                     WHERE driver.BusNo=bag.BusNo AND driver.StaffType<>bag.StaffType AND driver.StaffType='Driver' AND driver.BusType=bag.BusType) as staff
                     RIGHT JOIN (SELECT Bus.BusNo as BusNo, Bus.BusDesc as BusDesc, Bus.BusType as BusType
                                 FROM Bus
                                 WHERE Bus.Gate='$gate') as bus
                     ON bus.BusNo=staff.BusNo AND bus.BusType=staff.BusType";
      $check = 1;
    } else if($gate != "" && $province != "" && $type == "All" && $stationID == "") {
      $sql = "SELECT DISTINCT bus.BusNo, bus.BusDesc, bus.BusType, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
              FROM  (SELECT DISTINCT driver.BusNo as BusNo, driver.BusType as BusType, driver.FirstName as driverFirstName, driver.LastName as driverLastName, driver.StaffType as driverType, bag.FirstName as bagFirstName, bag.LastName as bagLastName, bag.StaffType as bagType
                    FROM (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                          FROM Staff CROSS JOIN Enrollment
                          WHERE Staff.StaffID=Enrollment.StaffID) as driver
                          CROSS JOIN
                          (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                           FROM Staff CROSS JOIN Enrollment
                           WHERE Staff.StaffID=Enrollment.StaffID) as bag
                     WHERE driver.BusNo=bag.BusNo AND driver.StaffType<>bag.StaffType AND driver.StaffType='Driver' AND driver.BusType=bag.BusType) as staff
                     RIGHT JOIN (SELECT Bus.BusNo as BusNo, Bus.BusDesc as BusDesc, Bus.BusType as BusType
                                 FROM Bus CROSS JOIN Station
                                 WHERE Bus.Gate='$gate' AND Station.Province='$province' AND Bus.BusNo=Station.BusNo) as bus
                     ON bus.BusNo=staff.BusNo AND bus.BusType=staff.BusType";
      $check = 1;
    } else if($gate != "" && $province != "" && $type != "All" && $stationID == "") {
      $sql = "SELECT DISTINCT bus.BusNo, bus.BusDesc, bus.BusType, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
              FROM  (SELECT DISTINCT driver.BusNo as BusNo, driver.BusType as BusType, driver.FirstName as driverFirstName, driver.LastName as driverLastName, driver.StaffType as driverType, bag.FirstName as bagFirstName, bag.LastName as bagLastName, bag.StaffType as bagType
                    FROM (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                          FROM Staff CROSS JOIN Enrollment
                          WHERE Staff.StaffID=Enrollment.StaffID) as driver
                          CROSS JOIN
                          (SELECT Enrollment.BusNo, Enrollment.BusType, Staff.FirstName, Staff.LastName, Staff.StaffType
                           FROM Staff CROSS JOIN Enrollment
                           WHERE Staff.StaffID=Enrollment.StaffID) as bag
                     WHERE driver.BusNo=bag.BusNo AND driver.StaffType<>bag.StaffType AND driver.StaffType='Driver' AND driver.BusType=bag.BusType) as staff
                     RIGHT JOIN (SELECT Bus.BusNo as BusNo, Bus.BusDesc as BusDesc, Bus.BusType as BusType
                                 FROM Bus
                                 WHERE Bus.Gate='$gate') as bus
                     ON bus.BusNo=staff.BusNo AND bus.BusType=staff.BusType";
      $check = 1;
    } else { //check when gate not null and province not null and station not null and type not all
      $sql = "SELECT DISTINCT bus.BusNo, bus.BusDesc, bus.BusType, bus.StationName, staff.driverFirstName, staff.driverLastName, staff.driverType, staff.bagFirstName, staff.bagLastName, staff.bagType
              FROM (SELECT DISTINCT Bus.BusNo, Bus.BusDesc, Bus.BusType, Station.StationName
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
    $table .= "<table id='display_Table' border=1>";
    if($check == 1) {
      $table .= "<tr><th>BusNo</th>";
      $table .= "<th>BusDesc</th>";
      $table .= "<th>BusType</th>";
      $table .= "<th>FirstName</th>";
      $table .= "<th>LastName</th>";
      $table .= "<th>StaffType</th>";
      $table .= "<th>FirstName</th>";
      $table .= "<th>LastName</th>";
      $table .= "<th>StaffType</th></tr>";
      if(mysqli_num_rows($result) == 0) {
        $table = "<p>No data is matched.</p>";
      } else {
          while( $row = mysqli_fetch_array($result) ) {
            $table .= "<tr><td>". $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td>" . $row[4] . "</td><td>" . $row[5] . "</td><td>" .
            $row[6] . "</td><td>" . $row[7] . "</td><td>" . $row[8] . "</td></tr>";
          }
          $table .= "</table>";
      }
    } else {
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
      if(mysqli_num_rows($result) == 0) {
        $table = "<p>No data is matched.</p>";
      } else {
        while( $row = mysqli_fetch_array($result) ) {
          $table .= "<tr><td>". $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td>" . $row[4] . "</td><td>" . $row[5] . "</td><td>" .
          $row[6] . "</td><td>" . $row[7] . "</td><td>" . $row[8] . "</td><td>" . $row[9] . "</td></tr>";
        }
        $table .= "</table>";
      }
    }
    echo $table;
    disconnect( $connection );
   ?>
 </body>
 </html>
