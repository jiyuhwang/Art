<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<style type="text/css">
.Pbackground{
	width : 100%;
	height : 100%;
	background-color: black;
	opacity: 0.4;
	position: absolute;
	left : 0;
	top : 0;
	z-index:10;
}
.Pmain{
	width : 400px;
	height: 300px;
	background-color: #E0E7E9;
	position: absolute;
	left :50%;
	top: 50%;
	margin-left : -180px;
	margin-top : -190px;
	font-size: 15pt;
	border-radius: 7px;
	z-index:10;
}
.Pmain.topBlank{
	height: 30px;
	width: 100%;
	background-color: RGBA;
}
.Pmain .middleBlank{
	width : 100%;
	height: 250px;
	background-color: Rgba;
	margin : 0 auto;
	text-align: center;
}
.Pmain input{
	width : 250px;
	height : 30px;
	padding : 5px;
}
.Pmain .title{
	width : 100%;
	height: 50px;
	font-size: 15pt;
	text-align: center;
	margin-bottom: 10px;
}
.Pmain .bottomBlank{
	width : 100%;
	height: 30px;
	padding-bottom: 10px; 
}
.Pmain button{
	width:150px;
	height: 45px;
	border-radius: 9px;
	font-size: 15pt;
	font-weight: bold;
	cursor: pointer;
	border: none;
	margin: 0 5px;
}
.Pmain button:hover{
	background-color: #0C4A60;
	color: white;
}
.Pmain #id{
	margin-bottom : 10px;
}

</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready( function () {
	 $(".delete_btn").on("click", function () {
		
		var html =	"<c\:import url=\"login.jsp\"><\/c\:import>"
			
					/*  "<div class = \"Pbackground\"></div>" +
						"<div class = \"Pmain\">" +
							"<div class = \"topBlank\"></div>" +
							"<div class = \"middleBlank\">" +
							"<div class = \"title\">로그인이 필요합니다.</div>" +
							"<input type=\"text\" placeholder=\"아이디\" id=\"id\"><br>" +
							"<input type=\"password\" placeholder=\"비밀번호\">" +
							"<div class =\"bottomBlank\"></div>" +
							"<button id=\"cancel_btn\">cancel</button>" +
							"<button>ok</button>" +
						"</div>" +
					"</div>";     */                                                   
			
		$("body").prepend(html);
		
		
		$("#cancel_btn").on("click", function () {
			$(".Pbackground, .Pmain").remove();
		}); 
	});//deletbtn end
	
});
</head>
<body>
<div class = "Pbackground"></div>
<div class = "Pmain">
<div class = "topBlank"></div>
<div class = "middleBlank">
	<div class = "title">로그인이 필요합니다.</div>
	<input type="text" placeholder="아이디" id="id"><br>
	<input type="password" placeholder="비밀번호">
	<div class ="bottomBlank"></div>
	<button>cancel</button>
	<button>ok</button>
</div>
</div>
</body>
</html>