<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드바 c:import</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

a { text-decoration: none; color: inherit;}
img { border: 0px; }
ul { list-style: none;}
.font-red { color: red;}
/* ----------------------------------------------------초기화 */

.side_bar{
	width: 200px;
	height: 940px;
	background-color: #6C7A89;
	display: inline-block;
	box-shadow: 5px 5px 5px grey;
}
.blank {
	height : 60px;
}
.member_manage{
	height : 60px;
	font-size: 15pt;
	text-align: center;
	line-height: 60px;
	cursor: pointer;
}

.manage{
	height : 60px;
	font-size: 15pt;
	text-align: center;
	line-height: 60px;
	cursor: pointer;
}

.manage_selected ,.manage_selected:hover, .manage_selected:active {
	height : 60px;
	background-color: #0C4A60;
	font-style: bold;
	font-size: 17pt;
	text-align: center;
	line-height: 60px;
	box-shadow: 5px 5px 5px grey;
	border-radius: 5px;
	color: white;
	font-style: 고딕;
	cursor: pointer;
	z-index: 1;/* 이게 왜 안될까요 무슨일이까요 */
	position: relative;
}

</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//사이드바 메뉴
/* 	$("#member").on("click", function(){
		location.href = "#";
	}); */
	
	$("#gallary").on("click", function(){
		location.href = "gallaryManage";
	});
	
	$("#report").on("click", function(){
		location.href = "reportManage";
	});
	
	//사이드바 클릭했을 때
	$(".side_bar").on("click", "div", function(){
		
		$(".side_bar div div").attr("class", "manage");
		$(this).attr("class", "manage_selected");
		
	});
	

	
});//document end
</script>
</head>
<body>
	<div class="side_bar">
		<div class="blank"></div>
		<div id="member" class="manage">회원관리</div>
		<div id="gallary" class="manage">작품관리</div>
		<div id="report" class="manage">신고관리</div>
	 </div>
</body>
</html>