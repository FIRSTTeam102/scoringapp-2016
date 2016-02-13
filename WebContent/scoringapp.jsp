<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="STUDENTRUN.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!-- WORK IN PROGRESS -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/scoring2016"
     user="scoring102"  password="GearBrainz"/>
<sql:query dataSource="${snapshot}" var="result">
select mt1.match_number, m.start_time, mt1.team_number as team1, mt2.team_number as team2, mt3.team_number as team3, mt1.initials
			from matches m, match_teams mt1, match_teams mt2, match_teams mt3, tournaments t
			where t.active = 'Y'
			and m.tournament_id = t.id
			and mt1.tournament_id = m.tournament_id
			and mt1.match_number = m.match_number
			and mt1.completed = 'N'
			and mt1.alliance = '%s'
			and mt1.seq_no = 1
			and mt2.team_number != mt1.team_number
			and mt2.tournament_id = mt1.tournament_id
			and mt2.match_number = mt1.match_number
			and mt2.completed = mt1.completed
			and mt2.alliance = mt1.alliance
			and mt2.seq_no = 2
			and mt3.team_number != mt1.team_number
			and mt3.team_number != mt2.team_number
			and mt3.tournament_id = mt1.tournament_id
			and mt3.match_number = mt1.match_number
			and mt3.completed = mt1.completed
			and mt3.alliance = mt1.alliance
			and mt3.seq_no = 3
			order by m.match_number;
</sql:query>

<%
	String allianceInput = (String)request.getParameter("rdoAlliance");
	session.setAttribute(allianceKey, allianceInput);
	
	String tournamentTitle = "Temporary value.";
%>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8" http-equiv="Content-Type"
	content="text/html; charset=ISO-8859-1" />
<title>FRC 2016 Scoring App</title>
<meta name="viewport"
	content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
<script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script>
<link rel="stylesheet" href="stylesheet.css" />
</head>
<body class="no-js">
	<div id="page">
		<div class="main">
			<jsp:include page="title.html"></jsp:include>
			<form id="CompetitionForm" action="scoringapp.jsp" method="post">
				<div id="Tournament" class="header">
				<%= tournamentTitle %>
				</div>
				<div id="Alliance">
					<div>Choose an Alliance</div>
					<div id="AllianceList">
						<label for="rdoAllianceRed" id="lblRed"> <input
							type="radio" name="rdoAlliance" id="rdoAllianceRed" value="Red"
							tabindex="2" />Red
						</label> &nbsp;&nbsp; <label for="rdoAllianceBlue" id="lblBlue"> <input
							type="radio" name="rdoAlliance" id="rdoAllianceBlue" value="Blue"
							tabindex="3" />Blue
						</label>
					</div>
				</div>
				<div id="nav">
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnChooseMatch" value="Choose Match" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/modernizr.js"></script>
</body>