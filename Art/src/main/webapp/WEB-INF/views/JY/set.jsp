<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 관리</title>
<link rel="stylesheet" href="resources/css/JY/set.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".profile_manage").on("click", function() {
		location.href = "profile";
	});
	
	$(".privacy").on("click", function() {
		location.href = "set";
	});
	
	$(".stop").on("click", function() {
		location.href = "withdrawal";
	});
});
	

	function check_pw(){
		 
        var pw = document.getElementById('pw').value;
        /* var SC = ["!","@","#","$","%"];
        var check_SC = 0; */

        
        if(document.getElementById('pw').value !='' && document.getElementById('pwCheck').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pwCheck').value){
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
	<c:import url="header.jsp"></c:import>
	
	<div class="wrap">
		<div class="btn_menu">
			<div class="set">설정</div>
			<div class="profile_manage">프로필관리</div>
			<div class="privacy">개인정보관리</div>
			<div class="stop">탈퇴하기</div>
		</div>
		<div class="contents">
			<div class="title">개인정보 관리</div>
			<table cellspacing="0" class="table">
				<tr>
					<th>새 비밀번호</th>
					<td><input id="pw" type="password" onchange="check_pw()" size="10" maxlength="200"/><br/><span id="check"></span></td>
				</tr>
				<tr>
					<th>새비밀번호 확인</th>
					<td><input id="pwCheck" type="password" onchange="check_pw()" size="10" maxlength="200"/><br/><span id="check2"></span></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input id="year" type="text" size="10" maxlength="4" placeholder="년(4자)"/>
						<select class="month">
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
				<tr>
					<th>성별</th>
					<td>
						<select class="sex">
								<option value="0" selected="selected">성별</option>
								<option value="1">남자</option>
								<option value="1">여자</option>
								<option value="1">선택안함</option>
						</select>
					</td>
				</tr>
				<tr>
					<th rowspan="2">이메일</th>
					<td>
					<input id="email1" type="text" size="40" maxlength="50"/>
					@
					<input id="email2" type="text" size="40" maxlength="50"/>
					<input id="emailSend" type="button" value="인증번호 받기">
					</td>
				</tr>
				<tr>
					<td>
						<input id="email3" type="text" disabled="disabled" placeholder="인증번호 입력하세요" size="40" maxlength="50"/>
						<input id="emailCheck" type="button" value="확인">
					</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td>
						<input id="phone1" type="text" size="10" maxlength="4"/>
						- <input id="phone2" type="text" size="10" maxlength="4"/>
						- <input id="phone3" type="text" size="10" maxlength="4"/>
					</td>
				</tr>
				<tr>
					<th>정보수신여부</th>
					<td rowspan="2" >서비스 관련 소식 및 프로모션 메일을
						<select class="agree">
							<option value="0" selected="selected">수신합니다.</option>
							<option value="1">수신하지 않습니다.</option>
						</select>
					</td>
				</tr>
			</table>
			<div class="save_cancel">
				<input id="btnSave" type="button" value="저장하기">
				<input id="btnCancel" type="button" value="취소하기">
			</div>
		</div>
	</div>
	
	<c:import url="footer.jsp"></c:import>
</body>
</html>