var positionToPlaceDefense;
var positionToPlaceRobot;
var teamAsSpyBot = "";
var hasSpyHuman = false;
var defensePositions = [];
var robotPositions = [];
var originX = 0;
var originY = 0;

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
		team1Div = document.getElementById("team1NoShow");
		team2Div = document.getElementById("team2NoShow");
		team3Div = document.getElementById("team3NoShow");
		
		team1Div.innerHTML += "Team " + team1;
		team2Div.innerHTML += "Team " + team2;
		team3Div.innerHTML += "Team " + team3;
		
		canvas = document.getElementById("arena");
		ctx = canvas.getContext('2d');
		
		if (defense0name != "")
		{
			if (Team1NoShow == "YES")
			{
				document.getElementById("team1Checkbox").checked = true;
			}
			if (Team2NoShow == "YES")
			{
				document.getElementById("team2Checkbox").checked = true;
			}
			if (Team3NoShow == "YES")
			{
				document.getElementById("team3Checkbox").checked = true;
			}
			
			if (robot0teamNumber != 'null')
			{
				robotPositions.push(new robot(robot0teamNumber, {x:robot0xPosition, y:robot0yPosition, width:robot0width, height:robot0height}));
			}
			if (robot1teamNumber != 'null')
			{
				robotPositions.push(new robot(robot1teamNumber, {x:robot1xPosition, y:robot1yPosition, width:robot1width, height:robot1height}));
			}
			if (robot2teamNumber != 'null')
			{
				robotPositions.push(new robot(robot2teamNumber, {x:robot2xPosition, y:robot2yPosition, width:robot2width, height:robot2height}));
			}
			
			for (var i = 0; i < 4; i++)
			{
				var image = null;
				var category = null;
				
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
					
					if (image != null)
					{
						defensePositions.push(new defense(image, {x:defense0xPosition, y:defense0yPosition, width:defense0width, height:defense0height}, category, defense0name));
					}
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
					
					if (image != null)
					{
						defensePositions.push(new defense(image, {x:defense1xPosition, y:defense1yPosition, width:defense1width, height:defense1height}, category, defense1name));
					}
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
					
					if (image != null)
					{
						defensePositions.push(new defense(image, {x:defense2xPosition, y:defense2yPosition, width:defense2width, height:defense2height}, category, defense2name));
					}
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
					
					if (image != null)
					{
						defensePositions.push(new defense(image, {x:defense3xPosition, y:defense3yPosition, width:defense3width, height:defense3height}, category, defense3name));
					}
				}
				
				if (robotAsSpyBot != "0")
				{
					teamAsSpyBot = robotAsSpyBot;
				}
			}
		}
		
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
			
			selectMode = 0;

			portcullis = document.getElementById("portcullis");
			chevalDeFrise = document.getElementById("chevalDeFrise");
			moat = document.getElementById("moat");
			ramparts = document.getElementById("ramparts");
			drawbridge = document.getElementById("drawbridge");
			roughTerrain = document.getElementById("roughTerrain");
			rockWall = document.getElementById("rockWall");
			sallyPort = document.getElementById("sallyPort");
			
			if (alliance != "Red")
			{
				var defense1 = new Path2D();
				defense1.rect(137, 170, 74, 84);
				
				var defense2 = new Path2D();
				defense2.rect(137, 254, 74, 84);
				
				var defense3 = new Path2D();
				defense3.rect(137, 340, 74, 84);
				
				var defense4 = new Path2D();
				defense4.rect(137, 425, 74, 84);
				
			}
			else
			{
				var defense1 = new Path2D();
				defense1.rect(138, 173, 74, 84);
				
				var defense2 = new Path2D();
				defense2.rect(138, 257, 74, 84);
				
				var defense3 = new Path2D();
				defense3.rect(138, 343, 74, 84);
				
				var defense4 = new Path2D();
				defense4.rect(138, 428, 74, 84);
				
			}
			
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
			
			spyHumanPath = new Path2D();
			spyHumanPath.rect(406, 22, 107, 31);
			
			var spyBotPath = new Path2D();
			spyBotPath.rect(341, 127, 134, 102);
			
			var team1Path = new Path2D();
			team1Path.rect(72.5, 235 + 115 / 2, 136.66667, 115);
			
			var team2Path = new Path2D();
			team2Path.rect(219.16667, 235 + 115 / 2, 136.66667, 115);
			
			var team3Path = new Path2D();
			team3Path.rect(365.83334, 235 + 115 / 2, 136.66667, 115);
			
			var robotPosition1 = new Path2D();
			robotPosition1.rect(41, 102, 77, 58);
			
			var robotPosition2 = new Path2D();
			robotPosition2.rect(41, 183, 77, 58);
			
			var robotPosition3 = new Path2D();
			robotPosition3.rect(41, 269, 77, 58);
			
			var robotPosition4 = new Path2D();
			robotPosition4.rect(41, 353, 77, 58);
			
			var robotPosition5 = new Path2D();
			robotPosition5.rect(41, 440, 77, 58);
			
			canvas.onmousedown = function (e)
			{
				var context = e.target.getContext('2d');
				var x = e.offsetX;
				var y = e.offsetY;
				
				if (selectMode == 0)
				{
					if (context.isPointInPath(defense1, x, y))
					{
			  			selectMode = 1;
			  			drawDefenseSelection();
			  			if (alliance != "Red")
			  			{
			  				positionToPlaceDefense = {x:137, y:170, width:74, height:84};
			  			}
			  			else
			  			{
			  				positionToPlaceDefense = {x:138, y:173, width:74, height:84};
			  			}
					}
					else if (context.isPointInPath(defense2, x, y))
					{
			  			selectMode = 1;
			  			drawDefenseSelection();
			  			if (alliance != "Red")
			  			{
			  				positionToPlaceDefense = {x:137, y:254, width:74, height:84};
			  			}
			  			else
			  			{
			  				positionToPlaceDefense = {x:138, y:257, width:74, height:84};
			  			}
					}
					else if (context.isPointInPath(defense3, x, y))
					{
			  			selectMode = 1;
			  			drawDefenseSelection();
			  			if (alliance != "Red")
			  			{
				  			positionToPlaceDefense = {x:137, y:340, width:74, height:84};
			  			}
			  			else
			  			{
				  			positionToPlaceDefense = {x:138, y:343, width:74, height:84};
			  			}
					}
					else if (context.isPointInPath(defense4, x, y))
					{
			  			selectMode = 1;
			  			drawDefenseSelection();
			  			if (alliance != "Red")
			  			{
			  				positionToPlaceDefense = {x:137, y:425, width:74, height:84};
			  			}
			  			else
			  			{
			  				positionToPlaceDefense = {x:138, y:428, width:74, height:84};
			  			}
					}
					else if (context.isPointInPath(spyBotPath, x, y))
					{
						selectMode = 2;
						drawTeamSelection();
					}
					else if (context.isPointInPath(spyHumanPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						if (hasSpyHuman)
							hasSpyHuman = false;
						else
							hasSpyHuman = true;
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(robotPosition1, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:41, y:102, width:77, height:58};
					}
					else if (context.isPointInPath(robotPosition2, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:41, y:183, width:77, height:58};
					}
					else if (context.isPointInPath(robotPosition3, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:41, y:269, width:77, height:58};
					}
					else if (context.isPointInPath(robotPosition4, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:41, y:353, width:77, height:58};
					}
					else if (context.isPointInPath(robotPosition5, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:41, y:440, width:77, height:58};
					}
				}
				else if (selectMode == 1)
				{
					if (context.isPointInPath(portcullisPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(portcullis, positionToPlaceDefense, 1, "Portcullis");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(chevalDeFrisePath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(chevalDeFrise, positionToPlaceDefense, 1, "Cheval De Frise");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(moatPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(moat, positionToPlaceDefense, 2, "Moat");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(rampartsPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(ramparts, positionToPlaceDefense, 2, "Ramparts");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(drawbridgePath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(drawbridge, positionToPlaceDefense, 3, "Drawbridge");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(sallyPortPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(sallyPort, positionToPlaceDefense, 3, "Sally Port");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(rockWallPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(rockWall, positionToPlaceDefense, 4, "Rock Wall");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(roughTerrainPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(roughTerrain, positionToPlaceDefense, 4, "Rough Terrain");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						drawArenaWithChanges();
					}
				}
				else if (selectMode == 2)
				{
					if (context.isPointInPath(team1Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						teamAsSpyBot = team1;
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(team2Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						teamAsSpyBot = team2;
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(team3Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						teamAsSpyBot = team3;
						drawArenaWithChanges();
					}
					else
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						drawArenaWithChanges();
					}
				}
				else if (selectMode == 3)
				{
					if (context.isPointInPath(team1Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newRobot = new robot(team1, positionToPlaceRobot);
						robotPositions.push(newRobot);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(team2Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newRobot = new robot(team2, positionToPlaceRobot);
						robotPositions.push(newRobot);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(team3Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newRobot = new robot(team3, positionToPlaceRobot);
						robotPositions.push(newRobot);
						drawArenaWithChanges();
					}
					else
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						drawArenaWithChanges();
					}
				}
			}
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
			
			selectMode = 0;

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
			
			spyHumanPath = new Path2D();
			spyHumanPath.rect(63, 647, 107, 31);
			
			var spyBotPath = new Path2D();
			spyBotPath.rect(99, 472, 134, 102);
			
			var team1Path = new Path2D();
			team1Path.rect(72.5, 235 + 115 / 2, 136.66667, 115);
			
			var team2Path = new Path2D();
			team2Path.rect(219.16667, 235 + 115 / 2, 136.66667, 115);
			
			var team3Path = new Path2D();
			team3Path.rect(365.83334, 235 + 115 / 2, 136.66667, 115);
			
			var robotPosition1 = new Path2D();
			robotPosition1.rect(460, 206, 77, 58);
			
			var robotPosition2 = new Path2D();
			robotPosition2.rect(460, 287, 77, 58);
			
			var robotPosition3 = new Path2D();
			robotPosition3.rect(460, 373, 77, 58);
			
			var robotPosition4 = new Path2D();
			robotPosition4.rect(460, 458, 77, 58);
			
			var robotPosition5 = new Path2D();
			robotPosition5.rect(460, 544, 77, 58);
			
			canvas.onmousedown = function (e)
			{
				var context = e.target.getContext('2d');
				var x = e.offsetX;
				var y = e.offsetY;
				
				if (selectMode == 0)
				{
					if (context.isPointInPath(defense1, x, y))
					{
			  			selectMode = 1;
			  			drawDefenseSelection();
			  			if (alliance != "Red")
			  			{
				  			positionToPlaceDefense = {x:363, y:191, width:74, height:84};
			  			}
			  			else
			  			{
				  			positionToPlaceDefense = {x:363, y:189, width:74, height:84};
			  			}
					}
					else if (context.isPointInPath(defense2, x, y))
					{
			  			selectMode = 1;
			  			drawDefenseSelection();
			  			if (alliance != "Red")
			  			{
				  			positionToPlaceDefense = {x:363, y:276, width:74, height:84};
			  			}
			  			else
			  			{
				  			positionToPlaceDefense = {x:363, y:274, width:74, height:84};
			  			}
					}
					else if (context.isPointInPath(defense3, x, y))
					{
			  			selectMode = 1;
			  			drawDefenseSelection();
			  			if (alliance != "Red")
			  			{
				  			positionToPlaceDefense = {x:363, y:361, width:74, height:84};
			  			}
			  			else
			  			{
				  			positionToPlaceDefense = {x:363, y:359, width:74, height:84};
			  			}
					}
					else if (context.isPointInPath(defense4, x, y))
					{
			  			selectMode = 1;
			  			drawDefenseSelection();
			  			if (alliance != "Red")
			  			{
				  			positionToPlaceDefense = {x:363, y:446, width:74, height:84};
			  			}
			  			else
			  			{
				  			positionToPlaceDefense = {x:363, y:444, width:74, height:84};
			  			}
					}
					else if (context.isPointInPath(spyBotPath, x, y))
					{
						selectMode = 2;
						drawTeamSelection();
					}
					else if (context.isPointInPath(spyHumanPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						if (hasSpyHuman)
							hasSpyHuman = false;
						else
							hasSpyHuman = true;
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(robotPosition1, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:460, y:206, width:77, height:58};
					}
					else if (context.isPointInPath(robotPosition2, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:460, y:287, width:77, height:58};
					}
					else if (context.isPointInPath(robotPosition3, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:460, y:373, width:77, height:58};
					}
					else if (context.isPointInPath(robotPosition4, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:460, y:458, width:77, height:58};
					}
					else if (context.isPointInPath(robotPosition5, x, y))
					{
						selectMode = 3;
						drawTeamSelection();
						positionToPlaceRobot = {x:460, y:544, width:77, height:58};
					}
				}
				else if (selectMode == 1)
				{
					if (context.isPointInPath(portcullisPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(portcullis, positionToPlaceDefense, 1, "Portcullis");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(chevalDeFrisePath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(chevalDeFrise, positionToPlaceDefense, 1, "Cheval De Frise");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(moatPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(moat, positionToPlaceDefense, 2, "Moat");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(rampartsPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(ramparts, positionToPlaceDefense, 2, "Ramparts");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(drawbridgePath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(drawbridge, positionToPlaceDefense, 3, "Drawbridge");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(sallyPortPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(sallyPort, positionToPlaceDefense, 3, "Sally Port");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(rockWallPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(rockWall, positionToPlaceDefense, 4, "Rock Wall");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(roughTerrainPath, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newDefense = new defense(roughTerrain, positionToPlaceDefense, 4, "Rough Terrain");
						defensePositions.push(newDefense);
						drawArenaWithChanges();
					}
					else
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						drawArenaWithChanges();
					}
				}
				else if (selectMode == 2)
				{
					if (context.isPointInPath(team1Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						teamAsSpyBot = team1;
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(team2Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						teamAsSpyBot = team2;
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(team3Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						teamAsSpyBot = team3;
						drawArenaWithChanges();
					}
					else
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						drawArenaWithChanges();
					}
				}
				else if (selectMode == 3)
				{
					if (context.isPointInPath(team1Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newRobot = new robot(team1, positionToPlaceRobot);
						robotPositions.push(newRobot);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(team2Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newRobot = new robot(team2, positionToPlaceRobot);
						robotPositions.push(newRobot);
						drawArenaWithChanges();
					}
					else if (context.isPointInPath(team3Path, x, y))
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						var newRobot = new robot(team3, positionToPlaceRobot);
						robotPositions.push(newRobot);
						drawArenaWithChanges();
					}
					else
					{
						ctx.drawImage(arena, 0, 0);
						selectMode = 0;
						drawArenaWithChanges();
					}
				}
			}
		}
		drawArenaWithChanges();
	}
	
	function drawArenaWithChanges() {
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
		for (var i = 0; i < robotPositions.length; i++)
		{
			var robotToCheck = robotPositions[i];
			if (robotToCheck.teamNumber == teamAsSpyBot)
			{
				teamAsSpyBot = "";
			}
		}
		
		if (teamAsSpyBot != "")
		{
			if (side != "Near")
			{
				ctx.font = "24px serif";
				ctx.textAlign = "center";
				ctx.fillStyle = "white";
				ctx.fillText("Team " + teamAsSpyBot, 341 + 134 / 2, 127 + 102 / 2 + 7, 134);
			}
			else
			{
				ctx.font = "24px serif";
				ctx.textAlign = "center";
				ctx.fillStyle = "white";
				ctx.fillText("Team " + teamAsSpyBot, 99 + 134 / 2, 472 + 102 / 2 + 7, 134);
			}
		}
		
		if (hasSpyHuman)
		{
			ctx.fillStyle = "green";
			ctx.fill(spyHumanPath);
		}
		else
		{
			ctx.fillStyle = "red";
			ctx.fill(spyHumanPath);
		}
		
		ctx.fillStyle = "white";
		ctx.font = "18px serif";
		ctx.textAlign = "center";
		for (var i = 0; i < robotPositions.length - 1; i++)
		{
			var robotToCheck = robotPositions[robotPositions.length - 1];
			var dynamicRobot = robotPositions[i];
			
			if (robotToCheck.position.x == dynamicRobot.position.x && robotToCheck.position.y == dynamicRobot.position.y)
			{
				robotPositions.splice(i, 1);
				break;
			}
		}
		for (var i = 0; i < robotPositions.length - 1; i++)
		{
			var robotToCheck = robotPositions[robotPositions.length - 1];
			var dynamicRobot = robotPositions[i];
			
			if (robotToCheck.teamNumber == dynamicRobot.teamNumber)
			{
				robotPositions.splice(i, 1);
				break;
			}
		}
		for (var i = 0; i < robotPositions.length; i++)
		{
			var robotToCheck = robotPositions[i];
			
			if (robotToCheck.teamNumber == teamAsSpyBot)
			{
				teamAsSpyBot = "";
				break;
			}
			if (team1Div.innerHTML.includes(robotToCheck.teamNumber) && document.getElementById("team1Checkbox").checked || team2Div.innerHTML.includes(robotToCheck.teamNumber) && document.getElementById("team2Checkbox").checked || team3Div.innerHTML.includes(robotToCheck.teamNumber) && document.getElementById("team3Checkbox").checked)
			{
				robotPositions.splice(i, 1);
			}
		}
		for (var i = 0; i < robotPositions.length; i++)
		{
			var robotToDraw = robotPositions[i];
			ctx.fillText("Team " + robotToDraw.teamNumber, robotToDraw.position.x + 77 / 2, robotToDraw.position.y + 58 / 2 + 3, robotToDraw.position.width);
		}
	}
	
	function drawTeamSelection() {
		var defenseBG = document.getElementById("defenseBG");
		ctx.drawImage(defenseBG, 62.5, 235, 450, 230);
		
		ctx.font = "48px serif";
		ctx.textAlign = "left";
		ctx.fillStyle = "white";
		
		ctx.fillText("Team " + team1, 72.5, 235 + 115 + 7, 136.66667);
		ctx.fillText("Team " + team2, 219.16667, 235 + 115 + 7, 136.66667);
		ctx.fillText("Team " + team3, 365.83334, 235 + 115 + 7, 136.66667);
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
	
	function removeDuplicates(checkboxNumber) {
		if (document.getElementById("team" + checkboxNumber + "Checkbox").checked)
		{
			for (var i = 0; i < robotPositions.length; i++)
			{
				var robotToCheck = robotPositions[i];
				
				switch (checkboxNumber)
				{
				case 1:
					if (team1Div.innerHTML.includes(robotToCheck.teamNumber))
					{
						robotPositions.splice(i, 1);
						ctx.drawImage(arena, 0, 0);
						drawArenaWithChanges();
					}
					break;
				case 2:
					if (team2Div.innerHTML.includes(robotToCheck.teamNumber))
					{
						robotPositions.splice(i, 1);
						ctx.drawImage(arena, 0, 0);
						drawArenaWithChanges();
					}
					break;
				case 3:
					if (team3Div.innerHTML.includes(robotToCheck.teamNumber))
					{
						robotPositions.splice(i, 1);
						ctx.drawImage(arena, 0, 0);
						drawArenaWithChanges();
					}
					break;
				}
			}
			switch (checkboxNumber)
			{
			case 1:
				if (team1Div.innerHTML.includes(teamAsSpyBot))
				{
					teamAsSpyBot = "";
					ctx.drawImage(arena, 0, 0);
					drawArenaWithChanges();
				}
				break;
			case 2:
				if (team2Div.innerHTML.includes(teamAsSpyBot))
				{
					teamAsSpyBot = "";
					ctx.drawImage(arena, 0, 0);
					drawArenaWithChanges();
				}
				break;
			case 3:
				if (team3Div.innerHTML.includes(teamAsSpyBot))
				{
					teamAsSpyBot = "";
					ctx.drawImage(arena, 0, 0);
					drawArenaWithChanges();
				}
				break;
			}
		}
	}
	
	function loadNextPage() {
//		var dataToPass = new data(robotPositions, defensePositions, teamAsSpyBot, hasSpyHuman);

		var form = document.getElementById("actionForm");
		
		var team1Checked = document.getElementById("team1Checkbox").checked;
		var team2Checked = document.getElementById("team2Checkbox").checked;
		var team3Checked = document.getElementById("team3Checkbox").checked;
		
		for (var i = 0; i < robotPositions.length; i++)
		{
			var robotToParse = robotPositions[i];
			
			form.innerHTML += '<input type="hidden" name="robot' + i + 'teamNumber" value="' + robotToParse.teamNumber + '"/>';
			form.innerHTML += '<input type="hidden" name="robot' + i + 'xPosition" value="' + robotToParse.position.x + '"/>';
			form.innerHTML += '<input type="hidden" name="robot' + i + 'yPosition" value="' + robotToParse.position.y + '"/>';
			form.innerHTML += '<input type="hidden" name="robot' + i + 'width" value="' + robotToParse.position.width + '"/>';
			form.innerHTML += '<input type="hidden" name="robot' + i + 'height" value="' + robotToParse.position.height + '"/>';
		}
		
		for (var i = 0; i < defensePositions.length; i++)
		{
			var defenseToParse = defensePositions[i];
			
			form.innerHTML += '<input type="hidden" name="defense' + i + 'name" value="' + defenseToParse.name + '"/>';
			form.innerHTML += '<input type="hidden" name="defense' + i + 'xPosition" value="' + defenseToParse.position.x + '"/>';
			form.innerHTML += '<input type="hidden" name="defense' + i + 'yPosition" value="' + defenseToParse.position.y + '"/>';
			form.innerHTML += '<input type="hidden" name="defense' + i + 'width" value="' + defenseToParse.position.width + '"/>';
			form.innerHTML += '<input type="hidden" name="defense' + i + 'height" value="' + defenseToParse.position.height + '"/>';
			form.innerHTML += '<input type="hidden" name="defense' + i + 'height" value="' + defenseToParse.position.height + '"/>';
			form.innerHTML += '<input type="hidden" name="defense' + i + 'category" value="' + defenseToParse.category + '"/>';
		}
		
		if (teamAsSpyBot != "")
		{
			form.innerHTML += '<input type="hidden" name="robotAsSpyBot" value="' + teamAsSpyBot + '"/>';
		}
		else
		{
			form.innerHTML += '<input type="hidden" name="robotAsSpyBot" value="' + "0" + '"/>';
		}
		
		if (hasSpyHuman)
		{
			form.innerHTML += '<input type="hidden" name="hasSpyHuman" value="' + "YES" + '"/>';
		}
		else
		{
			form.innerHTML += '<input type="hidden" name="hasSpyHuman" value="' + "NO" + '"/>';
		}
		
		if (team1Checked)
		{
			form.innerHTML += '<input type="hidden" name="Team1NoShow" value="' + "YES" + '"/>';
		}
		else
		{
			form.innerHTML += '<input type="hidden" name="Team1NoShow" value="' + "NO" + '"/>';
		}
		
		if (team2Checked)
		{
			form.innerHTML += '<input type="hidden" name="Team2NoShow" value="' + "YES" + '"/>';
		}
		else
		{
			form.innerHTML += '<input type="hidden" name="Team2NoShow" value="' + "NO" + '"/>';
		}
		
		if (team3Checked)
		{
			form.innerHTML += '<input type="hidden" name="Team3NoShow" value="' + "YES" + '"/>';
		}
		else
		{
			form.innerHTML += '<input type="hidden" name="Team3NoShow" value="' + "NO" + '"/>';
		}
		
		form.submit();
	}