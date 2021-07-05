<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필관리</title>
<link rel="stylesheet" href="resources/css/JY/profile.css">
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
	
	$("#btnNicknameCheck").on("click", function(){
				
		var userNickname= $("#nickname").serialize();
		
		$.ajax({
			url : "nicknameCheck",
			type : "post",
			dataType : "json",
			data : userNickname,
			success: function(res) { // 성공 시 다음 함수 실행
				if(res.msg == "exist") {
					alert("닉네임이 존재합니다. 다른 닉네임을 입력해주세요.");
				} else if(res.msg == "none") {
					alert("사용가능한 닉네임입니다.");
				} else {
					alert("작성 중 문제가 발생하였습니다.")
				}
			},
			error: function(request, status, error) { // 실패 시 다음 함수 실행
				console.log(error);
			}
		})
	    
	});
	
	$("#btnSave").on("click", function() {
		
		var params= $("#profileForm").serialize();
			console.log(params);
		$.ajax({
			url: "profiles", // 접속 주소
			type: "post", // 전송 방식: get, post
			dataType: "json", // 받아올 데이터 형태
			data: params, // 보낼 데이터(문자열 형태)
			success: function(res) { // 성공 시 다음 함수 실행
			    if(res.msg == "success") {
					$("#profileForm").attr("action", "main");
					$("#profileForm").submit();
				} else if(res.msg == "failed") {
					alert("수정에 실패하였습니다.")
				} else {
					alert("수정 중 문제가 발생하였습니다.")
				}
			},
			error: function(request, status, error) { // 실패 시 다음 함수 실행
				console.log(error);
			}
		});
	})
});
</script>
</head>
<body>
<form action="#" id="profileForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value="${sUserNo}">
	<c:import url="header.jsp"></c:import>
	<div class="wrap">
		<div class="btn_menu">
			<div class="set">설정</div>
			<div class="profile_manage">프로필관리</div>
			<div class="privacy">개인정보관리</div>
			<div class="stop">탈퇴하기</div>
		</div>
		<div class="contents">
			<div class="title">프로필 관리</div>
			<div class="profile_edit">
				<img id="profileEditImg" src="resources/images/JY/짱구5.jpg" alt="프로필사진" width="300px" height="300px">
		    </div>
		    <div class="btn_profile_upload_w"><input id="btnProfileUpload" type="button" value="첨부하기"></div>
		    
			<table cellspacing="0" class="table">
				<tr height="50px">
					<th>닉네임</th>
					<td>
						<input id="nickname" name="userNickname" type="text" value="${sUserNickname}" size="40" maxlength="50"/>
						<input id="btnNicknameCheck" type="button" value="중복확인">
					</td>
				</tr>
				<tr height="300px">
					<th>내 소개</th>
					<td><input id="introduce" name="userIntroduce" type="text" value="${sUserIntroduce}" size="40" maxlength="500"/></td>
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