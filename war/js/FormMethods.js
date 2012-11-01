
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