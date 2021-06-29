<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>other_gallary</title>
<link rel="stylesheet" href="resources/css/PJ/other_gallary.css">
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
		var heart = document.getElementById('heart')

		if (heart.src.match("resources/images/PJ/heart.png")) {
			heart.src = "resources/images/PJ/heart2.png";
		} else {
			heart.src = "resources/images/PJ/heart.png";
		}
	}
</script>
</head>
<body>
	<div class="hdr">
		<img src="resources/images/PJ/menu.png" id="btnMenu" alt="메뉴" width="35px" height="40px">
		<a href="main"><img src="resources/images/PJ/art2.png" id="btnLogo" alt="로고" width="70px" height="40px"></a>
		<a href="searchPage"><img src="resources/images/PJ/look.png" id="btnLook" alt="돋보기" width="40px" height="40px"></a>
	</div>
	<div class="side_bar">
		<div class="pfe">
			<img class="pfe_img" src="resources/images/PJ/짱구1.jpg" alt="짱구1" width="300px"
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
	<div class="wrap">
		<div class="pfe_wrap">
		<img id="heart" src="resources/images/PJ/heart.png" alt="하트" onclick="heart();" width="35px" height="35px">
			<div class="pfe2">
				<img class="pfe_img2" src="resources/images/PJ/짱구1.jpg" alt="짱구1"
					width="200px" height="200px">
			</div>
			<div id="pfeName2">짱구</div>
			<div id="pfeLike">좋아요수</div>
			<div id="pfeIrue">
				<div id="pfeIrueIn">작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개
				작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개
				</div>
			</div>
		</div>
		<div class="gly_wrap">
			<div class="gly">
				<div id="tabs">
					<input id="glyMenu1" type="radio" name="tab" checked="checked" />
					<input id="glyMenu2" type="radio" name="tab" />
					<input id="glyMenu3" type="radio" name="tab" />
					<label for="glyMenu1">사진작품관</label>
					<label for="glyMenu2">그림작품관</label>
					<label for="glyMenu3">영상작품관</label>
					<select id="set">
						<option value="0" selected="selected">최신순</option>
						<option value="1">좋아요순</option>
					</select>
					<div class="gly_menu1_ctt">
						<div class="pte_wrap">
							<div class="pte" id="pte1">
								<img src="resources/images/PJ/짱구1.jpg" alt="짱구1" width="300px" height="300px">
							</div>
							<div class="pte" id="pte2">
								<img src="resources/images/PJ/짱구2.jpg" alt="짱구2" width="300px" height="300px">
							</div>
							<div class="pte" id="pte3">
								<img src="resources/images/PJ/짱구3.jpg" alt="짱구3" width="300px" height="300px">
							</div>
							<div class="pte" id="pte4">
								<img src="resources/images/PJ/짱구4.jpg" alt="짱구4" width="300px" height="300px">
							</div>
							<div class="pte" id="pte5">
								<img src="resources/images/PJ/짱구1.jpg" alt="짱구1" width="300px" height="300px">
							</div>
							<div class="pte" id="pte6">
								<img src="resources/images/PJ/짱구2.jpg" alt="짱구2" width="300px" height="300px">
							</div>
							<div class="pte" id="pte7">
								<img src="resources/images/PJ/짱구3.jpg" alt="짱구3" width="300px" height="300px">
							</div>
							<div class="pte" id="pte8">
								<img src="resources/images/PJ/짱구4.jpg" alt="짱구4" width="300px" height="300px">
							</div>
							<div class="pte" id="pte9">
								<img src="resources/images/PJ/짱구1.jpg" alt="짱구1" width="300px" height="300px">
							</div>
						</div>
					</div>

					<div class="gly_menu2_ctt">addfasd</div>
					<div class="gly_menu3_ctt"></div>
				</div>
			</div>
			<div class="pitn">
				<a href="#">&laquo;</a> <a href="#" class="active">1</a> <a href="#">2</a>
				<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
				<a href="#">&raquo;</a>
			</div>
		</div>
	</div>
	<br />
	<div class="ftr">
		<a href="main"><img src="resources/images/PJ/art2_w.png" id="btnLogo2" alt="로고" width="70px" height="50px"></a>
		<div class="ftr_pae">You can be an art writer.</div>
		<div id="ftr1"><a href="#">관리방침 안내</a></div>
		<div id="ftr2"><a href="#">도움말 안내</a></div>
		<div id="ftr3"><a href="#">회원가입 및 글게시 안내</a></div>
		<div id="ftr4"><a href="#">홈페이지 서비스 안내</a></div>
	</div>
</body>
</html>