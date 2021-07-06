<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디</title>
<style type="text/css">
body {
	margin: 0;
}
.wrap {
	width:100%;
	height: 500px;
}

.top2 {
	background-color: #ffad33;
	height: 80px;
	padding-top: 50px;
}


.idfind, .pwfind {
	font-size: 12pt;
    padding:5px;
    text-align:center;
    width:200px;
    margin-top:5px;
    line-height:65px;
    font-weight:700;
    border-radius:3px 3px 0 0;
    background: white;
    color: black;
    border-width:1px 1px 0;
    cursor: pointer;
    border: none;
}

.idfind{
	margin-left: calc(50% - 450px);
}

.idfind:hover, .pwfind:hover {
	background-color: #ff9900;
}



.h2 {
	width:340px;
    height:50px;
    border: 0;
    outline: none;
    font-size: 14pt;
    border-bottom: 2px solid #e5e5e5;
    margin-bottom: 20px;
}

.middle {
	width: 900px;
	margin: 0 auto;
	height: 100%;
}

.text {
 /* margin-left: 510px; */
 border-bottom: 2px solid #e5e5e5;
 width: 100%;
}

/* .text2 {
 margin-left: 510px;
} */

.box {
	margin-top: 30px;
	border :1px solid #ccc;
	width : 100%;
	height: 200px;
 	text-align: center;
 	line-height: 200px;
}

.check {
	text-align: center;
	margin-top: 15px;
}

.login { 
	width : 130px;
	height: 40px;
	background-color: #ffad33;
	border : none;
	border-radius: 5px;
	cursor: pointer;
}

.passwordfind {
	width : 130px;
	height: 40px;
	border : none;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 30px;
}


</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".login").on("click", function(){
	    
		$("#login").submit();    
	});
	
	$(".passwordfind, .pwfind").on("click", function(){
		    
			location.href = "passwordfind";   
	});

	
	$(".idfind").on("click", function(){
	    
		location.href = "idfind";   
	});
});
</script>
</head>
<body>
<form id="login" action="login" method="post">
	<input type="hidden" name="id" value="${param.userId2}">
</form>
	<div class="wrap">
			<div class="top2">
				<input type="button" class="idfind" value="아이디 찾기">
				<input type="button" class="pwfind" value="비밀번호 찾기">	
			</div>
			<div class="middle">
			<div class="text"><h2>아이디찾기</h2></div>
			<br>	
			<div class="text2">고객님의 정보와 일치하는 아이디 목록입니다.</div>
			<div class="box">
				<input type="radio">${param.userId2}
			</div>
			<div class="check" >
				<input type="button" class="login" value="로그인하기">
				<input type="button" class="passwordfind" value="비밀번호 찾기">
			</div>
		</div>
	</div>

</body>
</html>