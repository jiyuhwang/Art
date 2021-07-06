<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.wrap {
	width:100%;
	height: 700px;
}

.top {
	background-color: black;
	height: 50px;
}

.top2 {
	background-color: #ffad33;
	height: 80px;
}


.idfind {
	border: none;
	background-color: #ffaa33;
	font-size: 25px;
	margin-left: 500px;
	margin-top: 20px;
	cursor:pointer;
}

.pwfind {
	border: none;
	background-color: #ffaa33;
	font-size: 25px;
	margin-left: 120px;
	cursor:pointer;
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
}

.passwordfind {
	width : 130px;
	height: 40px;
	border : none;
	border-radius: 5px;
}


</style>
</head>
<body>
	<div class="wrap">
	<div class="top"></div>
	<div class="top2">
	<input type="button" class="idfind" value="아이디 찾기">
	<input type="button" class="pwfind" value="비밀번호 찾기">	
	</div>
	<div class="middle">
	<div class="text"><h2>아이디찾기</h2></div>
	<br>	
	<div class="text2">고객님의 정보와 일치하는 아이디 목록입니다.</div>
	<div class="box">
		<input type="radio" value="">hwangJIU
	</div>
	 <div class="check" >
		<input type="button" class="login" value="로그인하기">
		<input type="button" class="passwordfind" value="비밀번호 찾기">
	 </div>
	</div>
	</div>
<form>
</form>
</body>
</html>