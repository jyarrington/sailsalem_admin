<?php /**/ ?><?php
include ('config.php');
include_once ('db.php');
include_once ('student.php');
include_once ('session_student.php');
include_once ('sailing_session.php');
include ('controls.php') ;


class reports {

	function enrollmentCount($status = "ALL") {

		$sailing_session = new sailing_session();
		
		$rs_session_counts = $sailing_session->getAllSessions();
		
		$rowNumber = 0;
		
		echo "<table>";

    foreach ($rs_session_counts as $row) {

			if ($rowNumber == 0) {
				echo "<tr>" ;
							
				foreach ($row as $column=>$value) {
					if (($status == "ALL") or ($status = $row["Status"])) {
	
						echo "<td>" . $column . '</td>';					
					
					}
				}
				echo "</tr>" ;			
			} 
			
				echo "<tr>" ;
				
				foreach ($row as $column=>$value) {
						echo "<td>" . $value . '</td>';					
				}
				
				echo "</tr>" ;	
				
				$rowNumber += 1;
		}

		echo "</table>";
	}
	
	function unassignedStudents() {
		
		$student = new student();
				
		$resultSet = $student->getUnassignedStudents();
		
		$rowNumber = 0;
		
		echo "<table>";
		
		while ($row = mysql_fetch_array($resultSet, MYSQL_ASSOC)) {
			
			if ($rowNumber == 0) {
				echo "<tr>" ;
							
				foreach ($row as $column=>$value) {
						echo "<td>" . $column . '</td>';					
				
				}
				echo "</tr>" ;			
			} 
			
				echo "<tr>" ;
				
				foreach ($row as $column=>$value) {
						echo "<td>" . $value . '</td>';					
				}
				
				echo "</tr>" ;	
				
				$rowNumber += 1;
		}

		echo "</table>";		
	}
	
	//TODO: Move to controls.php
	function td($value, $class) {
	
		if ($value == "") {
			$value = '&nbsp;' ;
		}
		echo "<td class='$class'>$value</td>";
			
	}
	
	function checked($value) {
	
		if ($value == 1) {
			$checked = '<IMG SRC="/admin/checkmark.gif">' ;
		} else {
			$checked = "" ;
		}
				
		return $checked;
	}
	
	function classAttendence() {

		if ( array_key_exists("sessionStartDate", $_REQUEST) ) {
			$_start_date = $_REQUEST["sessionStartDate"] ;
		} else {
			$_start_date = "";
		}

		$controls = new controls;
		
		echo '<form action="reports.php" method="post" class="sessionselect">' ;
		echo '  <input type="hidden" name="reportID" value="3">' ;
		echo '		Pick Session Start Date ';
		$controls->sessionStartDateSelect($_start_date);
		echo '		<input type="submit" name="submit">';
		echo '	</form>';
		echo "\n\n\n";
		echo '';
		
		if ( $_start_date == "" ) {
			echo ' <h2>Select a session</h2>' ;
		} else {
		//TODO: Add Session titles at top of each table.
		//TODO: Fill table with empty rows to total count of class.
			$student = new student();
			
			$sailing_session = new sailing_session();

      // @TODO convert this to loop over an array and test;
			$rs_sailing_sessions = $sailing_session->getSessionsByStartDate($_start_date);

      //$db = new db();

      // @BUG - For some reason there is nothing in this array.
      //$results = $db->results_to_array($rs_sailing_sessions);

			while ($row = mysql_fetch_array($rs_sailing_sessions, MYSQL_ASSOC)) {
				
				echo "<strong><em>" . $row["month_name"] . " " . $row["day_name"] . " -- " . $row["time_of_day"] . "</em> -- " . $row["class_name"] . 
				     " -- " . $row["class_description"] . "</strong> <br/>\n" ;
				echo "Student Count: " . $row["count_student"] . " -- " . "Class Limit: " . $row["student_limit"] . "<br/>\n";   

				
				$rs_students = $student->getStudentsBySession($row["id_sailing_session"]);
				
				$rowNumber = 0;
				
				?>
				
				<table border=1 cellpadding='3' cellspacing='0' class="attendance"  style="font-size:10pt;">
				
				
				<thead>
				<th id="name" style="width:200px;">Name</th>
				<th id="form_med" style="width:25px;">Med</th>
				<th id="form_swim" style="width:25px;">Swim</th>
				<th id="parents" style="width:100px;">parent/guardian name</th>
				<th id="contact" style="width:85px;">Contact Info</th>
				<th id="monday" style="width:60px;">Mon</th>
				<th id="tuesday" style="width:60px;">Tue</th>
				<th id="wednesday" style="width:60px;">Wed</th>
				<th id="thursday" style="width:60px;">Thu</th>
				<th id="friday" style="width:60px;">Fri</th>
				 
				</thead>
				
				<?php 
				
				while ($row = mysql_fetch_array($rs_students, MYSQL_ASSOC)) {
					
						echo "<tr>" ;
						
					$student_full_name = $row["first_name"] . " " . $row["last_name"];
					$guardian_one_full_name = $row["guardian_one_first_name"] . " " . $row["guardian_one_last_name"];
					$guardian_two_full_name = $row["guardian_two_first_name"] . " " . $row["guardian_two_last_name"];

					if ($row["form_med"] == 1) {
						$form_recieved["med"] = "X";
					} else {
						$form_recieved["med"] = " "; 	
					}

					if ($row["form_swim"] == 1) {
						$form_recieved["swim"] = "<span>X</span>";
					} else {
						$form_recieved["swim"] = " "; 	
					}
					
					?>

						<td class="student_full_name"><?php echo $student_full_name ?>&nbsp;</td>
						<td class="form_med"><?php echo $form_recieved["med"] ?>&nbsp;</td> 
						<td class="form_swim"><?php echo $form_recieved["swim"]?>&nbsp;</td>
						<td class="parents"><?php echo $guardian_one_full_name . "<br />" . $guardian_two_full_name ?>&nbsp;</td>
						<td class="contact"><?php echo $row["phone1"]?><br />
											<?php echo $row["phone2"]?><br />
											<strong>(E) </strong><?php echo $row["emergency_phone"]?>
						<td class="day"> &nbsp;</td>
						<td class="day"> &nbsp;</td>
						<td class="day"> &nbsp;</td>
						<td class="day"> &nbsp;</td>
						<td class="day"> &nbsp;</td>
						</tr>
						
				<?php } ?>
		
				</table>
				<p class="break"> </p>
				<?php 	
			}
		}
	}
}
?>

<?php 
// Begin base page
// 

include ('menu.php');
?>

<link type="text/css" href="http://admin.sailsalem.org/includes/css/datatable-jui.css" rel="stylesheet" ></link>	

		<script type="text/javascript" src="http://admin.sailsalem.org/includes/js/jquery.dataTables.min.js"></script>
			
		<script type="text/javascript">
			$(document).ready(function() {

				$(".email1").each(function() {
					var new_text = "<a href=\"https://mail.google.com/a/sailsalem.org/?view=cm&fs=1&tf=1&fs=1&to=" + $(this).text() + "\" target=\"_blank\">" + $(this).text() + "</a>";
					
					$(this).html(new_text);
				 });
				$(".email2").each(function() {
					var new_text = "<a href=\"https://mail.google.com/a/sailsalem.org/?view=cm&fs=1&tf=1&fs=1&to=" + $(this).text() + "\" target=\"_blank\">" + $(this).text() + "</a>";
					
					$(this).html(new_text);
				 }); 
				 
				$('.attendance').dataTable( {
					"bJQueryUI": true,
					"bAutoWidth": false,
					"bFilter": false,
					"bInfo": false,
					"bLengthChange": false,
					"bPaginate": false
				} );
				

				  
			} );
			
		</script>
<div id="sectionMenu">
<a href="reports.php?id=1&status=ALL">Enrollment Count</a> -
<!--  <a href="reports.php?id=2">Unassigned Students</a> - -->
<!-- <a href="reports.php?id=1&status=OPEN">Open Sessions</a> - -->
<a href="reports.php?id=3">Class Attendence Sheet</a>
<br>
<br>
</div>
<?php

	$reports = new reports;
	
	if (array_key_exists("id", $_REQUEST)) {
		$reportID = $_REQUEST["id"] ;
	}
	
	if (array_key_exists("reportID", $_POST)) {
		$reportID = $_POST["reportID"] ;
	}
	
	if ( isset($reportID) ) {
		if ( $reportID == 1) {
			$reports->enrollmentCount($_REQUEST["status"]);
		} else if ($reportID == 2) {
			$reports->unassignedStudents();
		} else if ($reportID == 3) {
			$reports->classAttendence();
		}
	}		
//print_r( $_POST );

?>
