<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pre Match</title>
<style>
	.box {
		border: 1px solid black;
		width: 400px;
		height: 100px;
		float: right;
		margin: auto;
	}
</style>
<script id="allianceSet" type="text/javascript">
	alliance = "Red";
</script>
<script type="text/javascript">

var positionToPlaceDefense;
var defensePositions = [];

var defense = function(image, position, category){
	this.image = image;
	this.position = position;
	this.category = category;
}

	function loadPage() {
		canvas = document.getElementById("arena");
		ctx = canvas.getContext('2d');
		if (alliance == "Red")
		{
			arena = document.getElementById("redArenaBG");
			ctx.drawImage(arena, 0, 0);
		}
		else
		{
			arena = document.getElementById("blueArenaBG");
			ctx.drawImage(arena, 0, 0);
		}
		
		selectDefense = false;

		portcullis = document.getElementById("portcullis");
		chevalDeFrise = document.getElementById("chevalDeFrise");
		moat = document.getElementById("moat");
		ramparts = document.getElementById("ramparts");
		drawbridge = document.getElementById("drawbridge");
		roughTerrain = document.getElementById("roughTerrain");
		rockWall = document.getElementById("rockWall");
		sallyPort = document.getElementById("sallyPort");
		
		var defense1 = new Path2D();
		defense1.rect(363, 189, 74, 84);
		
		var defense2 = new Path2D();
		defense2.rect(363, 274, 74, 84);
		
		var defense3 = new Path2D();
		defense3.rect(363, 359, 74, 84);
		
		var defense4 = new Path2D();
		defense4.rect(363, 444, 74, 84);
		
		var portcullisPath = new Path2D();
		portcullisPath.rect(72.5, 245, 100, 100);
		
		var chevalDeFrisePath = new Path2D();
		chevalDeFrisePath.rect(182.5, 245, 100, 100);
		
		var moatPath = new Path2D();
		moatPath.rect(292.5, 245, 100, 100);
		
		var rampartsPath = new Path2D();
		rampartsPath.rect(402.5, 245, 100, 100);
		
		var drawbridgePath = new Path2D();
		drawbridgePath.rect(72.5, 355, 100, 100);
		
		var sallyPortPath = new Path2D();
		sallyPortPath.rect(182.5, 355, 100, 100);
		
		var rockWallPath = new Path2D();
		rockWallPath.rect(292.5, 355, 100, 100);
		
		var roughTerrainPath = new Path2D();
		roughTerrainPath.rect(402.5, 355, 100, 100);
		
		canvas.onmousedown = function (e)
		{
			var context = e.target.getContext('2d');
			var x = e.offsetX;
			var y = e.offsetY;
			
			if (!selectDefense)
			{
				if (context.isPointInPath(defense1, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
		  			positionToPlaceDefense = {x:363, y:189, width:74, height:84};
				}
				else if (context.isPointInPath(defense2, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
		  			positionToPlaceDefense = {x:363, y:274, width:74, height:84};
				}
				else if (context.isPointInPath(defense3, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
		  			positionToPlaceDefense = {x:363, y:359, width:74, height:84};
				}
				else if (context.isPointInPath(defense4, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
		  			positionToPlaceDefense = {x:363, y:444, width:74, height:84};
				}
			}
			else
			{
				if (context.isPointInPath(portcullisPath, x, y))
				{
					ctx.drawImage(arena, 0, 0);
					selectDefense = false;
					var newDefense = new defense(portcullis, positionToPlaceDefense, 1);
					defensePositions.push(newDefense);
					drawDefenses();
				}
				else if (context.isPointInPath(chevalDeFrisePath, x, y))
				{
					ctx.drawImage(arena, 0, 0);
					selectDefense = false;
					var newDefense = new defense(chevalDeFrise, positionToPlaceDefense, 1);
					defensePositions.push(newDefense);
					drawDefenses();
				}
				else if (context.isPointInPath(moatPath, x, y))
				{
					ctx.drawImage(arena, 0, 0);
					selectDefense = false;
					var newDefense = new defense(moat, positionToPlaceDefense, 2);
					defensePositions.push(newDefense);
					drawDefenses();
				}
				else if (context.isPointInPath(rampartsPath, x, y))
				{
					ctx.drawImage(arena, 0, 0);
					selectDefense = false;
					var newDefense = new defense(ramparts, positionToPlaceDefense, 2);
					defensePositions.push(newDefense);
					drawDefenses();
				}
				else if (context.isPointInPath(drawbridgePath, x, y))
				{
					ctx.drawImage(arena, 0, 0);
					selectDefense = false;
					var newDefense = new defense(drawbridge, positionToPlaceDefense, 3);
					defensePositions.push(newDefense);
					drawDefenses();
				}
				else if (context.isPointInPath(sallyPortPath, x, y))
				{
					ctx.drawImage(arena, 0, 0);
					selectDefense = false;
					var newDefense = new defense(sallyPort, positionToPlaceDefense, 3);
					defensePositions.push(newDefense);
					drawDefenses();
				}
				else if (context.isPointInPath(rockWallPath, x, y))
				{
					ctx.drawImage(arena, 0, 0);
					selectDefense = false;
					var newDefense = new defense(rockWall, positionToPlaceDefense, 4);
					defensePositions.push(newDefense);
					drawDefenses();
				}
				else if (context.isPointInPath(roughTerrainPath, x, y))
				{
					ctx.drawImage(arena, 0, 0);
					selectDefense = false;
					var newDefense = new defense(roughTerrain, positionToPlaceDefense, 4);
					defensePositions.push(newDefense);
					drawDefenses();
				}
				else
				{
					ctx.drawImage(arena, 0, 0);
					selectDefense = false;
					drawDefenses();
				}
			}
		}
	}
	
	function drawDefenses() {
		for (var i = 0; i < defensePositions.length - 1; i++)
		{
			var defenseToCheck = defensePositions[defensePositions.length - 1];
			var dynamicDefense = defensePositions[i];
			
			if (defenseToCheck.position.x == dynamicDefense.position.x && defenseToCheck.position.y == dynamicDefense.position.y)
			{
				defensePositions.splice(i, 1);
				break;
			}
		}
		for (var i = 0; i < defensePositions.length - 1; i++)
		{
			var defenseToCheck = defensePositions[defensePositions.length - 1];
			var dynamicDefense = defensePositions[i];
			
			if (defenseToCheck.category == dynamicDefense.category)
			{
				defensePositions.splice(i, 1);
				break;
			}
		}
		for (var i = 0; i < defensePositions.length; i++)
		{
			var defenseToDraw = defensePositions[i];
			ctx.drawImage(defenseToDraw.image, defenseToDraw.position.x, defenseToDraw.position.y, defenseToDraw.position.width, defenseToDraw.position.height);
		}
	}
	
	function drawDefenseSelection() {
		var defenseBG = document.getElementById("defenseBG");
		ctx.drawImage(defenseBG, 62.5, 235, 450, 230);
		
		ctx.shadowBlur = 12;
		ctx.shadowColor = "white";
		
		ctx.drawImage(portcullis, 72.5, 245, 100, 100);
		ctx.drawImage(chevalDeFrise, 182.5, 245, 100, 100);
		ctx.drawImage(moat, 292.5, 245, 100, 100);
		ctx.drawImage(ramparts, 402.5, 245, 100, 100);
		ctx.drawImage(drawbridge, 72.5, 355, 100, 100);
		ctx.drawImage(sallyPort, 182.5, 355, 100, 100);
		ctx.drawImage(rockWall, 292.5, 355, 100, 100);
		ctx.drawImage(roughTerrain, 402.5, 355, 100, 100);
		
		ctx.shadowBlur = 0;
	}
</script>
</head>
<body onload="loadPage();">
	<canvas id="arena" width="575" height="700" style="border: 1px solid black">
		
	</canvas>
	<div class="box">
		No Show:
		<br>
		<input name="Team1NoShow" type="checkbox"/>Team 1
		<br>
		<input name="Team2NoShow" type="checkbox"/>Team 2
		<br>
		<input name="Team3NoShow" type="checkbox"/>Team 3
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
	<img src="Images/woodBG-defense.jpg" id="defenseBG" style="visibility: hidden" width="1" height="1">
	
</body>
</html>