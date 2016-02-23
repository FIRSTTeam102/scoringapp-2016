<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*"%>
<%@ include file="STUDENTRUN.jsp"%> 

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
<script type="text/javascript">

var robotPositions = [];
var defensePositions = [];
var selectMode = 0;

var defense = function(image, position, category, name){
	this.image = image;
	this.position = position;
	this.category = category;
	this.name = name;
}

var robot = function(teamNumber, position){
	this.teamNumber = teamNumber;
	this.position = position;
}

	function loadPage() {
		canvas = document.getElementById("arena");
		ctx = canvas.getContext('2d');
		
		if (robot0teamNumber)
		{
			robotPositions.push(new robot(robot0teamNumber, {x:robot0xPosition, y:robot0yPosition, width:robot0width, height:robot0height}));
		}

		if (robot1teamNumber != null)
		{
			robotPositions.push(new robot(robot1teamNumber, {x:robot1xPosition, y:robot1yPosition, width:robot1width, height:robot1height}));
		}
		
		if (robot2teamNumber != null)
		{
			robotPositions.push(new robot(robot2teamNumber, {x:robot2xPosition, y:robot2yPosition, width:robot2width, height:robot2height}));
		}
		
		for (var i = 0; i < 4; i++)
		{
			var image;
			var category;
			
			if (i == 0)
			{
				if (defense0name == "Portcullis")
				{
					image = document.getElementById("portcullis");
					category = 1;
				}
				else if (defense0name == "Cheval De Frise")
				{
					image = document.getElementById("chevalDeFrise");
					category = 1;
				}
				else if (defense0name == "Moat")
				{
					image = document.getElementById("moat");
					category = 2;
				}
				else if (defense0name == "Ramparts")
				{
					image = document.getElementById("ramparts");
					category = 2;
				}
				else if (defense0name == "Drawbridge")
				{
					image = document.getElementById("drawbridge");
					category = 3;
				}
				else if (defense0name == "Sally Port")
				{
					image = document.getElementById("sallyPort");
					category = 3;
				}
				else if (defense0name == "Rock Wall")
				{
					image = document.getElementById("rockWall");
					category = 4;
				}
				else if (defense0name == "Rough Terrain")
				{
					image = document.getElementById("roughTerrain");
					category = 4;
				}
				defensePositions.push(new defense(image, {x:defense0xPosition, y:defense0yPosition, width:defense0width, height:defense0height}, category, defense0name));
			}
			else if (i == 1)
			{
				if (defense1name == "Portcullis")
				{
					image = document.getElementById("portcullis");
					category = 1;
				}
				else if (defense1name == "Cheval De Frise")
				{
					image = document.getElementById("chevalDeFrise");
					category = 1;
				}
				else if (defense1name == "Moat")
				{
					image = document.getElementById("moat");
					category = 2;
				}
				else if (defense1name == "Ramparts")
				{
					image = document.getElementById("ramparts");
					category = 2;
				}
				else if (defense1name == "Drawbridge")
				{
					image = document.getElementById("drawbridge");
					category = 3;
				}
				else if (defense1name == "Sally Port")
				{
					image = document.getElementById("sallyPort");
					category = 3;
				}
				else if (defense1name == "Rock Wall")
				{
					image = document.getElementById("rockWall");
					category = 4;
				}
				else if (defense1name == "Rough Terrain")
				{
					image = document.getElementById("roughTerrain");
					category = 4;
				}
				defensePositions.push(new defense(image, {x:defense1xPosition, y:defense1yPosition, width:defense1width, height:defense1height}, category, defense1name));
			}
			else if (i == 2)
			{
				if (defense2name == "Portcullis")
				{
					image = document.getElementById("portcullis");
					category = 1;
				}
				else if (defense2name == "Cheval De Frise")
				{
					image = document.getElementById("chevalDeFrise");
					category = 1;
				}
				else if (defense2name == "Moat")
				{
					image = document.getElementById("moat");
					category = 2;
				}
				else if (defense2name == "Ramparts")
				{
					image = document.getElementById("ramparts");
					category = 2;
				}
				else if (defense2name == "Drawbridge")
				{
					image = document.getElementById("drawbridge");
					category = 3;
				}
				else if (defense2name == "Sally Port")
				{
					image = document.getElementById("sallyPort");
					category = 3;
				}
				else if (defense2name == "Rock Wall")
				{
					image = document.getElementById("rockWall");
					category = 4;
				}
				else if (defense2name == "Rough Terrain")
				{
					image = document.getElementById("roughTerrain");
					category = 4;
				}
				defensePositions.push(new defense(image, {x:defense2xPosition, y:defense2yPosition, width:defense2width, height:defense2height}, category, defense2name));
			}
			else
			{
				if (defense3name == "Portcullis")
				{
					image = document.getElementById("portcullis");
					category = 1;
				}
				else if (defense3name == "Cheval De Frise")
				{
					image = document.getElementById("chevalDeFrise");
					category = 1;
				}
				else if (defense3name == "Moat")
				{
					image = document.getElementById("moat");
					category = 2;
				}
				else if (defense3name == "Ramparts")
				{
					image = document.getElementById("ramparts");
					category = 2;
				}
				else if (defense3name == "Drawbridge")
				{
					image = document.getElementById("drawbridge");
					category = 3;
				}
				else if (defense3name == "Sally Port")
				{
					image = document.getElementById("sallyPort");
					category = 3;
				}
				else if (defense3name == "Rock Wall")
				{
					image = document.getElementById("rockWall");
					category = 4;
				}
				else if (defense3name == "Rough Terrain")
				{
					image = document.getElementById("roughTerrain");
					category = 4;
				}
				defensePositions.push(new defense(image, {x:defense3xPosition, y:defense3yPosition, width:defense3width, height:defense3height}, category, defense3name));
			}
		}
		
		failedPath = new Path2D();
		failedPath.rect(105, 652, 78, 33);
		
		succeededPath = new Path2D();
		succeededPath.rect(370, 652, 123, 33);
		
		if (side != "Near")
		{
			if (alliance != "Red")
			{
				arena = document.getElementById("redArenaFlippedBG");
			}
			else
			{
				arena = document.getElementById("blueArenaFlippedBG");
			}
			ctx.drawImage(arena, 0, 0);
		}
		else
		{
			if (alliance != "Red")
			{
				arena = document.getElementById("redArenaBG");
			}
			else
			{
				arena = document.getElementById("blueArenaBG");
			}
			ctx.drawImage(arena, 0, 0);
		}
		
		// Should remain at bottom
		drawArenaWithChanges();
		
		canvas.onmousedown = function (e)
		{
			var context = e.target.getContext('2d');
			var x = e.offsetX;
			var y = e.offsetY;
			
			if (selectMode == 0)
			{
				if (context.isPointInPath())
			}
		}
	}
	
	function drawArenaWithChanges() {
		for (var i = 0; i < defensePositions.length; i++)
		{
			var defenseToDraw = defensePositions[i];
			ctx.drawImage(defenseToDraw.image, defenseToDraw.position.x, defenseToDraw.position.y, defenseToDraw.position.width, defenseToDraw.position.height);
		}

		ctx.fillStyle = "white";
		ctx.font = "18px serif";
		ctx.textAlign = "center";
		for (var i = 0; i < robotPositions.length; i++)
		{
			var robotToDraw = robotPositions[i];
			ctx.fillText("Team " + robotToDraw.teamNumber, robotToDraw.position.x + 77 / 2, robotToDraw.position.y + 58 / 2 + 3, robotToDraw.position.width);
		}
		
		ctx.fillStyle = "red";
		ctx.fill(failedPath);
		ctx.fillStyle = "green";
		ctx.fill(succeededPath);
		
		ctx.font = "25px serif";
		ctx.fillStyle = "white";
		ctx.fillText("Failed", 143.75, 677);
		ctx.fillText("Succeeded", 431.25, 677);
	}
</script>
</head>
<body onload="loadPage();">
<div class="main">
	<canvas id="arena" style="border: 1px solid black;" width="575" height="700">
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
	<img src="Images/TObluearena.png" id="blueArenaBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/TOredarena.png" id="redArenaBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/TObluearena-flipped.png" id="blueArenaFlippedBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/TOredarena-flipped.png" id="redArenaFlippedBG" style="visibility: hidden" width="1" height="1">
	<img src="Images/woodBG-defense.jpg" id="defenseBG" style="visibility: hidden" width="1" height="1">
</body>
</html>