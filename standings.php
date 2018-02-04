<?php
	set_include_path(get_include_path() . PATH_SEPARATOR . "../" . PATH_SEPARATOR . "../../" . PATH_SEPARATOR . "../../../");

	session_start();
	
	// Connect to the database.
	$publicPwd = file_get_contents('junk');
	$link = @mysql_connect('team102.org:3306', 'team102_readonly', $publicPwd);
	if(!$link)
	{
		echo sprintf('Could not connect to database, Err: %s', mysql_error());
		exit;
	}	
	if (!mysql_select_db('team102_2016', $link)) {
		echo sprintf('Could not select database, Err: %s', mysql_error());
		exit;
	}
	$sort = "`Avg_Pts` desc";
	if($_GET['sort'] != null)
		$sort = $_GET['sort'];

//	echo "sort: " . $sort;
	
	$more = false;
	if($_GET['more'] != null)
		$more = ($_GET['more'] == "true") ? true : false;
		
	$selectList = "tournament_id,rank,team_number,num_matches,avg_pts,avg_auto_pts,avg_auto_def_pts,auto_high_att,`auto_high_%`,auto_lo_att,`auto_lo_%`,`brch_%`,`challng_%`,`scale_%`,`captr_%`,LOW_Att,`LOW_%`,HGH_Att,`HGH_%`,Defense";
	if($more)
		$selectList = "tournament_id,rank,team_number,num_matches,avg_pts,POR_Att,`POR_%`,CDF_Att,`CDF_%`,MOT_Att,`MOT_%`,RMP_Att,`RMP_%`,DRW_Att,`DRW_%`,SLP_Att,`SLP_%`,RCK_Att,`RCK_%`,RGT_Att,`RGT_%`,LOB_Att,`LOB_%`";
		
	$sql = "select ". $selectList . " from team_avg_pts_v order by ";		// Temporary.
	
	if($_GET['AllTournaments'] != null)
		$sql = "select " . $selectList .
				" from t_team_avg_pts_v  apv
				where team_number in (select team_number from tournament_teams tt, tournaments t where tt.tournament_id = t.id and t.active = 'Y')
				order by ";	// Over all tournaments that are not Active = 'O'
	
	$sql .= mysql_real_escape_string($sort);
	
	$standingsQ = mysql_query($sql, $link);
	if (!$standingsQ) {
		echo "DB Error, could not query match teams\n";
		echo 'MySQL Error: ' . mysql_error();
		exit;
	}

  $data = array();
  while($row = mysql_fetch_assoc($standingsQ))
  {
     $data[] = $row;
  }
  if($data != null)
	$colNames = array_keys(reset($data));
  else 
	$colNames = null;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><? echo $_SESSION['tournament']->Title; ?> Standings</title>
    <meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
	<script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script>
    <link rel="stylesheet" href="stylesheet.css" />
</head>
<body>
<div id="button_holder">
<div id="button_holder">
	<a href="preview.php" style="color:white; text-style:none;">Preview</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="upcoming.php" style="color:white; text-style:none;">Upcoming</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="survey.php" style="color:white; text-style:none;">Survey</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="standings.php?more=<?php echo ($more ? 'false' : 'true') ?>&sort=<?php echo ($sort);?>" style="color:white; text-style:none;">
							<?php if($more) echo('Less'); else echo ('More');?></a>
</div></div>
<div>&nbsp;</div>
 <table border="1" id="standings">
    <?php
 		if($colNames == null)
		{
			echo "<tr><th>There are no standings to report.</th></tr>";
		}
		else
		{
 		   //print the rows
		   $i = 1;
		   foreach($data as $row)
		   {
				if(($i - 1) % 10 == 0)
				{
					echo "<th>row</th>";
				   //print the header
				   foreach($colNames as $colName)
				   {
				   	if($colName != 'tournament_id')
				   	{
						if(($colName == 'team_number') || ($colName == 'luck_factor') || ($colName == 'num_matches') || ($colName == 'rank'))
						{
							$default_sort = ' asc';
							$second_sort = ' desc';
						}
						else
						{
							$default_sort = ' desc';
							$second_sort = ' asc';
						}
				   ?>
					 <th><a href="standings.php?more=<?php echo ($more ? 'true' : 'false')?>&sort=<?php echo ($sort == $colName . $default_sort) ? urlencode('`'.$colName.'`') . $second_sort: urlencode('`'.$colName.'`') . $default_sort;?>" 
									<?php echo (($sort == $colName . $default_sort) || ($sort == $colName . $second_sort)) ? ' class="currentSort"' : '';?> >
							<?php echo str_replace('_', ' ', $colName); ?></a></th>
					<?php
					}
				   }
				}
			  echo "<tr><td>" . $i++ . "</td>";
			  foreach($colNames as $colName)
			  {
				if($colName == "team_number")
				{
					echo '<td><a href="survey.php?team=' . $row[$colName] . '">' . $row[$colName] . "</a></td>";
				}
				else if($colName != 'tournament_id')
				{
					echo "<td>".$row[$colName]."</td>";
				}
			  }
			  echo "</tr>";
		   }
		}
    ?>
 </table>
 </body>
</html>