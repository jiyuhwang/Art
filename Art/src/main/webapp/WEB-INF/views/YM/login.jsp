<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Art 로그인</title>
<style type="text/css">

.wrap{
   text-align: center;
   height : 370px;
   width : 400px;
   margin: 0 auto;
   border : 1px solid #e5e5e5;
   margin-top: 200px;
   
}

#userId, #userPw {
	width: 250px;
	height: 45px;
	border: 0;
	font-size: 12pt;
	outline: none;
	border-bottom: 2px solid #e5e5e5;
}

.a{
  text-align: center;

}

#btnLogin{
   width : 250px;
   height : 50px;
   background-color: #ffad33;
   border: none;
   border-radius: 20px;
   color: #fff;
   font-size: 15px;
   cursor: pointer;
}

a {
	color: inherit;
	text-decoration: none;
}

</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnLogin").on("click", function() {
			if($.trim($("#userId").val()) == "") {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
			} else if($.trim($("#userPw").val()) == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPw").focus();
			} else {
				// form의 data를 문자열로 전환
				var params = $("#loginForm").serialize();
				console.log(params);
				// ajax
				$.ajax({
					url: "Logins", // 접속 주소
					type: "post", // 전송 방식: get, post
					dataType: "json", // 받아올 데이터 형태
					data: params, // 보낼 데이터(문자열 형태)
					success: function(res) { // 성공 시 다음 함수 실행
						if(res.resMsg == "success") {
							location.href = "main";
						} else {
							$('.incorrect').html("아이디 또는 비밀번호가 일치하지 않습니다.");
							$('.incorrect').css("color", "red");
							$('.incorrect').css("text-align", "left");
						}
					},
					error: function(request, status, error) { // 실패 시 다음 함수 실행
						console.log(error);
					}
				});
			}
		});
	})
</script>
</head>
<body>
<form action="#" id="loginForm">
	<div class = "wrap">
	     <div class="login"><h1>Art 로그인</h1></div>
	         <input type="text" placeholder="아이디" id="userId" name="userId">
	   <br><br>            
		     <input type="password" placeholder="비밀번호" id="userPw" name="userPw">
	   <br><br>
	   		 <span class="incorrect"></span>
	   <br><br>
	         <input type="button" id="btnLogin" value="로그인하기">
	   <br><br>
			<a href="agree">회원가입</a> |
			<a href="#">아이디찾기</a> |
			<a href="#">비밀번호 찾기 </a>                   
	</div>
</form>
</body>

</html>