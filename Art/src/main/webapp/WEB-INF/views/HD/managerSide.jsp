<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자사이드</title>
<style type="text/css">
.side{
	width: 200px;
	height: 940px;
	background-color: #6C7A89;
	display: inline-block;
	box-shadow: 5px 5px 5px grey;
}
.blank{
	height : 60px;
	background-color: RGBA;
}
.member{
	height : 60px;
	background-color: RGBA;
	font-size: 15pt;
	text-align: center;
	line-height: 60px;
	cursor: pointer;
}

.member:hover{
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
	position: relative;
}

#active{
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
}
.tag{
	height : 60px;
	background-color: RGBA;
	font-size: 15pt;
	text-align: center;
	line-height: 60px;
	cursor: pointer;
}
.tag:hover{
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
	position: relative;
}
.gallary{
	height : 60px;
	background-color: RGBA;
	font-size: 15pt;
	text-align: center;
	line-height: 60px;
	cursor: pointer;
}

.gallary:hover{
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
	position: relative;
}

.report{
	height : 60px;
	background-color: RGBA;
	font-size: 15pt;
	text-align: center;
	line-height: 60px;
	cursor: pointer;
}

.report:hover{
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
	position: relative;
}
.gong{
	height : 60px;
	background-color: RGBA;
	font-size: 15pt;
	text-align: center;
	line-height: 60px;
	cursor: pointer;
}
.gong:hover{
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
	position: relative;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".member").on("click", function(){
		location.href = "user_board";
	});
	
	$(".tag").on("click", function(){
		location.href = "tag_board";
	});
	
	$(".gallary").on("click", function(){
		location.href = "gallaryManage";
	});
	
	$(".report").on("click", function(){
		location.href = "reportManage";
	});
	
	$(".gong").on("click", function(){
		location.href = "gong_board";
	});

});//document end
</script>
</head>
<body>
	 <div class="side">
		<div class="blank" id=""></div>
		<div class="member" id="">회원관리</div>
		<div class="tag" id="">태그관리</div>
		<div class="gallary" id="">작품관리</div>
		<div class="report" id="">신고관리</div>
		<div class="gong" id="">공지사항</div>
	 </div>
</body>
</html>