<?php
  include 'connection.php';
  $connection = connect();

  if (mysqli_connect_errno())
      {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
      }

  $staff = "SELECT * FROM Staff";
  $result = mysqli_query($connection, $staff);
  $spans = "";
    while( $row = mysqli_fetch_array($result) ) {
    $spans .= "<span id='$row[0]'>". $row[0] . "," . $row[1] . ",". $row[2] . ",". $row[3]
            . ",". $row[4] . ",". $row[5] . "</span>";
  }
  echo $spans;
  disconnect($connection);
 ?>
