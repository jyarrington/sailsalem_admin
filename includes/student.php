<?php /**/ ?><?php

class student {

	var $id_student;
	var $form_number = "NULL";
	var $form_medical_info = "NULL";
	var $form_swim = "NULL";
	var $form_field_trip = "NULL";
	var $paid = "NULL";
	var $first_name;
	var $last_name;
	var $birth_date = "NULL";
	var $address;
	var $city;
	var $state;
	var $zip;
	var $school_grade;
	var $guardian_one_first_name;
	var $guardian_one_last_name;
	var $phone1;
	var $phone2;
	var $email1;
	var $email2;
	var $emergency_phone;
	var $t_shirt_size;
	var $notes;
	var $guardian_two_first_name;
	var $guardian_two_last_name;
	var $form_consent = "NULL";
	
//	function __constructor () {
//		$db = new db;
//	}

	function getStudentID() {

		$db = new db;
	
		$link = $db->link();
		
		$query = sprintf("
			SELECT
				id_student
			FROM
				students 
			WHERE
				first_name = '%s' AND 
				last_name = '%s' AND
				birth_date = '%s'
			",
				mysql_real_escape_string($this->first_name, $link),
				mysql_real_escape_string($this->last_name, $link),
				date('Y-m-d', strtotime($this->birth_date))
			);
				
		$rs_students = $db->select($query);
		
		//echo mysql_num_rows($rs_students);
		
		if (mysql_num_rows($rs_students) > 0) {
			$row = mysql_fetch_array($rs_students);	
			$this->id_student = $row["id_student"];
			echo "Set the student id during the check: " . $this->id_student . "<br>";
		}
					
	}
	
	function insert() {

		if ( trim($this->id_student == '')) { $this->id_student = "NULL"; };
	
		$db = new db;
	
		$link = $db->link();

    $str_birthdate = null;

    if ($this->birth_date !== null) {
       $str_birthdate = date('Y-m-d', strtotime($this->birth_date));
    }

		$query = sprintf("
			INSERT INTO students 
			SET
				id_student = %s,
				first_name = '%s',
				last_name = '%s',
				birth_date = '%s',
				address = '%s',
				city = '%s',
				state = '%s',
				zip = '%s',
				school_grade = '%s',
				guardian_one_first_name = '%s',
				guardian_one_last_name = '%s',
				phone1 = '%s',
				phone2 = '%s',
				email1 = '%s',
				email2 = '%s',
				emergency_phone = '%s',
				notes = '%s',
				guardian_two_first_name = '%s',
				guardian_two_last_name = '%s',
        paid = '%s'
			",
			mysql_real_escape_string($this->id_student, $link),
			mysql_real_escape_string($this->first_name, $link),
			mysql_real_escape_string($this->last_name, $link),
      mysql_real_escape_string($str_birthdate, $link),
			mysql_real_escape_string($this->address, $link),
			mysql_real_escape_string($this->city, $link),
			mysql_real_escape_string($this->state, $link),
			mysql_real_escape_string($this->zip, $link),
			mysql_real_escape_string($this->school_grade, $link),
			mysql_real_escape_string($this->guardian_one_first_name, $link),
			mysql_real_escape_string($this->guardian_one_last_name, $link),
			mysql_real_escape_string($this->phone1, $link),
			mysql_real_escape_string($this->phone2, $link),
			mysql_real_escape_string($this->email1, $link),
			mysql_real_escape_string($this->email2, $link),
			mysql_real_escape_string($this->emergency_phone, $link),
			mysql_real_escape_string($this->notes, $link),
			mysql_real_escape_string($this->guardian_two_first_name, $link),
			mysql_real_escape_string($this->guardian_two_last_name, $link),
      mysql_real_escape_string($this->paid, $link)
			);

    //var_dump($query);

			$this->id_student = $db->insert("$query");
						
			
	}

	function update () {
		
		$db = new db;
		
		$link = $db->link();

    $str_birthdate = null;

    if ($this->birth_date !== null) {
       $str_birthdate = date('Y-m-d', strtotime($this->birth_date));
    }

		$query = sprintf("
			UPDATE students 
			SET
				first_name = '%s',
				last_name = '%s',
				birth_date = '%s',
				address = '%s',
				city = '%s',
				state = '%s',
				zip = '%s',
				school_grade = '%s',
				guardian_one_first_name = '%s',
				guardian_one_last_name = '%s',
				phone1 = '%s',
				phone2 = '%s',
				email1 = '%s',
				email2 = '%s',
				emergency_phone = '%s',
				notes = '%s',
				guardian_two_first_name = '%s',
				guardian_two_last_name = '%s',
				paid = '%s'
			WHERE
				id_student = %s
			",
			mysql_real_escape_string($this->first_name, $link),
			mysql_real_escape_string($this->last_name, $link),
      mysql_real_escape_string($str_birthdate, $link),
			mysql_real_escape_string($this->address, $link),
			mysql_real_escape_string($this->city, $link),
			mysql_real_escape_string($this->state, $link),
			mysql_real_escape_string($this->zip, $link),
			mysql_real_escape_string($this->school_grade, $link),
			mysql_real_escape_string($this->guardian_one_first_name, $link),
			mysql_real_escape_string($this->guardian_one_last_name, $link),
			mysql_real_escape_string($this->phone1, $link),
			mysql_real_escape_string($this->phone2, $link),
			mysql_real_escape_string($this->email1, $link),
			mysql_real_escape_string($this->email2, $link),
			mysql_real_escape_string($this->emergency_phone, $link),
			mysql_real_escape_string($this->notes, $link),
			mysql_real_escape_string($this->guardian_two_first_name, $link),
			mysql_real_escape_string($this->guardian_two_last_name, $link),
      mysql_real_escape_string($this->paid, $link),
			mysql_real_escape_string($this->id_student, $link)

			);

			//var_dump($query);
			
		$db->update($query);
		
	}

  function delete () {

  		$db = new db;

  		$link = $db->link();

  		$query = sprintf("
  			DELETE FROM students
  			WHERE
  				id_student = %s
  			",
  			mysql_real_escape_string($this->id_student, $link)
  			);

  			//var_dump($query);

  		$db->delete($query);

  	}

	function get () {
		
		$query = "
				SELECT 
					* 
				FROM 
					students
				WHERE
					id_student = " . $this->id_student;
		
		
		$db = new db;
		
		$resultSet = $db->select($query) or die("student.get():" . mysql_error() . $query) ;
		$row = mysql_fetch_array($resultSet);

		$this->id_student = $row['id_student'];
		$this->first_name = $row['first_name'];
		$this->last_name = $row['last_name'];
		$this->birth_date = $row['birth_date'];
		$this->address = $row['address'];
		$this->city = $row['city'];
		$this->state = $row['state'];
		$this->zip = $row['zip'];
		$this->school_grade = $row['school_grade'];
		$this->guardian_one_first_name = $row['guardian_one_first_name'];
		$this->guardian_one_last_name = $row['guardian_one_last_name'];
		$this->phone1 = $row['phone1'];
		$this->phone2 = $row['phone2'];
		$this->email1 = $row['email1'];
		$this->email2 = $row['email2'];
		$this->emergency_phone = $row['emergency_phone'];
		$this->notes = $row['notes'];
		$this->guardian_two_first_name = $row['guardian_two_first_name'];
		$this->guardian_two_last_name = $row['guardian_two_last_name'];
    $this->paid = $row['paid'];

		
	}
	
	function getStudents ($id_student, $first_name, $guardian_one_name, $sailing_session ) {

//TODO: This gets a little more complicated now that we have split names
	
		$ar = new ArrayObject;
		
		if (trim($id_student) <> "") {
			$ar["A.id_student"] = $id_student;
		}
		if (trim($first_name) <> "") {
			$ar["A.first_name"] = $first_name;
		}
		if (trim($guardian_one_name) <> "") {
			$ar["A.guardian_one_name"] = $guardian_one_name;
		}
		if (trim($sailing_session) <> "") {
			$ar["B.sailing_session"] = $sailing_session;
		}
		
		$where = '';
		
		foreach ($ar as $column=>$value) {
			$where .= " AND " . $column . " LIKE '%" . $value . "%' ";	 
		}
		
		$query = "
				SELECT 
				    *
				    
				FROM 
				        student_detail
				WHERE
					1=1
				" . $where . "
				ORDER BY
					age
				";

		
		$db = new db;
		
		$resultSet = $db->select($query);

		
		return $resultSet;
						
	}

	function getStudentsDetail ( ) {

//TODO: This gets a little more complicated now that we have split names
			
		$query = "
				SELECT 
				    *
				    
				FROM 
				        student_detail
				";
		
		
		$db = new db;
		
		$resultSet = $db->select($query);

		return $resultSet;
						
	}
	
	function getSessionStudents ($sailing_session ) {

		$ar = new ArrayObject;
				
		$query = "
				SELECT 
					B.*
				FROM 
						session_students AS A
					LEFT JOIN	
						students AS B
						  ON A.id_student = B.id_student
				WHERE
					A.id_sailing_session = " . $sailing_session . "
				";
		
		
		$db = new db;
		
		$resultSet = $db->select($query);

		
		return $resultSet;
						
	}

	
	function getStudentsBySession ($sailing_session ) {
		echo "<pre>" . $sailing_session . "</pre>";	
		if (trim($sailing_session) == "ALL")
		{
			// get all students
			// add nothing to the where clause
			$ar["2"] = "2";
		} else if (trim($sailing_session) <> "") {
			// get just the students from a specific session
			$ar["A.id_sailing_session"] = $sailing_session;
		} else {
			// get all students -- add nothing to the where clause
			$ar["1"] = "0";
		}
		
		$where = '';
		
		foreach ($ar as $column=>$value) {
			$where .= " AND " . $column . " = " . $value;	 
		}
		
		$query = "
				SELECT 
				    B.*, 
				    CASE WHEN F1.id_form IS NULL THEN 0 ELSE 1 END AS form_med,
				    CASE WHEN F2.id_form IS NULL THEN 0 ELSE 1 END AS form_swim
				FROM 
				    session_students AS A
					LEFT JOIN students AS B ON A.id_student = B.id_student
					LEFT JOIN forms_students AS F1 ON B.id_student = F1.id_student AND F1.id_form = 1
					LEFT JOIN form AS FO1 ON F1.id_form = FO1.id_form 
					LEFT JOIN forms_students AS F2 ON B.id_student = F2.id_student AND F2.id_form = 2
					LEFT JOIN form AS FO2 ON F2.id_form = FO2.id_form
				WHERE
					1=1
					AND A.id_student IS NOT NULL
					AND A.id_sailing_session IS NOT NULL
					AND B.id_student IS NOT NULL
				" . $where . "
				ORDER BY
					B.last_name, B.first_name
				";
		
		$db = new db;
		
		echo "<pre>" . ($query) . "</pre>";
		
		$resultSet = $db->select($query);

		
		return $resultSet;
						
	}
	
	function getUnassignedStudents () {
		
		$query = "
			SELECT A.* 
			FROM 
					students AS A
				LEFT JOIN 
					session_students AS B 
				  	  ON A.id_student = B.id_student
			WHERE 
				B.id_student IS NULL " ;
		
		$db = new db;
		
		$resultSet = $db->select($query);
		
		
		return $resultSet;
		
	}
	
}
		
?>