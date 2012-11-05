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
<link type="text/css" rel="stylesheet" href="css/miniColors.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
<script src="js/handlebars.js"></script>

<script src="js/FormMethods.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />

<script id="application-template" type="text/x-handlebars-template">
<div class="Application" data-key="{{key}}" style='border: 2px solid {{colorCode}}; display: none;' data-institutionTitle='{{institutionName}}' data-programName='{{programName}}' data-colorCode='{{colorCode}}'>
	<div class='SelectionIndicator'></div>
	<div class='ApplicationHeader' style='border-bottom: 1px solid black;'>
		<div class='ApplicationTitle'>{{institutionName}}</div>
		<div class='ProgramName' style='color: {{colorCode}};'>{{programName}}</div>
		<div class="TaskPercent">0% Complete</div>
		<div class='TaskProgressBar'></div>
		<div class="TaskActionBar"><div class="NewTaskButton">new task</div><div class="ModifyTaskButton">modify task</div><div class="RemoveTaskButton">remove task</div><div class="ExpandTasksButton">expand tasks</div></div>
	</div>
	<div class='TaskListContainer'>
		<div class='TaskList' style='border-top: 1px solid rgb(70,70,70);'>
			<div class='EmptyTaskListMessage'>No tasks were found for this application.</div>					
		</div>					
	</div>
</div>
</script>

<script id="task-template" type="text/x-handlebars-template">
<div class='Task'  data-key='{{key}}' data-applicationKey='{{applicationKey}}' data-taskDate='{{taskDate}}' data-taskTitle='{{taskTitle}}' data-taskStatus='{{taskStatus}}'>
	<div class='TaskTitleContainer'>
		<div class='TaskTitle'>{{taskTitle}}</div>
		<div class='TaskStatus'>								
			<select name='taskStatus'>
				<option value="0">-- Status --</option>
				<option value="1">New</option>
				<option value="2">In Progress</option>
				<option value="3">Complete</option>
			</select>								
		</div>
	</div>
	<div class='DueDate'>Due by <span>{{taskDate}}</span></div>
	<div class='Notes'>{{taskNotes}}</div>
</div>
</script>

<head>
    <title>Achieve Timeline</title>    
</head>

<div id="LightBox">
	<div class="FormContainer">
		<div class="ExitButton"></div>
		<form id="CreateApplicationForm">
		<div class="FormTitle Green">New Application</div>
		<br />
			<div class="Label">University/College Name</div><input type="text" name="institutionName" value="" /><br/><br/>
			<div class="Label">Program Name</div><input type="text" name="programName" value="" /><br/><br/>
			<div class="Label">Color</div><input type="text" name="colorCode" value="" /><br/><br/>
			<div class="SubmitButton">Create</div>
		</form>	
		
		<form id="ModifyApplicationForm">
		<div class="FormTitle Green">Update Application</div>
		<br />
			<div class="Label">University/College Name</div><input type="text" name="institutionName" value="" /><br/><br/>
			<div class="Label">Program Name</div><input type="text" name="programName" value="" /><br/><br/>
			<div class="Label">Color</div><input type="text" name="colorCode" value="" /><br/><br/>
			<input type="text" name="key" value="" />
			<div class="SubmitButton">Update</div>
		</form>	
		
		<form id="DeleteApplicationForm">
		<div class="FormTitle Green">Delete This Application?</div>
		<br />
			<div class="Label">University/College Name</div><input type="text" name="institutionName" value="" readonly="readonly" /><br/><br/>	
			<div class="Label">Program Name</div><input type="text" name="programName" value="" readonly="readonly" /><br/><br/>			
			<input type="text" name="key" value="" />
			<div class="SubmitButton">Confirm Delete</div>
		</form>	
		
		<form id="CreateTaskForm">
		<div class="FormTitle Green">New Task</div>		
		<br />
			<div class="Label">Title</div><input type="text" name="taskTitle" value="" /><br/><br/>
			<div class="Label">Due Date</div><input type="text" name="taskDate" value="" /><br/><br/>
			<div class="Label">Notes</div><br/>
			<textarea type="text" name="taskNotes" ></textarea>
			<input type="text" name="applicationKey" value="" />
			<input type="text" name="taskStatus" value="0" />
			<div class="SubmitButton">Create</div>
		</form>	
		
		<form id="ModifyTaskForm">
		<div class="FormTitle Green">Update Task</div>		
		<br />
			<div class="Label">Title</div><input type="text" name="taskTitle" value="" /><br/><br/>
			<div class="Label">Due Date</div><input type="text" name="taskDate" value="" /><br/><br/>
			<select name="taskStatus">
				<option value="0">-- Status --</option>
				<option value="1">New</option>
				<option value="2">In Progress</option>
				<option value="3">Complete</option>
			</select>
			<div class="Label">Notes</div><br/>
			<textarea type="text" name="taskNotes" ></textarea>
			<input type="text" name="applicationKey" value="" />
			<input type="text" name="key" value="" />
			<div class="SubmitButton">Update</div>
		</form>	
		
		<form id="DeleteTaskForm">
		<div class="FormTitle Green">Delete Task</div>		
		<br />
			<div class="Label">Title</div><input type="text" name="taskTitle" value="" /><br/><br/>			
			<input type="text" name="applicationKey" value="" />
			<input type="text" name="key" value="" />
			<div class="SubmitButton">Confirm Delete</div>
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
					<div class="Stat">Applications in progress<span class="Orange ApplicationsInProgress">*</span></div>
					<div class="Stat">Applications Complete<span class="Green">*</span></div>
				</div>
				
				<div class="Column2">
					<div class="Stat">Tasks in progress<span class="Orange">*</span></div>
					<div class="Stat">Tasks Complete<span class="Green">*</span></div>
				</div>
			</div>
		</div>
		
		<div id="ActionBar"><div id="NewAppButton">new application</div><div id="ModifyAppButton">Modify application</div><div id="RemoveAppButton">Remove application</div></div>
		
		<div id="ApplicationsList">		
		</div>
		
	</div>
<script>

GetAllApplications();


function init() {
	AttachEvents();
	UpdateApplicationCompletion();
}

function UpdateApplicationCompletion() {
	console.log('here');
	$(".Application").each(function(){
		console.log('2');
		var totalTasks = 0;
		var tasksComplete = 0;
		
		$(this).find("select[name='taskStatus']").each(function(){
			totalTasks = totalTasks + 1; 
			console.log('inner');
		
		});
			
			
		
		console.log(totalTasks);
	
	});
}



	


function GetAllApplications() {
	$.ajax({
	  	url: '/applicationsservice/getApplications',
	  	type: 'GET',
	 	success: function(applications) {
			
			var index = 0;
			
			$(".ApplicationsInProgress").html(applications.length);
			
			while( index < applications.length) {
				var data = applications[index];
				console.log(data);
				var source   = $("#application-template").html();
				var template = Handlebars.compile(source);
				var context = {key: data.propertyMap.key, institutionName: data.propertyMap.institutionName, programName: data.propertyMap.programName, colorCode: data.propertyMap.colorCode};
				var html    = template(context);
				
				$(html).prependTo("#ApplicationsList");
				
				var application = $("#ApplicationsList").find(".Application[data-key='"+ data.propertyMap.key+"']");
				
				$(application).fadeIn();
				$(application).find(".TaskProgressBar").first().progressbar({
					value: 0
				});
				
				var taskList = $(application).find(".TaskList");
				
				var taskIndex = 0;
				while(taskIndex < data.propertyMap.tasks.length) {
					$(taskList).find(".EmptyTaskListMessage").html("");
				
					var task = $.parseJSON(data.propertyMap.tasks[taskIndex]);
					
					var taskSource   = $("#task-template").html();
					var template = Handlebars.compile(taskSource);
					
					var taskContext = {applicationKey: data.propertyMap.key, key: task.propertyMap.key, taskDate: task.propertyMap.taskDate, taskNotes: task.propertyMap.taskNotes, taskTitle: task.propertyMap.taskTitle};
					var taskHtml    = template(taskContext);
					
					$(taskHtml).prependTo(taskList);
					
					var newTask = $(taskList).find(".Task");
					
					$(newTask).slideDown();				
					
					taskIndex++;
				}
			
				index++;
			}
			init();
		}
	});
}

function AttachEvents() {
	
	$("select[name='taskStatus']").unbind('change');
	$("select[name='taskStatus']").change(function(){
		UpdateApplicationCompletion();
	});

	
	$(".ExpandTasksButton").unbind('click');	
	$(".ExpandTasksButton").toggle(function(){
		$(this).parents(".Application").find(".TaskList").slideDown();
		
		var application = $(this).parents(".Application");
		ApplicationSelected(application);
		
		
		$(this).text("collapse tasks");
	}, function() {
		$(this).parents(".Application").find(".TaskList").slideUp();
		$(this).text("expand tasks");
	});

	$(".Application").unbind('click');	
	$(".Application").click(function(){
		ApplicationSelected(this);
	});
	
	$(".NewTaskButton").unbind("click");
	$(".NewTaskButton").click(function(){
		$("#LightBox").fadeIn();
		$("#CreateTaskForm").show();		
		
		$("#CreateTaskForm").siblings("form").each(function(){
			$(this).hide();
		});		
		
		$("#CreateTaskForm").find("input[name='taskTitle']").val("");
		$("#CreateTaskForm").find("input[name='taskDate']").val("");
		$("#CreateTaskForm").find("textarea").val("");
		
	});
	
	$(".ModifyTaskButton").unbind("click");
	$(".ModifyTaskButton").click(function(){
		$("#LightBox").fadeIn();
		$("#ModifyTaskForm").show();		
		
		$("#ModifyTaskForm").siblings("form").each(function(){
			$(this).hide();
		});				
	});
	
	$(".RemoveTaskButton").unbind("click");
	$(".RemoveTaskButton").click(function(){
		$("#LightBox").fadeIn();
		$("#DeleteTaskForm").show();		
		
		$("#DeleteTaskForm").siblings("form").each(function(){
			$(this).hide();
		});				
	});
	
	$(".Task").unbind("click");
	$(".Task").click(function(){
	
		var isSelected = $(this).hasClass("Selected");
	
		if(!isSelected) {
			$(".Task").each(function(){
				$(this).removeClass("Selected");
			});
			$(this).addClass("Selected");
			
		} 
		
		var applicationKey = $(this).attr("data-applicationKey");
		var key = $(this).attr("data-key");
		var taskTitle = $(this).attr("data-taskTitle");
		var taskDate = $(this).attr("data-taskDate");
		var taskNotes = $(this).find(".Notes").html();
		
		$("#ModifyTaskForm").find("input[name='applicationKey']").val(applicationKey);
		$("#ModifyTaskForm").find("input[name='key']").val(key);
		$("#ModifyTaskForm").find("input[name='taskTitle']").val(taskTitle);
		$("#ModifyTaskForm").find("input[name='taskDate']").val(taskDate);
		$("#ModifyTaskForm").find("textarea").val(taskNotes);
		
		$("#DeleteTaskForm").find("input[name='applicationKey']").val(applicationKey);
		$("#DeleteTaskForm").find("input[name='key']").val(key);
		$("#DeleteTaskForm").find("input[name='taskTitle']").val(taskTitle);
		
		
	});
}



$("#NewAppButton").click(function(){
	$("#LightBox").fadeIn();
	$("#CreateApplicationForm").show();
	
	$("#CreateApplicationForm").find("input").each(function(){
		$(this).val("");
	});
	
	
	$("#CreateApplicationForm").siblings("form").each(function(){
		$(this).hide();
	});
});


$("#ModifyAppButton").click(function(){

	var key = $("#ModifyApplicationForm").find("input[name='key']").val();
	
	if(key != null & key != "") {

		$("#LightBox").fadeIn();
		$("#ModifyApplicationForm").show();	
		
		$("#ModifyApplicationForm").siblings("form").each(function(){
			$(this).hide();
		});
	}
});

$("#RemoveAppButton").click(function(){
	var key = $("#DeleteApplicationForm").find("input[name='key']").val();
	
	if(key != null & key != "") {

		$("#LightBox").fadeIn();
		$("#DeleteApplicationForm").show();	
		
		$("#DeleteApplicationForm").siblings("form").each(function(){
			$(this).hide();
		});
	}

});

$(".SubmitButton").click( function(){
	var form = $(this).parents('form');
	var id = $(form).attr("id");
	
	switch(id) {
		
		case "CreateApplicationForm": 
			CreateApplication(form);
		break;
		case "ModifyApplicationForm":
			ModifyApplication(form);
		break;
		case "DeleteApplicationForm":
			DeleteApplication(form);
		break;		
		case "CreateTaskForm":
			CreateTask(form);
		break;
		case "ModifyTaskForm":
			ModifyTask(form);
		break;
		case "DeleteTaskForm":
			DeleteTask(form);
		break;
	}

});



$(function() {
        var taskBar = $(".TaskProgressBar").progressbar({
            value: 88
        });
		
		$("input[name='colorCode']").miniColors();
		
	
	$("input[name='taskDate']").datepicker();
});

$(".ExitButton").click(function(){
	$("#LightBox").fadeOut(400);
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
	
	var institutionTitle = $(application).attr("data-institutionTitle");
	var programName = $(application).attr("data-programName");
	var colorCode = $(application).attr("data-colorCode");
	var key = $(application).attr("data-key");
	
	$("#ModifyApplicationForm").find("input[name='institutionName']").val(institutionTitle);
	$("#ModifyApplicationForm").find("input[name='programName']").val(programName);
	$("#ModifyApplicationForm").find("input[name='colorCode']").val(colorCode);
	$("#ModifyApplicationForm").find("input[name='key']").val(key);
	
	$("#DeleteApplicationForm").find("input[name='institutionName']").val(institutionTitle);
	$("#DeleteApplicationForm").find("input[name='programName']").val(programName);
	$("#DeleteApplicationForm").find("input[name='key']").val(key);
	
	$("#CreateTaskForm").find("input[name='applicationKey']").val(key);
	
	
}

</script>
</body

</html>