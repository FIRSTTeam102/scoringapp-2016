<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="STUDENTRUN.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!-- WORK IN PROGRESS -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://Gearheads-5/scoring2016"
     user="scoring102"  password="GearBrainz"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM tournaments WHERE active = "Y"
</sql:query>
<c:set var="tournament" scope="session" value="${result}"/>
<%
	String tournamentName = "g";
	session.setAttribute(tournamentNameKey, tournamentName);
%>

<%
	String allianceInput = (String)request.getParameter("rdoAlliance");
	session.setAttribute(allianceKey, allianceInput);
	
	String tournamentTitle = "Temporary value.";
%>

<%! void setBlock(){
	
}
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
				<c:out value="${tournament}"/>
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