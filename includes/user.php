<?php /**/ ?><?php

class user {

	var $UserAuthenticationID;
	var $UserName;
	var $Password;
	var $Role;
	
//	function __constructor () {
//		$db = new db;
//	}

	function getAuthentication () {
	
		$db = new db;
				
		$query = sprintf("
				SELECT 
					role 
				FROM 
					UserAuthentication
				WHERE
					UserName = '%s'
					AND Password = '%s'",
				$this->UserName,
				$this->Password
				);
				
		$resultSet = $db->select($query);
		
		return $resultSet;
	}
	
}


	
//$di = new dataInterface;
//
//$resultSet = $di->getRegistrations("", "", "", "Jun 30");
//
//		echo "<pre>";
//		while ($row = mysql_fetch_array($resultSet, MYSQL_ASSOC)) {
//			foreach ($row as $column=>$value) {
//				echo $value . ',';
//			}
//			echo "\n";
//		    echo $row['registrationNumber'] . ': ' . $row['studentName'] . " " . $row['Mother'] . " " . $row['AssignedSession'] . "<br>\n";
//		}
//		echo "</pre>";
		
?>