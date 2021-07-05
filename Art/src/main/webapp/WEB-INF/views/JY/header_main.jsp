<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
[type="button"] {
	cursor: pointer;
	font-family: '돋움';
}


a {
	color: inherit;
	text-decoration: none;
}

.banner {
	width: 100%;
	height: 70px;
	background-color: skyblue;
}

.header {
	margin-top: 20px;
	position: relative;
	width: 100%;
	height: 60px;
}

#btnMenu {
	position: absolute;
	left: 40px;
	cursor: pointer;
}

#btnLogo {
	position: absolute;
	left: 80px;
}

#search_w {
	width: 300px;
	height: 45px;
	position: absolute;
	right: 100px;
	display: none;
}

#btnSearch {
	width: 100%;
	height: 100%;
	border-radius: 15px;
	border: 1px solid #cccccc;
	outline-style: none;
}

#btnLook {
	position: absolute;
	right: 40px;
	cursor: pointer;
}

.side_bar {
	display: none;
	border: 2px solid gray;
	background-color: white;
	width: 300px;
	height: 630px;
	position: absolute;
	top: 130px;
	left: 40px;
	z-index: 900;
	border-radius: 10px;
}

#btnUpload, #btnLogout {
	border: 1px solid #ffad33;
	color: #ffad33;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18pt;
	cursor: pointer;
	border-radius: 20px;
	background-color: white;
}

.profile {
	width: 200px;
	height: 200px;
	border-radius: 70%;
	overflow: hidden;
	position: absolute;
	top: 50px;
	left: 48px;
}

.profile_img, .profile_img2, .profile_img3, .profile_img4 {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profile_name {
	position: absolute;
	width: 300px;
	height: 20px;
	text-align: center;
	top: 260px;
	font-size: 22pt;
}

#btnUpload {
	position: absolute;
	top: 310px;
	left: 95px;
}

.side_bar_menu {
	position: absolute;
	margin: 330px auto 0px;
	text-align: center;
	padding-top: 20px;
	font-size: 15pt;
	width: 100%;
	height: 200px;
}

#btnLogout {
	position: absolute;
	top: 550px;
	left: 95px;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnMenu').click(function() {
			if ($('.side_bar').css('display') == 'none') {
				$('.side_bar').slideDown();
			} else {
				$('.side_bar').slideUp();
			}
		});
		
		$("#btnLogout").on("click", function() {
			$.ajax({
				url: "Logout",
				type: "post",
				success: function(res) {
					location.href = "main";
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="banner"></div>
	<div class="header">
		<img src="resources/images/JY/menu.png" id="btnMenu" alt="메뉴" width="35px" height="40px">
		<a href="main"><img src="resources/images/JY/art2.png" id="btnLogo" alt="로고" width="70px" height="40px"></a>
		<a href="searchPage"><img src="resources/images/JY/look.png" id="btnLook" alt="돋보기" width="40px" height="40px"></a>
	</div>
	<div class="side_bar">
		<div class="profile">
			<img class="profile_img" src="resources/images/JY/짱구1.jpg" alt="짱구1" width="475px" height="475px">
		</div>
		<div class="profile_name">${sUserNickname}</div>
		<a href="writing"><input type="button" id="btnUpload" value="작품등록"></a>
		<div class="side_bar_menu">
			<span>--------------</span>
			<div class="side_bar_menu1"><a href="mygallary">나의 작업실</a></div>
			<br />
			<div class="side_bar_menu2"><a href="gallary">작품 보러가기</a></div>
			<br />
			<div class="side_bar_menu3"><a href="profile">개인정보 수정</a></div>
			<br />
			<div class="side_bar_menu4"><a href="gongji">공지사항</a></div>
		</div>
		<input type="button" id="btnLogout" value="로그아웃">
	</div>

</body>
</html>