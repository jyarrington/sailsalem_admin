<?php /**/ ?><?php

class session_student {

  //BUG - WE can't assume only one session anymore.
	var $id_sailing_session;
	var $id_student;

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
		
    $resultSet = $db->select($query) or die("session_student->getBySailingSession():" . mysql_error() . $query);
    $results = $db->results_to_array($resultSet);
		return $results;
		
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

    // BUG - This used to assume a single session per student.  So now we aren't setting the id_sailing_session
	$resultSet = $db->select($query) or die("session_student->getByStudent():" . mysql_error() . $query);
    $results = $db->results_to_array($resultSet);
    return $results;
		
	}
}
		
?>