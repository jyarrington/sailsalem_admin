<?php /**/ ?><?php

class session_student {

	var $id_sailing_session;
	var $id_student;
	
//	function __constructor () {
//		$db = new db;
//	}

	function insert() {

		$db = new db;
	
		$link = $db->link();
		
			$query = sprintf("
				INSERT INTO session_students 
				SET
					id_sailing_session = %s,
					id_student = %s
				",
				mysql_real_escape_string($this->id_sailing_session, $link),
				mysql_real_escape_string($this->id_student, $link)
				);
				
			$db->insert("$query");
									
	}

	function delete () {
		
		$db = new db;
		
		$link = $db->link();
				
		$query = sprintf("
			DELETE FROM session_students 
			WHERE
				id_sailing_session = %s AND
				id_student = %s
			",
				mysql_real_escape_string($this->id_sailing_session, $link),
				mysql_real_escape_string($this->id_student, $link)
			);

		$db->delete($query);
	}

	function deleteSessionsByStudent () {
		
		$db = new db;
		
		$link = $db->link();
				
		$query = sprintf("
			DELETE FROM session_students 
			WHERE
				id_student = %s
			",
				mysql_real_escape_string($this->id_student, $link)
			);

		//echo "<pre>" . $query . "</pre>";
						
		$db->delete($query);
	}
	
	function getBySailingSession () {
		
		$query = "
				SELECT 
					* 
				FROM 
					session_students
				WHERE
					id_sailing_session = " . $this->id_sailing_session;
		
		$db = new db;
		
		$resultSet = $db->select($query);
		$row = mysql_fetch_array($resultSet);

		$this->id_sailing_session = $row['id_sailing_session'];
		$this->id_student = $row['id_student'];
		
	}
	
	function getByStudent () {
		
		$query = "
				SELECT 
					* 
				FROM 
					session_students
				WHERE
					id_student = " . $this->id_student;
		
		$db = new db;
		
		// print $query;
		
		$resultSet = $db->select($query) or die("session_student->getByStudent():" . mysql_error() . $query);
//		$row = mysql_fetch_array($resultSet);

//		$this->id_sailing_session = $row['id_sailing_session'];
//		$this->id_student = $row['id_student'];
    return $resultSet;
		
	}
}
		
?>