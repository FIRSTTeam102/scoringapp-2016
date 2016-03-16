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
	}
}
%>

<c:if test="${isFormSubmitted == true}">
	<c:set var="hasSpyHuman" value='<%=request.getParameterValues("hasSpyHuman")[0]%>' />
	<%=request.getParameterValues("hasSpyHuman")[0]%>
	
	<c:set var="alliance" value="<%=alliance%>" />
	<c:if test="${hasSpyHuman == 'YES'}">
	<c:if test="${alliance == 'Blue'}">
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
	<c:if test="${hasSpyHuman == 'YES'}">
	<c:if test="${alliance == 'Red'}">
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
</c:if>

<%
	Enumeration<String> info = request.getParameterNames();

	Map<String, String> data = new HashMap<String, String>();

	for (int i = 0; info.hasMoreElements(); i++) {
		String currentName = info.nextElement();
		String currentValue = request.getParameterValues(currentName)[0];

		data.put(currentName, currentValue);
	}
	if (data.size() > 6 && request.getParameterValues("hasSpyHuman")[0].equals("YES")) {
		session.setAttribute(arenaDataKey, data);
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "autonomous.jsp");
	}
%>

<%
	//Place in head.	
	//Set alliance and team variables.
	String allianceColor = (String) session.getAttribute(allianceKey);
	String script = "<script id='allianceSet' type='text/javascript'>" + "alliance = '" + allianceColor + "'; "
			+ "side = '" + "Near" + "';" + "team1 = " + team1 + ";" + "team2 = " + team2 + ";" + "team3 = "
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