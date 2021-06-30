<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gallary</title>
<link rel="stylesheet" href="resources/css/JY/gallary.css">
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
</script>
</head>
<body>
	<div class="header">
		<img src="resources/images/JY/menu.png" id="btnMenu" alt="메뉴" width="35px" height="40px">
      	<a href="main"><img src="resources/images/JY/art2.png" id="btnLogo" alt="로고" width="70px" height="40px"></a>
      	<a href="searchPage"><img src="resources/images/JY/look.png" id="btnLook" alt="돋보기" width="40px" height="40px"></a>
	</div>
	<div class="side_bar">
		<div class="profile">
			<img class="profile_img" src="resources/images/JY/짱구1.jpg" alt="짱구1" width="300px" height="300px">
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
			<div class="gallary">
				<div id="tabs">
					<input id="gallaryMenu1" type="radio" name="tab" checked="checked" />
					<input id="gallaryMenu2" type="radio" name="tab" />
					<input id="gallaryMenu3" type="radio" name="tab" />
					<label for="gallaryMenu1">사진작품관</label>
					<label for="gallaryMenu2">그림작품관</label>
					<label for="gallaryMenu3">영상작품관</label>
					<select id="set">
						<option value="0" selected="selected">최신순</option>
						<option value="1">좋아요순</option>
					</select>
					<div class="gallary_menu1_contents">
						<div class="picture_wrap">
							<div class="picture" id="picture1"></div>
							<div class="picture" id="picture2"></div>
							<div class="picture" id="picture3"></div>
							<div class="picture" id="picture4"></div>
							<div class="picture" id="picture5"></div>
							<div class="picture" id="picture6"></div>
							<div class="picture" id="picture7"></div>
							<div class="picture" id="picture8"></div>
							<div class="picture" id="picture9"></div>
							<div class="picture" id="picture10"></div>
							<div class="picture" id="picture11"></div>
							<div class="picture" id="picture12"></div>
							<div class="picture" id="picture13"></div>
							<div class="picture" id="picture14"></div>
							<div class="picture" id="picture15"></div>
							<div class="picture" id="picture16"></div>
						</div>
					</div>
					<div class="gallary_menu2_contents"></div>
					<div class="gallary_menu3_contents"></div>
				</div>
			</div>
			<div class="pagination">
				<a href="#">&laquo;</a> <a href="#" class="active">1</a> <a href="#">2</a>
				<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
				<a href="#">&raquo;</a>
			</div>
		</div>
	<br />
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