<?php /**/ ?><?php
 
include ('config.php');
include ('db.php');
include_once ('student.php');
include_once ('sailing_session.php');
include_once ('session_student.php');
include ('user.php');
include ('controls.php');
include ('page.php');
include ('message.php');

class register {
	
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
	
	
function showPrintForms ($student, $session_student) {
		
		$sailing_session = new sailing_session();
		
		$session_detail = $sailing_session->getSessionDetail($session_student->id_sailing_session);
		
		$row = mysql_fetch_array($session_detail);
		
		$class_date = date("F j, Y", strtotime($row['start_date']));
		$class_time = date("g:i a", strtotime($row['start_date']));
		//$class_date = $row['start_date'];
		$student_name = $student->first_name . " " . $student->last_name;
			
		$confirmation = "		
			<center><strong>Registration Confirmation</strong></center><br><br>
			<strong>Thank you for signing up for Sail Salem's summer youth program.</strong><br><br>
			
			[STUDENT_NAME] is signed up for classes beginning the week of [CLASS_DATE].<br>  
			Classes	begin each day at [CLASS_TIME].  
			
			<br/><br/>
			
			Please print out the medical information form and swim form, 
			complete them, and mail them, along with $1 to the address below. <br/><br/>
			
			Sail Salem<br/>
			c/o Jason Yarrington<br/>
			23 Pickman Street<br/>
			Salem MA, 01970<br/>
			
			Forms: <br/><br/>
			
			<a href=\"./includes/SailSalemRegistrationForms.pdf\">Swim Form and Medical Information Form</a> <br/><br/>
			
			Also, if you have a moment, would you please answer a few demographic questions.
			Sail Salem is able to offer our youth programs through the generousity of local companies and private citizens.  
			We also get a portion of our funding from public grants.  Information about the demographics
			of the families involved helps us apply for these grants.  All information anonymous, and you 
			don't have to respond to anything you don't want to.
			
			<br><br>
			<a href=\"http://admin.sailsalem.org/demographicform.php\">Click here to complete the Demographics Form Online</a><br/><br/>
		";			
		
		$confirmation = str_replace("[CLASS_DATE]", $class_date, $confirmation);
		$confirmation = str_replace("[CLASS_TIME]", $class_time, $confirmation);
		$confirmation = str_replace("[STUDENT_NAME]", $student_name, $confirmation);
		
		echo $confirmation;
		
	}
	
	function submit () {

		$student = new student();
		
		$student->first_name = $_POST["first_name"];
		$student->last_name = $_POST["last_name"];		
		$student->age = $_POST["age"];
		$student->birth_date = $_POST["birth_date"];
		$student->address = $_POST["address"];
		$student->city = $_POST["city"];
		$student->state = $_POST["state"];
		$student->zip = $_POST["zip"];
		$student->school_grade = $_POST["school_grade"];
		$student->height = $_POST["height"];
		$student->weight = $_POST["weight"];
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
		$student->notes = $POST["notes"];
		
		if ($_POST["formtype"] == "Insert" ) {

			$student->getStudentID();
			
			//echo "Test for student id" . $student->id_student . "</br>";
			
			if ($student->id_student > 0) {
				echo "This student appears to be already registered.  Email jason@sailsalem.org for assistance." ;
			} else {
				$result = $student->insert() ;
				if ($student->id_student > 0) {	
					$session_student = new session_student();
				
					$session_student->id_student = $student->id_student;
					$session_student->id_sailing_session = $_POST["id_sailing_session"];
					
					$session_student->insert();
	
					$message = new message();
					
					$message->send_confirmation($student, $session_student);
	
					$reg = new register;
					
					$reg->showPrintForms ($student, $session_student) ;
				}
			
			}			 
		} else {
			echo "There was a problem with your registration.  Email jason@sailsalem.org for assistance." ;
		}		
	}

	
	
	function showRegistrationForm () {
	
		$controls = new controls;		
?>

		<form id="youth_register" action="publicregister.php" method="post">
			<input type="hidden" name="formtype" value="Insert">
			<hr>
			<p>Welcome to our youth sign-ups.  Please fill in the form below to reserve your spot in class.
			</p>
			<p style="color: red;"><strong>8 to 12 Year Old Group</strong> </p>
			<p>We are sorry to announce that our 8-12 year old groups are full at the moment.
			However, we do get cancellations throughout the season and we are currently forming a waitlist for these classes.
			Please email your contact information and child's age to <a href="mailto:jason+waitlist@sailsalem.org">jason+waitlist@sailsalem.org</a>.
			We will contact people on the wait list as we have more openings.</p>
			<p>We are excited by demand for the program, and regret that we don't have the capacity yet to meet it.  But, you have our commitment
			to keep working to build more capacity in the coming seasons.</p>
			
			<p><strong>13 to 18 Year Old Group</strong>
			<p>We still have limited spots available in the 13 to 18 year old group.  Also, if you have a child that is 11 or 12
			and has participated in Sail Salem before, then you can register for a 13 to 18 year old class.  We teach this class on 
			J-24's.  To get the most out of the experience, it is helpful if children are a little bit more physically developed.  It just
			takes a little more muscle to participate and learn on the boats than it does in an Opti.  If you have questions, email us.</p>
			<p>Thank you for your support.</p>
			<fieldset class="publicreg">
				<b>Student Information</b><br/>
				<label for="first_name">First Name</label><input type="text" name="first_name" value="" tabindex="1"> <br/> 
			
				<label for="last_name">Last Name</label><input type="text" name="last_name" value="" tabindex="2"> <br/>
			
				<label for="birth_date">BirthDate</label><input type="text" name="birth_date" value="" tabindex="3"> <br/>
			
				<label for="address">Address</label><input type="text" name="address" value="" tabindex="4"><br/>
				
				<label>City			</label><input type="text" name="city" value="Salem" tabindex="5"><br/>
			
				<label>State			</label><input type="text" name="state" value="MA" tabindex="6"><br/>		
			
				<label>Zip				</label><input type="text" name="zip" value="01970" tabindex="7"><br/>
			
				<label>SchoolGrade		</label><input type="text" name="school_grade" value="" tabindex="8"><br/>
			
				<label>Height			</label><input type="text" name="height" value="" tabindex="9"><br/>
			
				<label>Weight			</label><input type="text" name="weight" value="" tabindex="10"><br/>
				
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
				<label>Notes			</label><input type="text" name="Notes" value="" width="50 tabindex="20"><br/>

			
			<b>Children 8 to 12 -- all skill levels</b>	<br/>
			<?php $controls->sessionRadio("Opti", "1"); ?><br/>
			<b>Children 13 to 18 -- all skill levels</b><br><?php $controls->sessionRadio("Junior", "2"); ?><br/>


			<p>
				<input type="submit" name="submit" value="Enter">
			</p>
			</fieldset>	
			<!-- <hr>
			<h3>Medical Information</h3>
			<table>
				<tr>
					<td>Gender</td><td><select name="gender"><option value="Male"><option value="Female"></option></select></td>
				</tr>
				<tr>
					<td>Insurance</td><td><input type="text" name="insuranceCompany"></td>
				</tr>
				<tr>
					<td>Policy Number</td><td>Doctor</td>
				</tr>
				<tr>
					<td>Subscriber's Name</td>
				</tr>
				<tr>

			</table>
			 -->			
		</form>	
	
		
	<?php 
	
	}
}


?>

<html>

<head>
<title>Sail Salem Program Registration</title>

<!--   <link rel="stylesheet" type="text/css" href="/admin/styles.css" /> -->

    <script type="text/javascript" src="http://admindev.sailsalem.org/includes/jquery.js"></script>
    <script type="text/javascript" src="http://admindev.sailsalem.org/includes/jquery.validate.js"></script>
    <script type="text/javascript" src="http://admindev.sailsalem.org/publicregister.js"></script>
    
	<style type="text/css" media="screen">
		@import url( http://www.sailsalem.org/wp-content/themes/SailSalemNew/style.css );
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

		fieldset.publicreg label.error { float: right; color: red; vertical-align: bottom; position:absolute; margin-left: 5px; width:300px; text-align:left;}
		
	</style>
	
</head>
<body>
<div id='menu'>
	<p>

	</p>
</div>
<div id="rap">
<div id="content">
<div class="post">

<div class="post-content">

<?php

$page = new page();

$page->echoHeader();

$reg = new register;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {  

	$reg->submit();
	
} else {
	$reg->showRegistrationForm () ;		
}

$page->echoFooter();

?>
</div>
</div>
</div>
</div>
</body>
</html>