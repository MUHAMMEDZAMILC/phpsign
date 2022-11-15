<?php
  $db = mysqli_connect('localhost','root','','fluttercrud');
  if(!$db)
  {
    echo " Database connection failed!";
  }
  $username = $_POST['username'];
  $email = $_POST['email'];
  $number = $_POST['phonenumber'];
  $password = $_POST['password'];

  $sql = "SELECT username from user WHERE username = '$username'";
  $result = mysqli_query($db,$sql);
  $count = mysqli_num_rows($result);
  if ($count ==1) {
    echo json_encode("Error");
  }
  else
  {
    $insert = "INSERT INTO login (email,password) VALUES ('$email','$password')";
    $query1 = mysqli_query($db,$insert);
    $user_id = mysqli_insert_id($db);
    $insertreg = "INSERT INTO user (username,phonenumber,log_id) VALUES ('$username','$password','$user_id')";
    $query2= mysqli_query($db,$insertreg);
    if ($query1 && $query2) {
        echo json_encode("Success");
    }
  }
?>