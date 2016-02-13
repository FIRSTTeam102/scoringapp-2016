<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%	
	
	out.println("hello/");
	
%>
<html>
<head>
<title>Session Tracking</title>
<script type="text/javascript">
	function test() {
		console.log("Test");
	}
</script>
</head>
<body>
<center>
<form method="post" action="NewFile.jsp">
	<input type="submit" value="Test" onclick="test();"/>
</form>
</center>
</body>
</html>