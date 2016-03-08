<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="STUDENTRUN.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auto</title>
<link rel="stylesheet" href="stylesheet.css">
<script src="js/jquery-1.12.0.min.js"></script>
<style>
#AllianceList>input:hover {
	cursor: pointer;
}

#AllianceList>input {
	border: none;
}

body div {
	text-align: center;
}

.teamNumber {
	padding: 5px;
}

.team {
	border: solid 1px white;
	float: left;
	width: 32%;
}

.team div {
	padding: .2em 0 .2em 0;
}

#Score {
	color: white;
	padding: 20;
}

input:focus, textarea:focus, select:focus {
	outline-color: #c00;
}
</style>
</head>
<body>
	<div class="main">
		<%@include file="title-small.jsp"%>

		<!-- div class="box">
			<div>Crossed Line</div>
			<br> <input type="CheckBox"> <br> <input
				type="CheckBox"> <br> <input type="CheckBox"> <br>
		</div>
		<br>
		<div class="box">
			<div>Crossed Defense</div>
			<br> <input type="CheckBox"> <br> <input
				type="CheckBox"> <br> <input type="CheckBox"> <br>
		</div>
		<br>
		<div class="box">
			<div>Score High/Low</div>
			<br> <input type="CheckBox"> <br> <input
				type="CheckBox"> <br> <input type="CheckBox"> <br>
		</div>
		<br> <input value="Tele-Op" type="button"
			onclick="window.location = 'teleop.jsp';" /-->
		<p id="TEST"></p>
		<form id="autonomousForm" action="/2014/autonomous.php" method="POST">
			<div id="Team1" class="team">
				<div id="Team1Number" class="teamNumber"><%= team1 %></div>
				<div id="Team1AutoScore">
					<div id="Team1Reached">
						<input type="checkbox" name="chkTeam1HasBallName"
							id="chkTeam1Reached" value="Y" checked=""> <label
							for="chkTeam1Reached">Reached Defense</label>
					</div>
					<div id="Team1Crossed">
						<input type="checkbox" name="chkTeam1HasBallName"
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
				<div id="Team2Number" class="teamNumber"><%= team2 %></div>
				<div id="Team2AutoScore">
					<div id="Team2HasBall">
						<input type="checkbox" name="chkTeam2HasBallName"
							id="chkTeam2HasBall" value="Team-2-HasBall" checked=""> <label
							for="chkTeam2HasBall">Has Ball</label>
					</div>
					<div id="Team2ScoreHigh">
						<input type="radio" name="rdoScore2" id="rdoScoreHigh2" value="H">
						<label for="rdoScoreHigh2">High</label>
					</div>
					<div id="Team2ScoreLow">
						<input type="radio" name="rdoScore2" id="rdoScoreLow2" value="L">
						<label for="rdoScoreLow2">Low</label>
					</div>
					<div id="Team2ScoreNone">
						<input type="radio" name="rdoScore2" id="rdoScoreNone2" value="N"
							checked="true"> <label for="rdoScoreNone2">None</label>
					</div>
					<div id="Team2Hot">
						<input type="checkbox" name="chkTeam2HotName" id="chkScoreHot2"
							value="Team-2-Hot"> <label for="chkScoreHot2">Hot</label>
					</div>
					<div id="Team2Mobility">
						<input type="checkbox" name="chkTeam2MobilityName"
							id="chkMobility2" value="Team-2-Mobility"> <label
							for="chkMobility2">Mobility</label>
					</div>
				</div>
			</div>
			<div id="Team3" class="team">
				<div id="Team3Number" class="teamNumber"><%= team3 %></div>
				<div id="Team3AutoScore">
					<div id="Team3HasBall">
						<input type="checkbox" name="chkTeam3HasBallName"
							id="chkTeam3HasBall" value="Team-3-HasBall" checked=""> <label
							for="chkTeam3HasBall">Has Ball</label>
					</div>
					<div id="Team3ScoreHigh">
						<input type="radio" name="rdoScore3" id="rdoScoreHigh3" value="H">
						<label for="rdoScoreHigh3">High</label>
					</div>
					<div id="Team3ScoreLow">
						<input type="radio" name="rdoScore3" id="rdoScoreLow3" value="L">
						<label for="rdoScoreLow3">Low</label>
					</div>
					<div id="Team3ScoreNone">
						<input type="radio" name="rdoScore3" id="rdoScoreNone3" value="N"
							checked="true"> <label for="rdoScoreNone3">None</label>
					</div>
					<div id="Team3Hot">
						<input type="checkbox" name="chkTeam3HotName" id="chkScoreHot3"
							value="Team-3-Hot"> <label for="chkScoreHot3">Hot</label>
					</div>
					<div id="Team3Mobility">
						<input type="checkbox" name="chkTeam3MobilityName"
							id="chkMobility3" value="Team-3-Mobility"> <label
							for="chkMobility3">Mobility</label>
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
	<script src="js/autonomous.js">
	</script>
</body>
</html>