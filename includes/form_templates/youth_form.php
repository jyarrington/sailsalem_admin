<form id="youth-register" action="youth-register.php" method="post">
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
		<label>City			</label><input type="text" name="city" value="" tabindex="5"><br/>
		<label>State			</label><input type="text" name="state" value="" tabindex="6"><br/>
		<label>Zip				</label><input type="text" name="zip" value="" tabindex="7"><br/>
		<label>SchoolGrade		</label><input type="text" name="school_grade" value="" tabindex="8"><br/>

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
    $sp_array = $sailing_program->getProgramsByType("youth"); //TODO - Refactor Getprograms to take a parameter and not return all programs

   foreach ($sp_array as $row) {
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