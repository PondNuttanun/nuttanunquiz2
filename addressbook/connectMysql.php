<?php
    $host = "localhost";
    $username = "id16382205_patty";
    $password = "jeqg3y3zCBHq0h{r";
    $db= "id16382205_pattyteacher";

    $con = new mysqli($host,$username,$password,$db);
        if ($con->connect_error)
        {
            die('Error : ('. $con->connect_errno .')'. $con->connect_error);
        }else{
            //echo "Connect sucessful";
        }
    $con->set_charset("utf8"); 

    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "select * from user where username = '". $username."' and password = '". $password."'";

    //$sql = "select * from user where username = 'peter' and password = '123'";

    $result = mysqli_query($con, $sql);
    $count = mysqli_num_rows($result);

    if($count == 1){
        echo json_encode('Completed');
    }else{
        echo json_encode('Error');
    }



?>