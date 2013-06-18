<?php /**/ ?><?php

/*
 * Sends emails and parses email templates for sending.
 */
class message {
	
	private $to;
	private $subject;
	private $body;
	private $headers;

  const template_reminder = 'junior_class_reminder.html';
  const template_confirmation = 'junior_class_confirmation.html';
  /*
   * Send email
   */
	private function send() {

        global $from_address;

		// To send HTML mail, the Content-type header must be set
	
		$this->headers = 
			'MIME-Version: 1.0' . '\r\n' .
			'Content-type: text/html; charset=iso-8859-1' . '\r\n' .
			'From: Sail Salem <' . $from_address . '>\r\n' .
	    'Reply-To: Sail Salem <' . $from_address . '>\r\n' .
	    'X-Mailer: PHP/' . phpversion();
		
		mail($this->to, $this->subject, $this->body, $this->headers);

	}

  /*
   * Public function to access send function directly.
   */
  function send_email($to, $subject, $body) {
    $this->to = $to;
    $this->subject = $subject;
    $this->body = $body;
    $this->send();
  }
	/*
	 * Merge email template with array of tokens and then call the method send
	 *
	 */
  function send_message(array $array, $template) {
    global $path;


    $this->body = file_get_contents($path[0] . '/emails/' . $template, FILE_USE_INCLUDE_PATH);

    $this->subject = $array["subject"];

    $to_array = array();
    foreach ($array as $key => $value) {
      if (substr($key, 0, 5) == "email") {
        $to_array[] = $value;
      }

      $token = '[' . strtoupper($key) . ']';
      $this->body = str_replace($token, $value, $this->body);
      $this->subject = str_replace($token, $value, $this->subject);
      $this->subject = str_replace($token, $value, $this->subject);
    }
    $this->to = implode(',', $to_array);
    $this->subject = $array["subject"];
    $this->send();
  }

  /*
   * Takes an array of students and pre-processes the array then sends the array and template reference
   * to message->send_message.
   */
  function pre_process_array (array $results, $template) {

    echo 'Sending Reminders<br/>';
    $row_count =  count($results) or die("There are no results in the array");
    echo "<b>Number of students to send reminders to " . $row_count . "</b><br/><br/>\n\n";

    $row_num = 1;

    // Loop through each row of reminders to send
    foreach ($results as $message_array) {

      /* Add fields */
      $message_array["subject"] = "SAIL SALEM - Thank you for registering";
      $message_array["class_date"] = date("F j, Y", strtotime($message_array["start_date"]));
      $message_array["class_time"] = date("g:i a", strtotime($message_array["start_date"]));

      /* Modify format of fields */
      $message_array["birth_date"] = date("F j, Y", strtotime($message_array["birth_date"]));

      /*! Print results */
      if ($row_num == 1) {
        echo '<div class="block">';
        foreach ($message_array as $key => $value) {
          echo '<div class="block child">';
          echo $key;
          echo '</div>';
        }
        echo '</div>';
      }
      echo '<div class="block">';
      foreach ($message_array as $key => $value) {
        if ($key <> "body") {
          echo '<div class="block child">';
          echo $value;
          echo '</div>';
        }
      }

      $message = new message();
      $message->send_message($message_array, $template);

      echo '<div class="block child">';
      if ( ( trim($message_array["email1"]) == "" ) && ( trim($message_array["email1"]) == "" ) ) {
        echo '<strong style="color=red">No email address </strong>' ;
      } else {
        echo 'Reminder Sent';
      }
      echo '</div>';
      echo '</div>';
      echo '<div>';
      echo $message->to;
      echo '<br/>';
      echo $message->subject;
      echo '<br/>';
      echo $message->body;
      echo '<hr/>';
      $row_num++;
    }
  }

  /*
   * Deprecated - replace with send_message ($array_of_students, $template)
   */
	function send_confirmation(student $student, session_student $session_student) {

    global $path;

    $this->to      = $student->email1 . ", " . $student->email2;
		$this->subject = 'Sail Salem Registration Confirmation for ' . $student->first_name;
		
		$this->body = file_get_contents($path . '/emails/junior_class_confirmation.html', FILE_USE_INCLUDE_PATH);
		
		$sailing_session = new sailing_session();

		$results = $sailing_session->getSessionDetail($session_student);
		
		$row = $results[0];
		
		$class_date = date("F j, Y", strtotime($row['start_date']));
		$class_time = date("g:i a", strtotime($row['start_date']));
		//$class_date = $row['start_date'];
		$student_name = $student->first_name . " " . $student->last_name;
		
		$this->body = str_replace("[CLASS_DATE]", $class_date, $this->body);
		$this->body = str_replace("[CLASS_TIME]", $class_time, $this->body);
		
		
		$this->body = str_replace("[STUDENT_NAME]", $student_name, $this->body);
		$this->body = str_replace("[STUDENT_BIRTHDATE]", date("F j, Y", strtotime($student->birth_date)), $this->body);

    $this->body = str_replace("[CLASS_NAME]", $row["class_name"], $this->body);
    $this->body = str_replace("[MONTH_NAME]", $row["month_name"], $this->body);
    $this->body = str_replace("[DAY_NAME]", $row["day_name"], $this->body);
    $this->body = str_replace("[TIME_OF_DAY]", $row["time_of_day"], $this->body);

		$this->send();
	}

}
