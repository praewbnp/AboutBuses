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
          background-color: #ffffff
          ;
          color: black;
          padding: 2px;
          font-size: 1em;
    }
    </style>
</head>
<body>
  <?php
    include 'connection.php';
    $connection = connect();
    if (mysqli_connect_errno())
        {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }
    $staff = "SELECT * FROM Staff";
    $result = mysqli_query($connection, $staff);
    $table = "";
    $table .= "<table id='table'>";
    $table .= "<tr><th>StaffID</th>";
    $table .= "<th>FirstName</th>";
    $table .= "<th>LastName</th>";
    $table .= "<th>Gender</th>";
    $table .= "<th>Age</th>";
    $table .= "<th>StaffType</th>";
    $table .= "<th>Delete</th></tr>";
      while( $row = mysqli_fetch_array($result) ) {
        $id = $row[0];
      $table .= "<tr><td>". $row[0] . "</td><td>" . $row[1] . "</td><td>". $row[2] . "</td><td>". $row[3]
              . "</td><td>". $row[4] . "</td><td>". $row[5] . "</td><td>" . " <input type='image' id='$id' src='/aboutbuses/images/trash.png' alt='Submit' width='24' height='24' onclick='deleteRow(this)' >" . "</td></tr>";
    }
    $table .= "</table>";
    echo $table;
    disconnect($connection);
   ?>
 </body>
 </html>
