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
<link rel="stylesheet" type="text/css" href="css/MyTimeline.css" />
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
		<div id="TimelineDash"><div id="WeekButton" class="Active">Week</div><div id="MonthButton" class="InActive">Month</div><div id="ListButton" class="InActive">List</div></div>
		
		<div id="WeekView" style='display: none;'>
				<div class='WeekDay First'>
					<div class='CalendarDay'>
						<div class='Divider'></div>
						<div class='Day'></div>
						<div class='Number'></div>
					</div>
					<div class="Task Blue">
						Submit Transcript
					</div>
				</div>
				
				<div class='WeekDay Second'>
					<div class='CalendarDay'>
						<div class='Divider'></div>
						<div class='Day'></div>
						<div class='Number'></div>
					</div>
					<div class="Task Blue">
						Dance like I have never danced before.
					</div>
					<div class="Task Orange">
						Yell at the wall.
					</div>
				</div>
				
				<div class='WeekDay Third'>
					<div class='CalendarDay'>
						<div class='Divider'></div>
						<div class='Day'></div>
						<div class='Number'></div>
					</div>
				</div>
				
				<div class='WeekDay Fourth'>
					<div class='CalendarDay'>
						<div class='Divider'></div>
						<div class='Day'></div>
						<div class='Number'></div>
					</div>
					<div class="Task Orange">
						Yell at the wall.
					</div>
				</div>
				
				<div class='WeekDay Fifth'>
					<div class='CalendarDay'>
						<div class='Divider'></div>
						<div class='Day'></div>
						<div class='Number'></div>
					</div>
					<div class="Task Blue">
						Pee on the Beta house. 
					</div>
				</div>
				
				<div class='WeekDay Sixth'>
					<div class='CalendarDay'>
						<div class='Divider'></div>
						<div class='Day'></div>
						<div class='Number'></div>
					</div>
				</div>
				
				<div class='WeekDay Seventh'>
					<div class='CalendarDay'>
						<div class='Divider'></div>
						<div class='Day'></div>
						<div class='Number'></div>
					</div>
					<div class="Task Orange">
						Call that person about that thing.
					</div>
				</div>
		</div>
		
		<div id="MonthView" style='display: none;'>
			<div class="MonthDay">
				<div class="MicroCalendarDay">1</div>
					<div class="Task Orange">
						Call that person about that thing.
					</div>
					<div class="Task Orange">
						Yell at the wall.
					</div>
			</div>
			<div class="MonthDay" style="top: 0px; left: 160px;">
				<div class="MicroCalendarDay">2</div>
			</div>
			<div class="MonthDay" style="top: 0px; left: 320px;">
				<div class="MicroCalendarDay">3</div>
				<div class="Task Blue">
						Smile for no reason.
				</div>
			</div>
		</div>
		
		<div id="ListView">
			<div class='ListItem'>
				<div class='DateTitle'>
					Sunday Oct 28, 2012
				</div>
				<div class='ListTask Task Orange'>
					<div class='ListTaskTitle'>Super Title</div>					
					<div class='ListTaskNotes'>Lalalal here are my notes</div>
				</div>
				<div class='ListTask Task Blue'>
					<div class='ListTaskTitle'>Super Title</div>				
					<div class='ListTaskNotes'>Lalalal here are my notes</div>
				</div>
				<div class='ListTask Task Orange'>
					<div class='ListTaskTitle'>Super Title</div>					
					<div class='ListTaskNotes'>Lalalal here are my notes</div>
				</div>
			</div>
			
			<div class='ListItem'>
				<div class='DateTitle'>
					Monday Oct 29, 2012
				</div>
				<div class='ListTask Task Orange'>
					<div class='ListTaskTitle'>Super Title</div>					
					<div class='ListTaskNotes'>Lalalal here are my notes</div>
				</div>
			</div>
			
			<div class='ListItem'>
				<div class='DateTitle'>
					Tuesday Oct 30, 2012
				</div>
				<div class='ListTask'>
					<div class='ListTaskTitle'>Super Title</div>					
					<div class='ListTaskNotes'>Lalalal here are my notes</div>
				</div>
			</div>
			
		
		</div>
		
		<div id="InstitutionList">
			<div class="Institution Blue">University of British Columbia</div>
			<div class="Institution Orange">University of Alberta</div>
		</div>
	</div>
<script>

$("#WeekButton").click(function(){
	$("#MonthView").fadeOut(300, function(){
		$("#ListView").fadeOut(300, function(){
			$("#WeekView").fadeIn();
		});		
	});
});

$("#MonthButton").click(function(){
	$("#WeekView").fadeOut(300, function(){
		$("#ListView").fadeOut(300, function(){
			$("#MonthView").fadeIn();
		});		
	});
});

$("#ListButton").click(function(){
	$("#WeekView").fadeOut(300, function(){
		$("#MonthView").fadeOut(300, function(){
			$("#ListView").fadeIn();
		});		
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
		
		$('.CalendarDay').each(function(){
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