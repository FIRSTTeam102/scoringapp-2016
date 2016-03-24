<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ include file="STUDENTRUN.jsp"%>


<% 
Enumeration<String> formInputs = request.getParameterNames(); 

for(int i = 0; formInputs.hasMoreElements(); i++){
	String str = formInputs.nextElement();
	
	if(str.equals("hasSpyHuman")){
		pageContext.setAttribute("isFormSubmitted",true);
		
		pageContext.setAttribute("Team1", team1);
		pageContext.setAttribute("Team2", team2);
		pageContext.setAttribute("Team3", team3);
	}
}
%>

<c:if test="${isFormSubmitted == true}">
	<c:set var="hasSpyHuman" value='<%=request.getParameterValues("hasSpyHuman")[0]%>' />
	<c:set var="team1ShowUp" value='<%=request.getParameterValues("Team1NoShow")[0]%>' />
	<c:set var="team2ShowUp" value='<%=request.getParameterValues("Team2NoShow")[0]%>' />
	<c:set var="team3ShowUp" value='<%=request.getParameterValues("Team3NoShow")[0]%>' />
	
	<c:set var="alliance" value="<%=alliance%>" />
	<c:if test="${hasSpyHuman == 'YES'}">
	<c:if test="${alliance == 'Blue'}">
	<sql:update dataSource="${database}">
		UPDATE matches
		SET red_spy_human = ?
		WHERE tournament_id = ?
		AND match_number = ?
		<sql:param value="Y" />
		<sql:param value="${tournament.rows[0].ID}" />
		<sql:param value="${sessionScope.matchNumber }" />
	</sql:update>
	</c:if>
	</c:if>
	
	<c:if test="${hasSpyHuman == 'YES'}">
	<c:if test="${alliance == 'Red'}">
	<sql:update dataSource="${database}">
		UPDATE matches
		SET blue_spy_human = ?
		WHERE tournament_id = ?
		AND match_number = ?
		<sql:param value="Y" />
		<sql:param value="${tournament.rows[0].ID}" />
		<sql:param value="${sessionScope.matchNumber }" />
	</sql:update>
	</c:if>
	</c:if>
	
	<c:if test="${team1ShowUp == 'NO'}">
		<sql:update dataSource="${database}">
			UPDATE match_teams
			SET did_show_up = ?
			WHERE tournament_id = ?
			AND match_number = ?
			AND team_number = ?
			<sql:param value="Y" />
			<sql:param value="${tournament.rows[0].ID}" />
			<sql:param value="${sessionScope.matchNumber}" />
			<sql:param value="${Team1}" />
		</sql:update>
	</c:if>
	<c:if test="${team2ShowUp == 'NO'}">
		<sql:update dataSource="${database}">
			UPDATE match_teams
			SET did_show_up = ?
			WHERE tournament_id = ?
			AND match_number = ?
			AND team_number = ?
			<sql:param value="Y" />
			<sql:param value="${tournament.rows[0].ID}" />
			<sql:param value="${sessionScope.matchNumber}" />
			<sql:param value="${Team2}" />
		</sql:update>
	</c:if>
	<c:if test="${team3ShowUp == 'NO'}">
		<sql:update dataSource="${database}">
			UPDATE match_teams
			SET did_show_up = ?
			WHERE tournament_id = ?
			AND match_number = ?
			AND team_number = ?
			<sql:param value="Y" />
			<sql:param value="${tournament.rows[0].ID}" />
			<sql:param value="${sessionScope.matchNumber}" />
			<sql:param value="${Team3}" />
		</sql:update>
	</c:if>
	
	<c:if test="${team1ShowUp == 'YES'}">
		<sql:update dataSource="${database}">
			UPDATE match_teams
			SET did_show_up = ?
			WHERE tournament_id = ?
			AND match_number = ?
			AND team_number = ?
			<sql:param value="N" />
			<sql:param value="${tournament.rows[0].ID}" />
			<sql:param value="${sessionScope.matchNumber}" />
			<sql:param value="${Team1}" />
		</sql:update>
	</c:if>
	<c:if test="${team2ShowUp == 'YES'}">
		<sql:update dataSource="${database}">
			UPDATE match_teams
			SET did_show_up = ?
			WHERE tournament_id = ?
			AND match_number = ?
			AND team_number = ?
			<sql:param value="N" />
			<sql:param value="${tournament.rows[0].ID}" />
			<sql:param value="${sessionScope.matchNumber}" />
			<sql:param value="${Team2}" />
		</sql:update>
	</c:if>
	<c:if test="${team3ShowUp == 'YES'}">
		<sql:update dataSource="${database}">
			UPDATE match_teams
			SET did_show_up = ?
			WHERE tournament_id = ?
			AND match_number = ?
			AND team_number = ?
			<sql:param value="N" />
			<sql:param value="${tournament.rows[0].ID}" />
			<sql:param value="${sessionScope.matchNumber}" />
			<sql:param value="${Team3}" />
		</sql:update>
	</c:if>
</c:if>

<%
	HashMap<String, String> data = (HashMap<String, String>)session.getAttribute("arenaData");
	
	if (data != null)
	{
		String script = "<script type='text/javascript'>\nrobot0teamNumber = '" + data.get("robot0teamNumber") + "';\nrobot0xPosition = " + data.get("robot0xPosition") + ";\nrobot0yPosition = " + data.get("robot0yPosition") + ";\nrobot0width = " + data.get("robot0width") + ";\nrobot0height = " + data.get("robot0height") + ";\n";
		script += "robot1teamNumber = '" + data.get("robot1teamNumber") + "';\nrobot1xPosition = " + data.get("robot1xPosition") + ";\nrobot1yPosition = " + data.get("robot1yPosition") + ";\nrobot1width = " + data.get("robot1width") + ";\nrobot1height = " + data.get("robot1height") + ";\n";
		script += "robot2teamNumber = '" + data.get("robot2teamNumber") + "';\nrobot2xPosition = " + data.get("robot2xPosition") + ";\nrobot2yPosition = " + data.get("robot2yPosition") + ";\nrobot2width = " + data.get("robot2width") + ";\nrobot2height = " + data.get("robot2height") + ";\n";
		
		script += "defense0name = '" + data.get("defense0name") + "';\ndefense0xPosition = " + data.get("defense0xPosition") + ";\ndefense0yPosition = " + data.get("defense0yPosition") + ";\ndefense0width = " + data.get("defense0width") + ";\ndefense0height = " + data.get("defense0height") + ";\ndefense0category = " + data.get("defense0category") + ";\n";
		script += "defense1name = '" + data.get("defense1name") + "';\ndefense1xPosition = " + data.get("defense1xPosition") + ";\ndefense1yPosition = " + data.get("defense1yPosition") + ";\ndefense1width = " + data.get("defense1width") + ";\ndefense1height = " + data.get("defense1height") + ";\ndefense1category = " + data.get("defense1category") + ";\n";
		script += "defense2name = '" + data.get("defense2name") + "';\ndefense2xPosition = " + data.get("defense2xPosition") + ";\ndefense2yPosition = " + data.get("defense2yPosition") + ";\ndefense2width = " + data.get("defense2width") + ";\ndefense2height = " + data.get("defense2height") + ";\ndefense2category = " + data.get("defense2category") + ";\n";
		script += "defense3name = '" + data.get("defense3name") + "';\ndefense3xPosition = " + data.get("defense3xPosition") + ";\ndefense3yPosition = " + data.get("defense3yPosition") + ";\ndefense3width = " + data.get("defense3width") + ";\ndefense3height = " + data.get("defense3height") + ";\ndefense3category = " + data.get("defense3category") + ";\n";
		
		script += "robotAsSpyBot = '" + data.get("robotAsSpyBot") + "';\nhasSpyHuman = '" + data.get("hasSpyHuman") + "';\n";
		script += "Team1NoShow = '" + data.get("Team1NoShow") + "';\nTeam2NoShow = '" + data.get("Team2NoShow") + "';\nTeam3NoShow = '" + data.get("Team3NoShow") + "';\n";
		
		script += "<" + "/" + "script>";
		
		out.println(script);
	}
	else
	{
		String script = "<script type='text/javascript'>\ndefense0name = '';\n</script>";
		out.println(script);
	}
	
	Enumeration<String> info = request.getParameterNames();

	Map<String, String> dataForSession = new HashMap<String, String>();

	for (int i = 0; info.hasMoreElements(); i++) {
		String currentName = info.nextElement();
		String currentValue = request.getParameterValues(currentName)[0];

		dataForSession.put(currentName, currentValue);
	}
	if (dataForSession.size() > 6) {
		session.setAttribute(arenaDataKey, dataForSession);
		session.setAttribute("cycleNumber", 0);
		session.setAttribute("preMatch", true);
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "autonomous.jsp");
	}
%>

<%
	//Place in head.	
	//Set alliance and team variables.
	String allianceColor = (String) session.getAttribute(allianceKey);
	String script = "<script id='allianceSet' type='text/javascript'>" + "alliance = '" + allianceColor + "'; "
			+ "side = '" + side + "';" + "team1 = " + team1 + ";" + "team2 = " + team2 + ";" + "team3 = "
			+ team3 + ";" + "</script>";
	out.println(script);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="stylesheet.css">
<title>Pre Match</title>
<style>
.title-small {
	z-index: 10;
}

#arena {
	z-index: -1;
	margin-top: -67px;
}

span.no_selection {
	-webkit-user-select: none; /* webkit (safari, chrome) browsers */
	-moz-user-select: none; /* mozilla browsers */
	-khtml-user-select: none; /* webkit (konqueror) browsers */
	-ms-user-select: none; /* IE10+ */
}
</style>
<script type="text/javascript" src="js/pre-match.js">
	
</script>
</head>
<body onload="loadPage();">
	<div class="main">
		<%@include file="title-small.jsp"%>
		<br>
		<br>
		<canvas id="arena" width="575" height="700"> </canvas>

		<div id="nav">
			<div id="NoShow">
				No Show <br>
				<div id="team1NoShow">
					<input id="team1Checkbox" name="Team1NoShow" type="checkbox"
						onclick="removeDuplicates(1);" />
				</div>
				<br>
				<div id="team2NoShow">
					<input id="team2Checkbox" name="Team2NoShow" type="checkbox"
						onclick="removeDuplicates(2);" />
				</div>
				<br>
				<div id="team3NoShow">
					<input id="team3Checkbox" name="Team3NoShow" type="checkbox"
						onclick="removeDuplicates(3);" />
				</div>
			</div>
			<br>
			<div style="padding-top: 10px; padding-bottom: 10px;">
				<input type="submit" name="btnChooseMatch" value="Next"
					onclick="loadNextPage();" />
			</div>
		</div>
	</div>

	<form class="main" action="pre-match.jsp" method="post" id="actionForm">
	</form>

	<img id="portcullis" src="Images/Defenses/Portcullis.png" width="1"
		height="1" style="visibility: hidden">
	<img id="chevalDeFrise" src="Images/Defenses/ChevaldeFrise.png"
		width="1" height="1" style="visibility: hidden">
	<img id="moat" src="Images/Defenses/Moat.png" width="1" height="1"
		style="visibility: hidden">
	<img id="ramparts" src="Images/Defenses/Ramparts.png" width="1"
		height="1" style="visibility: hidden">
	<img id="drawbridge" src="Images/Defenses/Drawbridge.png" width="1"
		height="1" style="visibility: hidden">
	<img id="sallyPort" src="Images/Defenses/Sally Port.png" width="1"
		height="1" style="visibility: hidden">
	<img id="rockWall" src="Images/Defenses/Rock Wall.png" width="1"
		height="1" style="visibility: hidden">
	<img id="roughTerrain" src="Images/Defenses/Rough Terrain.png"
		width="1" height="1" style="visibility: hidden">
	<img id="lowBar" src="Images/Defenses/Low Bar.png" width="1" height="1"
		style="visibility: hidden">
	<img src="Images/bluearena.png" id="blueArenaBG"
		style="visibility: hidden" width="1" height="1">
	<img src="Images/redarena.png" id="redArenaBG"
		style="visibility: hidden" width="1" height="1">
	<img src="Images/bluearena-flipped.png" id="blueArenaFlippedBG"
		style="visibility: hidden" width="1" height="1">
	<img src="Images/redarena-flipped.png" id="redArenaFlippedBG"
		style="visibility: hidden" width="1" height="1">
	<img src="Images/woodBG-defense.jpg" id="defenseBG"
		style="visibility: hidden" width="1" height="1">

</body>
</html>