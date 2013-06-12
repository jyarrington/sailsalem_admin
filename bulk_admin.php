<?php /**/ ?><?php 

/*
 * @TODO - Need to update all the code to use the new message->send_message which does all the template parsing
 * and takes an array and a template.  Includes combining the student object with the session_student object.
 */
include('config.php');
include ('db.php') ;
require_once ('controls.php');
include ('student.php');
include ('sailing_session.php');
include ('session_student.php');
include ('page.php');
include ('message.php');

class bulk_admin {

  /* Sending all confirmations
   *
   */
	function send_confirmations () {

    $message = new message();
    echo "Sending Confirmations <br />" ;
    $student = new student();
    // Get array of students
    $results_array = $student->getStudentsBySession("ALL");
    $message->pre_process_array($results_array, $message::template_confirmation) ;
	}
  /*
   * Send the class reminder templates to either all of the students, or just the ones in a
   * particular week.
   */
	function send_junior_reminders ($class_date="ALL") {

    $message = new message();
	  echo "Sending Reminders <br />" ;
	  $student = new student();
		
	  // If the class_date is ALL, then select all the students
	  // pass a blank to getStudentsBySession will return all students
	  // If the class_date equals "next_week" then select all classes that begin in
	  // the next 7 days.

	  if (trim($class_date) == "ALL") {
      // Get array of students
		  $results_array = $student->getStudentsBySession("ALL");
      $message->pre_process_array($results_array, $message::template_reminder) ;
		} else if (trim($class_date) <> "") {
		  // select all classes that start on the class date sent
      $results_array = $student->getStudentsBySession($class_date);
      $message->pre_process_array($results_array, $message::template_reminder) ;
		}
	}
}


$page = new page;
$bulk_admin = new bulk_admin();

if (isset($_POST["sessionStartDate"]) && $_POST["sessionStartDate"] <> '--') {
  $start_date = $_POST["sessionStartDate"];
} else {
  $start_date = '';
}

include('menu.php');

/*
 * Query strings drive which reminders will be sent.
 * ?send_confirmations - Send all confirmations
 * ?send_all_reminders_one - Send the season open reminders to everyone
 * ?send_all_reminders - Send the class reminders to everyone
 * ?send_reminder - Send the weekly reminder (this is set in a hidden variable in the form post)
 */
?>
  <h2>Class Reminders</h2>
  <h3>Note</h3>
  <p>Clicking a link sends emails to a lot of people.  Please confirm whether it has already been sent.</p>

  <h3>Season Opening Reminders</h3>
  <div class="block">
    <div class="child">
      <a href="bulk_admin.php?send_confirmations">Send All Confirmations</a>
    </div>
    <div class="child">
      <a href="/includes/emails/junior_class_confirmation.html" target="_blank">View Template</a>
    </div>
    <div class="child wide">
      This resends the same confirmations that all parents should have received when they first registered.  It includes class information.
        They will receive one email for each class they are signed up for.  It will include classes in the past.
    </div>
  </div>

  <div class="block">
    <div class="child">
      <a href="bulk_admin.php?send_all_reminders">Send Class Reminders To Everyone</a>
    </div>
    <div class="child">
      <a href="/includes/emails/junior_class_reminder.html" target="_blank">View Template</a>
    </div>
    <div class="child wide">
      This sends the same reminder as the weekly reminder to every student.
    </div>
  </div>

  <h3>Weekly Reminders</h3>

  <div class="block">
    <div class="child">
      <form action="bulk_admin.php" method="post" class="sessionselect">
        <input type="hidden" name="send_reminder" value="1">
          Pick Session Start Date
          <?php
            $controls = new controls();
            $controls->sessionStartDateSelect($start_date);
          ?>
          <input type="submit" name="send" value="send reminders">
      </form>
    </div>
    <div class="child">
      <a href="/includes/emails/junior_class_reminder.html" target="_blank">View Template</a>
    </div>
    <div class="child wide">
      Send this reminder on Tuesday, the week prior to classes starting.
    </div>
  </div>

<?php
  if (array_key_exists("send_confirmations", $_REQUEST)) {
    $bulk_admin->send_confirmations();
  } else if (array_key_exists("send_all_reminders", $_REQUEST)) {
    $bulk_admin->send_junior_reminders("ALL");
  } else if ( array_key_exists("send_reminder", $_REQUEST) ) {
    $bulk_admin->send_junior_reminders($_REQUEST["sessionStartDate"]);
  }
?>