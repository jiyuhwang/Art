<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.badge {
	display: inline-block;
	min-width: 10px;
	padding: 4px 7px;
	font-size: 12px;
	font-weight: 550;
	line-height: 1;
	color: #2f2f2f;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	background-color: #ececec;
	border-radius: 5px;
	margin-right: 8px;
}
.tags_input{	
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	
}

.xClass{
	font-size: 10px;
	color: #777;
	margin-left: 4px;
	cursor: pointer;
	padding: 3px;
}

</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	    	 for(var i= 0; i <10; i++) {
	$('#tagId').keypress(function(event){
	     if (event.which == 13) {
	    	 var html = "";
	    	 var text = $('#tagId').val();
	    	 html += "<div class=\"badge\">" + text + "</div>" 

	     }
	    	 $(".tags_input").html(html);
	     //$('#tagId').val("");
	});
	    	 }
	
})
/* ------------ */
/* function draw(text) {
		var html = "";
		for(var i of text) {
			
			html += "<span class=\"badge\">" + i + "</span>" 

		}
		$(".tags_input").html(html);
	} */
</script>		
</head>
<body>
<input id="tagId" type="text" name="post_tag" class="form-control" />
<div id="tag" class="tags_input"></div>
</body>
</html>