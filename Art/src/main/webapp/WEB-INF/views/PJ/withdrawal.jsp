<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ART</title>
<link rel="stylesheet" href="resources/css/PJ/withdrawal.css">
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
<body class="settings">
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
 <div class="main">
	<div class="popup-leave">
	 <h1>아트 탈퇴하기</h1>
	 <div class="desc">
		 탈퇴하시면 이용 중인 아트가 폐쇄되며
		 <br>
		 <b>모든 데이터는 복구가 불가능합니다.</b>
		 <br>
		  아래 사항을 확인하신 후에 신중하게 결정해 주세요.
	 </div>
	 <span class="ico_dot"> 작성한 글, 작품 모든 정보가 삭제됩니다.<br>작성한 댓글은 사라지지 않으니 미리 확인하시기 바랍니다.</span><br>
	  <div class="screen_out">
	   <input type="checkbox"><label > 안내사항을 모두 확인하였으며, 이에 동의합니다.</label>
	  <br><br>
	   <input type="button" class="stopbtn" value="탈퇴하기">
	  </div>
	</div><!--popup-leave end  -->
  </div>
</div><!--body end-->
</body>
</html>