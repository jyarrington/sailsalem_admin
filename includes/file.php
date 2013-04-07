<?php /**/ ?><?php

include ('dataInterface.php');

class myfile {
	
	
	function read () {
		
				$lines = file('G://Files/Jason/SailSalem/Junior Program.csv');
		
				
		// Loop through our array, show HTML source as HTML source; and line numbers too.
		foreach ($lines as $line_num => $line) {
			
			echo $line_num;
			
			if ($line_num <> 0) {
				

				$reg = new dataInterface;
								
				list(
					$Timestamp,
					$reg->RegistrationNumber,
					$Called,
					$reg->MedicalInformationForm,
					$reg->SwimForm,
					$reg->FieldTripForm,
					$reg->RegForm,
					$reg->Paid,
					$reg->studentName,
					$reg->Age,
					$reg->BirthDate,
					$reg->Address,
					$reg->City,
					$reg->State,
					$reg->Zip,
					$reg->SchoolGrade,
					$reg->Height,
					$reg->Weight,
					$reg->HomePhone,
					$reg->Mother,
					$reg->Father,
					$reg->Phone1,
					$reg->Phone2,
					$reg->Email1,
					$reg->Email2,
					$reg->PrimaryEmergencyNumber,
					$reg->TShirtSize,
					$reg->AssignedSession,
					$reg->SessionChange,
					$reg->Choice1,
					$reg->Choice2,
					$reg->Choice3,
					$reg->Choice4,
					$reg->Choice5,
					$reg->Notes,
					$Friend1,
					$Friend2,
					$Friend3,
					$Notes) = split(",", $line);
					
			    //echo "Line #<b>{$line_num}</b> : " . htmlspecialchars($RegistrationNumber) . "::" . htmlspecialchars($studentName) . "::" . htmlspecialchars($Father) . "::". htmlspecialchars($AssignedSession) . "<br />\n";
							if ( trim($reg->RegistrationNumber <> '')) {
								

					$result = $reg->insertRegistration();
														}
														
			}
						
		}
	}
}

$myfile = new myfile();

$myfile->read();

?>