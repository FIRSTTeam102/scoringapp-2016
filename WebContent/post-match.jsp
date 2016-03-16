<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="STUDENTRUN.jsp"%>

<%--
-Official score
-Result (win/loss/tie)
-(Difference between ours and theirs
-Challenge
-Capture
-Scale
-Fouls
 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FRC 2016 Scoring App</title>
<script src="js/jquery-1.12.0.min.js"></script>
<script>
	
<%out.print("var alliance = '" + alliance + "'; alliance = alliance.toLowerCase();" + "var breach = false; "
					+ "var capture = false; ");%>
	
</script>
<script src="js/post-match.js"></script>
<link rel="stylesheet" href="stylesheet.css" />
</head>
<body>
	<div class="main">
		<%@include file="title-small.jsp"%>
		<div class="header">
			<div>Game Results</div>
			<div id="allianceColor" class="<%=alliance%>"><%=alliance%>
				Alliance
			</div>
		</div>
		<center>
			<form id="postMatchForm" action="post-match.jsp" method="post">
				<div id="team1" class="team">
					<div id="Team1Number" class="teamNumber"><%=team1%></div>
					<div id="Team1EndScore">
						<div id="Team1Challenge">
							<input type="checkbox" name="chkTeam1Challenge"
								id="chkTeam1Challenge" value="Y"> <label
								for="chkTeam1Challenge">Completed Challenge</label>
						</div>
						<div id="Team1Scale">
							<input type="checkbox" name="chkTeam1Scale" id="chkTeam1Scale"
								value="Y"> <label for="chkTeam1Scale">Scaled
								Wall</label>
						</div>
					</div>
				</div>
				<div id="team2" class="team">
					<div id="Team2Number" class="teamNumber"><%=team2%></div>
					<div id="Team2EndScore">
						<div id="Team2Challenge">
							<input type="checkbox" name="chkTeam2Challenge"
								id="chkTeam2Challenge" value="Y"> <label
								for="chkTeam2Challenge">Completed Challenge</label>
						</div>
						<div id="Team2Scale">
							<input type="checkbox" name="chkTeam2Scale" id="chkTeam2Scale"
								value="Y"> <label for="chkTeam2Scale">Scaled
								Wall</label>
						</div>
					</div>
				</div>
				<div id="team3" class="team">
					<div id="Team3Number" class="teamNumber"><%=team3%></div>
					<div id="Team3EndScore">
						<div id="Team3Challenge">
							<input type="checkbox" name="chkTeam3Challenge"
								id="chkTeam3Challenge" value="Y"> <label
								for="chkTeam3Challenge">Completed Challenge</label>
						</div>
						<div id="Team3Scale">
							<input type="checkbox" name="chkTeam3Scale" id="chkTeam3Scale"
								value="Y"> <label for="chkTeam3Scale">Scaled
								Wall</label>
						</div>
					</div>
				</div>

				<table id="BreachCapture">
					<tr>
						<td id="Capture"><img src="Images/icons/capt-blue-n.png"
							width="150" height="150" /></td>
						<td id="Breach"><img src="Images/icons/br-blue-y.png"
							width="150" height="150" /></td>
					</tr>
				</table>
				
				<div id="FoulPts">
					<% 
					if(alliance.equals("Red")){
						out.print("Blue");
					}else{
						out.print("Red");
					}
					%> Penalty:
					<input type="number" min="0" max="9999" width="90px" style="width: 90px;"/>
				</div>
			</form>
		</center>
	</div>
</body>
</html>