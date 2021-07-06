<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
.wrap {
	width: 460px;
	height: 500px;
	margin: 0 auto;
	padding: 30px;
	margin-top: 100px;
	border: solid 1px;
	text-align: center;
	border: 1px solid #e5e5e5;
}

#id1 {
	font-size: 10pt;
	margin-bottom: 3px;
	margin-right: 290px;
}
#id2 {
	font-size: 10pt;
	margin-bottom: 5px;
	margin-right: 275px;
}
#id3 {
	font-size: 10pt;
	margin-bottom: 5px;
	margin-right: 290px;
}

.a {
   text-align:center;
}

#userId {
  width:340px;
    height:50px;
    border: 0;
    outline: none;
    font-size: 14pt;
    border-bottom: 2px solid #e5e5e5;
    margin-bottom: 20px;
}
#userMail {
  	width: 235px;
    height: 30px;
    border: 0;
    outline: none;
    font-size: 14pt;
    border-bottom: 2px solid #e5e5e5;
    margin-bottom: 20px;
}

.c3{
  width: 100px;
  height: 40px;
  display: inline-block;
  background-color: #ffad33;
  position : relative;
  color: #fff;
  font-size: 14px;
  cursor:pointer;
  border:none;
  border-radius: 20px;
}

#checkMail{
 	width: 235px;
 	height: 30px;
    border: 0;
    outline: none;
    font-size: 14pt;
    border-bottom: 2px solid #e5e5e5;
    margin-bottom: 20px;
}
.cancel{
 	margin-left: 10px;
 	height:40px;
 	width: 90px;
	font-size: 20px;
	color: #888;
	border: 0;
	cursor:pointer;
	border-radius: 10px;
}

.check{
	margin-left: 30px;
	height:40px;
	background-color: #ffad33;
	width: 90px;
	border:none;
	margin-left: 50px;
	font-size: 20px;
	color: #fff;
	cursor:pointer;
	border-radius: 10px;
}

</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".check").on("click", function() {
		if($.trim($("#userId").val()) == "") {
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
		} else if($.trim($("#userMail").val()) == "") {
			alert("이메일 주소를 정확하게 입력해주세요.");
			$("#userMail").focus();
		} else {
			// form의 data를 문자열로 전환
			var params = $("#pwFindForm").serialize();
			console.log(params);
			// ajax
			$.ajax({
				url: "pwfinds", // 접속 주소
				type: "post", // 전송 방식: get, post
				dataType: "json", // 받아올 데이터 형태
				data: params, // 보낼 데이터(문자열 형태)
				success: function(res) { // 성공 시 다음 함수 실행
					if(res.Msg == "success") {
						location.href = "main";
					} else {
						$('.incorrect').html("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다");
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
<form action="#" id="pwFindForm">
<div class="wrap">
	<div class="a"><h1>비밀번호 찾기</h1></div>
	<div class="c"><h2>이메일 인증</h2></div>
	<span>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, <br> 인증번호를 받을 수 있습니다.</span>
	<br><br>
	<div id="id1">아이디</div>
	<input type="text" id="userId" name="userId" placeholder="아이디">
<br>
	<div id="id2">이메일주소</div>	
	<input type="text" id="userMail" name="userMail" placeholder="이메일주소">
	<input type="button" id="emailSend" class="c3" value="인증번호받기">
<br>
	<div id="id3">인증번호</div>
	<input type="text" id="checkMail" name="userMailCheck" placeholder= "인증번호입력" disabled="disabled">
	<input type="button" class="c3" id="emailCheck" value="확인">
<br><br>
	<input type="button" class="cancel" value="취소">
	<input type="button" class="check" value="확인">
	
</div>
</form>
</body>
</html>