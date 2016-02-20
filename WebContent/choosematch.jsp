<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="STUDENTRUN.jsp"%>

<sql:query dataSource="${database}" var="result">
	<%="select mt1.match_number, m.start_time, mt1.team_number as team1, mt2.team_number as team2, mt3.team_number as team3, mt1.initials"
								+ " from matches m, match_teams mt1, match_teams mt2, match_teams mt3, tournaments t"
								+ " where t.active = 'Y'  and m.tournament_id = t.id"
								+ " and mt1.tournament_id = m.tournament_id  and mt1.match_number = m.match_number"
								+ " and mt1.completed = 'N'  and mt1.alliance = '" + alliance + "'"
								+ " and mt1.seq_no = 1  and mt2.team_number != mt1.team_number"
								+ " and mt2.tournament_id = mt1.tournament_id"
								+ " and mt2.match_number = mt1.match_number  and mt2.completed = mt1.completed"
								+ " and mt2.alliance = mt1.alliance  and mt2.seq_no = 2"
								+ " and mt3.team_number != mt1.team_number  and mt3.team_number != mt2.team_number"
								+ " and mt3.tournament_id = mt1.tournament_id"
								+ " and mt3.match_number = mt1.match_number  and mt3.completed = mt1.completed"
								+ " and mt3.alliance = mt1.alliance  and mt3.seq_no = 3"
								+ " order by m.match_number;"%>
</sql:query>
<c:set var="matches" scope="page" value="${result}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" http-equiv="Content-Type"
	content="text/html; charset=ISO-8859-1" />
<title>{tournamentTitle} Selection</title>
<meta name="viewport"
	content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
<script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script>
<link rel="stylesheet" href="stylesheet.css" />
</head>
<body class="no-js">
	<div id="page">
		<div class="header">
			<div id="competition">{tournamentTitle}</div>
			<div id="competition"></div>
			<div id="AllianceColor" class="{allianceColor}">{allianceColor}
				Alliance</div>
		</div>
		<form id="MatchForm" action="choosematch.php" method="POST">
			<div id="nav">
				<input type="submit" name="btnNext" value="Next" />
			</div>
			<div id="Match">
				<div>Choose a Match</div>
				<div id="MatchList"
					style="margin-left: auto; margin-right: auto; width: 100%; font-size: .8em;">
					<!-- BEGIN oneMatch -->
					<label for="rdoMatch{matchNumber}">
						<div class="match_number">
							<input type="radio" name="rdoMatch" id="rdoMatch{matchNumber}"
								value="{matchNumber}" />
							<%="#"%>{matchNumber} @ {matchStartTime}
						</div>
						<div class="team_holder">{team1}</div>
						<div class="team_holder">{team2}</div>
						<div class="team_holder">{team3}</div>
						<div class="team_holder">{initials}</div>
						<div style="clear: both;"></div>
					</label>
							<!-- 
							while($row = mysql_fetch_assoc($matches)) {
									$tpl->setCurrentBlock("oneMatch");
									$tpl->setVariable("matchNumber", $row['match_number']) ;
									$tpl->setVariable("matchStartTime", $row['start_time']) ;
									$tpl->setVariable("team1", $row['team1']) ;
									$tpl->setVariable("team2", $row['team2']) ;
									$tpl->setVariable("team3", $row['team3']) ;
									$tpl->setVariable("initials", $row['initials']) ;
									$tpl->parseCurrentBlock() ;		
								}
							 -->
					<c:forEach var="row" items="${matches.rows}">
						<div class="match_number">
							<input type="radio" name="rdoMatch" id="rdoMatch{matchNumber}"
								value="{matchNumber}" />
							<%="#"%><c:out value="${row.match_number}" /> @ <c:out value="${row.start_time}" />
						</div>
						<div class="team_holder"><c:out value="${row.team1}" /></div>
						<div class="team_holder"><c:out value="${row.team2}" /></div>
						<div class="team_holder"><c:out value="${row.team3}" /></div>
						<div class="team_holder"><c:out value="${row.initials}" /></div>
						<div style="clear: both;"></div>
					
						
					</c:forEach>
				</div>
			</div>
		</form>
	</div>
</body>
</html>