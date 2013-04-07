<?php /**/ ?><?php

class db {

  // Local
  private $dbhost = 'localhost:8889';

  // Production

	//private $dbhost = 'db.getaclew.com';
  private $dbuser = 'sailsalem';
	private $dbpass = 'airodoodle';
	private $dbname = 'ss_admin_data';
	private $conn;
	private $debug = 1;

	
	protected function open ()
	{

		// Open the database connection
		$this->conn = mysql_connect($this->dbhost, $this->dbuser, $this->dbpass) or die
			('Database connection problem: ' . __LINE__ . mysql_error() );
		mysql_select_db($this->dbname);

	}
	
	function link()
	{
		$this->open();

		$link = mysql_connect($this->dbhost, $this->dbuser, $this->dbpass) OR die(__LINE__ . mysql_error());

		return $link;
	}

	protected function close ()
	{
		// close the connection
		mysql_close($this->conn);	
	}
	
	function insert ($query)
	{
		$this->open();
		
		mysql_query($query) or die('Query execution problem: ' . mysql_error() . "<!-- Query:: " . $query . "-->");
		
		$id = mysql_insert_id();
					
		$this->close();
		
		return $id;
		
	}

	function update ($query)
	{
		$this->open();
		
		mysql_query($query) or die('Query execution problem: ' . mysql_error() . "<!--Query:: " . $query . "-->" );
		
		$this->close();
	}
	
	function select ($query)
	{
		$this->open();

		$resultSet = mysql_query($query) or die('Query execution problem: ' . mysql_error() . "<!--Query:: " . $query . "-->"  );
		
		$this->close();
		
		return $resultSet;

	}
	
	function delete ($query)
	{
		$this->open();
	
		$resultSet = mysql_query($query) or die('Query execution problem: ' . mysql_error() . "<!--Query:: " . $query . "-->"  );
		
		$this->close();

	}
}



?>
