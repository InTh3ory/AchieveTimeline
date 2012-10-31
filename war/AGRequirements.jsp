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
<link rel="stylesheet" type="text/css" href="css/AGRequirements.css" />
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
			<a href="AGRequirements.jsp"><div class="WidgetTitle AGTitle">My "A-G"<br /> Requirements</div></a>
			<div class="WidgetContent">
				<div id="ProgressBarTitle">Percentage Of Requirements Complete: 88%</div>
				<div id="ProgressBar"></div>
			</div>
		</div>
		
		<div class="LightWidget">
			<div class="Title">(a) History / Social Science</div>
			<div class="UnitCompletion">
				<div class="CompletedButton" data-spanId="1"></div><span data-spanId="1">Unit One - Incomplete</span><br /><div class="CompletedButton" data-spanId="2"></div><span data-spanId="2">Unit Two - Incomplete</span>
			</div>
			<div class="ShortDescription"><div style="color: orange; font-weight: bold;">Description</div>Two years, including one year of world history, cultures, and historical geography and one year of us history or one-half year of us history and one-half year of civics or American government.</div>
			<a href="http://www.ucop.edu/a-gGuide/ag/a-g/history_reqs.html"><div class="ExpandButton">Source</div></a>
		</div>
		
		<div class="LightWidget">
			<div class="Title">(b) English</div>
			<div class="UnitCompletion">
				<div class="CompletedButton" data-spanId="1"></div><span data-spanId="1">Unit One - Incomplete</span><br /><div class="CompletedButton" data-spanId="2"></div><span data-spanId="2">Unit Two - Incomplete</span><br /><div class="CompletedButton" data-spanId="3"></div><span data-spanId="3">Unit Three - Incomplete</span><br /><div class="CompletedButton" data-spanId="4"></div><span data-spanId="4">Unit Four - Incomplete</span>
			</div>
			<div class="ShortDescription"><div style="color: orange; font-weight: bold;">Description</div>Four years of college preparatory English that include frequent and regular writing, and reading of classic and modern literature.</div>
			<a href="http://www.ucop.edu/a-gGuide/ag/a-g/english_reqs.html"><div class="ExpandButton">Source</div></a>
		</div>
		
		<div class="LightWidget">
			<div class="Title">(c) Mathematics</div>
			<div class="UnitCompletion">
				<div class="CompletedButton" data-spanId="1"></div><span data-spanId="1">Unit One - Incomplete</span><br /><div class="CompletedButton" data-spanId="2"></div><span data-spanId="2">Unit Two - Incomplete</span><br /><div class="CompletedButton" data-spanId="3"></div><span data-spanId="3">Unit Three - Incomplete</span>
			</div>
			<div class="ShortDescription"><div style="color: orange; font-weight: bold;">Description</div>Three years of college preparatory mathematics that include the topics covered in elementary and advanced algebra and two- and three-dimensional geometry.</div>
			<a href="http://www.ucop.edu/a-gGuide/ag/a-g/math_reqs.html"><div class="ExpandButton">Source</div></a>
		</div>
		
		<div class="LightWidget">
			<div class="Title">(d) Laboratory Science</div>
			<div class="UnitCompletion">
				<div class="CompletedButton" data-spanId="1"></div><span data-spanId="1">Unit One - Incomplete</span><br /><div class="CompletedButton" data-spanId="2"></div><span data-spanId="2">Unit Two - Incomplete</span>
			</div>
			<div class="ShortDescription"><div style="color: orange; font-weight: bold;">Description</div>Two years of laboratory science providing fundamental knowledge in at least two of these three disciplines: biology, chemistry, and physics.</div>
			<a href="http://www.ucop.edu/a-gGuide/ag/a-g/science_reqs.html"><div class="ExpandButton">Source</div></a>
		</div>
		
		<div class="LightWidget">
			<div class="Title">(e) Language Other Than English</div>
			<div class="UnitCompletion">
				<div class="CompletedButton" data-spanId="1"></div><span data-spanId="1">Unit One - Incomplete</span><br /><div class="CompletedButton" data-spanId="2"></div><span data-spanId="2">Unit Two - Incomplete</span>
			</div>
			<div class="ShortDescription"><div style="color: orange; font-weight: bold;">Description</div>Two years of the same language other than English.</div>
			<a href="http://www.ucop.edu/a-gGuide/ag/a-g/language_reqs.html"><div class="ExpandButton">Source</div></a>
		</div>
		
		<div class="LightWidget">
			<div class="Title">(f) Visual & Performing Arts</div>
			<div class="UnitCompletion">
				<div class="CompletedButton" data-spanId="1"></div><span data-spanId="1">Unit One - Incomplete</span>
			</div>
			<div class="ShortDescription"><div style="color: orange; font-weight: bold;">Description</div>One year, including dance, drama/theater, music, or visual art.</div>
			<a href="http://www.ucop.edu/a-gGuide/ag/a-g/vpa.html"><div class="ExpandButton">Source</div></a>
		</div>
		
		<div class="LightWidget">
			<div class="Title">(g) College Preparatory Elective</div>
			<div class="UnitCompletion">
				<div class="CompletedButton" data-spanId="1"></div><span data-spanId="1">Unit One - Incomplete</span>
			</div>
			<div class="ShortDescription"><div style="color: orange; font-weight: bold;">Description</div>One year (two semesters), chosen from additional "a-f" courses beyond those used to satisfy the requirements above, or courses that have been approved solely for use as "g" electives.</div>
			<a href="http://www.ucop.edu/a-gGuide/ag/a-g/elective.html"><div class="ExpandButton">Source</div></a>
		</div>
		
	
	</div>
<script>

$(".CompletedButton").click(function(){

	var isCompleted = $(this).hasClass("Completed");
	var spanId = $(this).attr("data-spanId");
	
	if(isCompleted) {
		$(this).removeClass("Completed");
		var text = $(this).parents(".UnitCompletion").find("span[data-spanId='"+spanId+"']").text();
		text = text.replace("Complete", "Incomplete");
		$(this).parents(".UnitCompletion").find("span[data-spanId='"+spanId+"']").text(text);
	} else {
		$(this).addClass("Completed");
		var text = $(this).parents(".UnitCompletion").find("span[data-spanId='"+spanId+"']").text();
		text = text.replace("Incomplete", "Complete");
		$(this).parents(".UnitCompletion").find("span[data-spanId='"+spanId+"']").text(text);
	}
	
	UpdateRequirements();

	
});

$(function() {
        $("#ProgressBar").progressbar({
            value: 88
        });
		
		GetRequirementsValues();
});

//Terrible implementation...must refactor
function GetRequirementsValues() {
	$(function() {
	$.ajax({
	  	url: 'agrequirements/get',
	  	type: 'GET',
	  	dataType: "json",	 	
		success: function(data) {
		
			var objectKeys = keys(data.propertyMap);
			objectKeys.sort();			
			
			$(".CompletedButton").each(function(index, element){
				if(data.propertyMap[objectKeys[index]] == "true") {					
					var spanId = $(this).attr("data-spanId");
					$(this).addClass("Completed");					
					var text = $(this).parents(".UnitCompletion").find("span[data-spanId='"+spanId+"']").text();
					text = text.replace("Incomplete", "Complete");
					$(this).parents(".UnitCompletion").find("span[data-spanId='"+spanId+"']").text(text);					
				}
			});			
		}
	});
});
	
}

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


function UpdateRequirements() {
	var ag = [];
	
	$(".CompletedButton").each(function(){
		var completed = $(this).hasClass("Completed");
		
		if(completed) {
			ag.push(true);
		} else {
			ag.push(false);
		}
	});
	
	
	var data = {a: ag[0],
	b: ag[1],
	c: ag[2],
	d: ag[3],
	e: ag[4],
	f: ag[5],
	g: ag[6],
	h: ag[7],
	i: ag[8],
	j: ag[9],
	k: ag[10],
	l: ag[11],
	m: ag[12],
	n: ag[13],
	o: ag[14]
	};
	
	console.log("Updating Requirements");
	
$(function() {
	$.ajax({
	  	url: 'agrequirements/update',
	  	type: 'POST',
	  	dataType: "json",
		data: data,
		async: false,
	 	success: function(newData) {
			
			console.log(newData);
		}
	});
});
	


}
</script>
</body

</html>