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
<script type="text/javascript">

	function loadPage() {
		canvas = document.getElementById("arena");
		ctx = canvas.getContext('2d');
		arena = document.getElementById("arenaBG");
		
		var defensesPath = "Images/Defenses/";
		selectDefense = false;

		portcullis = document.getElementById("portcullis");
		chevalDeFrise = document.getElementById("chevalDeFrise");
		moat = document.getElementById("moat");
		ramparts = document.getElementById("ramparts");
		drawbridge = document.getElementById("drawbridge");
		roughTerrain = document.getElementById("roughTerrain");
		rockWall = document.getElementById("rockWall");
		sallyPort = document.getElementById("sallyPort");
		
		ctx.drawImage(arena, 0, 0);
		
		var leftDefense1 = new Path2D();
		leftDefense1.rect(363, 189, 74, 84);
		
		var leftDefense2 = new Path2D();
		leftDefense2.rect(363, 274, 74, 84);
		
		var leftDefense3 = new Path2D();
		leftDefense3.rect(363, 359, 74, 84);
		
		var leftDefense4 = new Path2D();
		leftDefense4.rect(363, 444, 74, 84);
		
		var leftDefense5 = new Path2D();
		leftDefense5.rect(363, 528, 74, 84);
		
		var rightDefense1 = new Path2D();
		rightDefense1.rect(710, 106, 74, 78);
		
		var rightDefense2 = new Path2D();
		rightDefense2.rect(710, 185, 74, 84);
		
		var rightDefense3 = new Path2D();
		rightDefense3.rect(710, 270, 74, 84);
		
		var rightDefense4 = new Path2D();
		rightDefense4.rect(710, 355, 74, 84);
		
		var rightDefense5 = new Path2D();
		rightDefense5.rect(710, 440, 74, 84);
		
		var portcullisPath = new Path2D();
		portcullisPath.rect(360, 245, 100, 100);
		
		canvas.onmousedown = function (e)
		{
			var context = e.target.getContext('2d');
			var x = e.offsetX;
			var y = e.offsetY;
			
			if (!selectDefense)
			{
				if (context.isPointInPath(leftDefense1, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
				}
				else if (context.isPointInPath(leftDefense2, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
				}
				else if (context.isPointInPath(leftDefense3, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
				}
				else if (context.isPointInPath(leftDefense4, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
				}
		    	else if (context.isPointInPath(leftDefense5, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
				}
		    	else if (context.isPointInPath(rightDefense1, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
				}
				else if (context.isPointInPath(rightDefense2, x, y))
				{
					selectDefense = true;
		  			drawDefenseSelection();
				}
				else if (context.isPointInPath(rightDefense3, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
				}
				else if (context.isPointInPath(rightDefense4, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
				}
		    	else if (context.isPointInPath(rightDefense5, x, y))
				{
		  			selectDefense = true;
		  			drawDefenseSelection();
				}
			}
			else
			{
				if (context.isPointInPath(portcullis, x, y))
				{
					
				}
			}
		}
	}
	
	function drawDefenseSelection() {
		var defenseBG = document.getElementById("defenseBG");
		ctx.drawImage(defenseBG, 350, 235, 450, 230);
		
		ctx.beginPath();
		ctx.rect(360, 245, 100, 100);
		ctx.fillStyle = "#FFFFFF";
		ctx.fill();
		ctx.drawImage(portcullis, 360, 245, 100, 100);
	}
</script>
</head>
<body onload="loadPage();">
	<canvas id="arena" width="1150" height="700" style="border: 1px solid black">
		
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
	<img src="arena.png" id="arenaBG" style="visibility: hidden" width="1" height="1">
	<img src=Images/Defenses/defenseBG.jpg" id="defenseBG" style="visibility: hidden" width="1" height="1">
	
</body>
</html>