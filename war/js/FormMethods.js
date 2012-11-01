

function CreateTask(form) {
	
	var taskTitle = $(form).find("input[name='taskTitle']").val();
	var taskDate = $(form).find("input[name='taskDate']").val();
	var taskNotes = $(form).find("textarea[name='taskNotes']").val();
	var taskStatus = $(form).find("textarea[name='taskStatus']").val();
	var applicationKey = $(form).find("input[name='applicationKey']").val();
	
	var data = {taskTitle: taskTitle, taskDate: taskDate, taskNotes: taskNotes, applicationKey: applicationKey, taskStatus: taskStatus};
	
	$.ajax({
	  	url: '/taskservice/createTask',
	  	type: 'POST',
	  	data: data,
	  	dataType: "json",
	 	success: function(data) {
			$("#LightBox").fadeOut();
			console.log(data);
			
			var application = $(".Application[data-key='"+ data.propertyMap.applicationKey +"']");
			var taskList = $(application).find(".TaskList");
			
			$(taskList).find(".EmptyTaskListMessage").html("");
			$(taskList).slideDown();
			
			var source   = $("#task-template").html();
			var template = Handlebars.compile(source);
			var context = {applicationKey: data.propertyMap.applicationKey, key: data.propertyMap.key, taskDate: data.propertyMap.taskDate, taskNotes: data.propertyMap.taskNotes, taskTitle: data.propertyMap.taskTitle, taskStatus: data.propertyMap.taskStatus};
			var html    = template(context);
			
			$(html).prependTo(taskList);
			
			var newTask = $(taskList).find(".Task");
			
			$(newTask).slideDown();
						
			AttachEvents();
			
		}
	});
	
}


function DeleteApplication(form) {

	var institutionName = $(form).find("input[name='institutionName']").val();
	var programName = $(form).find("input[name='programName']").val();	
	var key = $(form).find("input[name='key']").val();
	
	//var data = {key: key, institutionName: institutionName, programName: programName};
	var data = "?key=" + key + "&institutionName=" + institutionName + "&programName=" + programName;
	//TODO refactor to use put
	$.ajax({
	  	url: '/applicationsservice/deleteApplication' + data,
	  	type: 'DELETE',
	  	dataType: "json",
	 	success: function(data) {
			console.log(data);
			$("#ApplicationsList").find(".Application[data-key='" + data.propertyMap.key + "']").remove();		
			$("#LightBox").fadeOut();			
		}
	});
}

function ModifyApplication(form) {
	var institutionName = $(form).find("input[name='institutionName']").val();
	var programName = $(form).find("input[name='programName']").val();
	var colorCode = $(form).find("input[name='colorCode']").val();
	var key = $(form).find("input[name='key']").val();
	
	var data = {key: key, institutionName: institutionName, programName: programName, colorCode: colorCode};
	console.log(key);
	//TODO refactor to use put
	$.ajax({
	  	url: '/applicationsservice/createApplication',
	  	type: 'POST',
	  	data: data,
	  	dataType: "json",
	 	success: function(data) {
			console.log(data);
			$("#ApplicationsList").find(".Application[data-key='" + data.propertyMap.key + "']").remove();
		
			$("#LightBox").fadeOut();			
			
			var source   = $("#application-template").html();
			var template = Handlebars.compile(source);
			var context = {key: data.propertyMap.key, institutionName: data.propertyMap.institutionName, programName: data.propertyMap.programName, colorCode: data.propertyMap.colorCode};
			var html    = template(context);
			
			$(html).prependTo("#ApplicationsList");
			
			var newApplication = $("#ApplicationsList").find(".Application");
			
			$(newApplication).slideDown();
			$(newApplication).find(".TaskProgressBar").first().progressbar({
				value: 0
			});
			
			AttachEvents();
		}
	});
}

function CreateApplication(form) {
	var institutionName = $(form).find("input[name='institutionName']").val();
	var programName = $(form).find("input[name='programName']").val();
	var colorCode = $(form).find("input[name='colorCode']").val();
	
	var data = {institutionName: institutionName, programName: programName, colorCode: colorCode};
	
	
	$.ajax({
	  	url: '/applicationsservice/createApplication',
	  	type: 'POST',
	  	data: data,
	  	dataType: "json",
	 	success: function(data) {
			console.log(data);
			$("#LightBox").fadeOut();			
			
			var source   = $("#application-template").html();
			var template = Handlebars.compile(source);
			var context = {key: data.propertyMap.key, institutionName: data.propertyMap.institutionName, programName: data.propertyMap.programName, colorCode: data.propertyMap.colorCode};
			var html    = template(context);
			
			$(html).prependTo("#ApplicationsList");
			
			var newApplication = $("#ApplicationsList").find(".Application");
			
			$(newApplication).slideDown();
			$(newApplication).find(".TaskProgressBar").first().progressbar({
				value: 0
			});
			
			AttachEvents();
		}
	});
	
}		