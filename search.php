<?php /**/ ?><?php

include('config.php');
include ('db.php') ;
include ('controls.php');
include ('student.php');
include ('sailing_session.php');
include ('session_student.php');
include ('page.php');

class search {

	function showresults () {
		
		$student = new student();
			
		$resultSet = $student->getStudentsDetail();		

		$column_count = mysql_num_fields($resultSet) or die("display_db_query:" . __LINE__ . mysql_error());

		$row_count = mysql_num_rows($resultSet) or $row_count = 0;

		echo "<b>Number of children enrolled " . $row_count . "</b>\n\n";
		
		// Here the table attributes from the $table_params variable are added
		print("<TABLE id=\"searchresults\">\n");
		// optionally print a bold header at top of table
		
			print("<THEAD><TR><th></th>");
			for ($column_num = 0; $column_num < $column_count; $column_num++) {
				$field_name =
				mysql_field_name($resultSet, $column_num);
				print("<TH>$field_name</TH>");
			}
			print("</TR>\n");
			print("</THEAD><TBODY>\n");
			
		// print the body of the table
		while ($row = mysql_fetch_array($resultSet))
		{
			print("<TR ALIGN=LEFT VALIGN=TOP>");
			
			if ( $_SESSION["admin_role"] == 'admin' ) {
				echo "<td><a href=adminregister.php?id=" . $row["id_student"] . ">Edit</a></td>" ;				
			} else {
				echo "<td>&nbsp;</td>" ;
			}
			
			for ($column_num = 0; $column_num < $column_count; $column_num++)
			{
				$field_name = mysql_field_name($resultSet, $column_num);
				
				print("<TD class=\"$field_name\">$row[$column_num]</TD>\n");
			}
			print("</TR>\n");
		}
		print("</TBODY></TABLE>\n"); 

	}
}

$page = new page;

//$page->echoHeader();
include('menu.php');
?>
<link type="text/css" href="/includes/css/datatable-jui.css" rel="stylesheet" ></link>	

		<script type="text/javascript" src="/includes/js/jquery.dataTables.min.js"></script>
			
		<script type="text/javascript">
			$(document).ready(function() {

				$(".email1").each(function() {
					var new_text = "<a href=\"https://mail.google.com/a/sailsalem.org/?view=cm&fs=1&tf=1&fs=1&to=" + $(this).text() + "\" target=\"_blank\">" + $(this).text() + "</a>";
					
					$(this).html(new_text);
				 });
				 
				$('#searchresults').dataTable( {
					"bJQueryUI": true,
					"sPaginationType": "full_numbers",
					"bStateSave": true
				} );
				

				  
			} );
			
		</script>
<?php 
		
$search = new search;
$search->showresults("");
	
?>
