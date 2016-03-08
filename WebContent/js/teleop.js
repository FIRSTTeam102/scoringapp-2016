var robotPositions = [];
var defensePositions = [];
var selectMode = 0;
var selectedDefense;

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
		defensePositions.push(new defense())
		
		defense1Path = new Path2D();
		defense2Path = new Path2D();
		defense3Path = new Path2D();
		defense4Path = new Path2D();
		lowBarPath = new Path2D();
		
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
				lowBarPath.rect(137, 91, 74, 85);
			}
			else
			{
				arena = document.getElementById("blueArenaFlippedBG");
				lowBarPath.rect(138, 92, 74, 85);
			}
			ctx.drawImage(arena, 0, 0);
		}
		else
		{
			if (alliance != "Red")
			{
				arena = document.getElementById("redArenaBG");
				lowBarPath.rect(364, 533, 74, 85);
			}
			else
			{
				arena = document.getElementById("blueArenaBG");
				lowBarPath.rect(363, 531, 74, 85);
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
					ctx.fill(defense1Path);
				}
				else if (context.isPointInPath(defense2Path, x, y))
				{
					selectedDefense = defensePositions[1];
					ctx.fill(defense2Path);
				}
				else if (context.isPointInPath(defense3Path, x, y))
				{
					selectedDefense = defensePositions[2];
					ctx.fill(defense3Path);
				}
				else if (context.isPointInPath(defense4Path, x, y))
				{
					selectedDefense = defensePositions[3];
					ctx.fill(defense4Path);
				}
				else if (context.isPointInPath(lowBarPath, x, y))
				{
					selectedDefense = 
				}
				else if (context.isPointInPath(failedPath, x, y))
				{
					
				}
				else if (context.isPointInPath(succeededPath, x, y))
				{
					
				}
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