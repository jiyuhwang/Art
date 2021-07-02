<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Art 회원가입</title>
<link rel="stylesheet" href="resources/css/JY/sign_up.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
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
});

function check_pw(){
	 
    var pw = document.getElementById('pwInput').value;
    /* var SC = ["!","@","#","$","%"];
    var check_SC = 0; */

    
    if(document.getElementById('pwInput').value !='' && document.getElementById('pwckInput').value!=''){
        if(document.getElementById('pwInput').value==document.getElementById('pwckInput').value){
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
<div class="subjecet">
	<span>Art 회원가입</span>
</div>
<form action="">
<div class="wrapper">
	<div class="wrap">
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input id="idInput" placeholder="아이디 입력">
				</div>
				<input type="button" id="btnIdCheck" value="중복확인">
			</div>
			<div class="nickname_wrap">
				<div class="nickname_name">닉네임</div>
				<div class="nickname_input_box">
					<input id="nicknameInput" placeholder="닉네임 입력">
				</div>
				<input type="button" id="btnNicknameCheck" value="중복확인">
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input type="password" id="pwInput" onchange="check_pw()" placeholder="비밀번호 입력">
					<div id="check1"></div>
				</div>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input id="pwckInput" type="password" onchange="check_pw()" placeholder="비밀번호 재입력">
					<div id="check2"></div>
				</div>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input id="userInput" name="memberName"  placeholder="이름 입력">
				</div>
			</div>
			<div class="sex_wrap">
				<div class="sex_name">성별</div>
				<div class="sex_input_box">
					<input type="radio" name="gender" value="남" checked ="checked">남 
        			<input type="radio" name="gender" value="여">여 
				</div>
			</div>
			<div class="phone_wrap">
				<div class="phone_name">휴대폰번호</div>
				<div class="phone_input_box">
					<input id="phoneInput" name="memberPhone"  placeholder="010-****-****">
				</div>
			</div>
			<div class="birth_wrap">
				<div class="birth_name">생년월일</div>
				<div class="birth_input_box">
				<select class="birth_select">
				<option>-- 선택 --</option>
		      	<option>1940</option>
		      	<option>1941</option>
		      	<option>1942</option>
		      	<option>1943</option>
		      	<option>1944</option>
		      	<option>1945</option>
		      	<option>1946</option>
		      	<option>1947</option>
		      	<option>1948</option>
		      	<option>1949</option>
		      	<option>1950</option>
		      	<option>1951</option>
		      	<option>1952</option>
		      	<option>1953</option>
		      	<option>1954</option>
		      	<option>1955</option>
		      	<option>1956</option>
		      	<option>1957</option>
		      	<option>1958</option>
		      	<option>1959</option>
		      	<option>1960</option>
		      	<option>1961</option>
		      	<option>1962</option>
		      	<option>1963</option>
		      	<option>1964</option>
		      	<option>1965</option>
		      	<option>1966</option>
		      	<option>1967</option>
		      	<option>1968</option>
		      	<option>1969</option>
		      	<option>1970</option>
		      	<option>1971</option>
		      	<option>1972</option>
		      	<option>1973</option>
		      	<option>1974</option>
		      	<option>1975</option>
		      	<option>1976</option>
		      	<option>1977</option>
		      	<option>1978</option>
		      	<option>1979</option>
		      	<option>1980</option>
		      	<option>1981</option>
		      	<option>1982</option>
		      	<option>1983</option>
		      	<option>1984</option>
		      	<option>1985</option>
		      	<option>1986</option>
		      	<option>1987</option>
		      	<option>1988</option>
		      	<option>1989</option>
		      	<option>1990</option>
		      	<option>1991</option>
		      	<option>1992</option>
		      	<option>1993</option>
		      	<option>1994</option>
		      	<option>1995</option>
		      	<option>1996</option>
		      	<option>1997</option>
		      	<option>1998</option>
		      	<option>1999</option>
		      	<option>2000</option>
		      	<option>2001</option>
		      	<option>2002</option>
		      	<option>2003</option>
		      	<option>2004</option>
		      	<option>2005</option>
		      	<option>2006</option>
		      	<option>2007</option>
		      	<option>2008</option>
		      	<option>2009</option>
		      	<option>2010</option>
		      	<option>2011</option>
		      	<option>2012</option>
		      	<option>2013</option>
		      	<option>2014</option>
		      	<option>2015</option>
		      	<option>2016</option>
		      	<option>2017</option>
		      	<option>2018</option>
		      	<option>2019</option>
		      	<option>2020</option>
		      	<option>2021</option>
			</select>
			<select class="birth_select">
				<option>-- 선택 --</option>
		      	<option>1</option>
		      	<option>2</option>
		      	<option>3</option>
		      	<option>4</option>
		      	<option>5</option>
		      	<option>6</option>
		      	<option>7</option>
		      	<option>8</option>
		      	<option>9</option>
		      	<option>10</option>
		      	<option>11</option>
		      	<option>12</option>
 			</select>
 			<select class="birth_select">
				<option>-- 선택 --</option>
		      	<option>1</option>
		      	<option>2</option>
		      	<option>3</option>
		      	<option>4</option>
		      	<option>5</option>
		      	<option>6</option>
		      	<option>7</option>
		      	<option>8</option>
		      	<option>9</option>
		      	<option>10</option>
		      	<option>11</option>
		      	<option>12</option>
		      	<option>13</option>
		      	<option>14</option>
		      	<option>15</option>
		      	<option>16</option>
		      	<option>17</option>
		      	<option>18</option>
		      	<option>19</option>
		      	<option>20</option>
		      	<option>21</option>
		      	<option>22</option>
		      	<option>23</option>
		      	<option>24</option>
		      	<option>25</option>
		      	<option>26</option>
		      	<option>27</option>
		      	<option>28</option>
		      	<option>29</option>
		      	<option>30</option>
		      	<option>31</option>
 			</select>
				</div>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input id="mailInput" name="memberMail" placeholder="이메일 주소 입력">
				</div>
				<div id="btnMailSend">
					<span>인증번호 전송</span>
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input id="mailCheckInput" disabled="disabled">
					</div>
					<div id="btnMailCheck">
						<span>확인</span>
					</div>
					<div class="clearfix"></div>
					 <span id="mail_check_input_box_warn"></span>
				</div>
			</div>
		</div>
</div>
<div class="join_button_wrap">
	<input type="button" id="btnJoin" value="가입하기">
</div>
	</form>
	<input type="hidden" id="check" name="check" value="${param.check}" /><br/>
</body>
</html>