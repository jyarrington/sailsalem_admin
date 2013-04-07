<?php /**/ ?><?php
// like i said, we must never forget to start the session
session_start();

// is the one accessing this page logged in or not?
if (!isset($_SESSION['admin_is_logged_in'])
    || $_SESSION['admin_is_logged_in'] !== true) {

    // not logged in, move to login page
    header('Location: login.php');
    exit;
} else {
	$role = $_SESSION['admin_role'] ;
}
?>
<html>

<head>
<title>Sail Salem Program Registration</title>

<link type="text/css" href="/includes/css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="/includes/jquery.js"></script>

<link type="text/css" href="/includes/css/jquery-ui-1.8.2.custom.css" rel="stylesheet" ></link>	
<script type="text/javascript" src="/includes/js/jquery-ui-1.8.2.custom.min.js" ></script>


</head>
<body>
<h1>Sail Salem Program Administration</h1>
<div id='menu'>

	
	<p>
	<a href="index.php">Home</a> - 
	<a href="reports.php">Reports</a> - 
	<a href="search.php">Search</a> -
<?php 
	if ( $_SESSION["admin_role"] == 'admin') { 
		echo "<a href='adminregister.php'>New Registration</a> -" ; 
		echo "<a href='bulk_admin.php'>Additional Admin Functions</a>";
	}
?> 
	<a href="logout.php">Logout</a>
	</p>
</div>
<?php

?>