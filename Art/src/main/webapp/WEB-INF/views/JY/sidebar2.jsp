<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar2</title>
<link rel="stylesheet" href="resources/css/JY/sidebar2.css">
</head>
<body>
	<div class="side_bar">
		<img id="sideBarLogo" src="resources/images/JY/art2.png" alt="로고" width="80px"
			height="50px">
		<div class="side_bar_phrase">You can be an art writer.</div>
		<input type="button" id="btnStart" value="Art 시작하기">
		<div class="side_bar_menu">
			<div class="side_bar_menu1">
				<a href="main">Art 홈</a>
			</div>
			<br />
			<div class="side_bar_menu2">
				<a href="gallary">작품 보러가기</a>
			</div>
		</div>
		<div class="forget">
			<a href="#">계정을 잊어버리셨나요?</a>
		</div>
	</div>
</body>
</html>