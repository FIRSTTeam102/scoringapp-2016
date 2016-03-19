<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="STUDENTRUN.jsp"%>

<%
teleOp = true;
if(teleOp == null){
	if(auto == null){
		if (preMatch == null) {
			if (match == null) {
				if (alliance == null) {
					response.setStatus(response.SC_MOVED_TEMPORARILY);
					response.setHeader("Location", "scoringapp.jsp");
				} else {
					response.setStatus(response.SC_MOVED_TEMPORARILY);
					response.setHeader("Location", "choosematch.jsp");
				}
			} else {
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "pre-match.jsp");
			}
		}else{
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", "autonomous.jsp");
		}
	}else{
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "teleop.jsp");
	}	
}
%>

<%-- Check if the form has been submitted already. --%>
<%
	Enumeration<String> formInputs = request.getParameterNames();

	for (int i = 0; formInputs.hasMoreElements(); i++) {
		String str = formInputs.nextElement();

		if (str.equals("btnNext")) {
			pageContext.setAttribute("isFormSubmitted", true);
		}
	}
%>
<c:if test="${isFormSubmitted == true }">
	<%-- Universal data --%>
	<%	
		int foulPts = 0;
		if(request.getParameter("foulPts").equals("")){
			foulPts = 0;
		}else{
			foulPts = Integer.parseInt(request.getParameter("foulPts"));
		}
		//String totalPts = request.getParameter("totalPts");
		
		pageContext.setAttribute("foulPts", foulPts);
		//pageContext.setAttribute("totalPts", totalPts);
	%>
	<%-- Team 1 data --%>
	<%
		String challenge1 = request.getParameter("chkTeam1Challenge");
		String scale1 = request.getParameter("chkTeam1Scale");
		
		if (scale1 != null) {
			pageContext.setAttribute("end_position1", "S");
		} else if (challenge1 != null) {
			pageContext.setAttribute("end_position1", "C");
		}else{
			pageContext.setAttribute("end_position1", "N");
		}
	%>
	<%-- Team 2 data --%>
	<%
		String challenge2 = request.getParameter("chkTeam2Challenge");
		String scale2 = request.getParameter("chkTeam2Scale");
		
		if (scale2 != null) {
			pageContext.setAttribute("end_position2", "S");
		} else if (challenge2 != null) {
			pageContext.setAttribute("end_position2", "C");
		}else{
			pageContext.setAttribute("end_position2", "N");
		}
	%>
	<%-- Team 3 data --%>
	<%
		String challenge3 = request.getParameter("chkTeam3Challenge");
		String scale3 = request.getParameter("chkTeam3Scale");
		
		if (scale3 != null) {
			pageContext.setAttribute("end_position3", "S");
		} else if (challenge3 != null) {
			pageContext.setAttribute("end_position3", "C");
		}else{
			pageContext.setAttribute("end_position3", "N");
		}
	%>

	<sql:update dataSource="${database}">
		UPDATE match_teams
			SET end_position = ?
				, completed = 'Y'
				, fouls = ?
			WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${end_position1 }" />
		<sql:param value="${foulPts }" />
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team1 }" />
	</sql:update>

	<sql:update dataSource="${database}">
		UPDATE match_teams
			SET end_position = ?
				, completed = 'Y'
				, fouls = ?
			WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${end_position2 }" />
		<sql:param value="${foulPts }" />
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team2 }" />
	</sql:update>
	
		<sql:update dataSource="${database}">
		UPDATE match_teams
			SET end_position = ?
				, completed = 'Y'
				, fouls = ?
			WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${end_position3 }" />
		<sql:param value="${foulPts }" />
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team3 }" />
	</sql:update>
	<% 
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "choosematch.jsp");
	%>
</c:if>

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
						if (alliance != null) {
							if (alliance.equals("Red")) {
								out.print("Blue");
							} else {
								out.print("Red");
							}
						}
					%>
					Penalty: <input name="foulPts" type="number" min="0" max="9999" width="90px"
						style="width: 90px;" />
				</div>
				<%-->
				<div id="TotalPts">
					Total <% if(alliance!=null){out.println(alliance);} %> Points: <input name="totalPts" type="number" min="0" max="9999" width="90px" style="width: 90px;"/>
				</div> --%>
				<div id="nav" style="padding-top: 25px; padding-bottom: 10px;">
					<input type="submit" name="btnNext" value=" Done ">
				</div>
			</form>
		</center>
	</div>
</body>
</html>