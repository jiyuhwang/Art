<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의</title>
</head>
<style type="text/css">
h1 {
	font-size: 70px;
	margin-top: 30px;
	margin-bottom: 40px;
	text-align: center;
}
*{
	
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body{

	background-color: #f7f7f7;
}

ul>li{
	
	list-style: none
}

a{

	text-decoration: none;
}

.clearfix::after{

	content: "";
	display: block;
	clear: both;
}

#joinForm{

	width: 450px;
	margin: 0 auto;
}

ul.join_box{
	
	border: 1px solid #ddd;
	background-color: #fff;
}

.checkBox,.checkBox>ul{

	position: relative;
	margin-bottom: 15px;
}

.checkBox>ul>li{

	float: left;
}

.checkBox>ul>li:first-child{

	width: 85%;
	padding: 15px;
	font-weight: 600;
	color: #888;
}

.checkBox>ul>li:nth-child(2){

	position: absolute;
	top: 50%;
	right: 30px;
	margin-top: -12px;
}

.checkBox textarea{

	width: 96%;
	height: 90px; 
	margin: 0 2%;
	background-color: #f7f7f7;
	color: #888; 
	border: none;
}

.footBtwrap{

margin-top: 15px;}
.footBtwrap>li{

	float: left;
	width: 50%;
	height: 60px;
}

.footBtwrap>li>button{

	display: block;
	width: 100%;
	height: 100%; 
	font-size: 20px; 
	bortext-align: center;
	line-height: 60px;
	border: none;
}

.fpmgBt1{
	
	background-color: #fff;
	color:#888;
	cursor:pointer;
}

.fpmgBt2{
	background-color: #ffad33;
	color: #fff;
	cursor:pointer;
}

</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#all").on("click", function() {
		if($(this).is(" :checked")) {
			$("#wrap input").prop("checked", true);
	 } else {	
		 $("#wrap input").prop("checked", false);
	 }
	
	 checkTxt();
	}
</script>
<body>
<form action="" id="joinForm">
		<h1>Art</h1>
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용, 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" onclick='selectAll(this)' id="chk" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk"> 
                        </li>
                    </ul>
                    <textarea name="" id="">내용을 입력

       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="">내용을 입력
       </textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
                 <textarea name="" id="">내용을 입력.
       </textarea>
                </li>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button class="fpmgBt1" type="button">비동의</button></li>
                <li><button class="fpmgBt2" type="button">동의</button></li>
            </ul>
        </form>
</body>
</html>
