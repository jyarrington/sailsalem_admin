<?php /**/ ?><?php

class controls {
	
	function sessionRadio($name, $id_sailing_program, $ar_sessions = "") {
	
		$sailing_session = new sailing_session();
		
		$sessions = $sailing_session->getSessions($id_sailing_program);



		while ($row = mysql_fetch_array($sessions, MYSQL_ASSOC)) {

			$checked = "";
			//echo "row and selected: " .
      //var_dump($row);
      //var_dump($selectedSession);

      if (is_array($ar_sessions)) {
        foreach ($ar_sessions as $value) {
         //var_dump($value);
         if ($row["id_sailing_session"] == $value) {
           $checked = "checked";
         }
       }
      }
			$disabled = "";
			$style="";
			if (($row["spaces_left"] < 1) && ($checked == "")) {
				$disabled = "disabled";
				$style="color: #C0C0C0; ";
			} 
			
			$spaces_left = 0;
			
			if ($row["spaces_left"] < 1) {
				$spaces_left = 0;
			} else {
				$spaces_left = $row["spaces_left"];
			}

      $ss_id = $row["id_sailing_session"];

			printf ("<input type=\"checkbox\" name=\"id_sailing_session[$ss_id]\" value=\"%s\" %s %s> ",
				$ss_id,
				$checked,
				$disabled);	
			printf ("<span style=\"%s \"> ",
				$style);	
			printf ("%s %s, %s -- <b>%s</b> spaces left <br/>\n", 
				$row["month_name"], 
				$row["day_name"], 
				$row["time_of_day"],
				$spaces_left,
				$row["student_limit"]); 
			printf ("</span> ");		
		}		
	}

	function sessionRadioAdmin($name, $id_sailing_program, $selectedSession = "") {
	
		$sailing_session = new sailing_session();
		
		$sessions = $sailing_session->getSessions($id_sailing_program);

		//echo $selectedSession;
		
		while ($row = mysql_fetch_array($sessions, MYSQL_ASSOC)) {

			$checked = "";
			//echo "row and selected: " . 
			if ($row["id_sailing_session"] == $selectedSession) {
				$checked = "checked";
			}

			$disabled = "";
			$style="";
			if (($row["spaces_left"] < 1) && ($checked == "")) {
				//$disabled = "disabled";
				$style="color: #C0C0C0; ";
			} 
			
			printf ("<input type=\"radio\" name=\"id_sailing_session\" value=\"%s\" %s %s> ",
				$row["id_sailing_session"],
				$checked,
				$disabled);	
			printf ("<span style=\"%s \"> ",
				$style);	
			printf ("%s %s, %s -- <b>%s</b> spaces left <br/>\n", 
				$row["month_name"], 
				$row["day_name"], 
				$row["time_of_day"],
				$row["spaces_left"],
				$row["student_limit"]); 
			printf ("</span> ");		
		}		
	}
	
	function sessionStartDateSelect($selected_start_date) {
	
		$sailing_session = new sailing_session();
		
		$sailing_session->start_date = $selected_start_date;
		
		$rs_sailing_sessions = $sailing_session->getSessionStartDates();
	
		$selected = "selected = 'selected'";
				
		echo "<select name='sessionStartDate'>\n";
				
		echo "<option value = ''>--</option>\n" ;
		
		while ($row = mysql_fetch_array($rs_sailing_sessions, MYSQL_ASSOC)) {
				if ($row["start_date"] == $selected_start_date) {
					echo "<option value = '" . $row["start_date"] . "' " . $selected . ">" . $row["date_label"] . " </option>\n" ;
				} else {
					echo "<option value = '" . $row["start_date"] . "'>" . $row["date_label"] . "</option>\n" ;
				}
		}

		echo "</select>" ;					
	}
	
	
	//TODO: Determine if this is used anymore
	function sessionSelectAvailable($name, $selectedSession = "") {
	
		$di = new dataInterface;
	
		$selected = "selected = 'selected'";
		
		$sessions = $di->getAvailableSessions();
		
		echo "<select name='" . $name . "'>";
				
		echo "<option value = ''></option>" ;
				
		while ($row = mysql_fetch_array($sessions, MYSQL_ASSOC)) {
			foreach ($row as $column=>$value) {
				if ($value == $selectedSession) {
					echo "<option value = '" . $value . "' " . $selected . ">" . $value . " </option>" ;
				} else {
					echo "<option value = '" . $value . "'>" . $value . "</option>" ;
				}
			}
		}
	
		echo "</select>" ;		
				
	}
	
}

?>