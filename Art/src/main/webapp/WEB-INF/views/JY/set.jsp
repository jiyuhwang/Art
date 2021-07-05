<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
$("#btnSave").on("click", function(){
	    
		if($("#pw").val() == "") {
			$("#pw").focus();
		} else if($("#pwCheck").val() == "") {
			$("#pwCheck").focus();
		} else if($("#pw").val() != $("#pwCheck").val()) {
			$("#pw").val("");
			$("#pwCheck").val("");
			$("#pw").focus();
		} else if($("#name").val() == "") {
			$("#name").focus();
		} else if($("#phone").val() == "") {
			$("#phone").focus();
		} else if($("#year").val() == "") {
			$("#year").focus();
		} else if($("select[name=birthMonth]").val() == '월') {
			$(".month").focus();
		} else if($('#day').val() == "") {
			$("#day").focus();
		} else if($("#email").val() == "") {
			$("#email").focus();
		} else {
			
			var params= $("#setForm").serialize();
		
			$.ajax({
				url: "sets", // 접속 주소
				type: "post", // 전송 방식: get, post
				dataType: "json", // 받아올 데이터 형태
				data: params, // 보낼 데이터(문자열 형태)
				success: function(res) { // 성공 시 다음 함수 실행
					if(res.msg == "success") {
						alert("회원정보 수정이 완료되었습니다.");
					} else if(res.msg == "failed") {
						alert("작성에 실패하였습니다.");
					} else {
						alert("작성 중 문제가 발생하였습니다.")
					}
				},
				error: function(request, status, error) { // 실패 시 다음 함수 실행
					console.log(error);
				}
			});
	  	}
	    
	});
});
	

	function check_pw(){
		 
        /* var pw = document.getElementById('pw').value; */
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
<form action="#" id="setForm" method="post">
	<input type="hidden" name="userNo" value="${sUserNo}">
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
					<td><input id="pw" type="password" name="userPw" onchange="check_pw()" size="10" maxlength="200"/></td>
				</tr>
				<tr>
					<th>새비밀번호 확인</th>
					<td><input id="pwCheck" type="password" onchange="check_pw()" size="10" maxlength="200"/><br/><span id="check2"></span></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input id="name" type="text" name="userName" size="10" maxlength="10" value="${sUserName}" /><br/></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<c:set var="Birth" value="${sUserBirth}" />
						<input type="number" id="year" name="birthYear" value="${fn:substring(Birth,0,4)}" size="10" maxlength="4" placeholder="년(4자)"/>
						<select name="birthMonth" class="month">
								<option>월</option>
								<option value="1" <c:if test="${fn:substring(Birth,5,7) eq '01'}">selected</c:if>>1</option>
								<option value="2" <c:if test="${fn:substring(Birth,5,7) eq '02'}">selected</c:if>>2</option>
								<option value="3" <c:if test="${fn:substring(Birth,5,7) eq '03'}">selected</c:if>>3</option>
								<option value="4" <c:if test="${fn:substring(Birth,5,7) eq '04'}">selected</c:if>>4</option>
								<option value="5" <c:if test="${fn:substring(Birth,5,7) eq '05'}">selected</c:if>>5</option>
								<option value="6" <c:if test="${fn:substring(Birth,5,7) eq '06'}">selected</c:if>>6</option>
								<option value="7" <c:if test="${fn:substring(Birth,5,7) eq '07'}">selected</c:if>>7</option>
								<option value="8" <c:if test="${fn:substring(Birth,5,7) eq '08'}">selected</c:if>>8</option>
								<option value="9" <c:if test="${fn:substring(Birth,5,7) eq '09'}">selected</c:if>>9</option>
								<option value="10" <c:if test="${fn:substring(Birth,5,7) eq '10'}">selected</c:if>>10</option>
								<option value="11" <c:if test="${fn:substring(Birth,5,7) eq '11'}">selected</c:if>>11</option>
								<option value="12" <c:if test="${fn:substring(Birth,5,7) eq '12'}">selected</c:if>>12</option>
						</select>
						<input type="number" id="day" name="birthDay" value="${fn:substring(Birth,8,10)}" size="10" maxlength="2" placeholder="일"/></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<div class="sex">
							<c:choose>
								<c:when test="${sUserSex == 0}">
									<input type="radio" value="${sUserSex}" name="gender" checked ="checked">남 
			        				<input type="radio" value="${sUserSex}" name="gender">여 
								</c:when>
								<c:otherwise>
									<input type="radio" value="${sUserSex}" name="gender">남 
			        				<input type="radio" value="${sUserSex}" name="gender" checked ="checked">여 
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td>
						<input id="phone" type="number" name="userPhone" size="10" value="${sUserPhone}"/>
					</td>
				</tr>
				<tr>
					<th rowspan="2">이메일</th>
					<td>
					<input id="email" type="text" name="userMail"  size="40" maxlength="50" value="${sUserMail}" />
					<input id="emailSend" type="button" value="인증번호 받기">
					</td>
				</tr>
				<tr>
					<td>
						<input id="email3" type="text" name="userMailCheck" disabled="disabled" placeholder="인증번호 입력하세요" size="40" maxlength="50"/>
						<input id="emailCheck" type="button" value="확인">
					</td>
				</tr>
				<tr>
					<th>정보수신여부</th>
					<td rowspan="2" >서비스 관련 소식 및 프로모션 메일을
						<c:choose>
							<c:when test="${sUserEventAgree == 0}">
								<select name="userEventAgree" class="agree">
									<option value="0" selected="selected">수신합니다.</option>
									<option value="">수신하지 않습니다.</option>
								</select>
							</c:when>
							<c:otherwise>
								<select name="userEventAgree" class="agree">
									<option value="0">수신합니다.</option>
									<option value="" selected="selected">수신하지 않습니다.</option>
								</select>
							</c:otherwise>
						</c:choose>
						
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
</form>
</body>
</html>