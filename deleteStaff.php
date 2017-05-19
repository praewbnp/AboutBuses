<?php
  include 'connection.php';
  $id = $_POST['id'];

  $connection = connect();

  $sql = "DELETE FROM `Staff` WHERE StaffID='$id'";
  $result = mysqli_query($connection, $sql);
  disconnect($connection);
 ?>
