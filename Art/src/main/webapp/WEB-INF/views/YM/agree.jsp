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
[type="button"] {
	cursor: pointer;
}

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
	margin-top: 15px;
}
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

.footBtwrap_clearfix {
	margin-top: 20px;
	text-align: center;
}

.fpmgBt1{
	width: 150px;
	height: 60px;
	background-color: #fff;
	color:#888;
	display: inline-block;
	border: none;
	margin-right: 20px;
}

.fpmgBt2{
	width: 150px;
	height: 60px;
	background-color: #ffad33;
	color: #fff;
	display: inline-block;
	border: none;
}

</style>
<body>
<form action="" id="joinForm">
		<h1>Art</h1>
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용, 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chk" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="check"> 
                        </li>
                    </ul>
                    <textarea name="" id="">내용을 입력

       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="check">
                        </li>
                    </ul>
 
                    <textarea name="" id="">내용을 입력
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="check" value="0">
                        </li>
                    </ul>
                 <textarea name="" id="">내용을 입력.
       </textarea>
                </li>
            </ul>
            <div class="footBtwrap_clearfix">
                <input type="button" class="fpmgBt1" type="button" value="비동의">
                <input type="button" class="fpmgBt2" type="button" value="동의">
                
            </div>
        </form>

</body>
</html>