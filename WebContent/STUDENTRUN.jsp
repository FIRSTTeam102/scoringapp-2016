<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

//public static final String loggedIn = "isLoggedIn";

boolean isLoggedIn = (boolean)session.getAttribute("isLoggedIn");
String user = (String)session.getAttribute("user");

// troll
%>