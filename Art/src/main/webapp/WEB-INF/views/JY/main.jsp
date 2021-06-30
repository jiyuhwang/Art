<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="resources/css/JY/main.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#btnMenu').click(function() {
		if ($('.side_bar').css('display') == 'none') {
			$('.side_bar').slideDown();
		} else {
			$('.side_bar').slideUp();
		}
	})
	
});
	
	function heart() {
		var heart = document.getElementById('contentsHeart');

		if (heart.src.match("resources/images/JY/heart3.png")) {
			heart.src = "resources/images/JY/heart2.png";
		} else {
			heart.src = "resources/images/JY/heart3.png";
		}
	}
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
		<div id="profileName">짱구</div>
		<a href="writing"><input type="button" id="btnUpload" value="작품등록"></a>
		<div class="side_bar_menu">
			<span>--------------</span>
			<div id="sideBarMenu1"><a href="mygallary">나의 작업실</a></div>
			<br />
			<div id="sideBarMenu2"><a href="gallary">작품 보러가기</a></div>
			<br />
			<div id="sideBarMenu3"><a href="profile">개인정보 수정</a></div>
			<br />
			<div id="sideBarMenu4"><a href="#">공지사항</a></div>
		</div>
		<input type="button" id="btnLogout" value="로그아웃">
	</div>
	<div class="wrap">
		<div class="pic_wrap">
			<div id="picTitle">사진갤러리</div>
			<div class="img_wrap">
				<img src="resources/images/JY/left_arrow2.png" id="leftArrow" alt="왼쪽 화살표" width="100px" height="100px">
			<div class="pic" id="pic1">
				<div id="bg">
					<div id="contentsTitle">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
					<div id="contentsIn">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
					<img id="contentsHeart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
					<div id="contentsName">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
				</div>
			</div>
			<div class="pic" id="pic2">
				<div id="bg">
					<div id="contentsTitle">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
					<div id="contentsIn">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
					<img id="contentsHeart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
					<div id="contentsName">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
				</div>
			</div>
			<div class="pic" id="pic3">
				<div id="bg">
					<div id="contentsTitle">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
					<div id="contentsIn">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
					<img id="contentsHeart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
					<div id="contentsName">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
				</div>
			</div>
			<div class="pic" id="pic4">
				<div id="bg">
					<div id="contentsTitle">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
					<div id="contentsIn">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
					<img id="contentsHeart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
					<div id="contentsName">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
				</div>
			</div>
			<img src="resources/images/JY/right_arrow2.png" id="rightArrow" alt="오른쪽 화살표" width="100px" height="100px"> <br />
			</div>	
			<div class="more">
				<a href="gallary">더 많은 작품 보러가기 ></a>
			</div>
		</div>
		<br />
		<div class="drawing_wrap">
			<div id="drawingTitle">그림갤러리</div>
			<div class="img_wrap2">
				<img src="resources/images/JY/left_arrow2.png" id="leftArrow" alt="왼쪽 화살표" width="100px" height="100px">
				<div class="drawing" id="drawing1">
					<div id="bg"></div>
				</div>
				<div class="drawing" id="drawing2">
					<div id="bg"></div>	
				</div>
				<div class="drawing" id="drawing3">
					<div id="bg"></div>
				</div>
				<div class="drawing" id="drawing4">
					<div id="bg"></div>
				</div>
				<img src="resources/images/JY/right_arrow2.png" id="rightArrow" alt="오른쪽 화살표" width="100px" height="100px">
			</div>
				<div class="more">
					<a href="gallary">더 많은 작품 보러가기 ></a>
				</div>
		</div>
		<br />
		<div class="video_wrap">
			<div id="videoTitle">영상갤러리</div>
			<div class="img_wrap3">
				<img src="resources/images/JY/left_arrow2.png" id="leftArrow" alt="왼쪽 화살표" width="100px" height="100px">
				<div class="video" id="video1"></div>
				<div class="video" id="video2"></div>
				<div class="video" id="video3"></div>
				<div class="video" id="video4"></div>
				<img src="resources/images/JY/right_arrow2.png" id="rightArrow" alt="오른쪽 화살표" width="100px" height="100px">
			</div>
				<div class="more">
					<a href="gallary">더 많은 작품 보러가기 ></a>
				</div>
		</div>
	</div>
	<div class="footer">
		<a href="main"><img src="resources/images/JY/art2_w.png" id="btnLogo2" alt="로고" width="70px" height="50px"></a>
		<div class="footer_phrase">You can be an art writer.</div>
		<div id="footer1"><a href="#">관리방침 안내</a></div>
		<div id="footer2"><a href="#">도움말 안내</a></div>
		<div id="footer3"><a href="#">회원가입 및 글게시 안내</a></div>
		<div id="footer4"><a href="#">홈페이지 서비스 안내</a></div>
	</div>
</body>
</html>
