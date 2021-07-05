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
	width: 460px;
	height: 450px;
	margin: 0 auto;
	padding: 30px;
	margin-top: 100px;
	border: solid 1px;
	text-align: center;
	border: 1px solid #e5e5e5;
}

#id1 {
	font-size: 10pt;
	margin-bottom: 3px;
	margin-right: 305px;
}
#id2 {
	font-size: 10pt;
	margin-bottom: 5px;
	margin-right: 275px;
}
#id3 {
	font-size: 10pt;
	margin-bottom: 5px;
	margin-right: 290px;
}

.a {
   text-align:center;
}

.c1 {
  width:340px;
    height:50px;
    border: 0;
    outline: none;
    font-size: 14pt;
    border-bottom: 2px solid #e5e5e5;
    margin-bottom: 20px;
}
.c2 {
  	width: 235px;
    height: 30px;
    border: 0;
    outline: none;
    font-size: 14pt;
    border-bottom: 2px solid #e5e5e5;
    margin-bottom: 20px;
}

.c3{
  width: 100px;
  height: 40px;
  display: inline-block;
  background-color: #ffad33;
  position : relative;
  color: #fff;
  font-size: 14px;
  cursor:pointer;
  border:none;
  border-radius: 20px;
}

.d{
 	width: 235px;
 	height: 30px;
    border: 0;
    outline: none;
    font-size: 14pt;
    border-bottom: 2px solid #e5e5e5;
    margin-bottom: 20px;
}
.cancel{
 	margin-left: 10px;
 	height:40px;
 	width: 90px;
	font-size: 20px;
	color: #888;
	border: 0;
	cursor:pointer;
	border-radius: 10px;
}

.check{
	margin-left: 30px;
	height:40px;
	background-color: #ffad33;
	width: 90px;
	border:none;
	margin-left: 50px;
	font-size: 20px;
	color: #fff;
	cursor:pointer;
	border-radius: 10px;
}

</style>
</head>
<body>
<div class="wrap">
	<div class="a"><h1>비밀번호 찾기</h1></div>
	<div class="c"><h2>이메일 인증</h2></div>
	<div id="id1">아이디</div>
	<input type="text" class="c1" placeholder="아이디">
<br>
	<div id="id2">이메일주소</div>	
	<input type="text" class="c2" placeholder="이메일주소">
	<input type="button" class="c3" value="인증번호받기">
<br>
	<div id="id3">인증번호</div>
	<input type="text" class="d" placeholder= 인증번호입력>
	<input type="button" class="c3" value="확인">
<br><br>
	<input type="button" class="cancel" value="취소">
	<input type="button" class="check" value="확인">
	
</div>
</body>
</html>