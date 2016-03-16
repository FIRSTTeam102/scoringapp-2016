<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="STUDENTRUN.jsp"%>
<%
	if (isPreMatchComplete == null) {
		if (match == null) {
			if (alliance == null) {
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "scoringapp.jsp");
			} else {
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "choosematch.jsp");
			}
		} else {
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", "pre-match.jsp");
		}
	}
%>

<%-- Check if the form has been submitted already. --%>
<%
	Enumeration<String> formInputs = request.getParameterNames();

	for (int i = 0; formInputs.hasMoreElements(); i++) {
		String str = formInputs.nextElement();

		if (str.equals("btnNext")) {
			pageContext.setAttribute("isFormSubmitted", true);
		}
	}
%>
<c:if test="${isFormSubmitted == true }">

	<%-- Team 1 data --%>
	<%
		String reach1 = request.getParameter("chkTeam1Reached");
			if (reach1 != null) {
				pageContext.setAttribute("team1reach", "Y");
			} else {
				pageContext.setAttribute("team1reach", "N");
			}

			String cross1 = request.getParameter("chkTeam1Crossed");
			if (cross1 != null) {
				pageContext.setAttribute("team1cross", "Y");
			} else {
				pageContext.setAttribute("team1cross", "N");
			}

			String score1 = request.getParameter("rdoScore1");
			if (score1 != null) {
				pageContext.setAttribute("team1goal", score1);
			} else {
				pageContext.setAttribute("team1goal", "N");
			}

			String succ1 = request.getParameter("chkTeam1ScoreFail");
			if (succ1 == null && score1 != null) {
				pageContext.setAttribute("team1succ", "Y");
			} else {
				pageContext.setAttribute("team1succ", "N");
			}
	%>
	<%-- Team 2 data --%>
	<%
		String reach2 = request.getParameter("chkTeam2Reached");
			if (reach2 != null) {
				pageContext.setAttribute("team2reach", "Y");
			} else {
				pageContext.setAttribute("team2reach", "N");
			}

			String cross2 = request.getParameter("chkTeam2Crossed");
			if (cross2 != null) {
				pageContext.setAttribute("team2cross", "Y");
			} else {
				pageContext.setAttribute("team2cross", "N");
			}

			String score2 = request.getParameter("rdoScore2");
			if (score2 != null) {
				pageContext.setAttribute("team2goal", score2);
			} else {
				pageContext.setAttribute("team2goal", "N");
			}

			String succ2 = request.getParameter("chkTeam2ScoreFail");
			if (succ2 == null && score2 != null) {
				pageContext.setAttribute("team2succ", "Y");
			} else {
				pageContext.setAttribute("team2succ", "N");
			}
	%>
	<%-- Team 3 data --%>
	<%
		String reach3 = request.getParameter("chkTeam3Reached");
			if (reach3 != null) {
				pageContext.setAttribute("team3reach", "Y");
			} else {
				pageContext.setAttribute("team3reach", "N");
			}

			String cross3 = request.getParameter("chkTeam3Crossed");
			if (cross3 != null) {
				pageContext.setAttribute("team3cross", "Y");
			} else {
				pageContext.setAttribute("team3cross", "N");
			}

			String score3 = request.getParameter("rdoScore3");
			if (score3 != null) {
				pageContext.setAttribute("team3goal", score3);
			} else {
				pageContext.setAttribute("team3goal", "N");
			}

			String succ3 = request.getParameter("chkTeam3ScoreFail");
			if (succ3 == null && score3 != null) {
				pageContext.setAttribute("team3succ", "Y");
			} else {
				pageContext.setAttribute("team3succ", "N");
			}
	%>

	<%-- SQL Update statements: 1 per team in alliance --%>

	<sql:update dataSource="${database}">
		UPDATE match_teams
			SET auto_reach = ?
				, auto_cross = ?
				, auto_goal = ?
				, auto_goal_success = ?
			WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${team1reach }" />
		<sql:param value="${team1cross }" />
		<sql:param value="${team1goal }" />
		<sql:param value="${team1succ }" />
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team1 }" />
	</sql:update>
	<sql:update dataSource="${database}">
		UPDATE match_teams
			SET auto_reach = ?
				, auto_cross = ?
				, auto_goal = ?
				, auto_goal_success = ?
			WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${team2reach }" />
		<sql:param value="${team2cross }" />
		<sql:param value="${team2goal }" />
		<sql:param value="${team2succ }" />
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team2 }" />
	</sql:update>
	<sql:update dataSource="${database}">
		UPDATE match_teams
			SET auto_reach = ?
				, auto_cross = ?
				, auto_goal = ?
				, auto_goal_success = ?
			WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${team3reach }" />
		<sql:param value="${team3cross }" />
		<sql:param value="${team3goal }" />
		<sql:param value="${team3succ }" />
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team3 }" />
	</sql:update>
	<%
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "teleop.jsp");
	%>
</c:if>


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
		<div class="header">
			<div>Choose a Match</div>
			<div id="competition"></div>
			<div id="allianceColor" class="<%=alliance%>"><%=alliance%>
				Alliance
			</div>
		</div>
		<form id="autonomousForm" action="autonomous.jsp" method="POST">
			<div id="Team1" class="team">
				<div id="Team1Number" class="teamNumber"><%=team1%></div>
				<div id="Team1AutoScore">
					<div id="Team1Reached">
						<input type="checkbox" name="chkTeam1Reached" id="chkTeam1Reached"
							value="Y"> <label for="chkTeam1Reached">Reached
							Defense</label>
					</div>
					<div id="Team1Crossed">
						<input type="checkbox" name="chkTeam1Crossed" id="chkTeam1Crossed"
							value="Y"> <label for="chkTeam1Crossed">Crossed
							Defense</label>
					</div>
					<div id="Team1ScoreHigh">
						<input type="radio" name="rdoScore1" id="rdoScoreHigh1" value="H">
						<label for="rdoScoreHigh1">High</label>
					</div>
					<div id="Team1ScoreLow">
						<input type="radio" name="rdoScore1" id="rdoScoreLow1" value="L">
						<label for="rdoScoreLow1">Low</label>
					</div>
					<div id="Team1ScoreFail">
						<!-- Note: Checked value "N" actually means that by default, the team succeeded. It's illogical in programming, but easier for the scorer. -->
						<input id="chkTeam1ScoreFail" type="checkbox"
							name="chkTeam1ScoreFail" value="N"> <label
							for="chkTeam1ScoreFail">Failed to Score</label>
					</div>
				</div>
			</div>
			<div id="Team2" class="team">
				<div id="Team2Number" class="teamNumber"><%=team2%></div>
				<div id="Team2AutoScore">
					<div id="Team2Reached">
						<input type="checkbox" name="chkTeam2Reached" id="chkTeam2Reached"
							value="Y"> <label for="chkTeam2Reached">Reached
							Defense</label>
					</div>
					<div id="Team2Crossed">
						<input type="checkbox" name="chkTeam2Crossed" id="chkTeam2Crossed"
							value="Y"> <label for="chkTeam2Crossed">Crossed
							Defense</label>
					</div>
					<div id="Team2ScoreHigh">
						<input type="radio" name="rdoScore2" id="rdoScoreHigh2" value="H">
						<label for="rdoScoreHigh2">High</label>
					</div>
					<div id="Team2ScoreLow">
						<input type="radio" name="rdoScore2" id="rdoScoreLow2" value="L">
						<label for="rdoScoreLow2">Low</label>
					</div>
					<div id="Team2ScoreFail">
						<!-- Note: Checked value "N" actually means that by default, the team succeeded. It's illogical in programming, but easier for the scorer. -->
						<input id="chkTeam2ScoreFail" type="checkbox"
							name="chkTeam2ScoreFail" value="N"> <label
							for="chkTeam2ScoreFail">Failed to Score</label>
					</div>
				</div>
			</div>
			<div id="Team3" class="team">
				<div id="Team3Number" class="teamNumber"><%=team3%></div>
				<div id="Team3AutoScore">
					<div id="Team3Reached">
						<input type="checkbox" name="chkTeam3Reached" id="chkTeam3Reached"
							value="Y"> <label for="chkTeam3Reached">Reached
							Defense</label>
					</div>
					<div id="Team3Crossed">
						<input type="checkbox" name="chkTeam3Crossed" id="chkTeam3Crossed"
							value="Y"> <label for="chkTeam3Crossed">Crossed
							Defense</label>
					</div>
					<div id="Team3ScoreHigh">
						<input type="radio" name="rdoScore3" id="rdoScoreHigh3" value="H">
						<label for="rdoScoreHigh3">High</label>
					</div>
					<div id="Team3ScoreLow">
						<input type="radio" name="rdoScore3" id="rdoScoreLow3" value="L">
						<label for="rdoScoreLow3">Low</label>
					</div>
					<div id="Team3ScoreFail">
						<!-- Note: Checked value "N" actually means that by default, the team succeeded. It's illogical in programming, but easier for the scorer. -->
						<input id="chkTeam3ScoreFail" type="checkbox"
							name="chkTeam3ScoreFail" value="N"> <label
							for="chkTeam3ScoreFail">Failed to Score</label>
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