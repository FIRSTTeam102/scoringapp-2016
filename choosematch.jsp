<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="STUDENTRUN.jsp"%>

<%
	match = request.getParameter("rdoMatch");

	//for(int i = 0; strings.hasMoreElements(); i++){
	//	String str = strings.nextElement();
	//	out.println(str);
	//}
	if (alliance == null) {
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "scoringapp.jsp");
	}
	if (match != null) {

		int matchIndex = match.indexOf('m');
		int team1Index = match.indexOf("a");
		int team2Index = match.indexOf("b");
		int team3Index = match.indexOf("c");

		String matchNum = match.substring(matchIndex + 2, team1Index);

		team1 = Integer.parseInt(match.substring(team1Index + 2, team2Index));
		team2 = Integer.parseInt(match.substring(team2Index + 2, team3Index));
		team3 = Integer.parseInt(match.substring(team3Index + 2));

		//out.println(team1);
		//out.println(team2);
		//out.println(team3);

		session.setAttribute("team1", team1);
		session.setAttribute("team2", team2);
		session.setAttribute("team3", team3);

		session.setAttribute(matchKey, matchNum);
		session.setAttribute("arenaData", null);
		
%>

<%
	pageContext.setAttribute(initialsKey, initials);
%>
<%--
<c:if test="${initials != null }">
	<sql:update dataSource="${database}">
		UPDATE match_teams
			SET initials = ?
				WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${initials }" />
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team1 }" />
	</sql:update>
	<sql:update dataSource="${database}">
		UPDATE match_teams
			SET initials = ?
				WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${initials }" />
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team2 }" />
	</sql:update>
	<sql:update dataSource="${database}">
		UPDATE match_teams
			SET initials = ?
				WHERE
				tournament_id = ?
				AND match_number = ?
				AND team_number = ?
		<sql:param value="${initials }" />
		<sql:param value="${tournament.rows[0].id}" />
		<sql:param value="${sessionScope.matchNumber }" />
		<sql:param value="${sessionScope.team3 }" />
	</sql:update>
</c:if>
--%>
<%
	response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "pre-match.jsp");
	}
%>

<sql:query dataSource="${database}" var="result">
	<%="select mt1.match_number, m.start_time, mt1.team_number as team1, mt2.team_number as team2, mt3.team_number as team3, mt1.initials"
								+ " from matches m, match_teams mt1, match_teams mt2, match_teams mt3, tournaments t"
								+ " where t.active = 'Y'  and m.tournament_id = t.id"
								+ " and mt1.tournament_id = m.tournament_id  and mt1.match_number = m.match_number"
								+ " and mt1.completed = 'N'  and mt1.alliance = '" + alliance + "'"
								+ " and mt1.seq_no = 1  and mt2.team_number != mt1.team_number"
								+ " and mt2.tournament_id = mt1.tournament_id"
								+ " and mt2.match_number = mt1.match_number  and mt2.completed = mt1.completed"
								+ " and mt2.alliance = mt1.alliance  and mt2.seq_no = 2"
								+ " and mt3.team_number != mt1.team_number  and mt3.team_number != mt2.team_number"
								+ " and mt3.tournament_id = mt1.tournament_id"
								+ " and mt3.match_number = mt1.match_number  and mt3.completed = mt1.completed"
								+ " and mt3.alliance = mt1.alliance  and mt3.seq_no = 3" + " order by m.match_number;"%>
</sql:query>
<c:set var="matches" scope="page" value="${result}" />



<%-- HTML --%>
<html lang="en">
<head>
<meta charset="utf-8" http-equiv="Content-Type"
	content="text/html; charset=ISO-8859-1" />
<title><c:forEach var="t" items="${tournament.rows}">
		<c:out value="${t.title}" />
	</c:forEach> Selection</title>
<meta name="viewport"
	content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
<script type='text/javascript' src='js/jquery-1.12.0.min.js'></script>
<link rel="stylesheet" href="stylesheet.css" />
</head>
<body class="no-js">
	<div id="page">
		<%@include file="title-small.jsp"%>
		<div class="header">
			<div>Choose a Match</div>
			<div id="competition"></div>
			<div id="allianceColor" class="<%=alliance%>"><%=alliance%>
				Alliance
			</div>
		</div>
		<form id="MatchForm" action="choosematch.jsp" method="POST">
			<div id="nav">
				<input type="submit" name="btnNext" value="Next" />
			</div>
			<div id="Match">
				<div style="font-size: 0.8em">
					<c:forEach var="row" items="${matches.rows}">
						<label for="rdoMatch<c:out value="${row.match_number}" />">
							<div class="match_number">
								<input type="radio" name="rdoMatch"
									id="<c:out value="rdoMatch${row.match_number}" />"
									value="m:<c:out value="${row.match_number}" />a:<c:out value="${row.team1}"/>b:<c:out value="${row.team2}"/>c:<c:out value="${row.team3}"/>" />
								<%="#"%><c:out value="${row.match_number}" />
								@
								<c:out value="${row.start_time}" />
								<input type="checkbox" name="chkIgnore<c:out value="Ignore Match"/>" class="ignore">Ignore Match</div>
							<input type="hidden" value="<c:out value="${row.team1}"/>"
							name="team1"></input> <input type="hidden"
							value="<c:out value="${row.team2}"/>" name="team2"></input> <input
							type="hidden" value="<c:out value="${row.team3}"/>" name="team3"></input>
							<div class="team_holder">
								<c:out value="${row.team1}" />
							</div>
							<div class="team_holder">
								<c:out value="${row.team2}" />
							</div>
							<div class="team_holder">
								<c:out value="${row.team3}" />
							</div>
							<div class="team_holder">
								<c:out value="${row.initials}" />
							</div>
							<div style="clear: both;"></div>
						</label>
					</c:forEach>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
