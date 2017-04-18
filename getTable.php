<?php
   include 'connection.php';
   $gate = $_POST['gate'];
   $type = $_POST['type'];
   $province = $_POST['province'];

  $connection = connect();

  if (mysqli_connect_errno())
        {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }


  $sql = "SELECT BusNo, BusDesc, BusType FROM bus WHERE Gate='$gate' AND BusType='$type'";
  $result = mysqli_query($connection, $sql);
  $table = "";

  $table .= "<table border=1>";

  if( $gate != "" ) {
    $table .= "<tr><th>BusNo</th>";
  }

  if( $type != "" ) {
    $table .= "<th>BusDesc</th>";
    $table .= "<th>BusType</th></tr>";
  }

  while( $row = mysqli_fetch_array($result) ) {
    $table .= "<tr><td>". $row['BusNo'] . "</td><td>" . $row['BusDesc'] . "</td><td>" . $row['BusType'] . "</td></tr>";
  }
  $table .= "</table>";
  echo $table;
  disconnect( $connection );
 ?>
