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
	$remotePwd = file_get_contents('garbage');
//	echo "Remote Password: " . $remotePwd."<br>";
//	$remoteLink = mysql_connect('team102.org:3306', 'team102_webuser', $_SESSION['password']);
	$remoteLink = mysql_connect('team102.org:3306', 'team102_webuser', $remotePwd);
	
	if (!mysql_select_db('team102_2016', $remoteLink)) {
    		echo sprintf('Could not select remote database, Err: %s', mysql_error());
    		exit;
	}
	$localPwd = file_get_contents('trash');
//	echo "Local Password: " . $localPwd."<br>";
	// Connect to local database
	$localLink = mysql_connect('gearheads-5:3306', 'scoring102', $localPwd, true);
	
	if (!mysql_select_db('scoring2016', $localLink)) {
    		echo sprintf('Could not select local database, Err: %s', mysql_error());
    		exit;
	}
	
	/* Use internal libxml errors -- turn on in production, off for debugging */
	libxml_use_internal_errors(true);
	
	// MOVE NEW TOURNAMENTS TO LOCAL
	$selectReturn = mysql_query("select * from tournaments", $remoteLink);
	if(!$selectReturn)
		die(sprintf("Error selecting tournaments, Err: %s", mysql_error()));
	
	// if any tournaments are not found in the local DB, create them.
	while($row = mysql_fetch_assoc($selectReturn)) 
	{
		$sql = sprintf("insert into tournaments (ID, Title, active, FIRST_Abbrev)
						 values ('%s', '%s','%s', '%s') ON DUPLICATE KEY UPDATE active = active"
						 , mysql_real_escape_string($row["ID"])
						 , mysql_real_escape_string($row["Title"])
						 , mysql_real_escape_string($row["active"])
						 , mysql_real_escape_string($row["FIRST_Abbrev"])
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = mysql_query($sql, $localLink);
		if(!$insertReturn)
			die(sprintf("Error inserting tournaments: %s, Err: %s", $teamNumber, mysql_error()));
		if(mysql_affected_rows($localLink) == 1)
		{
			echo "inserted tournament: " . $row["Title"] . "<br>";
		}
	}
	// MOVE NEW TEAMS TO LOCAL
	$selectReturn = mysql_query("select * from teams", $remoteLink);
	if(!$selectReturn)
		die(sprintf("Error selecting teams, Err: %s", mysql_error()));
	
	// if any teams are not found in the local DB, create them.
	while($row = mysql_fetch_assoc($selectReturn)) 
	{
		$sql = sprintf("INSERT IGNORE INTO teams
				(number, name, nickname, city, state) 
				VALUES (%s, '%s', '%s', '%s', '%s')"
						 , $row["number"]
						 , mysql_real_escape_string($row["name"])
						 , mysql_real_escape_string($row["nickname"])
						 , mysql_real_escape_string($row["city"])
						 , mysql_real_escape_string($row["state"])
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = mysql_query($sql, $localLink);
		if(!$insertReturn)
			die(sprintf("Error inserting teams: %s, Err: %s", $row["number"], mysql_error()));
		if(mysql_affected_rows($localLink) == 1)
		{
			echo "inserted team: " . $row["number"] . "<br>";
		}
	}

	// MOVE NEW TOURNAMENT-TEAMS TO LOCAL
	$selectReturn = mysql_query("select * from tournament_teams", $remoteLink);
	if(!$selectReturn)
		die(sprintf("Error selecting tournament_teams, Err: %s", mysql_error()));
	
	// if any teams are not found in the local DB, create them.
	while($row = mysql_fetch_assoc($selectReturn)) 
	{
		$sql = sprintf("INSERT IGNORE INTO tournament_teams
				(tournament_id, team_number) 
				VALUES ('%s', %s);"
						 , mysql_real_escape_string($row["tournament_id"])
						 , $row["team_number"]
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = mysql_query($sql, $localLink);
		if(!$insertReturn)
			die(sprintf("Error inserting tournament_team: %s-%s, Err: %s", $row["tournament_id"], $row["team_number"], mysql_error()));
		if(mysql_affected_rows($localLink) == 1)
		{
			echo "inserted tournament_team: " . $row["tournament_id"] . '-' . $row["team_number"] . "<br>";
		}
	}
	// MOVE NEW MATCHES TO LOCAL
	$selectReturn = mysql_query("select * from matches", $remoteLink);
	if(!$selectReturn)
		die(sprintf("Error selecting matches, Err: %s", mysql_error()));
	
	// if any are not found in the local DB, create them.
	while($row = mysql_fetch_assoc($selectReturn)) 
	{
		$sql = sprintf("INSERT INTO matches
				(tournament_id, match_number, start_time, red_score, blue_score, ignore_match, red_breach, blue_breach, red_capture, blue_capture, red_spy_human, blue_spy_human) 
				VALUES ('%s', %s, '%s', %s, %s, '%s', '%s', '%s', '%s', '%s', '%s', '%s')
				 ON DUPLICATE KEY UPDATE red_score = %s, blue_score = %s;"
						 , mysql_real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						 , mysql_real_escape_string($row["start_time"])
						 , $row["red_score"]
						 , $row["blue_score"]
						 , mysql_real_escape_string($row["ignore_match"])
						 , mysql_real_escape_string($row["red_breach"])
						 , mysql_real_escape_string($row["blue_breach"])
						 , mysql_real_escape_string($row["red_capture"])
						 , mysql_real_escape_string($row["blue_capture"])
						 , mysql_real_escape_string($row["red_spy_human"])
						 , mysql_real_escape_string($row["blue_spy_human"])
						 , $row["red_score"]
						 , $row["blue_score"]
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = mysql_query($sql, $localLink);
		if(!$insertReturn)
			die(sprintf("Error inserting match: %s-%s, Err: %s",$row["tournament_id"], $row["match_number"], mysql_error()));
		if(mysql_affected_rows($localLink) == 1)
		{
			echo "inserted match: " . $row["tournament_id"] . '-' . $row["match_number"] . "<br>";
		}
	}
	// UPDATE EXISTING MATCHES FROM LOCAL TO REMOTE
	$selectReturn = mysql_query("select * from matches", $localLink);
	if(!$selectReturn)
		die(sprintf("Error selecting local matches, Err: %s", mysql_error()));
	
	// update everything.
	while($row = mysql_fetch_assoc($selectReturn)) 
	{
		$sql = sprintf("UPDATE matches 
				SET start_time = '%s'
				, ignore_match = '%s', red_breach = '%s', blue_breach = '%s', red_capture = '%s', blue_capture = '%s'
				, red_spy_human = '%s', blue_spy_human = '%s' WHERE tournament_id = '%s' AND  match_number = %s;"
						 , mysql_real_escape_string($row["start_time"])
						 , mysql_real_escape_string($row["ignore_match"])
						 , mysql_real_escape_string($row["red_breach"])
						 , mysql_real_escape_string($row["blue_breach"])
						 , mysql_real_escape_string($row["red_capture"])
						 , mysql_real_escape_string($row["blue_capture"])
						 , mysql_real_escape_string($row["red_spy_human"])
						 , mysql_real_escape_string($row["blue_spy_human"])
						 , mysql_real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						);
//		echo $sql;
//		echo "<br>";				
		$updateReturn = mysql_query($sql, $remoteLink);
		if(!$updateReturn)
			die(sprintf("Error updating match: %s-%s, Err: %s",$row["tournament_id"], $row["match_number"], mysql_error()));
		if(mysql_affected_rows($remoteLink) == 1)
		{
			echo "updated match: " . $row["tournament_id"] . '-' . $row["match_number"] . "<br>";
		}
//		else
//		{
//			echo "could not update match: " . $row["tournament_id"] . '-' . $row["match_number"] . "<br>";
//		}		
	}

	// MOVE NEW MATCHES-TEAMS TO LOCAL
	$selectReturn = mysql_query("select * from match_teams", $remoteLink);
	if(!$selectReturn)
		die(sprintf("Error selecting match_teams, Err: %s", mysql_error()));
	
	// if any are not found in the local DB, create them.
	while($row = mysql_fetch_assoc($selectReturn)) 
	{
		$sql = sprintf("INSERT IGNORE INTO match_teams
				(tournament_id, match_number, team_number, alliance, seq_no, completed, match_result, comments, initials, fouls, tech_fouls, auto_reach, auto_cross, auto_goal
				, auto_goal_success, end_position, did_show_up) 
				VALUES ('%s', %s, %s, '%s', %s, '%s', '%s', '%s', '%s', %s, %s, '%s', '%s'
				, 'auto_goal', 'auto_goal_success', 'end_position', 'did_show_up');"
						 , mysql_real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						 , $row["team_number"]
						 , mysql_real_escape_string($row["alliance"])
						 , $row["seq_no"]
						 , mysql_real_escape_string($row["completed"])
						 , mysql_real_escape_string($row["match_result"])
						 , mysql_real_escape_string($row["comments"])
						 , mysql_real_escape_string($row["initials"])
						 , $row["fouls"]
						 , $row["tech_fouls"]
						 , mysql_real_escape_string($row["auto_reach"])
						 , mysql_real_escape_string($row["auto_cross"])
						 , mysql_real_escape_string($row["auto_goal"])
						 , mysql_real_escape_string($row["auto_goal_success"])
						 , mysql_real_escape_string($row["end_position"])
						 , mysql_real_escape_string($row["did_show_up"])
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = mysql_query($sql, $localLink);
		if(!$insertReturn)
			die(sprintf("Error inserting match_team: %s-%s-%s, Err: %s",$row["tournament_id"], $row["match_number"], $row["team_number"], mysql_error()));
		if(mysql_affected_rows($localLink) == 1)
		{
			echo "inserted match_team: " . $row["tournament_id"] . '-' . $row["match_number"] . '-' . $row["team_number"] . "<br>";
		}
	}
	// UPDATE EXISTING MATCHE-TEAMS FROM LOCAL TO REMOTE
	$selectReturn = mysql_query("select * from match_teams", $localLink);
	if(!$selectReturn)
		die(sprintf("Error selecting local match_teams, Err: %s", mysql_error()));
	
	// update everything.
	while($row = mysql_fetch_assoc($selectReturn)) 
	{
		// NOTE: We do not update alliance and seq_no
		$sql = sprintf("UPDATE match_teams 
				SET completed = '%s', match_result = '%s', comments = '%s', initials = '%s', fouls = %s, tech_fouls = %s
				, auto_reach = '%s', auto_cross = '%s', auto_goal = '%s', auto_goal_success = '%s', end_position = '%s'
				, did_show_up = '%s' WHERE tournament_id = '%s' AND  match_number = %s and team_number = %s;"
						 , mysql_real_escape_string($row["completed"])
						 , mysql_real_escape_string($row["match_result"])
						 , mysql_real_escape_string($row["comments"])
						 , mysql_real_escape_string($row["initials"])
						 , $row["fouls"]
						 , $row["tech_fouls"]
						 , mysql_real_escape_string($row["auto_reach"])
						 , mysql_real_escape_string($row["auto_cross"])
						 , mysql_real_escape_string($row["auto_goal"])
						 , mysql_real_escape_string($row["auto_goal_success"])
						 , mysql_real_escape_string($row["end_position"])
						 , mysql_real_escape_string($row["did_show_up"])
						 , mysql_real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						 , $row["team_number"]
						);
//		echo $sql;
//		echo "<br>";				
		$updateReturn = mysql_query($sql, $remoteLink);
		if(!$updateReturn)
			die(sprintf("Error updating match_team: %s-%s-%s, Err: %s",$row["tournament_id"], $row["match_number"], $row["team_number"], mysql_error()));
		if(mysql_affected_rows($remoteLink) == 1)
		{
			echo "updated match_team: " . $row["tournament_id"] . '-' . $row["match_number"] . '-' . $row["team_number"] . "<br>";
		}
//		else
//		{
//			echo "could not update match_team: " . $row["tournament_id"] . '-' . $row["match_number"] . '-' . $row["team_number"] . "<br>";
//		}		
	}

	// BIG NOTE: MATCH-TEAM-CYCLES are only ever created locally and copied to the remote.
	// MOVE NEW MATCHES-TEAM-CYCLES TO REMOTE
	$selectReturn = mysql_query("select * from match_team_cycles", $localLink);
	if(!$selectReturn)
		die(sprintf("Error selecting match_team_cycles, Err: %s", mysql_error()));
	
	// if any are not found in the remote DB, create them.
	while($row = mysql_fetch_assoc($selectReturn)) 
	{
		$sql = sprintf("INSERT IGNORE INTO match_team_cycles
				(tournament_id, match_number, team_number, cycle_number, operation_attempted, success) 
				VALUES ('%s', %s, %s, %s, '%s', '%s');"
						 , mysql_real_escape_string($row["tournament_id"])
						 , $row["match_number"]
						 , $row["team_number"]
						 , $row["cycle_number"]
						 , mysql_real_escape_string($row["operation_attempted"])
						 , mysql_real_escape_string($row["success"])
						);
//		echo $sql;
//		echo "<br>";				
		$insertReturn = mysql_query($sql, $remoteLink);
		if(!$insertReturn)
			die(sprintf("Error REMOTE inserting match_team_cycle: %s-%s-%s-%s, Err: %s",$row["tournament_id"], $row["match_number"], $row["team_number"], $row["cycle_number"], mysql_error()));
		if(mysql_affected_rows($remoteLink) == 1)
		{
			echo "inserted match_team_cycle: " . $row["tournament_id"] . '-' . $row["match_number"] . '-' . $row["team_number"] . '-' . $row["cycle_number"] . "<br>";
		}
	}

	// NO NEED TO UPDATE MATCH-TEAM-CYCLES

	echo "done.";
?>