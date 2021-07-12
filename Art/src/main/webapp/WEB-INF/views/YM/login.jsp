<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Art 로그인</title>
<style type="text/css">
a {
	color: inherit;
	text-decoration: none;
}

#loginForm2 {
    width: 800px;
    padding: 70px;
    border: 1px solid #ccc;
    margin: 150px auto;
    overflow: hidden;
}

.logo3 {
    width: 200px;
    height: 200px;
    border-radius: 50%;
    overflow: hidden;
    float: left;
    margin-right: 50px;
}

#loginForm2 form {
    height: 200px;
    padding-left: 50px;
    border-left: 2px dashed #ccc;
    float: left;
}

#loginForm2 form fieldset {
    width: 466px;
    border: 1px solid #ccc;
    margin-bottom: 15px;
    position: relative;
}

#loginForm2 form fieldset legend {
    font-size: 30px;
    font-weight: 900;
    margin-left: 20px;
}

#loginForm2 form fieldset ul {
    list-style: none;
}

#loginForm2 form fieldset ul li {
    margin-bottom: 15px;
}

#loginForm2 form fieldset ul li label {
    width: 75px;
    display: inline-block;
    font-weight: 900;
    color: #333;
}

#loginForm2 form fieldset ul li input {
    padding: 10px;
}

#saveId2 {
	margin-right: 50px;
}

#btnLogin {
    width: 100px;
    padding: 15px;
    position: absolute;
    top: 40px;
    right: 30px;
    background-color: #ffad33;;
    border: none;
    font-weight: 900;
    color: #333;
    cursor: pointer;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script src="resources/script/jquery/jquery.cookie.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		$('#loginForm').keypress(function(event){
		     if (event.which == 13 ) {
		         $('#btnLogin').click();
		         return false;
		     }
		});
		
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
<div id="loginForm2">
        <div class="logo3"><img src="resources/images/JY/art2.png" alt="art" width="200px" height="200px"></div>
        <form action="#" id="loginForm" method="post" >
            <fieldset>
                <legend>Art 로그인</legend>
                <ul>
                    <li>
                        <label for="userId">아이디</label>
                        <input type="text" id="userId" name="userId" placeholder="ID" value="${param.id}">
                    </li>
                    <li>
                        <label for="userPw">비밀번호</label>
                        <input type="password" id="userPw" name="userPw" placeholder="PASSWORD">
                    </li>
                </ul>
                <input type="button" id="btnLogin" value="로그인">
                <span class="incorrect"></span>
            </fieldset>
           	<a href="agree">회원가입</a> |
			<a href="idfind">아이디찾기</a> |
			<a href="passwordfind">비밀번호 찾기 </a>   
        </form>
    </div>
</body>

</html>