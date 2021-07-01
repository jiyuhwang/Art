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
});
</script>
</head>
<body>
	<c:import url="header.jsp"></c:import>
	
	<div class="wrap">
		<div class="btn_menu">
			<div class="set">설정</div>
			<!-- <div class="alarm">알림설정</div> -->
			<div class="profile_manage">프로필관리</div>
			<div class="privacy">개인정보관리</div>
			<div class="stop">탈퇴하기</div>
		</div>
		<div class="contents">
			<div class="title">프로필 관리</div>
			<div id="profileEdit">
				<img id="profileEditImg" src="resources/images/JY/짱구5.jpg" alt="프로필사진" width="300px" height="300px">
		    </div>
		    <div id="btnProfileUploadW"><input id="btnProfileUpload" type="button" value="첨부하기"></div>
		    
			<table cellspacing="0" class="table">
				<tr height="50px">
					<th>닉네임</th>
					<td>
						<input id="nickname" type="text" size="40" maxlength="50"/>
						<input id="nicknameCheck" type="button" value="중복확인">
					</td>
				</tr>
				<tr height="300px">
					<th>내 소개</th>
					<td><input id="introduce" type="text" size="40" maxlength="500"/></td>
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