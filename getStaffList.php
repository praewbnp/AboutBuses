<?php
  include 'connection.php';
  $connection = connect();

  if (mysqli_connect_errno())
      {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
      }

  $staff = "SELECT * FROM Staff";
  $result = mysqli_query($connection, $showStaff);
  $table = "";
  $table .= "<table>";
  $table .= "<tr><th>StaffID</th>";
  $table .= "<th>FirstName</th>";
  $table .= "<th>LastName</th>";
  $table .= "<th>Gender</th>";
  $table .= "<th>Age</th>";
  $table .= "<th>StaffType</th></tr>";
    while( $row = mysqli_fetch_array($result) ) {
    $table .= "<tr><td>". $row[0] . "</td><td>" . $row[1] . "</td><td>". $row[2] . "</td><td>". $row[3]
            . "</td><td>". $row[4] . "</td><td>". $row[5] . "</td></tr>";
  }
  $table .= "</table>";
  echo $table;
  disconnect($connection);
 ?>
