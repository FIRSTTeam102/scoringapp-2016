<%-- This page is to initialize all required SQL database access, and to pull any session variables created in previous pages. --%>
<%-- All of the code is run each time a page is loaded. --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

//public static final String loggedIn = "isLoggedIn";

final String allianceKey = "allianceColor";
final String loginKey = "isLoggedIn";
final String userKey = "user";
final String arenaDataKey = "arenaData";
final String tournamentIDKey = "tournamentID";
final String tournamentNameKey = "tournamentName";

boolean isLoggedIn = (Boolean)session.getAttribute(loginKey);
String user = (String)session.getAttribute(userKey);
String alliance = (String)session.getAttribute(allianceKey);
HashMap<String, String> arenaData = (HashMap<String, String>)session.getAttribute(arenaDataKey);
%>
<%
	//Check if logged in
	if (!isLoggedIn) {
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "index.jsp");
	}
%>
<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://Gearheads-5/scoring2016" user="scoring102"
	password="GearBrainz"/>