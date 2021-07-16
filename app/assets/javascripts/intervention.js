$( document ).ready(function() {
console.log( "ready!" );
$('#customer_selector').change(function() {
    alert( "Handler for .change() called." );
//detect current value
//call server with current value
//loop through results
//$('#building_selector').html('<option>test</option>')
});
}); 


$("#hour_task_id").prop("disabled", true); // second dropdown is disable while first dropdown is empty
$("#customer_selector").change(function(){
  	var project = $(this).val();
  	if(project == ''){
  		$("#customer_selector").prop("disabled", true);
  	}else{
  		$("#customer_selector").prop("disabled", false);
  	}
  	$.ajax({
	    url: "/tasks",
	    method: "GET",  
	    dataType: "json",
	    data: {project: project},
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response["tasks"];
	      	$("#customer_selector").empty();

	      	$("#customer_selector").append('<option>Select Task</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#customer_selector").append('<option value="' + tasks[i]["id"] + '">' +tasks[i]["name"] + '</option>');
	      	}
	    }
  	});
});
