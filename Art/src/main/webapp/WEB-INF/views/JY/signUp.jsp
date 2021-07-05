<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Art 회원가입</title>
<link rel="stylesheet" href="resources/css/JY/signUp.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript" src="resources/script/JY/signUp.js"></script> -->
<script type="text/javascript">

var code = "";                //이메일전송 인증번호 저장위한 코드

$(document).ready(function() {
	$("#btnMailSend").click(function(){
	    
		  var email = $("#mailInput").val();            // 입력한 이메일
		  var checkBox = $("#mailCheckInput");        // 인증번호 입력란
		  var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
		    
		    $.ajax({
		        
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
		            
		            //console.log("data : " + data);
		        	checkBox.attr("disabled",false);
		        	boxWrap.attr("id", "mail_check_input_box_true");
		        	code = data;
		        }
		                
		  });
	});
	
	/* 인증번호 비교 */
	/* $("#mailCheckInput").blur(function(){
	    
	    var inputCode = $("#mailCheckInput").val();        // 입력코드    
	    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
	    
	    if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");        
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    }    
	    
	}); */
	
	$("#btnMailSend").on("click", function(){
	    
	    alert("이메일 인증번호가 전송되었습니다.");
	    $("#mailCheckInput").val(""); 
	});
	
	$("#btnMailCheck").on("click", function(){
	    
	    var inputCode = $("#mailCheckInput").val();        // 입력코드    
	    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
	    
	    if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");        
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    }    
	    
	});
	
	
	
	/* $("#btnIdCheck").on("click", function(){
	    
		var userId= $("#idInput").serialize();
		
		$.ajax({
			url : "idCheck",
			type : "post",
			dataType : "json",
			data : userId,
			success: function(res) { // 성공 시 다음 함수 실행
				if(res.msg == "exist") {
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				} else if(res.msg == "none") {
					 alert("사용가능한 아이디입니다.");
				} else {
					alert("작성 중 문제가 발생하였습니다.")
				}
			},
			error: function(request, status, error) { // 실패 시 다음 함수 실행
				console.log(error);
			}
		})
	    
	}); */
	
	$('.id_wrap').on("propertychange change keyup paste input", function(){

		var userId= $("#idInput").serialize();
		
		$.ajax({
			url : "idCheck",
			type : "post",
			dataType : "json",
			data : userId,
			success: function(res) { // 성공 시 다음 함수 실행
				if(res.msg == "exist") {
					/* alert("아이디가 존재합니다. 다른 아이디를 입력해주세요."); */
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");
					$('.id_input_re_3').css("display", "none");
				} else if(res.msg == "none") {
					 /* alert("사용가능한 아이디입니다."); */
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");	
					$('.id_input_re_3').css("display", "none");	
				} else {
					alert("작성 중 문제가 발생하였습니다.")
				}
			},
			error: function(request, status, error) { // 실패 시 다음 함수 실행
				console.log(error);
			}
		})	

	});// function 종료
	
	
	$('.nickname_wrap').on("propertychange change keyup paste input", function(){
		
		var userNickname= $("#nicknameInput").serialize();

		$.ajax({
			url : "nicknameCheck",
			type : "post",
			dataType : "json",
			data : userNickname,
			success: function(res) { // 성공 시 다음 함수 실행
				if(res.msg == "exist") {
					/* alert("닉네임이 존재합니다. 다른 닉네임을 입력해주세요."); */
					$('.nickname_input_re_2').css("display","inline-block");
					$('.nickname_input_re_1').css("display", "none");
					$('.nickname_input_re_3').css("display", "none");
				} else if(res.msg == "none") {
					 /* alert("사용가능한 닉네임입니다."); */
					$('.nickname_input_re_1').css("display","inline-block");
					$('.nickname_input_re_2').css("display", "none");	
					$('.nickname_input_re_3').css("display", "none");	
				} else {
					alert("작성 중 문제가 발생하였습니다.")
				}
			},
			error: function(request, status, error) { // 실패 시 다음 함수 실행
				console.log(error);
			}
		})

	});// function 종료
	$('#idInput').click(function() {
		$('html').click(function(e) {
			if(!$(e.target).hasClass("id_wrap") && $('#idInput').val() == "") {
				$('.id_input_re_1').css("display", "none");
				$('.id_input_re_2').css("display", "none");
				$('.id_input_re_3').css("display","inline-block");
			} else {
				$('.id_input_re_3').css("display","none");
			}
		});
	});
	
	$('#nicknameInput').click(function() {
		$('html').click(function(e) {
			if(!$(e.target).hasClass("nickname_wrap") && $('#nicknameInput').val() == "") {
				$('.nickname_input_re_1').css("display", "none");
				$('.nickname_input_re_2').css("display", "none");
				$('.nickname_input_re_3').css("display","inline-block");
			} else {
				$('.nickname_input_re_3').css("display","none");
			}
		});
	});
	
	$('#pwInput').click(function() {
		$('html').click(function(e) {
			if(!$(e.target).hasClass("pw_wrap") && $('#pwInput').val() == "") {
				$('.pw_input_re_3').css("display","inline-block");
			} else {
				$('.pw_input_re_3').css("display","none");
			}
		});
	});
	
	$('#pwckInput').click(function() {
		$('html').click(function(e) {
			if(!$(e.target).hasClass("pwck_wrap") && $('#pwckInput').val() == "") {
				$('#check1').css("display","none");
				$('#check2').css("display","none");
				$('.pwck_input_re_3').css("display","inline-block");
			} else {
				$('#check1').css("display","inline-block");
				$('#check2').css("display","inline-block");
				$('.pwck_input_re_3').css("display","none");
			}
		});
	});
	
	$('#nameInput').click(function() {
		$('html').click(function(e) {
			if(!$(e.target).hasClass("name_wrap") && $('#nameInput').val() == "") {
				$('.name_input_re_3').css("display","inline-block");
			} else {
				$('.name_input_re_3').css("display","none");
			}
		});
	});
	
	$('#phoneInput').click(function() {
		$('html').click(function(e) {
			if(!$(e.target).hasClass("phone_wrap") && $('#phoneInput').val() == "") {
				$('.phone_input_re_3').css("display","inline-block");
			} else {
				$('.phone_input_re_3').css("display","none");
			}
		});
	});
	
	$('.birth_wrap').click(function() {
		$('html').click(function(e) {
			if(!$(e.target).hasClass("birth_wrap") && $('#birthYear').val() == "" || $("select[name=birthMonth]").val() == '월' || $('#birthDay').val() == "") {
				$('.birth_input_re_3').css("display","inline-block");
			} else {
				$('.birth_input_re_3').css("display","none");
			}
		});
	});
	
	$('#mailInput').click(function() {
		$('html').click(function(e) {
			if(!$(e.target).hasClass("mail_wrap") && $('#mailInput').val() == "") {
				$('.mail_input_re_3').css("display","inline-block");
			} else {
				$('.mail_input_re_3').css("display","none");
			}
		});
	});
	
	/* $("#btnNicknameCheck").on("click", function(){
	    
		var userNickname= $("#nicknameInput").serialize();
		
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
	    
	}); */
	
	$("#btnJoin").on("click", function(){
	    
		if($("#idInput").val() == "") {
			$("#idInput").focus();
		} else if($('.id_input_re_2').css("display") == "inline-block") {
			$("#idInput").focus();
		} else if($("#nicknameInput").val() == "") {
			$("#nicknameInput").focus();
		} else if($('.nickname_input_re_2').css("display") == "inline-block") {
			$("#nicknameInput").focus();
		} else if($("#pwInput").val() == "") {
			$("#pwInput").focus();
		} else if($("#pwckInput").val() == "") {
			$("#pwckInput").focus();
		} else if($("#pwInput").val() != $("#pwckInput").val()) {
			$("#pwInput").val("");
			$("#pwckInput").val("");
			$("#pwInput").focus();
		} else if($("#nameInput").val() == "") {
			$("#nameInput").focus();
		} else if($("#phoneInput").val() == "") {
			$("#phoneInput").focus();
		} else if($("#birthYear").val() == "") {
			$("#birthYear").focus();
		} else if($("select[name=birthMonth]").val() == '월') {
			$(".birth_select").focus();
		} else if($('#birthDay').val() == "") {
			$("#birthDay").focus();
		} else if($("#mailInput").val() == "") {
			$("#mailInput").focus();
		} else if($("#mail_check_input_box_warn").html() != "인증번호가 일치합니다." || $("#mailCheckInput").val() == "") {
			$("#mail_check_input_box_warn").html("인증번호를 다시 확인해주세요.");
			$("#mail_check_input_box_warn").attr("class", "incorrect");  
			$("#mailCheckInput").focus();
		}  else {
			
			var params= $("#joinForm").serialize();
		
			$.ajax({
				url: "signUps", // 접속 주소
				type: "post", // 전송 방식: get, post
				dataType: "json", // 받아올 데이터 형태
				data: params, // 보낼 데이터(문자열 형태)
				success: function(res) { // 성공 시 다음 함수 실행
					if(res.msg == "success") {
						alert("회원가입이 완료되었습니다.");
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
	 
    var pw = document.getElementById('pwInput').value;
    /* var SC = ["!","@","#","$","%"];
    var check_SC = 0; */

    
    if(document.getElementById('pwInput').value !='' && document.getElementById('pwckInput').value!=''){
        if(document.getElementById('pwInput').value==document.getElementById('pwckInput').value){
            document.getElementById('check2').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check2').style.color='green';
            $('.pw_input_re_3').css("display","none");
            $('.pwck_input_re_3').css("display","none");
        }
        else{
            document.getElementById('check2').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check2').style.color='red';
            $('.pw_input_re_3').css("display","none");
            $('.pwck_input_re_3').css("display","none");
        }
    }   
}
</script>
</head>
<body>
<div class="subjecet">
	<span>Art 회원가입</span>
</div>
<form action="#" id="joinForm" method="post">
<div class="wrapper">
	<div class="wrap">
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input id="idInput" name="userId" placeholder="아이디 입력">
				</div>
				<!-- <input type="button" id="btnIdCheck" value="중복확인"> -->
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="id_input_re_3">필수 정보입니다.</span>
			</div>
			<div class="nickname_wrap">
				<div class="nickname_name">닉네임</div>
				<div class="nickname_input_box">
					<input id="nicknameInput" name="userNickname" placeholder="닉네임 입력">
				</div>
				<!-- <input type="button" id="btnNicknameCheck" value="중복확인"> -->
				<span class="nickname_input_re_1">사용 가능한 닉네임입니다.</span>
				<span class="nickname_input_re_2">닉네임이 이미 존재합니다.</span>
				<span class="nickname_input_re_3">필수 정보입니다.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input type="password" id="pwInput" name="userPw" onchange="check_pw()" placeholder="비밀번호 입력">
					<span id="check1"></span>
				</div>
				<span class="pw_input_re_3">필수 정보입니다.</span>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input id="pwckInput" type="password" onchange="check_pw()" placeholder="비밀번호 재입력">
					<span id="check2"></span>
				</div>
				<span class="pwck_input_re_3">필수 정보입니다.</span>
			</div>
			<div class="name_wrap">
				<div class="name">이름</div>
				<div class="name_input_box">
					<input id="nameInput" name="userName"  placeholder="이름 입력">
				</div>
				<span class="name_input_re_3">필수 정보입니다.</span>
			</div>
			<div class="sex_wrap">
				<div class="sex_name">성별</div>
				<div class="sex_input_box">
					<input type="radio" value="0" name="gender" value="남" checked ="checked">남 
        			<input type="radio" value="1" name="gender" value="여">여 
				</div>
			</div>
			<div class="phone_wrap">
				<div class="phone_name">휴대폰번호</div>
				<div class="phone_input_box">
					<input type="number" id="phoneInput" name="userPhone" placeholder="010-****-****">
				</div>
				<span class="phone_input_re_3">필수 정보입니다.</span>
			</div>
			<div class="birth_wrap">
				<div class="birth_name">생년월일</div>
				<div class="birth_input_box">
					<input type="number" id="birthYear" name="birthYear" placeholder="년(4자)" maxlength="4">
					<select name="birthMonth" class="birth_select">
						<option>월</option>
				      	<option value="1">1</option>
				      	<option value="2">2</option>
				      	<option value="3">3</option>
				      	<option value="4">4</option>
				      	<option value="5">5</option>
				      	<option value="6">6</option>
				      	<option value="7">7</option>
				      	<option value="8">8</option>
				      	<option value="9">9</option>
				      	<option value="10">10</option>
				      	<option value="11">11</option>
				      	<option value="12">12</option>
		 			</select>
		 			<input type="number" id="birthDay" name="birthDay" placeholder="일" maxlength="2">			
				</div>
				<span class="birth_input_re_3">필수 정보입니다.</span>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input id="mailInput" name="userMail" placeholder="이메일 주소 입력">
				</div>
				<div id="btnMailSend">
					<span>인증번호 전송</span>
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input id="mailCheckInput" name="userMailCheck" disabled="disabled">
					</div>
					<div id="btnMailCheck">
						<span>확인</span>
					</div>
					<div class="clearfix"></div>
					 <span id="mail_check_input_box_warn"></span>
					 <span class="mail_input_re_3">필수 정보입니다.</span>
				</div>
			</div>
		</div>
</div>
<div class="join_button_wrap">
	<input type="button" id="btnJoin" value="가입하기">
</div>
	<input type="hidden" id="eventAgree" name="eventAgree" value="${param.eventAgree}" /><br/>
</form>
</body>
</html>