<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
   
    
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
   
    if (user != null) {
    	
    } else {
    	response.sendRedirect(response.encodeRedirectURL("Welcome.jsp"));
    }
   
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
		<div id="NavList"><a href="Dashboard.jsp"><span>Dashboard</span></a><a href='<%= userService.createLogoutURL(request.getRequestURI()) %>'><span style="float: right">Logout</span></a></div>
	</div>
	<div id="Content">
		<div class="ToDo">Applications and Timeline are still under construction :) Stay tuned for updates!</div>
	
		<div class="Widget">
			<a href="AGRequirements.jsp"><div class="WidgetTitle AGTitle">"A-G"<br /> Requirements</div></a>
			<div class="WidgetContent">
				<div id="ProgressBarTitle">Percent Of Requirements Complete: <span id="PercentComplete">88</span>%</div>
				<div id="ProgressBar"></div>
			</div>
		</div>
		
		<div class="Widget">
			<a href="MyApplications.jsp"><div class="WidgetTitle ApplicationsTitle">Applications</div></a>
			<div class="WidgetContent">
				<div class="Column1">
					<div class="Stat">Applications in progress<span class="Orange ApplicationsInProgress">*</span></div>
					<div class="Stat">Applications Complete<span class="Green ApplicationsComplete">*</span></div>
				</div>
				
				<div class="Column2">
					<div class="Stat">Tasks in progress<span class="Orange TasksInProgress">*</span></div>
					<div class="Stat">Tasks Complete<span class="Green TasksComplete">*</span></div>
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
		$.ajax({
			url: 'agrequirements/get',
			type: 'GET',
			dataType: "json",	 	
			success: function(data) {
				
				var objectKeys = keys(data.propertyMap);
				objectKeys.sort();			
				
				var total = 0;
				var completed = 0;
				
				while(total < objectKeys.length) {
					if(data.propertyMap[objectKeys[total]] == "true") {
						completed++;
					}
					total++;
				}
				
				var percent = Math.round((completed / total) * 100);
				
				
				$("#ProgressBar").progressbar({
				value: percent
				});
				
				$("#PercentComplete").html(percent);
			}
		});
		
		$.ajax({
	  	url: '/applicationsservice/getApplications',
	  	type: 'GET',
	 	success: function(applications) {
			calculateApplicationStats(applications);
			
		}
	});
});

function calculateApplicationStats(applications) {
	var applicationsInProgress = 0;
	var applicationsComplete = 0;
	var tasksInProgress = 0;
	var tasksComplete = 0;
	
	var index = 0;
	
	while(index < applications.length) {
		var current = applications[index];
		var allTasksComplete = true;
		
		var taskIndex = 0; 
		while(taskIndex < current.propertyMap.tasks.length) {
			var currentTask = $.parseJSON(current.propertyMap.tasks[taskIndex]);
		
			if(currentTask.propertyMap.taskStatus == "3") {
				tasksComplete++;
			} 
			
			if(currentTask.propertyMap.taskStatus == "2") {
				tasksInProgress++;
				allTasksComplete = false;
			}
			
			taskIndex++;
		}
		
		if(allTasksComplete && taskIndex > 0) {
			applicationsComplete++;
		} else {
			applicationsInProgress++;
		}
		index++;
	}
	
	$(".ApplicationsInProgress").text(applicationsInProgress);
	$(".ApplicationsComplete").text(applicationsComplete);
	$(".TasksInProgress").text(tasksInProgress);
	$(".TasksComplete").text(tasksComplete);
	

}

//Refactor
function keys(obj)
{
    var keys = [];

    for(var key in obj)
    {
        if(obj.hasOwnProperty(key))
        {
            keys.push(key);
        }
    }

    return keys;
}

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