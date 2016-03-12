<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.net.*"%>

<%  Enumeration<String> formInputs = request.getParameterNames();   
	String passwordInput = request.getParameter("txtPassword");
	String initialsInput = request.getParameter("txtInitials");
	String btnInput = "";
	String initialsKey = "initials";
	String buttonKey = "button";
	
	String newLocation = new String();
	
	for(int i = 0; formInputs.hasMoreElements(); i++){
		String str = formInputs.nextElement();
		if(str.equals("txtInitials") || str.equals("txtPassword")){
			
		}else{
			btnInput = str;
		}
	}
%>

<%-- Check for password --%>
<%
	String line;
	
	URL url = new URL("http://localhost:8080/ScoringApp-2016/junk");
	InputStream is = url.openStream();
    InputStreamReader read = new InputStreamReader(is);
	BufferedReader bufferedReader = new BufferedReader(read);
		
	line = bufferedReader.readLine();
	
	bufferedReader.close();
	read.close();
	is.close();
	
	if(passwordInput != null){
		if (passwordInput.equals(line)){
			
			session.setAttribute("isLoggedIn", true);
			initializeRedirect(response, btnInput);
			
		}
	}
%>
<%	
	
	session.setAttribute(initialsKey, initialsInput);
	session.setAttribute(buttonKey, btnInput);

%>
<%! public void initializeRedirect(HttpServletResponse response, String btnInput) {
		if (btnInput.equals("btnScoringApp")) {
			redirect(response, "scoringapp.jsp");
		} else if (btnInput.equals("btnNew")) {
			redirect(response, "NewFile.jsp");
		}
	}%>
<%! public void redirect(HttpServletResponse response, String newLocation){
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", newLocation);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>FRC 2015 Scoring App</title>
<meta name="viewport"
	content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,height=device-height,target-densitydpi=device-dpi,user-scalable=yes" />
<!-- script type='text/javascript' src='jqueryui/js/jquery-1.10.2.js'></script-->
<link rel="stylesheet" href="stylesheet.css" />
<!-- script type='text/javascript'>//<![CDATA[ 
		$(document).ready(function(){
			alert("{alertError}");
		});
	//]]>
	</script-->
</head>
<body class="no-js">
	<!-- div class="castle-bg">
		<img src="castle-bg-2.jpg"></img>
	</div-->
	<div id="page">
		<div class="gray-y-bg"></div>
		<div class="main">
			<jsp:include page="title.html"></jsp:include>
			<form id="indexForm" action="index.jsp" method="POST">
				<div id="input" class="input-contianer">
					<div id="Initials">
						<label for="txtInitials">Your Initials: <input type="text"
							maxLength="12" name="txtInitials" tabindex="1" class="input-box" />
						</label>
					</div>
					<div id="Password">
						<label for="txtPassword">Password: <input type="password"
							name="txtPassword" tabindex="4" class="input-box" />
						</label>
					</div>
				</div>
				<div id="nav">
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnScoringApp"
							value="Team 102 Scoring App" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnNew" value="NewFile JSP Tests" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnSurvey"
							value="Team 102 Scouting Survey" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnPreview"
							value="Team 102 Match Preview" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnUpcoming"
							value="Team 102 Upcoming Matches" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnAlliance"
							value="Team 102 Alliance Selection" />
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<input type="submit" name="btnLighterApp"
							value="Lighter Color Stuffz" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>