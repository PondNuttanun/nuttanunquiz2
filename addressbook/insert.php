<?php
    include('connectDB.php');

    $username = $_POST['username'];
    $password = $_POST['password'];
    $fullname = $_POST['fullname'];
   

    // $username = 'Mark123';
    // $password = '123';
    // $fullname = 'Mark';
   

    $sql = "select * from users where username = '". $username."'";
    // echo $sql;

    //$sql = "select * from user where username = 'peter' and password = '123'";

    $result = mysqli_query($con, $sql);
    $count = mysqli_num_rows($result);

    if($count == 1){
        echo json_encode('Error');
    }else{
        // echo "insert data";
        // $sql2 = "insert into user (username,password,fullname) values ('".  $username . "','". $password. "','". $fullname ."')";

        //echo $sql2;

        // $result2 = mysqli_query($con, $sql2);
        // if ($con->query($sql2) === TRUE) {
        //     echo "New record created successfully";
        //   } else {
        //     echo "Error: " . $sql . "<br>" . $conn->error;
        //   }
        // $con->close();
        
        $sql2 = "insert into users (username,password,fullname) values (?,?,?)";
        
        $statement = $con->prepare($sql2);
        $statement->bind_param('sss',$username,$password,$fullname);
    
        //i: integer, s:string, d:double, b:blob
        
        if($statement->execute()){
            // echo "after insert data";
            // print "Success!!" .  $con->insert_id;
            // echo $statement->affected_rows;
            echo json_encode('Success');
        }else{
            // echo "error somewhere";
            // echo $statement->error;
            echo json_encode('insertError');
        }
        $statement->close();
    }
?>