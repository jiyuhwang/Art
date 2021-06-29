<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.wrap{
   text-align: center;
   height : 370px;
   width : 400px;
   margin: 0 auto;
   border : 1px solid #e5e5e5;
   margin-top: 200px;
   
}

#id, #psrd {
	width: 250px;
	height: 45px;
	border: 0;
	font-size: 12pt;
	outline: none;
	border-bottom: 2px solid #e5e5e5;
}

.a{
  text-align: center;

}
.b{
  text-align:  center;
}

.c{
   height : 30px;
   width : 250px;
   background-color: #ffad33;
   border: none;
   color: #fff;
   font-size: 15px;

}

a {
	color: inherit;
	text-decoration: none;
}


</style>
</head>
<body>
<div class = "wrap">
     <div class="a"><h1>로그인</h1></div>
     <div class="b"></div>
         <input type="text" placeholder="아이디" id="id">
   <br><br>            
	     <input type="password" placeholder="비밀번호" id="psrd">
   <br><br>
         <input type="button" class="c" value="로그인하기">
   <br><br>
		<a href="#">회원가입</a>
		<a href="#">아이디찾기</a>
		<a href="#">비밀번호 찾기 </a>                   
</div>
</body>

</html>