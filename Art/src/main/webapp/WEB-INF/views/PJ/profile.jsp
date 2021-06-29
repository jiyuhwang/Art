<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필관리</title>
<link rel="stylesheet" href="resources/css/PJ/profile.css">
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
	
	$(".pfener").on("click", function() {
		location.href = "profile";
	});
	
	$(".pvy").on("click", function() {
		location.href = "set";
	});
	
	$(".stop").on("click", function() {
		location.href = "withdrawal";
	});
});
</script>
</head>
<body>
	<div class="hdr">
		<img src="resources/images/PJ/menu.png" id="btnMenu" alt="메뉴" width="35px" height="40px">
      	<a href="main"><img src="resources/images/PJ/art2.png" id="btnLogo" alt="로고" width="70px" height="40px"></a>
      	<img src="resources/images/PJ/look.png" id="btnLook" alt="돋보기" width="40px" height="40px">
	</div>
	<div class="side_bar">
		<div class="pfe">
			<img class="pfe_img" src="resources/images/PJ/짱구1.jpg" alt="짱구1" width="300px" height="300px">
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
		<div class="btn_menu">
			<div class="set">설정</div>
			<!-- <div class="alarm">알림설정</div> -->
			<div class="pfener">프로필관리</div>
			<div class="pvy">개인정보관리</div>
			<div class="stop">탈퇴하기</div>
		</div>
		<div class="ctt">
			<div class="title">프로필 관리</div>
			<div id="pfe_edit">
				<img id="pfe_edit_img" src="resources/images/PJ/짱구5.jpg" alt="프로필사진" width="300px" height="300px">
		    </div>
		    <div id="btnPfeUodW"><input id="btnPfeUod" type="button" value="첨부하기"></div>
		    
			<table cellspacing="0" class="table">
				<tr height="50px">
					<th>닉네임</th>
					<td>
						<input id="nkme" type="text" size="40" maxlength="50"/>
						<input id="nkme_check" type="button" value="중복확인">
					</td>
				</tr>
				<tr height="500px">
					<th>내 소개</th>
					<td><input id="irue" type="text" size="40" maxlength="500"/></td>
				</tr>
			</table>
			<div class="save_ccl">
				<input id="btnSave" type="button" value="저장하기">
				<input id="btnCcl" type="button" value="취소하기">
			</div>
		</div>
	</div>
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