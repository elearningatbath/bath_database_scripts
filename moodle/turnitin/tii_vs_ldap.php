<?php

ini_set('max_execution_time',0);

ob_start();
$server = "ldap.bath.ac.uk";
$ldapc = ldap_connect($server);
$attributes = array("mail");
$get_old_users = get_tii_users(); // MYSQL -  go to the tiiusers db and users table
$count = 0;


foreach($get_old_users as $tiiuser){
    $email = $tiiuser['email'];
    //Extracted the email to get the username
    $username = strstr($email,'@',true);
    //$email = "sf427@bath.ac.uk";
    $sr = ldap_search($ldapc, "ou=people,o=bath.ac.uk","(|(mail={$email})(mailAll={$email}))");

    if (ldap_count_entries($ldapc, $sr) === 0) {
        $count++;
        echo $email.",0 <br/>";
        $export_users[] = $tiiuser;
    }
}
echo $count;

//print_r($export_users);

function get_tii_users(){
    $server = 'localhost';
    $username = 'root';
    $password = 'password';
    $emailfilter = 'bath.ac.uk';
    $dbname = 'turnitin_users';
    $conn = new mysqli($server, $username, $password,$dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    else{
        $sql = "SELECT * FROM `users`  WHERE email LIKE '%bath.ac.uk'  ";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $tii_users[] = $row;
            }
            return $tii_users;
        }
    }
}