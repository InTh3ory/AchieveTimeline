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
    	response.sendRedirect(userService.createLoginURL(request.getRequestURI()));
    }
   
%>
<!doctype html>
<html>
<link rel="stylesheet" type="text/css" href="css/Layout.css" />
<link rel="stylesheet" type="text/css" href="css/MyApplications.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<head>
    <title>Achieve Timeline</title>    
</head>

<div id="LightBox">
	<div class="FormContainer">
		<div class="ExitButton"></div>
		<div class="FormTitle Green">New Application</div>		
		<form id="CreateApplicationForm">
		<br />
			<div class="Label">University/College Name</div><input type="text" name="institutionName" value=""><br/><br/>
			<div class="Label">Program Name</div><input type="text" name="programName" value=""><br/><br/>
			<div class="Label">Color</div><input type="text" name="colorCode" value=""><br/><br/>
			<div class="SubmitButton">Create</div>
		</form>	
	</div>
</div>

<body>
	<div id="NavBar">
		<div id="NavList"><a href="Dashboard.jsp"><span>Dashboard</span></a><span style="float: right">Logout</span></div>
	</div>
	<div id="Content">
		<div class="Widget">
			<a href="MyApplications.jsp"><div class="WidgetTitle ApplicationsTitle">My Applications</div></a>
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
		
		<div id="ActionBar"><div id="NewAppButton">new application</div><div id="ModifyAppButton">Modify application</div><div id="RemoveAppButton">Remove application</div></div>
		
		<div id="ApplicationsList">
			<div class="Application" style='border: 2px solid #00B91A;'>
				<div class='SelectionIndicator'></div>
				<div class='ApplicationHeader' style=' border-bottom: 1px solid black;'>
					<div class='ApplicationTitle'>University of British Columbia</div>
					<div class='ProgramName' style='color: #00B91A;'>Bachelor of Science</div>
					<div class="TaskPercent">20% Complete</div>
					<div class='TaskProgressBar'></div>
					<div class="TaskActionBar"><div class="NewTaskButton">new task</div><div class="ModifyTaskButton">modify task</div><div class="RemoveTaskButton">remove task</div><div class="ExpandTasksButton">expand tasks</div></div>
				</div>
				<div class='TaskListContainer'>
					<div class='TaskList' style='border-top: 1px solid rgb(70,70,70);'>
						<div class='EmptyTaskListMessage'>No tasks were found for this application.</div>					
					</div>					
				</div>
			</div>
			
			<div class="Application" style='border: 2px solid #138DFF;'>
				<div class='ApplicationHeader' style=' border-bottom: 1px solid black; '>
					<div class='SelectionIndicator'></div>
					<div class='ApplicationTitle'>University of Toronto</div>
					<div class='ProgramName' style='color: #138DFF;'>Bachelor of Science</div>
					<div class="TaskPercent">80% Complete</div>
					<div class='TaskProgressBar'></div>
					<div class="TaskActionBar"><div class="NewTaskButton">new task</div><div class="ModifyTaskButton">modify task</div><div class="RemoveTaskButton">remove task</div><div class="ExpandTasksButton">expand tasks</div></div>
				</div>
				<div class='TaskListContainer'>
					<div class='TaskList' style='border-top: 1px solid rgb(70,70,70);'>
						<div class='EmptyTaskListMessage'></div>
						
						<div class='Task' style='border: 1px solid #138DFF;'>
							<div class='TaskTitleContainer'>
								<div class='TaskTitle'>Submit High School Transcript</div>
								<div class='TaskStatus'>								
									<select>
										<option value="1">-- Status --</option>
										<option value="1">New</option>
										<option value="2">In Progress</option>
										<option value="3">Complete</option>
									</select>								
								</div>
							</div>
							<div class='DueDate'>Due by <span>Monday Nov 23, 2012</span></div>
							<div class='Notes'>I need to talk to my teachers and make sure I pass everything!</div>
						</div>
						
						<div class='Task' style='border: 1px solid #138DFF; '>
							<div class='TaskTitleContainer'>
								<div class='TaskTitle'>Send in letters of reference</div>
								<div class='TaskStatus'>								
									<select>
										<option value="1">-- Status --</option>
										<option value="1">New</option>
										<option value="2">In Progress</option>
										<option value="3">Complete</option>
									</select>								
								</div>
							</div>
							<div class='DueDate'>Due by <span>Monday Nov 29, 2012</span></div>
							<div class='Notes'>I need to talk to my teachers and make sure I pass everything!</div>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class="Application" style='border: 2px solid #FF07FC;'>
				<div class='ApplicationHeader' style='border-bottom: 1px solid black; '>
					<div class='SelectionIndicator'></div>
					<div class='ApplicationTitle'>University of Alberta</div>
					<div class='ProgramName' style='color: #FF07FC;'>Bachelor of Science</div>
					<div class="TaskPercent">80% Complete</div>
					<div class='TaskProgressBar'></div>
					<div class="TaskActionBar"><div class="NewTaskButton">new task</div><div class="ModifyTaskButton">modify task</div><div class="RemoveTaskButton">remove task</div><div class="ExpandTasksButton">expand tasks</div></div>
				</div>
				<div class='TaskListContainer'>
					<div class='TaskList' style='border-top: 1px solid rgb(70,70,70);'>
						<div class='EmptyTaskListMessage'></div>
						
						<div class='Task' style='border: 1px solid #FF07FC;'>
							<div class='TaskTitleContainer'>
								<div class='TaskTitle'>Submit High School Transcript</div>
								<div class='TaskStatus'>								
									<select>
										<option value="1">-- Status --</option>
										<option value="1">New</option>
										<option value="2">In Progress</option>
										<option value="3">Complete</option>
									</select>								
								</div>
							</div>
							<div class='DueDate'>Due by <span>Monday Nov 23, 2012</span></div>
							<div class='Notes'>I need to talk to my teachers and make sure I pass everything!</div>
						</div>
						
						<div class='Task' style='border: 1px solid #FF07FC; '>
							<div class='TaskTitleContainer'>
								<div class='TaskTitle'>Send in letters of reference</div>
								<div class='TaskStatus'>								
									<select>
										<option value="1">-- Status --</option>
										<option value="1">New</option>
										<option value="2">In Progress</option>
										<option value="3">Complete</option>
									</select>								
								</div>
							</div>
							<div class='DueDate'>Due by <span>Monday Nov 29, 2012</span></div>
							<div class='Notes'>I need to talk to my teachers and make sure I pass everything!</div>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
		
	</div>
<script>
$("#NewAppButton").click(function(){
	$("#LightBox").fadeIn();
});

$(".SubmitButton").click( function(){
	var form = $(this).parents('form');
	var id = $(form).attr("id");
	
	switch(id) {
		
		case "CreateApplicationForm": 
			CreateApplication(form);
		break;
	}

});

function CreateApplication(form) {
	var institutionName = $(form).find("input[name='institutionName']").val();
	var programName = $(form).find("input[name='programName']").val();
	var colorCode = $(form).find("input[name='colorCode']").val();
	
	var data = {institutionName: institutionName, programName: programName, colorCode: colorCode};
	console.log(data);
	
	$.ajax({
	  	url: '/applicationsservice/createApplication',
	  	type: 'POST',
	  	data: data,
	  	dataType: "json",
	 	success: function(data) {
			console.log(data);
			
		}
	});
	
}		


$(function() {
        var taskBar = $(".TaskProgressBar").progressbar({
            value: 88
        });
});

$(".ExitButton").click(function(){
	$("#LightBox").fadeOut(400);
});

$(".ExpandTasksButton").toggle(function(){
	$(this).parents(".Application").find(".TaskList").slideDown();
	
	var application = $(this).parents(".Application");
	ApplicationSelected(application);
	
	
	$(this).text("collapse tasks");
}, function() {
	$(this).parents(".Application").find(".TaskList").slideUp();
	$(this).text("expand tasks");
});

$(".Application").click(function(){
	ApplicationSelected(this);
});

function ApplicationSelected(application) {
	$(application).css("color", "orange");
	
	$(application).find(".SelectionIndicator").show();
	$(application).find(".SelectionIndicator").animate({
			left: -68
		});
	
	$(application).siblings().each(function(){
		$(this).css("color", "white");
		$(this).find(".SelectionIndicator").fadeOut();
		$(this).find(".SelectionIndicator").animate({
			left: -90
		});
	});
}

</script>
</body

</html>