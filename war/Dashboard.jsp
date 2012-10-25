<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
   
%>

<!doctype html>
<html>
<link rel="stylesheet" type="text/css" href="css/Layout.css" />
<link rel="stylesheet" type="text/css" href="css/Dashboard.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<head>
    <title>Calendar</title>    
</head>
<body>
	<div id="NavBar">
		<div id="NavList"><a href="Dashboard.jsp"><span>Dashboard</span></a><span style="float: right">Logout</span></div>
	</div>
	<div id="Content">
		<div class="Widget">
			<a href="AGRequirements.jsp"><div class="WidgetTitle AGTitle">My "A-G"<br /> Requirements</div></a>
			<div class="WidgetContent">
				<div id="ProgressBarTitle">Percent Of Requirements Complete: 88%</div>
				<div id="ProgressBar"></div>
			</div>
		</div>
		
		<div class="Widget">
			<div class="WidgetTitle ApplicationsTitle">My Applications</div>
			<div class="WidgetContent">
				
			</div>
		</div>
		
		<div class="Widget">
			<div class="WidgetTitle ApplicationsTitle">My Timeline</div>
			<div class="WidgetContent">
				
			</div>
		</div>
	
	</div>
<script>
$(function() {
        $("#ProgressBar").progressbar({
            value: 88
        });
});
</script>
</body

</html>