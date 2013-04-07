<?php

class sailing_session {

	var $start_date;
	var $id_sailing_session = "NULL";
	var $id_sailing_program;
	var $student_limit;
	
//	function __constructor () {
//		$db = new db;
//	}

	function insert() {

		if ( trim($this->id_sailing_session == '')) { $this->id_sailing_session = "NULL"; };
	
		$db = new db;
	
		$link = $db->link();
		
			$query = sprintf("
				INSERT INTO sailing_session 
				SET
					start_date = '%s',
					id_sailing_session = %s,
					id_sailing_program = %s,
					student_limit = %s
				",
				mysql_real_escape_string($this->start_date, $link),
				mysql_real_escape_string($this->id_sailing_session, $link),
				mysql_real_escape_string($this->id_sailing_program, $link),
				mysql_real_escape_string($this->student_limit, $link)
				);
				
			$this->id_sailing_session = $db->insert("$query");
									
			//echo "Sailing Session ID: " . $this->id_sailing_session;

	}

	function update () {
		
		$db = new db;
		
		$link = $db->link();
				
		$query = sprintf("
			UPDATE students 
			SET
					start_date = '%s',
					id_sailing_session = %s,
					id_sailing_program = %s,
					student_limit = %s
			WHERE
				id_sailing_session = %s
			",
				mysql_real_escape_string($this->start_date, $link),
				mysql_real_escape_string($this->id_sailing_session, $link),
				mysql_real_escape_string($this->id_sailing_program, $link),
				mysql_real_escape_string($this->student_limit, $link)
			);

			$db->update($query);
	}
	
	function get () {
		
		$query = "
				SELECT 
					* 
				FROM 
					sailing_session
				WHERE
					id_sailing_session = " . $id_sailing_session;
		
		$db = new db;
		
		$resultSet = $db->select($query);
		$row = mysql_fetch_array($rs);

		$this->start_date = $row['start_date'];
		$this->id_sailing_session = $row['id_sailing_session'];
		$this->id_sailing_program = $row['id_sailing_program'];
		$this->student_limit = $row['student_limit'];
		
	}

	function getSessionStartDates () {
			
		$query = "
				SELECT
					DISTINCT 
					date_format(start_date, '%M %e') AS date_label,
					date(start_date) AS start_date
				FROM 
					sailing_session
				WHERE
					id_sailing_program IN (1,2)
				ORDER BY
					date(start_date)"
		;
		
		$db = new db;
		
		$resultSet = $db->select($query);

		return $resultSet;
		
	}

	function getSessionsByStartDate($start_date) {
		
		$query = "
				SELECT
					A.*,
					B.start_date
				FROM 
						session_detail AS A
					LEFT JOIN
						sailing_session AS B
						  ON A.id_sailing_session = B.id_sailing_session
				WHERE
					A.id_sailing_program IN (1,2)
					AND date(B.start_date) = '" . $start_date . "'   
				ORDER BY
					A.id_sailing_program, B.start_date"
		;
		
		$db = new db;
		
		$resultSet = $db->select($query);

		return $resultSet;
	}
	
	function getSessions ($id_sailing_program) {
	
		$query = "
				SELECT 
					* 
				FROM 
					session_detail
				WHERE
					id_sailing_program = " . $id_sailing_program ;
		
		$db = new db;
		
		$resultSet = $db->select($query);
		
		return $resultSet;
						
	}

	function getSessionDetail ($id_sailing_session) {
	
		$query = "
				SELECT 
					* 
				FROM 
					session_detail
				WHERE
					id_sailing_session = " . $id_sailing_session ;
		
		$db = new db;
		
		// print $query;
		
		$resultSet = $db->select($query) or die("sailing_session->getSessionDetail():" . mysql_error() . $query);
		
		return $resultSet;
						
	}
	
	function getAvailableSessions () {
		
		$query = "
				SELECT 
					* 
				FROM 
					session_detail
				WHERE
					spaces_left > 0
				";
		
		$db = new db;
		
		$resultSet = $db->select($query);
		
		return $resultSet;	
	}
	
	function getAllSessions () {
		
		$query = "
				SELECT 
					* 
				FROM 
					session_detail
				";
		
		$db = new db;
		
		$resultSet = $db->select($query);
		
		return $resultSet;
		
	}

	
}
		
?>