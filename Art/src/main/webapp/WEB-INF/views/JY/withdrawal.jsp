<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ART</title>
<link rel="stylesheet" href="resources/css/JY/withdrawal.css">
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
	<c:choose>
		<c:when test="${empty sUserNo}">
			<c:import url="header2.jsp"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="header.jsp"></c:import>
		</c:otherwise>
	</c:choose>
	
	<div class="wrap">
		<div class="btn_menu">
			<div class="set">설정</div>
			<div class="profile_manage">프로필관리</div>
			<div class="privacy">개인정보관리</div>
			<div class="stop">탈퇴하기</div>
		</div>
		<div class="contents">
			<div class="title">탈퇴하기</div>
			<div class="box">
				 <div class="desc">
					 탈퇴하시면 이용 중인 아트가 폐쇄되며
					 <br>
					 <b>모든 데이터는 복구가 불가능합니다.</b>
					 <br>
					  아래 사항을 확인하신 후에 신중하게 결정해 주세요.
				 </div>
				 <span class="ico_dot"> 작성한 글, 작품 모든 정보가 삭제됩니다.<br>작성한 댓글은 사라지지 않으니 미리 확인하시기 바랍니다.</span><br>
				  <div class="screen_out">
				   <label > 안내사항을 모두 확인하였으며, 이에 동의합니다.</label><input type="checkbox">
				  <br><br>
				   <input type="button" class="stopbtn" value="탈퇴하기">
				  </div>
			</div>
		</div>
	</div>
	
	<c:import url="footer.jsp"></c:import>
</body>
</html>