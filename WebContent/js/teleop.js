var robotPositions = [];
var defensePositions = [];
var selectMode = 0;
var selectedDefense;
var defensePath;
var selectedRobot;
var operationAttempted = "";

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

	function loadPage()
	{
		canvas = document.getElementById("arena");
		ctx = canvas.getContext('2d');
		
		if (robot0teamNumber != null)
		{
			var positionToPlaceRobot = {x:robot0xPosition, y:robot0yPosition, width:robot0width, height:robot0height};
			var newRobot = new robot(robot0teamNumber, positionToPlaceRobot);
			robotPositions.push(newRobot);
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
		if (side != "Near")
		{
			if (alliance != "Red")
			{
				defensePositions.push(new defense(document.getElementById("lowBar"), {x:137, y:91, width:74, height:79}, 0, "Low Bar"));
			}
			else
			{
				defensePositions.push(new defense(document.getElementById("lowBar"), {x:137, y:91, width:73, height:77}, 0, "Low Bar"));
			}
		}
		else
		{
			if (alliance != "Red")
			{
				defensePositions.push(new defense(document.getElementById("lowBar"), {x:364, y:533, width:73, height:77}, 0, "Low Bar"));
			}
			else
			{
				defensePositions.push(new defense(document.getElementById("lowBar"), {x:363, y:531, width:74, height:79}, 0, "Low Bar"));
			}
		}		
		defense1Path = new Path2D();
		defense2Path = new Path2D();
		defense3Path = new Path2D();
		defense4Path = new Path2D();
		lowBarPath = new Path2D();
		
		defensivePlay1Path = new Path2D();
		defensivePlay1Path.rect(50, 10, 140, 45);
		
		defensivePlay2Path = new Path2D();
		defensivePlay2Path.rect(217.5, 10, 140, 45);
		
		defensivePlay3Path = new Path2D();
		defensivePlay3Path.rect(385, 10, 140, 45);
		
		
		for (var i = 0; i < defensePositions.length; i++)
		{
			var defenseToParse = defensePositions[i];
			if (i == 0)
			{
				defense1Path.rect(defenseToParse.position.x, defenseToParse.position.y, defenseToParse.position.width, defenseToParse.position.height);
			}
			else if (i == 1)
			{
				defense2Path.rect(defenseToParse.position.x, defenseToParse.position.y, defenseToParse.position.width, defenseToParse.position.height);
			}
			else if (i == 2)
			{
				defense3Path.rect(defenseToParse.position.x, defenseToParse.position.y, defenseToParse.position.width, defenseToParse.position.height);
			}
			else if (i == 3)
			{
				defense4Path.rect(defenseToParse.position.x, defenseToParse.position.y, defenseToParse.position.width, defenseToParse.position.height);
			}
			else if (i == 4)
			{
				lowBarPath.rect(defenseToParse.position.x, defenseToParse.position.y, defenseToParse.position.width, defenseToParse.position.height);
			}
		}
		
		highGoalPath = new Path2D();
		lowGoalPath = new Path2D();
		
		robot0Path = new Path2D();
		robot0Path.rect(robotPositions[0].position.x, robotPositions[0].position.y, robotPositions[0].position.width, robotPositions[0].position.height);
		
		robot1Path = new Path2D();
		robot1Path.rect(robotPositions[1].position.x, robotPositions[1].position.y, robotPositions[1].position.width, robotPositions[1].position.height);
		
		robot2Path = new Path2D();
		robot2Path.rect(robotPositions[2].position.x, robotPositions[2].position.y, robotPositions[2].position.width, robotPositions[2].position.height);
		
		
		failedPath = new Path2D();
		failedPath.rect(105, 652, 78, 33);
		
		succeededPath = new Path2D();
		succeededPath.rect(370, 652, 123, 33);
		
		if (side != "Near")
		{
			lowGoalPath.rect(314, 369, 118, 38);
			highGoalPath.rect(314, 311, 118, 38);
			
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
			lowGoalPath.rect(147, 351, 118, 38);
			highGoalPath.rect(147, 293, 118, 38);
			
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
				if (context.isPointInPath(defense1Path, x, y))
				{
					selectedDefense = defensePositions[0];
					defensePath = defense1Path;
					if (selectedDefense.image == document.getElementById("portcullis"))
					{
						operationAttempted = "POR";
					}
					else if (selectedDefense.image == document.getElementById("chevalDeFrise"))
					{
						operationAttempted = "CDF";
					}
					else if (selectedDefense.image == document.getElementById("moat"))
					{
						operationAttempted = "MOT";
					}
					else if (selectedDefense.image == document.getElementById("ramparts"))
					{
						operationAttempted = "RMP";
					}
					else if (selectedDefense.image == document.getElementById("drawbridge"))
					{
						operationAttempted = "DBW";
					}
					else if (selectedDefense.image == document.getElementById("sallyPort"))
					{
						operationAttempted = "SLP";
					}
					else if (selectedDefense.image == document.getElementById("rockWall"))
					{
						operationAttempted = "RCK";
					}
					else if (selectedDefense.image == document.getElementById("roughTerrain"))
					{
						operationAttempted = "RGT";
					}
					drawArenaWithChanges();
				}
				else if (context.isPointInPath(defense2Path, x, y))
				{
					selectedDefense = defensePositions[1];
					defensePath = defense2Path;

					if (selectedDefense.image == document.getElementById("portcullis"))
					{
						operationAttempted = "POR";
					}
					else if (selectedDefense.image == document.getElementById("chevalDeFrise"))
					{
						operationAttempted = "CDF";
					}
					else if (selectedDefense.image == document.getElementById("moat"))
					{
						operationAttempted = "MOT";
					}
					else if (selectedDefense.image == document.getElementById("ramparts"))
					{
						operationAttempted = "RMP";
					}
					else if (selectedDefense.image == document.getElementById("drawbridge"))
					{
						operationAttempted = "DBW";
					}
					else if (selectedDefense.image == document.getElementById("sallyPort"))
					{
						operationAttempted = "SLP";
					}
					else if (selectedDefense.image == document.getElementById("rockWall"))
					{
						operationAttempted = "RCK";
					}
					else if (selectedDefense.image == document.getElementById("roughTerrain"))
					{
						operationAttempted = "RGT";
					}
					drawArenaWithChanges();

				}
				else if (context.isPointInPath(defense3Path, x, y))
				{
					selectedDefense = defensePositions[2];
					defensePath = defense3Path;
					
					if (selectedDefense.image == document.getElementById("portcullis"))
					{
						operationAttempted = "POR";
					}
					else if (selectedDefense.image == document.getElementById("chevalDeFrise"))
					{
						operationAttempted = "CDF";
					}
					else if (selectedDefense.image == document.getElementById("moat"))
					{
						operationAttempted = "MOT";
					}
					else if (selectedDefense.image == document.getElementById("ramparts"))
					{
						operationAttempted = "RMP";
					}
					else if (selectedDefense.image == document.getElementById("drawbridge"))
					{
						operationAttempted = "DBW";
					}
					else if (selectedDefense.image == document.getElementById("sallyPort"))
					{
						operationAttempted = "SLP";
					}
					else if (selectedDefense.image == document.getElementById("rockWall"))
					{
						operationAttempted = "RCK";
					}
					else if (selectedDefense.image == document.getElementById("roughTerrain"))
					{
						operationAttempted = "RGT";
					}
					drawArenaWithChanges();
				}
				else if (context.isPointInPath(defense4Path, x, y))
				{
					selectedDefense = defensePositions[3];
					defensePath = defense4Path;
					
					if (selectedDefense.image == document.getElementById("portcullis"))
					{
						operationAttempted = "POR";
					}
					else if (selectedDefense.image == document.getElementById("chevalDeFrise"))
					{
						operationAttempted = "CDF";
					}
					else if (selectedDefense.image == document.getElementById("moat"))
					{
						operationAttempted = "MOT";
					}
					else if (selectedDefense.image == document.getElementById("ramparts"))
					{
						operationAttempted = "RMP";
					}
					else if (selectedDefense.image == document.getElementById("drawbridge"))
					{
						operationAttempted = "DBW";
					}
					else if (selectedDefense.image == document.getElementById("sallyPort"))
					{
						operationAttempted = "SLP";
					}
					else if (selectedDefense.image == document.getElementById("rockWall"))
					{
						operationAttempted = "RCK";
					}
					else if (selectedDefense.image == document.getElementById("roughTerrain"))
					{
						operationAttempted = "RGT";
					}
					drawArenaWithChanges();
				}
				else if (context.isPointInPath(lowBarPath, x, y))
				{
					defensePath = lowBarPath;
					selectedDefense = defensePositions[4];
					drawArenaWithChanges();
					operationAttempted = "LOB";
				}
				else if (context.isPointInPath(failedPath, x, y))
				{
					if (operationAttempted != "" && selectedRobot != null)
					{
						var form = document.getElementById("cycleForm");
						form.innerHTML += '<input type="hidden" name="operationAttempted" value="' + operationAttempted + '"/>';
						form.innerHTML += '<input type="hidden" name="succeeded" value="' + 'N' + '"/>';
						form.innerHTML += '<input type="hidden" name="teamNumber" value="' + selectedRobot + '"/>';
						form.submit();
					}
				}
				else if (context.isPointInPath(succeededPath, x, y))
				{
					if (operationAttempted != "" && selectedRobot != null)
					{
						var form = document.getElementById("cycleForm");
						form.innerHTML += '<input type="hidden" name="operationAttempted" value="' + operationAttempted + '"/>';
						form.innerHTML += '<input type="hidden" name="succeeded" value="' + 'Y' + '"/>';
						form.innerHTML += '<input type="hidden" name="teamNumber" value="' + selectedRobot + '"/>';
						form.submit();
					}
				}
				else if (context.isPointInPath(highGoalPath, x, y))
				{
					selectedDefense = null;
					operationAttempted = "HGH";
					drawArenaWithChanges();
				}
				else if (context.isPointInPath(lowGoalPath, x, y))
				{
					selectedDefense = null;
					operationAttempted = "LOW";
					drawArenaWithChanges();
				}
				else if (context.isPointInPath(robot0Path, x, y))
				{
					selectedRobot = robotPositions[0].teamNumber;
					drawArenaWithChanges();
				}
				else if (context.isPointInPath(robot1Path, x, y))
				{
					selectedRobot = robotPositions[1].teamNumber;
					drawArenaWithChanges();
				}
				else if (context.isPointInPath(robot2Path, x, y))
				{
					selectedRobot = robotPositions[2].teamNumber;
					drawArenaWithChanges();
				}
				else if (context.isPointInPath(defensivePlay1Path, x, y))
				{
					var robotToParse = robotPositions[0];
					var form = document.getElementById("cycleForm");
					form.innerHTML += '<input type="hidden" name="operationAttempted" value="DEF"/>';
					form.innerHTML += '<input type="hidden" name="succeeded" value="' + 'Y' + '"/>';
					form.innerHTML += '<input type="hidden" name="teamNumber" value="' + robotToParse.teamNumber + '"/>';
					form.submit();
				}
				else if (context.isPointInPath(defensivePlay2Path, x, y))
				{
					var robotToParse = robotPositions[1];
					var form = document.getElementById("cycleForm");
					form.innerHTML += '<input type="hidden" name="operationAttempted" value="DEF"/>';
					form.innerHTML += '<input type="hidden" name="succeeded" value="' + 'Y' + '"/>';
					form.innerHTML += '<input type="hidden" name="teamNumber" value="' + robotToParse.teamNumber + '"/>';
					form.submit();
				}
				else if (context.isPointInPath(defensivePlay3Path, x, y))
				{
					if (selectedRobot != null)
					{
						var robotToParse = robotPositions[2];
						var form = document.getElementById("cycleForm");
						form.innerHTML += '<input type="hidden" name="operationAttempted" value="DEF"/>';
						form.innerHTML += '<input type="hidden" name="succeeded" value="' + 'Y' + '"/>';
						form.innerHTML += '<input type="hidden" name="teamNumber" value="' + robotToParse.teamNumber + '"/>';
						form.submit();
					}
				}
			}
		}
	}
	
	function drawArenaWithChanges()
	{
		ctx.drawImage(arena, 0, 0);
		
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
		ctx.strokeStyle = "yellow";
		ctx.lineWidth = 1;
		ctx.stroke(defensivePlay1Path);
		ctx.fill(defensivePlay1Path);
		ctx.fillStyle = "white";
		ctx.fillText("Team " + robotPositions[0].teamNumber, 50 + 70, 10 + 45 / 3, 140);
		ctx.fillText("Defensive Play", 50 + 70, 10 + 45 / 1.4, 140);
		
		ctx.fillStyle = "red";
		ctx.strokeStyle = "yellow";
		ctx.lineWidth = 1;
		ctx.stroke(defensivePlay2Path);
		ctx.fill(defensivePlay2Path);
		ctx.fillStyle = "white";
		ctx.fillText("Team " + robotPositions[1].teamNumber, 217.5 + 70, 10 + 45 / 3, 140);
		ctx.fillText("Defensive Play", 217.5 + 70, 10 + 45 / 1.4, 140);
		
		ctx.fillStyle = "red";
		ctx.strokeStyle = "yellow";
		ctx.lineWidth = 1;
		ctx.stroke(defensivePlay3Path);
		ctx.fill(defensivePlay3Path);
		ctx.fillStyle = "white";
		ctx.fillText("Team " + robotPositions[2].teamNumber, 385 + 70, 10 + 45 / 3, 140);
		ctx.fillText("Defensive Play", 385 + 70, 10 + 45 / 1.4, 140);
		
		if (selectedDefense != null)
		{
			ctx.strokeStyle = "red";
			ctx.lineWidth = 2;
			ctx.stroke(defensePath);
		}
		else if (operationAttempted == "HGH")
		{
			ctx.strokeStyle = "red";
			ctx.lineWidth = 2;
			ctx.stroke(highGoalPath);
		}
		else if (operationAttempted == "LOW")
		{
			ctx.strokeStyle = "red";
			ctx.lineWidth = 2;
			ctx.stroke(lowGoalPath);
		}
		
		if (selectedRobot != null)
		{
			for (var i = 0; i < robotPositions.length; i++)
			{
				var robotToCheck = robotPositions[i];
				if (selectedRobot == robotToCheck.teamNumber)
				{
					var path = new Path2D();
					path.rect(robotToCheck.position.x, robotToCheck.position.y, robotToCheck.position.width, robotToCheck.position.height);
					ctx.strokeStyle = "red";
					ctx.lineWidth = 2;
					ctx.stroke(path);
				}
			}
		}
		
		ctx.fillStyle = "red";
		ctx.fill(failedPath);
		ctx.fillStyle = "green";
		ctx.fill(succeededPath);
		
		ctx.font = "25px serif";
		ctx.fillStyle = "white";
		ctx.fillText("Failed", 143.75, 677);
		ctx.fillText("Succeeded", 431.25, 677);
		
		if (robotAsSpyBot != "0")
		{
			if (side != "Near")
			{
				ctx.font = "24px serif";
				ctx.textAlign = "center";
				ctx.fillStyle = "white";
				ctx.fillText("Team " + robotAsSpyBot, 341 + 134 / 2, 127 + 102 / 2 + 7, 134);
			}
			else
			{
				ctx.font = "24px serif";
				ctx.textAlign = "center";
				ctx.fillStyle = "white";
				ctx.fillText("Team " + robotAsSpyBot, 99 + 134 / 2, 472 + 102 / 2 + 7, 134);
			}
		}
	}