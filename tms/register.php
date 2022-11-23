<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Form </title><!-- Bootstrap css -->
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
rel="stylesheet">
<!-- js -->
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js
"></script>

<link rel="stylesheet" href="style.css">
</head>

<body style="padding:1%">
<center>
<h1 id="form"></h1>
<div class="form" style="width:60% ;">
<h1 style=" color:black; font-size: large;" id="heading">Registeration
Form</h1>
<form name="myform" method="post" action="<?php echo
htmlspecialchars($_SERVER["PHP_SELF"]); ?>" onsubmit="return validate_form()">

<img class="centre" style="border:3px solid black;border-
radius:70%;" src="profile.jpg" alt="Profile Photo" id="status_profile" width="7%"

height="7%" onclick="changeImage()" name="status_profile">
<div class="form_design" id="name">
<input type="text" name="fname" id="" required
placeholder="Enter Your name"><b><br><span class="form_error"></span></b>
</div>
<div class="form_design" id="email">
<input type="email" name="femail" id="" required
placeholder="Enter E-mail here"><b><br><span class="form_error"> </span></b>
</div>
<div class="form_design" id="phno">
<input type="number" name="fphno" id="" required
placeholder="Enter Phone Number"><b><br><span class="form_error"> </span></b>
</div>
<div class="form_design" id="pass">
<input type="password" name="fpass" id="" required
placeholder="Password"><b><br><span class="form_error"></span></b>
</div>
<div class="form_design" id="cpass">
<input type="password" name="fcpass" id="" required
placeholder="Confirm Password"><b><br><span class="form_error"></span></b>
</div>
<input type="submit" class="button" value="Submit"
id="submitbutton">

<h1 style=" color:black; font-size: large;" id="checker"><a
href="login.php" style="color:black ;text-decoration:none;">Already
Registered?</a></h1>
</center>
</div>
</div>
</form>
<?php
// define variables and set to empty values
$name = $email = $phno = $pass = $cpass = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
$name = test_input($_POST["fname"]);
$email = test_input($_POST["femail"]);
$phno = test_input($_POST["fphno"]);
$pass = test_input($_POST["fpass"]);
$cpass = test_input($_POST["fcpass"]);
}

function test_input($data)
{
$data = trim($data);
$data = stripslashes($data);
$data = htmlspecialchars($data);
return $data;
}
?>
<?php
/* echo "<h2>Your Input:</h2>";
echo $name;

School of Computer Engineering & Technology
Class: Third Year B.Tech CSE (Semester V)
Course: Full Stack Development

echo "<br>";
echo $email;
echo "<br>";
echo $phno;
echo "<br>";
echo $pass;
echo "<br>";
echo $cpass; */
/* if (!function_exists('mysqli_init') && !extension_loaded('mysqli')) {
echo 'We don\'t have mysqli!!!';
} else {
echo 'Phew we have it!';
} */

if ($name != "" && $phno != "" && $email != "" && $pass != "" && $cpass != "")
{
$conn = new MySQLi('localhost', 'root', '', 'regestration_records');
if ($conn == false) {
die("Connection Failed: " . $conn->connect_error);
}
// echo "Connected Successfully";
$query = "INSERT into records
VALUES('$name','$email','$phno','$pass','$cpass');";
// echo $query;
try {
if (mysqli_query($conn, $query) == true) {
throw new Exception('SuccesFully Regestered');
} else {
echo '<script>alert("Already Exists")</script>';
}

} catch (Exception $e) {
echo '<script>alert("SuccesFully Regestered")</script>';
}
}

?>
<script src="algo.js">
</script>
</body>

</html>