$(document).ready(function () {
	$("#insideMiddle2").on("click", function () {
		if($("#insideMiddle2").attr("class") != "insideMiddle1"){
			$("#insideMiddle2").attr("class","insideMiddle1")
			$("#insideMiddle1").attr("class","insideMiddle2")
		}else{
			$("#insideMiddle2").attr("class","insideMiddle1")
			$("#insideMiddle1").attr("class","insideMiddle2")
		}
	});
	$("#insideMiddle1").on("click", function () {
		if($("#insideMiddle1").attr("class") != "insideMiddle1"){
			$("#insideMiddle1").attr("class","insideMiddle1")
			$("#insideMiddle2").attr("class","insideMiddle2")
		}else{
			$("#insideMiddle1").attr("class","insideMiddle1")
			$("#insideMiddle2").attr("class","insideMiddle2")
		}
	});
	
	
});//document ready end
