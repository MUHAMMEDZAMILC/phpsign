<?php 
  include 'connection.php';
  $email = $_POST['email'];
  $password = $_POST['password'];
  $sql = mysqli_query($conn,"SELECT * FROM login where email = '$email' && password = '$password'");
  if(mysqli_num_rows($sql)>0)
  {
    echo "login successfully";
    echo json_decode("Sucess")
  }
  else
  {
    echo "login failed";
    echo json_decode("Failed");
  }
?>