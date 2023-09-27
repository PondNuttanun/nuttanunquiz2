<?php
echo "Hello";
include('connectDB.php');
    $username = 'Mark123';
    $password = '123';
    $fullname = 'Mark';
   

    $sql = "select * from users where username = '". $username."'";
    echo $sql;
    
?>