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
	
	.defenses {
		border: 1px solid black;
		width: 400px;
		height: 325px;
		margin-top: 25px;
		float: right;
	}
</style>
<script type="text/javascript">
	function loadPage() {
		var canvas = document.getElementById("arena");
		var ctx = canvas.getContext("2d");
		var arena = document.getElementById("arenaBG");
		
		arena.src = "arena.png";
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
		
		canvas.onmousedown = function (e)
		{
			var context = e.target.getContext('2d');
			var x = e.offsetX;
			var y = e.offsetY;
			
			if (context.isPointInPath(leftDefense1, x, y))
			{
				ctx.fill(leftDefense1);
			}
			else if (context.isPointInPath(leftDefense2, x, y))
			{
				ctx.fill(leftDefense2);
			}
			else if (context.isPointInPath(leftDefense3, x, y))
			{
				ctx.fill(leftDefense3);
			}
			else if (context.isPointInPath(leftDefense4, x, y))
			{
				ctx.fill(leftDefense4);
			}
		    else if (context.isPointInPath(leftDefense5, x, y))
			{
		    	ctx.fill(leftDefense5);
			}
		    else if (context.isPointInPath(rightDefense1, x, y))
			{
				ctx.fill(rightDefense1);
			}
			else if (context.isPointInPath(rightDefense2, x, y))
			{
				ctx.fill(rightDefense2);
			}
			else if (context.isPointInPath(rightDefense3, x, y))
			{
				ctx.fill(rightDefense3);
			}
			else if (context.isPointInPath(rightDefense4, x, y))
			{
				ctx.fill(rightDefense4);
			}
		    else if (context.isPointInPath(rightDefense5, x, y))
			{
		    	ctx.fill(rightDefense5);
			}
		}
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
	<div class="defenses">
		Defenses:
		<br>
		<input type="radio" id="portcullis">Portcullis
		<br>
		<input type="radio" id="chivalDeFrise">Chival de Frise
		<br>
		<input type="radio" id="moat">Moat
		<br>
		<input type="radio" id="ramparts">Ramparts
		<br>
		<input type="radio" id="drawbridge">Drawbridge
		<br>
		<input type="radio" id="sallyPort">Sally Port
		<br>
		<input type="radio" id="rockWall">Rock Wall
		<br>
		<input type="radio" id="roughTerrain">Rough Terrain
	</div>
	<img src="arena.png" id="arenaBG" style="visibility: hidden" width="1" height="1">
	
</body>
</html>