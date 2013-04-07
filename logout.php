<?php /**/ ?><?php
session_start();
include ( 'config.php');

// if the user is logged in, unset the session
if (isset($_SESSION['admin_is_logged_in'])) {
   unset($_SESSION['admin_is_logged_in']);
   unset($_SESSION['admin_role']);
}

// now that the user is logged out,
// go to login page
header('Location: login.php');
?>