<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ include file="STUDENTRUN.jsp"%>

<% 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Tele-Op</title>
</head>
<body onload="loadPage();">
	<div class="main">
		<canvas id="arena" width="575" height="700">
		</canvas>
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
	<img src="Images/bluearena.png" id="blueArenaBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/redarena.png" id="redArenaBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/bluearena-flipped.png" id="blueArenaFlippedBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/redarena-flipped.png" id="redArenaFlippedBG" style="visibility: hidden" width="1" height="1">
</body>
</html>