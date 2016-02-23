<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="STUDENTRUN.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auto</title>
<link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<div class="main">
<div class="box">
<h1>
Crossed Line :
</h1>
<br>
<input type="CheckBox">
<br>
<input type="CheckBox">
<br>
<input type="CheckBox">
<br>
</div>
<br>
<div class="box">
<h1>
Cross Defense :
</h1>
<br>
<input type="CheckBox">
<br>
<input type="CheckBox">
<br>
<input type="CheckBox">
<br>
</div>
<br>
<div class="box">
<h1>
Score High/Low
</h1>
<br>
<input type="CheckBox">
<br>
<input type="CheckBox">
<br>
<input type="CheckBox">
<br>
</div>
<br>
<input value="Tele-Op" type="button" onclick="window.location = 'teleop.jsp';"/>
</div>
</body>
</html>