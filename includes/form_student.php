<?php /**/ ?><?php

class form_student {

	var $id_form;
	var $id_student;
	
	var $student_forms = array( "med" => 1, "swim" => 2 );
	
//	function __constructor () {
//		$db = new db;
//	}

	function get () {

		$db = new db;
				
		$query = sprintf("
				SELECT 
					* 
				FROM 
					forms_students
				WHERE
					id_student = %s AND
					id_form = %s
					",
				mysql_real_escape_string($this->start_date, $link),
				mysql_real_escape_string($this->id_sailing_session, $link)
				);
		
		$resultSet = $db->select($query);
		$row = mysql_fetch_array($resultSet);

		$this->id_form = $row['id_form'];
		$this->id_student = $row['id_student'];
		
	}
	
	function insert() {

		$db = new db;
		$link = $db->link();
			$query = sprintf("
				INSERT INTO forms_students 
				SET
					id_form = %s,
					id_student = %s
				",
				$this->id_form,
				$this->id_student
				);
						
			$db->insert("$query");
									
	}

	function delete () {
		
		$db = new db;
		
		$link = $db->link();
				
		$query = sprintf("
			DELETE FROM forms_students 
			WHERE
				id_form = %s AND
				id_student = %s
			",
				$this->id_student,
				$this->id_form
			);

		$db->delete($query);
	}
	
	function deleteFormsByStudent () {
		
		$db = new db;
		
		$link = $db->link();
				
		$query = sprintf("
			DELETE FROM forms_students 
			WHERE
				id_student = %s
			",
				mysql_real_escape_string($this->id_student, $link)
			);

		//echo "<pre>" . $query . "</pre>";
						
		$db->delete($query);
	}
		
	function getByStudent () {
		
		$query = "
				SELECT 
					* 
				FROM 
					forms_students
				WHERE
					id_student = " . $this->id_student;
		
		$db = new db;
		
		$resultSet = $db->select($query);
		
		return $resultSet;
		
	}
	
	function updateStudentForms ( $checked_forms ) {
		
		// Delete all the students forms
		$this->deleteFormsByStudent();
		
		//Insert all the students forms
		foreach ($checked_forms as $form => $value) {
			$this->id_form = $this->student_forms[$form];
			$this->insert();
		}
	}

}
		
?>