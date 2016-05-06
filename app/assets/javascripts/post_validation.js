$(document).ready(function(){
	$("#title").blur(function(){
		if($("#title").val() == "")
			document.getElementById("titleid").innerHTML="You must enter a title"
		else if($("#title").val().match(/[0-9]/))
			document.getElementById("titleid").innerHTML="Enter letters only"
		else
			document.getElementById("titleid").innerHTML=""

		});
	
	});
