<?php
/**
 * Created by JetBrains PhpStorm.
 * User: jyarrington
 * Date: 4/6/13
 * Time: 10:13 PM
 * To change this template use File | Settings | File Templates.
 */

class sailing_program {

  var $id_sailing_program;
  var $class_name;
  var $class_description;
  var $full_day;
  var $sort_order;


  function get () {

 		$query = "
 				SELECT
 					*
 				FROM
 					sailing_program
 				WHERE
 					id_sailing_program = " . $id_sailing_program;

 		$db = new db;

 		$resultSet = $db->select($query);
 		$row = mysql_fetch_array($rs);

 		$this->id_sailing_program = $row['id_sailing_program'];
 		$this->class_name = $row['class_name'];
 		$this->class_description = $row['class_description'];
 		$this->full_day = $row['full_day'];
    $this->sort_order = $row['sort_order'];

 	}

  function getPrograms () {

 		$query = "
 				SELECT
 					*
 				FROM
 					sailing_program
 			  ORDER BY
 			    sort_order ASC
 				";

 		$db = new db;

 		$resultSet = $db->select($query);

 		return $resultSet;

 	}
}