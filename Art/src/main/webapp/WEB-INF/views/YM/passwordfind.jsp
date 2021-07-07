<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
body {
	margin: 0;
}
.wrap {
	width: 460px;
	height: 500px;
	margin: 0 auto;
	padding: 30px;
	margin-top: 80px;
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

.top2 {
	background-color: #ffad33;
	height: 80px;
	padding-top: 50px;
}


.idfind, .pwfind {
	font-size: 12pt;
    padding:5px;
    text-align:center;
    width:200px;
    margin-top:5px;
    line-height:65px;
    font-weight:700;
    border-radius:3px 3px 0 0;
    background: white;
    color: black;
    border-width:1px 1px 0;
    cursor: pointer;
    border: none;
}

.idfind{
	margin-left: calc(50% - 250px);
}

.idfind:hover, .pwfind:hover {
	background-color: #ff9900;
}

</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
var code = ""; 
$(document).ready(function() {
	
	$(".pwfind").on("click", function(){
		    
			location.href = "passwordfind";   
	});
	
	
	$(".idfind").on("click", function(){
	    
		location.href = "idfind";   
	});	

	$("#emailSend").click(function(){
		if($.trim($("#userId").val()) == "") {
			alert("이름을 입력해주세요.");
			$("#userId").focus();
		} else if($.trim($("#userMail").val()) == "") {
			alert("이메일 주소를 정확하게 입력해주세요.");
			$("#userMail").focus();
		} else {
			// form의 data를 문자열로 전환
			var params = $("#pwFindForm").serialize();

			// ajax
			$.ajax({
				url: "passwordfinds", // 접속 주소
				type: "post", // 전송 방식: get, post
				dataType: "json", // 받아올 데이터 형태
				data: params, // 보낼 데이터(문자열 형태)
				success: function(res) { // 성공 시 다음 함수 실행
					if(res.resMsg == "success") {
					  alert("이메일 인증번호가 전송되었습니다.")
				      $("#checkMail").val(""); 
					  var email = $("#userMail").val();            // 입력한 이메일
					  var checkBox = $("#checkMail");        // 인증번호 입력란
					  
					    
					    $.ajax({
					        
					        type:"GET",
					        url:"mailCheck?email=" + email,
					        success:function(data){
					            
					        	checkBox.attr("disabled",false);
					        	code = data;

					        }
					                
					  });
					} else if(res.resMsg == "failed") {
						alert("탈퇴한 회원이거나 일치하는 회원정보가 없습니다.");
					} else {
						alert("로딩 중 문제 발생");
					}
				},
				error: function(request, status, error) { // 실패 시 다음 함수 실행
					console.log(error);
				}
			});
		}
	});
	
	$("#emailCheck").on("click", function(){
	    
	    var inputCode = $("#checkMail").val();        // 입력코드      
	    
	    if(inputCode == code){                            // 일치할 경우
	        alert("인증번호가 일치합니다.");        
	    } else {                                            // 일치하지 않을 경우
	        alert("인증번호를 다시 확인해주세요.");
	    }    
	    
	});
	
	$(".cancel").on("click", function() {
		location.href="login";
	
});
	
	
	$(".check").on("click", function() {
		if($.trim($("#userId").val()) == "") {
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
		} else if($.trim($("#userMail").val()) == "") {
			alert("이메일 주소를 정확하게 입력해주세요.");
			$("#userMail").focus();
		} else if($("#checkMail").val() == "") {
			alert("인증번호를 입력해주세요.");
			$("#checkMail").focus();
		} else if($("#checkMail").val() != code) {
			alert("이메일 인증번호가 틀립니다.");
		} else {
			var email = $("#userMail").val(); 
			
			
        	$.ajax({
		        
		        type:"GET",
		        url:"exPwMail?email=" + email,
		        success:function(data){
		     		console.log(data);
		        	code = data;
		        	$('#pw').val(code);
		        	$("#pwFindForm").attr("action", "findPw");
					$("#pwFindForm").submit();
					
					
		        }
		                
		  });

    	}
	});
});
</script>
</head>
<body>
<form action="#" id="pwFindForm" method="post">
<input type="hidden" id="pw" name="pw" >
<div class="top2">
	<input type="button" class="idfind" value="아이디 찾기">
	<input type="button" class="pwfind" value="비밀번호 찾기">	
</div>
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