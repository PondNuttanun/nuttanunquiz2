<?php 

    include ('connectDB.php');
    $username = $_POST['username'];
    
    $sql = "select * from users where '". $username ."'" ;
    $query= mysqli_query($con, $sql);
    $result = array();
    while($rs = $query->fetch_assoc()){
        $result[] = $rs;      
    }
    //print_r($result);
    echo json_encode($result);

?>