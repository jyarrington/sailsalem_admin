<?php /**/ ?><?php
// we must never forget to start the session
session_start();
include ( 'config.php');
include_once ('db.php');
include_once ( 'user.php');
ob_start();
$errorMessage = '';

if ( isset($_POST['txtUserId']) && isset($_POST['txtPassword']) ) {
	// check if the username and password combination is correct

	$user = new user();
	
	$user->UserName = $_POST['txtUserId'];
	$user->Password = $_POST['txtPassword'];

	echo $user->UserName;
	echo $user->Password;
	
	$resultSet = $user->getAuthentication();
	
	$row = mysql_fetch_array($resultSet, MYSQL_ASSOC) ;
	
	echo mysql_num_rows($resultSet);
	
	if (mysql_num_rows($resultSet) == 1 ) {
		// the username and password match,
		// set the session
		$_SESSION['admin_is_logged_in'] = true;
		$_SESSION['admin_role'] = $row["role"];
		
		// after login we move to the main page
		header('Location: index.php');
		exit;
	} else {
		$errorMessage = 'Sorry, wrong username / password';
	}
}

?>
<html>
<head>
<title>Basic Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="/admin/styles.css" />
</head>

<body>
<?php
if ($errorMessage != '') {
	?>
<p align="center"><strong><font color="#990000"><?php echo $errorMessage; ?></font></strong></p>
	<?php
}
?>
<br>
<center>
<h1>Sail Salem Program Administration</h1>
<p>Access is for authorized personnel only.  There is nothing interesting here anyway, go hack someone else's site.
</p>
</center>
<form action="" method="post" name="frmLogin" id="frmLogin">
<table width="400" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td width="150">User Id</td>
		<td><input name="txtUserId" type="text" id="txtUserId"></td>
	</tr>
	<tr>
		<td width="150">Password</td>
		<td><input name="txtPassword" type="password" id="txtPassword"></td>
	</tr>
	<tr>
		<td width="150">&nbsp;</td>
		<td><input name="btnLogin" type="submit" id="btnLogin" value="Login"></td>
	</tr>
</table>
</form>
</body>
</html>
