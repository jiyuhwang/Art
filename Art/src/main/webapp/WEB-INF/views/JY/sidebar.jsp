<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
<link rel="stylesheet" href="resources/css/JY/sidebar.css">
<script type="text/javascript" src="../script/jquery/jquery-1.12.4.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#btnMenu').click(function() {
			if ($('.side_bar').css('display') == 'none') {
				$('.side_bar').slideDown();
			} else {
				$('.side_bar').slideUp();
			}
		})
		
		$('#btnLook').click(function() {
			if ($('#srhW').css('display') == 'none') {
				$('#srhW').show();
			} else {
				$('#srhW').hide();
			}
		})
	});
</script>
</head>
<body>
<div class="hdr">
		<img src="resources/images/JY/menu.png" id="btnMenu" alt="메뉴" width="35px" height="40px">
      	<a href="main"><img src="resources/images/JY/art2.png" id="btnLogo" alt="로고" width="70px" height="40px"></a>
      	<div id="srhW"><input type="text" id="btnSrh"></div>
      	<img src="resources/images/JY/look.png" id="btnLook" alt="돋보기" width="40px" height="40px">
	</div>
	<div class="side_bar">
		<div class="pfe">
			<img class="pfe_img" src="resources/images/JY/짱구1.jpg" alt="짱구1" width="300px"
				height="300px">
		</div>
		<div id="pfeName">짱구</div>
		<a href="writing"><input type="button" id="btnUod"
			value="작품등록"></a>
		<div class="side_bar_menu">
			<span>--------------</span>
			<div id="sideBarMenu1">
				<a href="mygallary">나의 작업실</a>
			</div>
			<br />
			<div id="sideBarMenu2">
				<a href="gallary">작품 보러가기</a>
			</div>
			<br />
			<div id="sideBarMenu3">
				<a href="profile">개인정보 수정</a>
			</div>
			<br />
			<div id="sideBarMenu4">
				<a href="#">공지사항</a>
			</div>
		</div>
		<input type="button" id="btnLot" value="로그아웃">
	</div>
</body>
</html>