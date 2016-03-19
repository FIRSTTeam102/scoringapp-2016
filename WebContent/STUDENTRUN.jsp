<%-- This page is to initialize all required SQL database access, and to pull any session variables created in previous pages. --%>
<%-- All of the code is run each time a page is loaded. --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
           
<%
final String allianceKey = "allianceColor";
final String loginKey = "isLoggedIn";
final String initialsKey = "initials";
final String arenaDataKey = "arenaData";
final String tournamentIDKey = "tournamentID";
final String tournamentNameKey = "tournamentName";
final String matchKey = "matchNumber";
final String team1Key = "team1";
final String team2Key = "team2";
final String team3Key = "team3";
final String sideKey = "side";
final String preMatchKey = "preMatch";
final String cycleNumberKey = "cycleNumber";
final String teleopKey = "teleOp";
final String autoKey = "autonomous";

if(session.getAttribute(loginKey) == null){
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "index.jsp");

}
%>
<%	

String alliance = (String)session.getAttribute(allianceKey);
String tournament = (String)session.getAttribute(tournamentNameKey);
String tournamentID = (String)session.getAttribute(tournamentIDKey);
String match = (String)session.getAttribute(matchKey);
String side = (String)session.getAttribute(sideKey);
String initials = (String)session.getAttribute(initialsKey);

Boolean preMatch = (Boolean)session.getAttribute(preMatchKey);
Boolean teleOp = (Boolean)session.getAttribute(teleopKey);
Boolean auto = (Boolean)session.getAttribute(autoKey);
//Using Integer objects to avoid null pointer exceptions.
Integer team1 = (Integer)session.getAttribute(team1Key);
Integer team2 = (Integer)session.getAttribute(team2Key);
Integer team3 = (Integer)session.getAttribute(team3Key);
Integer cycleNumber = (Integer)session.getAttribute(cycleNumberKey);

HashMap<String, String> arenaData = (HashMap<String, String>)session.getAttribute(arenaDataKey);
%>

<%
	String line;
	
	URL url = new URL("http://localhost:8080/ScoringApp-2016/trash");
	InputStream is = url.openStream();
    InputStreamReader read = new InputStreamReader(is);
	BufferedReader bufferedReader = new BufferedReader(read);
		
	line = bufferedReader.readLine();
	pageContext.setAttribute("SQLPassword",line);
	
	bufferedReader.close();
	read.close();
	is.close();
%>

<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://Gearheads-5/scoring2016?useOldAliasMetadataBehavior=true" user="scoring102"
	password="${SQLPassword }"/>