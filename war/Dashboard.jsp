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
    <title>Achieve Timeline</title>    
</head>
<body>
	<div id="NavBar">
		<div id="NavList"><a href="Dashboard.jsp"><span>Dashboard</span></a><span style="float: right">Logout</span></div>
	</div>
	<div id="Content">
		
	
		<div class="Widget">
			<a href="AGRequirements.jsp"><div class="WidgetTitle AGTitle">"A-G"<br /> Requirements</div></a>
			<div class="WidgetContent">
				<div id="ProgressBarTitle">Percent Of Requirements Complete: 88%</div>
				<div id="ProgressBar"></div>
			</div>
		</div>
		
		<div class="Widget">
			<a href="MyApplications.jsp"><div class="WidgetTitle ApplicationsTitle">Applications</div></a>
			<div class="WidgetContent">
				<div class="Column1">
					<div class="Stat">Applications in progress<span class="Orange">4</span></div>
					<div class="Stat">Applications Complete<span class="Green">1</span></div>
				</div>
				
				<div class="Column2">
					<div class="Stat">Tasks in progress<span class="Orange">19</span></div>
					<div class="Stat">Tasks Complete<span class="Green">8</span></div>
				</div>
			</div>
		</div>
		
		<div class="Widget">
			<a href="MyTimeline.jsp"><div class="WidgetTitle ApplicationsTitle">Timeline</div></a>
			<div class="WidgetContent">
				
				<div class='MiniCalendarDay'>
					<div class='Divider'></div>
					<div class='Day'></div>
					<div class='Number'></div>
				</div>
				
				<div class='MiniCalendarDay'>
					<div class='Divider'></div>
					<div class='Day'></div>
					<div class='Number'></div>
				</div>
				
				<div class='MiniCalendarDay'>
					<div class='Divider'></div>
					<div class='Day'></div>
					<div class='Number'></div>
				</div>
				
				<div class='MiniCalendarDay'>
					<div class='Divider'></div>
					<div class='Day'></div>
					<div class='Number'></div>
				</div>
				
				
				<div class='MiniCalendarDay'>
					<div class='Divider'></div>
					<div class='Day'></div>
					<div class='Number'></div>
				</div>		
				
			</div>
		</div>
	
	</div>
<script>
$(function() {
        $("#ProgressBar").progressbar({
            value: 88
        });
});

$(function() {
        
		
		var weekday=new Array(7);
		weekday[0]="Sunday";
		weekday[1]="Monday";
		weekday[2]="Tuesday";
		weekday[3]="Wednesday";
		weekday[4]="Thursday";
		weekday[5]="Friday";
		weekday[6]="Saturday";
		
		var dayIndex = 0;
		
		$('.MiniCalendarDay').each(function(){
			var today = new Date();
			$(this).find('.Day').text(weekday[(today.getDay() + dayIndex)%7]);
			today.setDate( today.getDate() + dayIndex);
			$(this).find('.Number').text((today.getDate()));
			
			dayIndex++;
		});
});

</script>
</body

</html>