<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="STUDENTRUN.jsp"%>

<%
	String firstResp = request.getParameter("chkTeam1Reached");
	if(firstResp != null){
		
		pageContext.setAttribute("team1reach",request.getParameter("chkTeam1Reached"));
		pageContext.setAttribute("team1cross",request.getParameter("chkTeam1Crossed"));
		String score = request.getParameter("rdoScore1");
		if(score == "L"){
			pageContext.setAttribute("team1low","L");
		}else if(score == "H"){
			pageContext.setAttribute("team1high","H");
		}
	}
%>
<c:out value="${team1reach }"></c:out>

<sql:update dataSource="${database}">
	UPDATE match_teams
		SET auto_reach = ?
			, auto_cross = ?
			, auto_low = ?
			, auto_high = ?
		WHERE
			tournament_id = ?
			AND match_number = ?
			AND team_number = ?
	<sql:param value="${team1reach }" />
	<sql:param value="${team1cross }" />
	<sql:param value="${team1low }" />
	<sql:param value="Y" />
	<sql:param value="${tournament.rows[0].id}" />
	<sql:param value="${SessionScope.matchNumber }" />
	<sql:param value="${SessionScope.team1 }" />
</sql:update>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Autonomous</title>
<link rel="stylesheet" href="stylesheet.css">
<script src="js/jquery-1.12.0.min.js"></script>
<style>
</style>
</head>
<body>
	<div class="main">
		<%@include file="title-small.jsp"%>
		<form id="autonomousForm" action="autonomous.jsp" method="POST">
			<div id="Team1" class="team">
				<div id="Team1Number" class="teamNumber"><%=team1%></div>
				<div id="Team1AutoScore">
					<div id="Team1Reached">
						<input type="checkbox" name="chkTeam1Reached"
							id="chkTeam1Reached" value="Y" checked=""> <label
							for="chkTeam1Reached">Reached Defense</label>
					</div>
					<div id="Team1Crossed">
						<input type="checkbox" name="chkTeam1Crossed"
							id="chkTeam1Crossed" value="Y" checked=""> <label
							for="chkTeam1Crossed">Crossed Defense</label>
					</div>
					<div id="Team1ScoreHigh">
						<input type="radio" name="rdoScore1" id="rdoScoreHigh1" value="H">
						<label for="rdoScoreHigh1">High</label>
					</div>
					<div id="Team1ScoreLow">
						<input type="radio" name="rdoScore1" id="rdoScoreLow1" value="L">
						<label for="rdoScoreLow1">Low</label>
					</div>
				</div>
			</div>
			<div id="Team2" class="team">
				<div id="Team2Number" class="teamNumber"><%=team2%></div>
				<div id="Team2AutoScore">
					<div id="Team2Reached">
						<input type="checkbox" name="chkTeam2HasBallName"
							id="chkTeam2Reached" value="Y" checked=""> <label
							for="chkTeam2Reached">Reached Defense</label>
					</div>
					<div id="Team2Crossed">
						<input type="checkbox" name="chkTeam2HasBallName"
							id="chkTeam2Crossed" value="Y" checked=""> <label
							for="chkTeam2Crossed">Crossed Defense</label>
					</div>
					<div id="Team2ScoreHigh">
						<input type="radio" name="rdoScore2" id="rdoScoreHigh2" value="H">
						<label for="rdoScoreHigh2">High</label>
					</div>
					<div id="Team2ScoreLow">
						<input type="radio" name="rdoScore2" id="rdoScoreLow2" value="L">
						<label for="rdoScoreLow2">Low</label>
					</div>
				</div>
			</div>
			<div id="Team3" class="team">
				<div id="Team3Number" class="teamNumber"><%=team3%></div>
				<div id="Team3AutoScore">
					<div id="Team3Reached">
						<input type="checkbox" name="chkTeam3HasBallName"
							id="chkTeam3Reached" value="Y" checked=""> <label
							for="chkTeam3Reached">Reached Defense</label>
					</div>
					<div id="Team3Crossed">
						<input type="checkbox" name="chkTeam3HasBallName"
							id="chkTeam3Crossed" value="Y" checked=""> <label
							for="chkTeam3Crossed">Crossed Defense</label>
					</div>
					<div id="Team3ScoreHigh">
						<input type="radio" name="rdoScore3" id="rdoScoreHigh3" value="H">
						<label for="rdoScoreHigh3">High</label>
					</div>
					<div id="Team3ScoreLow">
						<input type="radio" name="rdoScore3" id="rdoScoreLow3" value="L">
						<label for="rdoScoreLow3">Low</label>
					</div>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="footer">
				<input type="hidden" name="scoreFieldName" id="scoreField" value="0">
				<div id="nav" style="padding-top: 25px; padding-bottom: 10px;">
					<input type="submit" name="btnNext" value=" Next ">
				</div>
			</div>
		</form>
	</div>
	<script src="js/autonomous.js"></script>
</body>
</html>