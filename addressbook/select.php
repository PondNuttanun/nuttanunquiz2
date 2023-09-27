<?php 

    include ('connectDB.php');
    
    $sql = "select * from users";
    $query= mysqli_query($con, $sql);
    $result = array();
    while($rs = $query->fetch_assoc()){
        $result[] = $rs;      
    }
    // print_r($result);
    echo json_encode($result);

?>