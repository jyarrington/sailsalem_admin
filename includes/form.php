<?php /**/ ?><?php

class form {

	var $id_form;
	var $name;
	var $required;
	
//	function __constructor () {
//		$db = new db;
//	}

	function insert() {
	
		$db = new db;
	
		$link = $db->link();
		
		$query = sprintf("
			INSERT INTO form 
			SET
				name = '%s',
				required = %s
			",
			mysql_real_escape_string($this->name, $link),
			mysql_real_escape_string($this->required, $link)
			);
			
		$this->id_form = $db->insert("$query");
								
		echo "Form ID: " . $this->id_form;

	}

	function update () {
		
		$db = new db;
		
		$link = $db->link();
				
		$query = sprintf("
			UPDATE form 
			SET
				name = '%s',
				required = %s
			",
			mysql_real_escape_string($this->name, $link),
			mysql_real_escape_string($this->required, $link)
			);

			$db->update($query);
	}
	
	function getForms() {
		
		$query = "
				SELECT 
					* 
				FROM 
					form
				";
		
		$db = new db;
		
		$resultSet = $db->select($query);

		return $resultSet;

	}


}
		
?>