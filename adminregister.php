<?php /**/ ?><?php
 
include ('config.php');
include ('db.php');
include_once ('student.php');
include_once ('sailing_program.php');
include_once ('sailing_session.php');
include_once ('session_student.php');
include ('user.php');
include ('controls.php');
include ('page.php');
include ('form_student.php');
include ('form.php');

/*
 * Manages the registration form for the administrator view.
 * @TODO: Need to refactor the various registration forms.
 */
class admin_register {
	
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
	
	
	function showPrintForms () {
		
		?>		
			<strong>Thank you for signing up for Sail Salem's summer youth program.</strong>
			
			Your class is reserved, but you have one or two more steps.  <br/><br/>
			
			Most importantly, please print out the medical information form and swim form, 
			complete them, and mail them, along with $1 to the address below. <br/><br/>
			
			Sail Salem<br/>
			c/o Jason Yarrington<br/>
			23 Pickman Street<br/>
			Salem MA, 01970<br/>
			
			Forms: <br/><br/>
			
			<a href="./includes/SailSalemRegistrationForms.pdf">Swim Form and Medical Information Form</a> <br/><br/>
			
			Also, if you have a moment, would you please answer a few demographic questions.
			Sail Salem is able to offer our youth programs through the generousity of local companies and private citizens.  
			We also get a portion of our funding from public grants.  Information about the demographics
			of the families involved helps us apply for these grants.  All information anonymous, and you 
			don't have to respond to anything you don't want to.
						


		<?php 
	}

	function showUpdated () {

		?>
			<strong>Student Information Updated</strong>
			
			   	
		<?php 
		header('Location: search.php');
		 
	}
	
	function submit () {

		$student = new student();
		$session_student = new session_student();
		$form_student = new form_student();
									
		$student->first_name = $_POST["first_name"];
		$student->last_name = $_POST["last_name"];		
		$student->age = $_POST["age"];
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
		$student->emergency_phone = $_POST["emergency_phone"];
		$student->t_shirt_size = $_POST["t_shirt_size"];
		$student->notes = $_POST["notes"];
    $student->paid = $_POST["paid"];
		
		if (isset($_POST["cbx_forms"])){
			$ar_checked_forms = $_POST["cbx_forms"];
		}
		
		//print_r($ar_checked_forms);
		
		//print_r($form_student->student_forms);
		

		
		$student_type = $_POST["student_type"];
		
		// Insert new student
		if ($student_type == "new" ) {

			$student->getStudentID();
			
			//echo "Test for student id" . $student->id_student . "</br>";
			
			if ($student->id_student > 0) {
				echo "This student appears to be already registered.  Email jason@sailsalem.org for assistance." ;
			} else {
				$result = $student->insert() ;
				if ($student->id_student > 0) {	

          foreach ($_POST["id_sailing_session"] as $_id_sailing_session) {

            $session_student->id_student = $student->id_student;
            $session_student->id_sailing_session = $_id_sailing_session;

            $session_student->insert();
          }
					
				}	
			}
    } elseif ($_POST['delete']) {

      $student->id_student = $_POST["id_student"];
      $student->delete();

		// Update existing student
		} else {

			//Update Student
			$student->id_student = $_POST["id_student"];
			
			$result = $student->update() ;
			
			// Delete current session and create new session
			
			$session_student->id_student = $student->id_student;
						
			$session_student->deleteSessionsByStudent($student->id_student);

      foreach ( $_POST["id_sailing_session"] as $value) {
     				$session_student->id_sailing_session = $value;
     				$session_student->insert();
      }
    }


		
		// Update form information
		// TODO: Move the check for form logic into the form_student class Insert and Delete methods

		$form_student->id_student = $student->id_student;
		
		$form_student->updateStudentForms($ar_checked_forms);
			
		$reg = new admin_register;
		$reg->showUpdated () ;
		
	}

	
	function showRegistrationForm ($id_student) {

		$controls = new controls;

		$student = new student;
		$session_student = new session_student();
		$form_student = new form_student();

		echo $id_student;
		
		if ($id_student > 0) {

			$student->id_student = $id_student;
			$student->get();
			
			//Get the assigned session
			//TODO: Refactor this to support more than one session
	
			$session_student->id_student = $student->id_student;

      // TODO: More than one session
			$rs_sessions = $session_student->getByStudent();

      foreach ($rs_sessions as $row) {
         $sr[] = $row["id_sailing_session"];
      }

			$form_student->id_student = $student->id_student;	
			$forms = $form_student->getByStudent();
		
			while ($row = mysql_fetch_object($forms)) {
				switch ($row->id_form) {
					case 1:
						$med_form_checked = "checked";
						break;
					case 2:
						$swim_form_checked = "checked";	
						break;	
				};	
			}
						
			$student_type = "existing" ;
			
		} else { 
				
			$student_type = "new" ;
			$id_student = 0;
			
		}

    $str_birthdate = '';

    if ($student->birth_date !== 'NULL') {
     $str_birthdate = date('n/j/y', strtotime($student->birth_date));
    }
?>

		<form id="youth_register" action="adminregister.php" method="post">
			<input type="hidden" name="student_type" value="<?php echo $student_type ?>">
			<input type="hidden" name="id_student" value="<?php echo $id_student ?>">
			<hr>
			<p>Youth Sign-Up Form for phone, email, and direct mail signups.  This form is also used for making requested changes.
			</p>
			<fieldset class="publicreg">
				<b>Student Information</b><br/>
				<label for="first_name">First Name</label><input type="text" class="text" name="first_name" value="<?php echo $student->first_name ?>" tabindex="1"> <br/> 
				<label for="last_name">Last Name</label><input type="text" class="text" name="last_name" value="<?php echo $student->last_name ?>" tabindex="2"> <br/>
				<label for="birth_date">BirthDate</label><input type="text" class="text" name="birth_date" value="<?php echo $str_birthdate?>" tabindex="3"> <br/>
				<label for="address">Address</label><input type="text" class="text" name="address" value="<?php echo $student->address ?>" tabindex="4"><br/>
				<label>City			</label><input type="text" class="text" name="city" value="<?php echo $student->city ?>" tabindex="5"><br/>
				<label>State			</label><input type="text" class="text" name="state" value="<?php echo $student->state ?>" tabindex="6"><br/>		
				<label>Zip				</label><input type="text" class="text" name="zip" value="<?php echo $student->zip ?>" tabindex="7"><br/>
				<label>SchoolGrade		</label><input type="text" class="text" name="school_grade" value="<?php echo $student->school_grade ?>" tabindex="8"><br/>

				<b>Parents/Guardian</b><br/>
				
				<label>First Name</label><input type="text" class="text" name="guardian_one_first_name" value="<?php echo $student->guardian_one_first_name ?>" tabindex="11"><br/>
				<label>Last Name</label><input type="text" class="text" name="guardian_one_last_name" value="<?php echo $student->guardian_one_last_name ?>" tabindex="12"><br/>
				<label>Phone			</label><input type="text" class="text" name="phone1" value="<?php echo $student->phone1 ?>" tabindex="13"><br/>
				<label>Email			</label><input type="text" class="text" name="email1" value="<?php echo $student->email1 ?>" tabindex="14"><br/>

				<br></br>									

				<label>First Name			</label><input type="text" class="text" name="guardian_two_first_name" value="<?php echo $student->guardian_two_first_name ?>" tabindex=15><br/>
				<label>Last Name			</label><input type="text" class="text" name="guardian_two_last_name" value="<?php echo $student->guardian_two_last_name ?>" tabindex=16><br/>
				<label>Phone			</label><input type="text" class="text" name="phone2" value="<?php echo $student->phone2 ?>" tabindex="17"><br/>		
				<label>Email			</label><input type="text" class="text" name="email2" value="<?php echo $student->email2 ?>" tabindex="18"><br/>
				
				<b>Emergency Information and Notes</b><br/>

				<label>Emergency Number		</label><input type="text" class="text" name="emergency_phone" value="<?php echo $student->emergency_phone ?>" tabindex="19"><br/>
				<label>Notes			</label><input type="text" class="text" name="notes" value="<?php echo $student->notes ?>" tabindex="20"><br/>
		
				<b>Forms</b><br/>
				
				<label for="med_form">Medical Information		</label><input type="checkbox" class="checkbox" name="cbx_forms[med]" value="1" <?php echo $med_form_checked ?> tabindex="21"><br/>
				<label for="swim_form">Swim Form			    </label><input type="checkbox" class="checkbox" name="cbx_forms[swim]" value="1" <?php echo $swim_form_checked ?> tabindex="22"><br/>
				<label for="paid">Paid</label><input type="checkbox" class="checkbox" name="paid" value="1" <?php echo $student->paid ?> tabindex="23"><br/>

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
				<input type="submit" name="update" value="Save" />
				<button id="clear_session" value="Clear Class Selection" >Clear Class Session</button>
        <input type="submit" name="delete" value="Delete" />
			</p>

			</fieldset>			
		</form>	
	
		
	<?php 
	
	}
}


?>






<?php

$page = new page();

include('menu.php');

?>

    <script type="text/javascript" src="/includes/jquery.validate.js"></script>
    <script type="text/javascript" src="/adminregister.js"></script>


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
	
</head>
<?php
// is the one accessing this page logged in or not?
if (!isset($_SESSION['admin_role'])
    || $_SESSION['admin_role'] !== 'admin') {

    // not an admin use, return to home page
    header('Location: search.php');
    exit;
}



$reg = new admin_register;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {  
	
	$reg->submit();
	
} else if (array_key_exists("id", $_REQUEST)) {
	
	$reg->showRegistrationForm($_REQUEST["id"]) ;
	
} else {
	
	$reg->showRegistrationForm(0) ;	
		
}


?>

</body>
</html>