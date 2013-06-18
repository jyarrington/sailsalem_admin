<?php
 
include ('config.php');
include ('db.php');
include_once ('student.php');
include_once ('sailing_program.php');
include_once ('sailing_session.php');
include_once ('session_student.php');
include ('user.php');
include ('controls.php');
include ('page.php');
include ('message.php');

class public_register {
	
	function checked ($checkboxname) {
		if (array_key_exists($checkboxname, $_POST)) {
			$r = 1 ;
		} else {
			$r = 0 ;
		}

		echo $checkboxname . " " . $r . " " ;
		
		return $r ;
	}
	
	function check ($checkboxvalue) {
		
		if ($checkboxvalue == 1) {
			$r = "checked" ;
		} else {
			$r = "";
		}
		
		echo $r;
	}

  function showConfirmation ($student, array $session_student) {
		
		$sailing_session = new sailing_session();


		$student_name = $student->first_name . " " . $student->last_name;
			
		$confirmation_header = "
			<center><strong>Registration Confirmation</strong></center><br><br>
			<strong>Thank you for signing up for Sail Salem's summer youth program.</strong><br><br>
			
			[STUDENT_NAME] is signed up for classes.  Class information is listed below.

			<br/><br/>
			
			Please print out the medical information form and swim form, 
			complete them, and bring them with you to the first day of class. <br/><br/>

			If you signed up for the advanced beginner classes or the racing clinic
			our program director will call you to arrange payment.  <br/><br/>
		";

    $confirmation_class = "

    Class Name: [CLASS_NAME]<br/>
    Class Date: [MONTH_NAME] [DAY_NAME]<br/>
		Class Time: [TIME_OF_DAY]<br/>
		<br/>

    ";

		$confirmation_footer = '
			<strong>Forms: </strong><br/><br/>
			
			<a href="http://admin.sailsalem.org/public/sail_salem_forms_2013.pdf">Swim Form and Medical Information Form</a> <br/><br/>

			<br><br>
		';

    $confirmation = str_replace("[STUDENT_NAME]", $student_name, $confirmation_header);

    foreach ($session_student as $value) {
      $_c = $confirmation_class;

      $session_detail = $sailing_session->getSessionDetail($value);

      $_c = str_replace("[CLASS_NAME]", $session_detail[0]["class_name"], $_c);
      $_c = str_replace("[MONTH_NAME]", $session_detail[0]["month_name"], $_c);
      $_c = str_replace("[DAY_NAME]", $session_detail[0]["day_name"], $_c);
      $_c = str_replace("[TIME_OF_DAY]", $session_detail[0]["time_of_day"], $_c);

      $confirmation .= $_c;
    }

    $confirmation .= $confirmation_footer;

    $message = new message();
    $message->send_email($_REQUEST["email1"], "Sail Salem Registration Confirmation", $confirmation);
    echo $confirmation;
		
  }
	
	function submit () {

    global $from_address;

		$student = new student();
		
		$student->first_name = $_POST["first_name"];
		$student->last_name = $_POST["last_name"];		
//		$student->age = $_POST["age"];
		$student->birth_date = $_POST["birth_date"];
		$student->address = $_POST["address"];
		$student->city = $_POST["city"];
		$student->state = $_POST["state"];
		$student->zip = $_POST["zip"];
		$student->school_grade = $_POST["school_grade"];
		$student->guardian_one_first_name = $_POST["guardian_one_first_name"];
		$student->guardian_one_last_name = $_POST["guardian_one_last_name"];
		$student->guardian_two_first_name = $_POST["guardian_two_first_name"];
		$student->guardian_two_last_name = $_POST["guardian_two_last_name"];
		$student->phone1 = $_POST["phone1"];
		$student->phone2 = $_POST["phone2"];
		$student->email1 = $_POST["email1"];
		$student->email2 = $_POST["email2"];
		$student->emergency_number = $_POST["emergency_number"];
		$student->t_shirt_size = $_POST["t_shirt_size"];
		$student->notes = $_POST["notes"];

		if ($_POST["formtype"] == "Insert" ) {
			$student->getStudentID();
			
			if ($student->id_student > 0) {
				echo 'This student appears to be already registered.  Email ' . $from_address . ' for assistance.' ;
			} else {
				$result = $student->insert() ;
				if ($student->id_student > 0) {	
					$session_student = new session_student();
          foreach ($_POST["id_sailing_session"] as $_id_sailing_session) {
            $session_student->id_student = $student->id_student;
            $session_student->id_sailing_session = $_id_sailing_session;
            $session_student->insert();
          }
					$this->showConfirmation ($student, $_POST["id_sailing_session"]) ;
				}
			
			}			 
		} else {
			echo "There was a problem with your registration.  Email " . $HELP_EMAIL . " for assistance." ;
		}		
	}

	function formHeader ($status) {
		
		$_form_header = "";
		
		if ( $status == "closed" ) {
			$_form_header = " 
			
			<p>Please fill in the form below to reserve your spot in class.</p>

			<h2>Some of our classes are full</h2>

			<p>Our classes are filling up quickly.  Please review the number of open spots
		  and reserve your spot now.
			
			";
			
		} elseif ($status == "coming") {
			$_form_header = "
			
			<p>Sail Salem is excited to announce the 2013 sailing season.  This year is going to be our best yet.</p>
			<p>Classes are available for age groups 8 to 18.  Go to our youth sailing page for more information.</p>
			<p>Registration for classes opens at 10:00 am on March 26th.</p>
			
			";
		
		} else {
			
			$_form_header = "
			
			<p>Sail Salem is excited to announce the 2013 sailing season.  This year is going to be
			our best yet.</p>
			<p>We are offering the following classes for children from ages 8 to 18.  Classes are taught
			on Optimists and 420s.
			<h2>Beginner Class</h2>

			<p>If this is your child's first time sailing, sign up for our beginner class.  This is
			a great place to get started.  It is a free class, taught in half days for one week.  Children
			work in small groups with a small child to instructor ratio and learn the basics of sailing.</p>
			<p><strong>Class Price: </strong> Free</p>

			<h2>Advanced Beginner</h2>
			<p>Once you have tried sailing and are hooked, come back for full day lessons with small
			student to instructor ratio groups.  Explore more about sailing and the ocean and continue
			to hone your skills.</p>
			<p><strong>Class Price: </strong> $300</p>

			<h2>Junior Racing Clinic</h2>
			<p>Each year hundreds of young sailors come from all around New England to
			race in Marblehead Junior Race week.  Our coaches take a small team of talented
			junior sailors over to Junior Race week to represent Sail Salem.</p>
			<p><strong>Race Clinic Price: </strong> $150</p>
			";
		}
			
		
		return $_form_header;
		
	}
	
	function showRegistrationForm () {
	
		$controls = new controls;		


		$today = getdate();
		$registration_opens = "2013-04-07 09:00:00";
		$_status = "open";
		
		if ($_status <> "closed") {
			
			if ($today < $registration_opens) {
				$_status = "coming";
			} else {
				$_status = "open";
			}
		}
		
		$_header = $this->formHeader($_status);
		echo $_header;
		
		

			?>	

		<form id="youth_register" action="publicregister.php" method="post">
			<input type="hidden" name="formtype" value="Insert">
			<hr>
			<p>Welcome to our youth sign-ups.  Please fill in the form below to reserve your spot in class.
			</p>
			
			
			<fieldset class="publicreg">
				<b>Student Information</b><br/>
				<label for="first_name">First Name</label><input type="text" name="first_name" value="" tabindex="1"> <br/>
				<label for="last_name">Last Name</label><input type="text" name="last_name" value="" tabindex="2"> <br/>
				<label for="birth_date">BirthDate</label><input type="text" name="birth_date" value="" tabindex="3"> <br/>
				<label for="address">Address</label><input type="text" name="address" value="" tabindex="4"><br/>
				<label for="city">City			</label><input type="text" name="city" value="" tabindex="5"><br/>
				<label for="state">State			</label><input type="text" name="state" value="" tabindex="6"><br/>
				<label for="zip">Zip				</label><input type="text" name="zip" value="" tabindex="7"><br/>
				<label for="school_grade">SchoolGrade		</label><input type="text" name="school_grade" value="" tabindex="8"><br/>

				<b>Parents/Guardian</b><br/>
				
				<label>First Name</label><input type="text" name="guardian_one_first_name" value="" tabindex="11"><br/>
				<label>Last Name</label><input type="text" name="guardian_one_last_name" value="" tabindex="12"><br/>
				<label>Phone			</label><input type="text" name="phone1" value="" tabindex="13"><br/>
				<label>Email			</label><input type="text" name="email1" value="" tabindex="14"><br/>
				<br></br>									
				<label>First Name			</label><input type="text" name="guardian_two_first_name" value="" tabindex=15><br/>
				<label>Last Name			</label><input type="text" name="guardian_two_last_name" value="" tabindex=16><br/>
				<label>Phone			</label><input type="text" name="phone2" value="" tabindex="17"><br/>		
				<label>Email			</label><input type="text" name="email2" value="" tabindex="18"><br/>
				
				<b>Emergency Information and Notes</b><br/>
				<label>Emergency Number		</label><input type="text" name="emergency_number" value="" tabindex="19"><br/>
				<label>Notes			</label><input type="text" name="Notes" value="" width="50" tabindex="20"><br/>

        <?php
                $sailing_program = new sailing_program();

                $resultSet = $sailing_program->getPrograms();


                while ($row = mysql_fetch_array($resultSet)) {
                  echo "<b>" . $row["class_name"] . "</b><br/>";

                  if ($id_student > 0) {
                    $controls->sessionRadio($row["class_name"], $row["id_sailing_program"], $sr);
                  } else {
                    $controls->sessionRadio($row["class_name"], $row["id_sailing_program"]);
                  }

                  echo "<br/>";
                }
        ?>

			<p>
				<input type="submit" name="submit" value="Enter">
			</p>
			</fieldset>	

		</form>	
	

			
			<?php 
		
	
	}
}


?>



<!--   <link rel="stylesheet" type="text/css" href="/admin/styles.css" /> -->



	


<?php

$title = "Sail Salem Registration";

$page = new page();

$page->echoHeader($title);

?>
<script type="text/javascript" src="/includes/jquery.js"></script>
<script type="text/javascript" src="/includes/jquery.validate.js"></script>
<script type="text/javascript" src="/publicregister.js"></script>



  <style type="text/css" media="screen">

  		fieldset.publicreg {
  			border-width:1px;
  			border-style:solid;
  			border-color:#333333;
  			background-color:#FFFFCC;
  			margin:20px 0px 20px 0px;
  			width:700px;
  			position:relative;
  			display:block;
  			padding: 0 10px 10px 10px;

  		}

  		fieldset.publicreg legend{
  			font-weight:bold;
  			background-color:#FFFFFF;
  			border-width:1px;
  			border-style:solid;
  			border-color:#333333;
  			padding:2px;
  			margin:0px 0px 10px 0px;
  			position:relative;
  			top: -12px;

  		}

  		fieldset.publicreg label{
  			float:left;
  			width:160px;
  			text-align:right;
  			margin:0px 5px 0px 0px;
  		}

  		fieldset.publicreg input.text {
  			width:300px;
  		}

  		fieldset.publicreg label.error { float: right; color: red; vertical-align: bottom; position:absolute; margin-left: 5px; width:300px; text-align:left;}

  	</style>

<?php

$reg = new public_register;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {  

	$reg->submit();
	
} else {
	$reg->showRegistrationForm () ;		
}

$page->echoFooter();
