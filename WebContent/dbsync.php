<?php

// Page that can sync remote database and local database.
// NOTE: this needs to run on the local web server.

	set_include_path(get_include_path() . PATH_SEPARATOR . "../" . PATH_SEPARATOR . "../../" . PATH_SEPARATOR . "../../../");

	session_start();
	
	// if we cannot get the password from session - redirect to the starting page.
//	if(!$_SESSION['password'])
//	{
//		header("Location: index.php"); 	/* Redirect browser */
//		exit();
//	}
	
	// Connect to the remote database.
	$remotePwd = file_get_contents('junk');
	$remoteLink = mysql_connect('team102.org:3306', 'team102_webuser', $remotePwd);
	
	if (!mysql_select_db('team102_2016', $remoteLink)) {
    		echo sprintf('Could not select remote database, Err: %s', mysql_error());
    		exit;
	}
	$localPwd = file_get_contents('junk');
	// Connect to local database
	$localLink = mysql_connect('team102.org:3306', 'team102_webuser', $localPwd);
	
	if (!mysql_select_db('team102_2016_local', $localLink)) {
    		echo sprintf('Could not select local database, Err: %s', mysql_error());
    		exit;
	}
	
	/* Use internal libxml errors -- turn on in production, off for debugging */
	libxml_use_internal_errors(true);
	$selectReturn = mysql_query("select * from tournaments", $remoteLink);
	if(!$selectReturn)
		die(sprintf("Error selecting tournaments, Err: %s", mysql_error()));
		
	// if any tournaments are not found in the local DB, create them.
	while($row = mysql_fetch_assoc($selectReturn)) 
	{
		$sql = sprintf("insert ignore into tournaments (ID, Title, active, FIRST_Abbrev)
						 values ('%s', '%s','%s', '%s')"
						 , $row["ID"]
						 , $row["Title"]
						 , $row["active"]
						 , $row["FIRST_Abbrev"]
						);
				echo $sql;
				echo "\n";				
/*		$insertReturn = mysql_query($sql, $localLink);
		if(!$insertReturn)
			die(sprintf("Error inserting tournament_team: %s, Err: %s", $teamNumber, mysql_error()));
		if(mysql_affected_rows($insertReturn) == 1)
		{
			echo "inserted tournament: " . $row["Title"]);
		}
*/	}
?>