<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Team102 Private Homepage</title>
    <meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
	<script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script>
<!--    <link rel="stylesheet" href="stylesheet.css" /> -->
	<style type="text/css">
	body {
	background-image: url("http://team102.org/2015/resources/images/Geary.jpg");
	background-repeat: repeat;
	background-color: #222;
	background-attachment: fixed;
	}
	.header{
	display: flex;
	flex-direction:row-reverse;
	flex-wrap: wrap;
	align-content: space-between;
	}
	.nav {
	max-width: 400px;
	background-image: url("http://team102.org/2015/resources/images/semitransparent.png");
    padding: 0 10px 17px 25px;
    border: 25px;
    margin: 15px 15px 15px 15px;
	order: 2;
	align-self: flex-end;
	flex-grow: 5;
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
	font-weight: 300;
	color: d5d5d8;
	border-radius: 16px;
	}
	.logo {
	 width: 300px;
    padding: 25px;
    border: 25px;
    margin: 0 15 25 0px;
	order: 1;
	flex-grow: 1;
	font-size: 21px;
	color: d5d5d8;
	}
	.bigButton {
	background-color: #F7b448;
	color: 151a2e;
	height: 60 px;
	width: 102 px;
	font-size: 20px;
	margin-top: 17px;
	}
	.loginbox{
	padding: 10px;
	border: 5px ridge #ff7e00;
	}
	.loginboxExterior{
	margin-top: 25px;
	}
	</style>
    <!--[if IE]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	<!-- BEGIN reportError --> 
	<script type='text/javascript'>//<![CDATA[ 
		$(document).ready(function(){
			alert("{alertError}");
		});
	//]]>
	</script>
	<!-- END reportError --> 
</head>
<body class="no-js">
    <div id="page">
        <div class="header">
			<div class="logo">
            <img src="favicon.ico" style="float: right; padding: 3px 15px 20px 10px;" onclick="changeImage()"/>
			<div id="indexForm" onclick="changeImage()">
				<div id="team102" style="text-align: right"><strong>FIRST Team 102</strong></div>
				<div style="text-align: right"><strong>PRIVATE HOMEPAGE</strong></div>
				<div style="text-align: right"><strong>Log in to enter scoring app.</strong></div>
			</div>
		    </div>
			
                <form class="nav" id="form" action="team102.php" method="POST">
					<div id="login" class="loginboxExterior">
					<table style="background-color: #F7b448; padding: 5px;" class="loginbox">
					<tr><td><label for="txtInitials" class="fieldLabel">Your Initials:</label></td>
						<td><input type="text" maxLength="4" name="txtInitials" tabindex="1" style="width: 90px;"/></td>
					</tr>
					<tr><td><label for="txtPassword" class="fieldLabel">Password:</label></td>
						<td><input type="password" name="txtPassword" tabindex="4" style="width: 90px;"/></td>
					</tr>
					</table>
					</div>
					<div style="padding-top: 10px;padding-bottom: 10px;"><input class="bigButton" type="submit" name="btnScoringApp" value="Team 102 Scoring App" /></div>
					Scoring App
					<div style="padding-top: 10px;padding-bottom: 10px;"><input class="bigButton" type="submit" name="btnStandings" value="Standings Page" /></div>
					Each team's ranking and statistics.
					<div style="padding-top: 10px;padding-bottom: 10px;"><input class="bigButton" type="submit" name="btnSurvey" value="Survey Results" /></div>
					Team results based on Team 102's scouting survey.
					<div style="padding-top: 10px;padding-bottom: 10px;"><input class="bigButton" type="submit" name="btnUpcoming" value="Upcoming Matches" /></div>
					Schedule for matches that will be taking place
					<div style="padding-top: 10px;padding-bottom: 10px;"><input class="bigButton" type="submit" name="btnAlliance" value="Alliance Selection" /></div>
					Alliances that have been formed for the final matches
					<div style="padding-top: 10px;padding-bottom: 10px;"><input class="bigButton" type="submit" name="btnLighterApp" value="Alliance Color Lighter" /></div>
					Illuminate screen in blue or red to show support for your alliance!
				</form>
        <script>
	var groupHighlights = [false];

function changeImage() {

        if (groupHighlights[0]===false) {
          document.getElementById("indexForm").style.background = "#ff8a19";
          document.getElementById("indexForm").style.color = "black";
          groupHighlights[0]=true;
          } else {
          document.getElementById("indexForm").style.background = "";
          document.getElementById("indexForm").style.color = "white";
          groupHighlights[0]=false;
        }
    } 
		</script>
    </div>
</body>
</html>