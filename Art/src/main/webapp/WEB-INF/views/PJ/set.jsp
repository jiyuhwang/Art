<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 관리</title>
<link rel="stylesheet" href="resources/css/PJ/set.css">
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
	

	function check_pw(){
		 
        var pw = document.getElementById('psrd').value;
        /* var SC = ["!","@","#","$","%"];
        var check_SC = 0; */

        
        if(document.getElementById('psrd').value !='' && document.getElementById('psrdCheck').value!=''){
            if(document.getElementById('psrd').value==document.getElementById('psrdCheck').value){
                document.getElementById('check2').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check2').style.color='green';
            }
            else{
                document.getElementById('check2').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check2').style.color='red';
            }
        }
	}
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
		<div class="btn_menu">
			<div class="set">설정</div>
			<!-- <div class="alarm">알림설정</div> -->
			<div class="pfener">프로필관리</div>
			<div class="pvy">개인정보관리</div>
			<div class="stop">탈퇴하기</div>
		</div>
		<div class="ctt">
			<div class="title">개인정보 관리</div>
			<table cellspacing="0" class="table">
				<!-- <colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup> -->
				<tr height="50px">
					<th>새 비밀번호</th>
					<td><input id="psrd" type="password" onchange="check_pw()" size="10" maxlength="200"/><br/><span id="check"></span></td>
				</tr>
				<tr height="50px">
					<th>새비밀번호 확인</th>
					<td><input id="psrdCheck" type="password" onchange="check_pw()" size="10" maxlength="200"/><br/><span id="check2"></span></td>
				</tr>
				<tr height="50px">
					<th>생년월일</th>
					<td>
						<input id="year" type="text" size="10" maxlength="4" placeholder="년(4자)"/>
						<select id="month">
								<option value="0" selected="selected">월</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="3">4</option>
								<option value="3">5</option>
								<option value="3">6</option>
								<option value="3">7</option>
								<option value="3">8</option>
								<option value="3">9</option>
								<option value="3">10</option>
								<option value="3">11</option>
								<option value="3">12</option>
						</select>
						<input id="day" type="text" size="10" maxlength="2" placeholder="일"/></td>
				</tr>
				<tr height="50px">
					<th>성별</th>
					<td>
						<select id="sex">
								<option value="0" selected="selected">성별</option>
								<option value="1">남자</option>
								<option value="1">여자</option>
								<option value="1">선택안함</option>
						</select>
					</td>
				</tr>
				<tr height="50px">
					<th rowspan="2">이메일</th>
					<td>
					<input id="email1" type="text" size="40" maxlength="50"/>
					@
					<input id="email2" type="text" size="40" maxlength="50"/>
					<input id="emailSend" type="button" value="인증번호 받기">
					</td>
				</tr>
				<tr height="50px">
					<!-- <th>인증번호 확인</th> -->
					<td>
						<input id="email3" type="text" disabled="disabled" placeholder="인증번호 입력하세요" size="40" maxlength="50"/>
						<input id="emailCheck" type="button" value="확인">
					</td>
				</tr>
				<tr height="50px">
					<th rowspan="2">휴대폰번호</th>
					<td>
						<input id="phone1" type="text" size="10" maxlength="4"/>
						- <input id="phone2" type="text" size="10" maxlength="4"/>
						- <input id="phone3" type="text" size="10" maxlength="4"/>
					</td>
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