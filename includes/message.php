<?php /**/ ?><?php

class message {
	
	private $to;
	private $subject;
	private $body;
	private $headers;
	
	private function send() {

		// To send HTML mail, the Content-type header must be set
	
		$this->headers = 
			'MIME-Version: 1.0' . "\r\n" .
			'Content-type: text/html; charset=iso-8859-1' . "\r\n" . 	
			'From: Sail Salem <jason@sailsalem.org>' . "\r\n" .
	    	'Reply-To: Sail Salem <jason@sailsalem.org>' . "\r\n" .
	    	'X-Mailer: PHP/' . phpversion();
		
		mail($this->to, $this->subject, $this->body, $this->headers);

	}
	
	function send_confirmation($student, $session_student) {
	
		$this->to      = $student->email1 . ", " . $student->email2;
		$this->subject = 'Sail Salem Registration Confirmation for ' . $student->first_name;
		
		$this->body = file_get_contents('/home/getaclew/admin.sailsalem.org/includes/emails/junior_class_confirmation.html', FILE_USE_INCLUDE_PATH);
		
		$sailing_session = new sailing_session();
		
		$session_detail = $sailing_session->getSessionDetail($session_student->id_sailing_session);
		
		$row = mysql_fetch_array($session_detail);
		
		$class_date = date("F j, Y", strtotime($row['start_date']));
		$class_time = date("g:i a", strtotime($row['start_date']));
		//$class_date = $row['start_date'];
		$student_name = $student->first_name . " " . $student->last_name;
		
		$this->body = str_replace("[CLASS_DATE]", $class_date, $this->body);
		$this->body = str_replace("[CLASS_TIME]", $class_time, $this->body);
		
		
		$this->body = str_replace("[STUDENT_NAME]", $student_name, $this->body);
		$this->body = str_replace("[STUDENT_BIRTHDATE]", date("F j, Y", strtotime($student->birth_date)), $this->body);
	
		$this->send();
	}
	
	function send_junior_class_reminder($student, $session_student) {
	
		$student_name = $student->first_name . " " . $student->last_name;
		
		$this->to      = $student->email1;
		$this->subject = 'Sail Salem Class Reminder for [STUDENT_NAME]';
		$this->subject = str_replace("[STUDENT_NAME]", $student_name, $this->subject);
		
		// TODO: Update this template before beginning of year.
		$this->body = file_get_contents('/home/getaclew/admin.sailsalem.org/includes/emails/junior_class_reminder_one.html', FILE_USE_INCLUDE_PATH);
		
		$sailing_session = new sailing_session();
		
		$session_detail = $sailing_session->getSessionDetail($session_student->id_sailing_session);
		
		$row = mysql_fetch_array($session_detail);
		
		$class_date = date("F j, Y", strtotime($row['start_date']));
		$class_time = date("g:i a", strtotime($row['start_date']));
		//$class_date = $row['start_date'];
		
		
		$this->body = str_replace("[CLASS_DATE]", $class_date, $this->body);
		$this->body = str_replace("[CLASS_TIME]", $class_time, $this->body);
		
		
		$this->body = str_replace("[STUDENT_NAME]", $student_name, $this->body);
		$this->body = str_replace("[STUDENT_BIRTHDATE]", date("F j, Y", strtotime($student->birth_date)), $this->body);
	
		$this->send();
	}
}
	
?>
