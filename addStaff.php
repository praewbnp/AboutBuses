<?php
  include 'connection.php';
  $firstname = $_POST['firstname'];
  $lastname = $_POST['lastname'];
  $gender = $_POST['gender'];
  $type = $_POST['type'];
  $age = intval($_POST['age']);
  $connection = connect();
  $previouslist_sql = "SELECT * FROM Staff";
  $result = mysqli_query($connection, $previouslist_sql);
  $num = mysqli_num_rows($result) + 1;
  $id = "S$num";
  $sql = "INSERT INTO `Staff`(`StaffID`, `FirstName`, `LastName`, `Gender`, `Age`, `StaffType`)
  VALUES ('$id','$firstname','$lastname','$gender','$age','$type')";
  $result = mysqli_query($connection, $sql);
  disconnect($connection);
 ?>
