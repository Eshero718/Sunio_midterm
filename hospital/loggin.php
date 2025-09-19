<?php
$conn = mysqli_connect("localhost", "root", "", "hospital");

if(!$conn){
    die("connection failed");
}

$email = $_POST['email'];
$password = $_POST ['password'];

$sql = "SELECT * FROM doctortable WHERE email = '$email' AND password = '$password'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0){
    echo "success";
    exit();
} else {
    echo "login failed";
}

mysqli_close ($conn);
?>
