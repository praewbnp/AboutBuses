<?php
  include 'connection.php';
  $connection = connect();

  if (mysqli_connect_errno())
      {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
      }

  $staff = "SELECT * FROM Staff";
  $result = mysqli_query($connection, $showStaff);
  echo json_encode($result);
  disconnect($connection);
 ?>
