<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>FRC 2015 Scoring App</title>
<meta name="viewport"
	content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
<!-- script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script-->
<link rel="stylesheet" href="stylesheet.css" />
<!-- script type='text/javascript'>//<![CDATA[ 
		$(document).ready(function(){
			alert("{alertError}");
		});
	//]]>
	</script-->
</head>
<body class="no-js">
	<!-- div class="castle-bg">
		<img src="castle-bg-2.jpg"></img>
	</div-->
	<div id="page">
		<div class="gray-y-bg"></div>
		<div class="header">
			<img class="title" src="Images/frc-stronghold-logo.png"/>
			<% Enumeration<String> thing = request.getParameterNames();  
				for(int i = 0; thing.hasMoreElements(); i++){
					out.println(thing.nextElement());
				}
			%>
			<%--= request.getParameterNames() --%>
			<form id="indexForm" action="index.jsp" method="POST">

				<div id="competition"
					style="padding-top: 50px; padding-bottom: 20px;">Team 102 FRC</div>
				<div id="input" class="input-contianer">
					<div id="Initials">
						<label for="txtInitials">Your Initials: <input type="text"
							maxLength="12" name="txtInitials" tabindex="1" class="input-box" />
						</label>
					</div>
					<div id="Password">
						<label for="txtPassword">Password: <input type="password"
							name="txtPassword" tabindex="4" class="input-box" />
						</label>
					</div>
				</div>
				<div id="nav">
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnScoringApp"
							value="Team 102 Scoring App" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnStandings"
							value="Team 102 Standings Page" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnSurvey"
							value="Team 102 Scouting Survey" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnPreview"
							value="Team 102 Match Preview" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnUpcoming"
							value="Team 102 Upcoming Matches" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnAlliance"
							value="Team 102 Alliance Selection" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnLighterApp"
							value="Lighter Color Stuffz" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>