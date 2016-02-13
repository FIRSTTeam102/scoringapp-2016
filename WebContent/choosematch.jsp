<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8" http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>{tournamentTitle} Selection</title>
    <meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
	<script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script>
    <link rel="stylesheet" href="stylesheet.css" />
</head>
<body class="no-js">
    <div id="page">
        <div class="header">
                <div id="competition">{tournamentTitle}</div>
            <div id="competition"></div>
            <div id="AllianceColor" class="{allianceColor}">{allianceColor} Alliance</div>
                </div>                 
                <form id="MatchForm" action="choosematch.php" method="POST">
                        <div id="nav">
                            <input type="submit" name="btnNext" value="Next" />
                        </div>
                        <div id="Match">
                                <div>Choose a Match</div>
                                <div id="MatchList" style="margin-left:auto;margin-right:auto;width:100%;font-size:.8em;">
									<!-- BEGIN oneMatch -->
									<label for="rdoMatch{matchNumber}"> 
											<div class="match_number">
													<input type="radio" name="rdoMatch" id="rdoMatch{matchNumber}" value="{matchNumber}"/> 
													<%="#" %>{matchNumber} @ {matchStartTime}
											</div>
											<div class="team_holder">{team1}</div>
											<div class="team_holder">{team2}</div>
											<div class="team_holder">{team3}</div>
											<div class="team_holder">{initials}</div>
											<div style="clear:both;"></div>
									</label>
                                </div>
                        </div>
                </form>
    </div>
</body>
</html>