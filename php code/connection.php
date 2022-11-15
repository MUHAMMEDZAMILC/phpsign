<?php
    $dbhost = 'localhost';
    $user = 'root';
    $password = '';
    $dbname = 'fluttercrud';
    $conn = new mysqli($dbhost, $user, $password,$dbname);
    if ($conn->connect_error) {
        die("Doesnot connect database");
    }
   
?>
