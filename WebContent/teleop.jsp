<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*"%>
<%@ include file="STUDENTRUN.jsp"%>

<% 
Enumeration<String> formInputs = request.getParameterNames(); 

for(int i = 0; formInputs.hasMoreElements(); i++){
	String str = formInputs.nextElement();
	
	if(str.equals("operationAttempted")){
		pageContext.setAttribute("isFormSubmitted",true);
	}
}
%>

<c:if test="${isFormSubmitted == true}">
	<sql:update dataSource="${database}">
		UPDATE match_team_cycles
		SET blue_spy_human = ?
		WHERE tournament_id = ?
		AND match_number = ?
		<sql:param value="Y" />
		<sql:param value="${tournament.rows[0].ID}" />
		<sql:param value="${sessionScope.matchNumber }" />
	</sql:update>
</c:if>

<% 	HashMap<String, String> data = (HashMap<String, String>)session.getAttribute("arenaData");
	String allianceColor = (String)session.getAttribute(allianceKey);
	
	String script = "<script type='text/javascript'>\nrobot0teamNumber = '" + data.get("robot0teamNumber") + "';\nrobot0xPosition = " + data.get("robot0xPosition") + ";\nrobot0yPosition = " + data.get("robot0yPosition") + ";\nrobot0width = " + data.get("robot0width") + ";\nrobot0height = " + data.get("robot0height") + ";\n";
	script += "robot1teamNumber = '" + data.get("robot1teamNumber") + "';\nrobot1xPosition = " + data.get("robot1xPosition") + ";\nrobot1yPosition = " + data.get("robot1yPosition") + ";\nrobot1width = " + data.get("robot1width") + ";\nrobot1height = " + data.get("robot1height") + ";\n";
	script += "robot2teamNumber = '" + data.get("robot2teamNumber") + "';\nrobot2xPosition = " + data.get("robot2xPosition") + ";\nrobot2yPosition = " + data.get("robot2yPosition") + ";\nrobot2width = " + data.get("robot2width") + ";\nrobot2height = " + data.get("robot2height") + ";\n";
	
	script += "defense0name = '" + data.get("defense0name") + "';\ndefense0xPosition = " + data.get("defense0xPosition") + ";\ndefense0yPosition = " + data.get("defense0yPosition") + ";\ndefense0width = " + data.get("defense0width") + ";\ndefense0height = " + data.get("defense0height") + ";\ndefense0category = " + data.get("defense0category") + ";\n";
	script += "defense1name = '" + data.get("defense1name") + "';\ndefense1xPosition = " + data.get("defense1xPosition") + ";\ndefense1yPosition = " + data.get("defense1yPosition") + ";\ndefense1width = " + data.get("defense1width") + ";\ndefense1height = " + data.get("defense1height") + ";\ndefense1category = " + data.get("defense1category") + ";\n";
	script += "defense2name = '" + data.get("defense2name") + "';\ndefense2xPosition = " + data.get("defense2xPosition") + ";\ndefense2yPosition = " + data.get("defense2yPosition") + ";\ndefense2width = " + data.get("defense2width") + ";\ndefense2height = " + data.get("defense2height") + ";\ndefense2category = " + data.get("defense2category") + ";\n";
	script += "defense3name = '" + data.get("defense3name") + "';\ndefense3xPosition = " + data.get("defense3xPosition") + ";\ndefense3yPosition = " + data.get("defense3yPosition") + ";\ndefense3width = " + data.get("defense3width") + ";\ndefense3height = " + data.get("defense3height") + ";\ndefense3category = " + data.get("defense3category") + ";\n";
	
	script += "robotAsSpyBot = '" + data.get("robotAsSpyBot") + "';\nhasSpyHuman = '" + data.get("hasSpyHuman") + "';\n";
	script += "Team1NoShow = '" + data.get("Team1NoShow") + "';\nTeam2NoShow = '" + data.get("Team2NoShow") + "';\nTeam3NoShow = '" + data.get("Team3NoShow") + "';\n";
	script += "alliance = '" + "Blue" + "';\nside = '" + "Near" +"';\nteam1 = '" + "102" + "';\nteam2 = '" + "105" + "';\nteam3 = '" + "108" + "';\n"; 
	
	script += "<" + "/" + "script>";
	
	out.println(script);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tele-Op</title>
<link rel="stylesheet" href="stylesheet.css">
<script type="text/javascript" src="js/teleop.js">

</script>
</head>
<body onload="loadPage();">
<div class="main">
	<canvas id="arena" style="border: 1px solid black;" width="575" height="700">
	</canvas>
	<br>
	<br>
	<input type="button" onclick="window.location = 'post-match.jsp';" value="Post Match"/>
</div>
	
	<img id="portcullis" src="Images/Defenses/Portcullis.png" width="1" height="1" style="visibility: hidden">
	<img id="chevalDeFrise" src="Images/Defenses/ChevaldeFrise.png" width="1" height="1" style="visibility: hidden">
	<img id="moat" src="Images/Defenses/Moat.png" width="1" height="1" style="visibility: hidden">
	<img id="ramparts" src="Images/Defenses/Ramparts.png" width="1" height="1" style="visibility: hidden">
	<img id="drawbridge" src="Images/Defenses/Drawbridge.png" width="1" height="1" style="visibility: hidden">
	<img id="sallyPort" src="Images/Defenses/Sally Port.png" width="1" height="1" style="visibility: hidden">
	<img id="rockWall" src="Images/Defenses/Rock Wall.png" width="1" height="1" style="visibility: hidden">
	<img id="roughTerrain" src="Images/Defenses/Rough Terrain.png" width="1" height="1" style="visibility: hidden">
	<img id="lowBar" src="Images/Defenses/Low Bar.png" width="1" height="1" style="visibility: hidden">	
	<img src="Images/TObluearena.png" id="blueArenaBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/TOredarena.png" id="redArenaBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/TObluearena-flipped.png" id="blueArenaFlippedBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/TOredarena-flipped.png" id="redArenaFlippedBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/woodBG-defense.jpg" id="defenseBG" style="visibility: hidden" width="1" height="1">
	<form id="cycleForm" name="cycleSubmit" action="teleop.jsp" method="POST">
		
	</form>
</body>
</html>