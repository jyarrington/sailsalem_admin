<?php /**/ ?><?php 

include('config.php');
include ('db.php') ;
require_once ('controls.php');
include ('student.php');
include ('sailing_session.php');
include ('session_student.php');
include ('page.php');
include ('message.php');

class templates {

    const one = "junior_class_reminder_one.html";
    const two = "junior_class_reminder.html";
    // etc.
}
	
class bulk_admin {
	
	function send_confirmations () {
		echo "Sending Confirmations <br />" ;
		
		$student = new student();
		
		$resultSet = $student->getStudents($id, $studentName, "", $assignedSession);		
		
		$row_count = mysql_num_rows($resultSet) or die("display_db_query:" . mysql_error());
		echo "<b>Number of children enrolled " . $row_count . "</b><br/><br/>\n\n";
		
		$column_count = mysql_num_fields($resultSet) or die("display_db_query:" . mysql_error());
				
		// optionally print a bold header at top of table
		
		for ($column_num = 0; $column_num < $column_count; $column_num++) {
			$field_name = mysql_field_name($resultSet, $column_num);
			
		}
		
		// print the body of the table
		while ($row = mysql_fetch_array($resultSet))
		{
				echo $row["email1"] . " -- " . $row["id_student"] . " -- " . $row["first_name"] . " -- " . $row["last_name"] . "<br/>";
			
				$student->id_student = $row["id_student"];
				$student->get();
				
				$session_student = new session_student();
				
				$session_student->id_student = $student->id_student;
				
				//print "line 45 <br/>";
				// TODO: Check this.
				$session_student->getByStudent();
				
				//print "line 46 <br />";
				$message = new message();
					
				$message->send_confirmation($student, $session_student);
					
				print("Confirmation Sent <br/>\n");	
		
		}

	}

	function send_junior_reminders ($class_date="ALL") {

		echo "Sending Reminders <br />" ;
		
		$student = new student();
		
		// If the class_date is ALL, then select all the students
		// pass a blank to getStudentsBySession will return all students
		
		// If the class_date equals "next_week" then select all classes that begin in
		// the next 7 days.
		
		$admin = new bulk_admin();
		
		if (trim($class_date) == "ALL") {
			//set sailing_session to ALL
			//getStudentsBySession

			$resultSet = $student->getStudentsBySession("ALL");
			
			send_reminder($resultSet) ;
			
		} else if (trim($class_date) <> "") {
			// select all classes that start on the class date sent
			//TODO: Build this code
			$sailing_session = new sailing_session();
			$session = $sailing_session->getSessionsByStartDate($class_date);
			while ($row = mysql_fetch_array($session)) {
				$resultSet = $student->getStudentsBySession($row["id_sailing_session"]);
				send_reminder($resultSet);
			}
		}

	}
}

	function send_reminder ($resultSet) {

		$student = new student();
				
		$row_count = mysql_num_rows($resultSet) or die("display_db_query:" . mysql_error());
		echo "<b>Number of children enrolled " . $row_count . "</b><br/><br/>\n\n";
		
		$column_count = mysql_num_fields($resultSet) or die("display_db_query:" . mysql_error());
				
		// optionally print a bold header at top of table
	
		for ($column_num = 0; $column_num < $column_count; $column_num++) {
			$field_name = mysql_field_name($resultSet, $column_num);
			
		}
		
		// print the body of the table
		while ($row = mysql_fetch_array($resultSet))
		{
				echo $row["email1"] . ", " . $row["email2"] . " -- " . $row["id_student"] . " -- " . $row["first_name"] . " -- " . $row["last_name"];
			
				$student->id_student = $row["id_student"];
				$student->get();
				
				$session_student = new session_student();
				
				$session_student->id_student = $student->id_student;
				$session_student->getByStudent();
				
				$message = new message();
					
				$message->send_junior_class_reminder($student, $session_student);

				if ( ( trim($row["email1"]) == "" ) && ( trim($row["email1"]) == "" ) ) {
					print("-- <strong style='color=red'>No email address </strong> <br />") ;
				} else {
					print("-- Reminder Sent <br />");
				}	
		
		}
		
	}


$page = new page;
$bulk_admin = new bulk_admin();


//$page->echoHeader();
include('menu.php');

?>
<h3>Note</h3>
<p>Clicking a link sends emails to a lot of people.  Please confirm whether it has already been sent.</p>
<a href="bulk_admin.php?send_confirmations">Send All Confirmations</a> -- <a href="/includes/emails/junior_class_confirmation.html" target="_blank">View Template</a>
<br/>
<a href="bulk_admin.php?send_all_reminders_one">Send Season Open Reminder</a> -- <a href="/includes/emails/junior_class_reminder_one.html" target="_blank">View Template</a>
<br />
<a href="bulk_admin.php?send_all_reminders">Send Class Reminders To Everyone</a> -- <a href="/includes/emails/junior_class_reminder.html" target="_blank">View Template</a>

<br/>Send Class Reminder-- <a href="/includes/emails/junior_class_reminder.html" target="_blank">View Template</a>
<br/>
<br/>
Send this reminder on Tuesday, the week prior to classes starting. 
<br/>
    <form action="bulk_admin.php" method="post" class="sessionselect">
	    <input type="hidden" name="send_reminder" value="1">
			Pick Session Start Date
			<br/>
		<?php 
		$controls = new controls();
		$controls->sessionStartDateSelect($_start_date); ?>		
		
		<br />
		<input type="submit" name="send" value="send reminders">
	</form>
	
	<?php 
if (array_key_exists("send_confirmations", $_REQUEST)) {
	
	$bulk_admin->send_confirmations();
} else if (array_key_exists("send_all_reminders", $_REQUEST)) {
	$bulk_admin->send_junior_reminders("ALL");
} else if ( array_key_exists("send_reminder", $_REQUEST) ) {
		$bulk_admin->send_junior_reminders($_REQUEST["sessionStartDate"]);
}
	?>