<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

//public static final String loggedIn = "isLoggedIn";

final String allianceKey = "allianceColor";
final String loginKey = "isLoggedIn";
final String userKey = "user";

boolean isLoggedIn = (Boolean)session.getAttribute(loginKey);
String user = (String)session.getAttribute(userKey);
String alliance = (String)session.getAttribute(allianceKey);
// troll
%>