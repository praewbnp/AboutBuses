<?php
  function connect() {
    $user = "root";
    $pass = "";
    $db = "aboutbus";

    $connection = mysqli_connect( "localhost", $user, $pass, $db );

    return $connection;
  }

  function disconnect( $connection ) {
      mysqli_close( $connection );
  }

 ?>
