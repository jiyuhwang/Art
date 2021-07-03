<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
<link rel="stylesheet" href="resources/css/HD/user_board.css"/>
<style type="text/css">
.Pbackground{
	width : 100%;
	height : 100%;
	background-color: black;
	opacity: 0.4;
	position: absolute;
	left : 0;
	top : 0;
	z-index:10;
}
.Pmain{
	width : 400px;
	height: 300px;
	background-color: #E0E7E9;
	position: absolute;
	left :50%;
	top: 50%;
	margin-left : -180px;
	margin-top : -190px;
	font-size: 15pt;
	border-radius: 7px;
	z-index:10;
}
.Pmain .topBlank{
	height: 30px;
	width: 100%;
	background-color: RGBA;
}
.Pmain .middleBlank{
	width : 100%;
	height: 250px;
	background-color: Rgba;
	margin : 0 auto;
	text-align: center;
}
.Pmain input{
	width : 250px;
	height : 30px;
	padding : 5px;
}
.Pmain .title{
	width : 100%;
	height: 50px;
	font-size: 15pt;
	text-align: center;
	margin-bottom: 10px;
}
.Pmain .bottomBlank{
	width : 100%;
	height: 30px;
	padding-bottom: 10px; 
}
.Pmain button{
	width:150px;
	height: 45px;
	border-radius: 9px;
	font-size: 15pt;
	font-weight: bold;
	cursor: pointer;
	border: none;
	margin: 0 5px;
}
.Pmain button:hover{
	background-color: #0C4A60;
	color: white;
}
.Pmain #id{
	margin-bottom : 10px;
}

</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready( function () {
	 $(".delete_btn").on("click", function () {
	/* 	var html =	
 					"<c\:import url=\"login.jsp\"><\/c\:import>" 
 			
					 "<div class = \"Pbackground\"></div>" +
						"<div class = \"Pmain\">" +
							"<div class = \"topBlank\"></div>" +
							"<div class = \"middleBlank\">" +
							"<div class = \"title\">로그인이 필요합니다.</div>" +
							"<input type=\"text\" placeholder=\"아이디\" id=\"id\"><br>" +
							"<input type=\"password\" placeholder=\"비밀번호\">" +
							"<div class =\"bottomBlank\"></div>" +
							"<button id=\"cancel_btn\">cancel</button>" +
							"<button>ok</button>" +
						"</div>" +
					"</div>";                                                       
			 
		$("body").prepend(html);*/
		window.open("login.jsp","로그인창");
		
		
		$("#cancel_btn").on("click", function () {
			$(".Pbackground, .Pmain").remove();
		}); 
	});//deletbtn end
	
});
	

</script>
</head>
<body>



<div class="header">

</div>
<div class="content">
	<div class ="side">
		<div class ="blank"></div>
		<div class ="member">회원관리</div>
		<div class ="tag">태그관리</div>
		<div class ="product">작품관리</div>
		<div class ="warning">신고관리</div>
		<div class ="gong">공지사항</div>
	 </div>
	<div class ="main">
		
		<div> </div>
		<div class ="blank2"></div>
		
		<div class ="bigClass">
			<div class ="bigClass-1">전체회원</div>
			<div class ="bigClass-2">탈퇴회원</div>
		</div>
		<div class="main1">
			<div class="main1-1">
				<span><span class="font-red">검색어를 입력</span>하여 검색할 수 있습니다.</span><br/>
				<span><span class="font-red">수정버튼</span>을 클릭하시면 수정할 수 있습니다.</span><br/>
				<span><span class="font-red">데이터가 많은 경우</span> 느려질 수 있습니다.</span>
			</div>
		</div>
		<div class ="main2">
			<div class="main2-1">
				<label>회원분류</label>
				<select>
					<option> 전체회원</option>
					<option> 작년회원</option>
				</select>
				<label>검색분류</label>
				<select>
					<option value="title">회원번호</option>
					<option value="writer">이름</option>
					<option value="number">아이디</option>
					<option value="content">전화번호</option>
					<option value="repoter">성별</option>
					<option value="process">나이</option>
				</select>
			     <input type="text" placeholder="검색어를 입력해주세요.">
			     <button>검색</button>
				<div class="date_search">
					<label>날짜분류</label>
						<input type="date">
						<span> ~ </span>
						<input type="date">
						<button>검색</button>
				</div>
			</div>
		</div>
		<div class="main3">
			<input type="button" value="등록"/>
			<input type="button" value="이메일"/>
		</div>
		<div class="main3-table">
			<table>
				<colgroup>
						<col width="2%"/>
						<col width="5%"/>
						<col width="5%"/>
						<col width="5%"/>
						<col width="8%"/>
						<col width="8%"/>
						<col width="5%"/>
						<col width="8%"/>
						<col width="13%"/>
						<col width="13%"/>
						<col width="10%"/>
						<col width="10%"/>
					</colgroup>
			<thead>
				<tr>
					<th>
					<input type="checkbox" id="ex_chk"> 
					</th>
					<th>번호</th>
					<th>회원번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>닉네임(아이디)</th>
					<th>성별</th>
					<th>생년월일(나이)</th>
					<th>전화번호</th><!--신고자 닉네임(아이디)  -->
					<th>이메일</th>
					<th>가입일</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ex_chk"> </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>남</td>
					<td>2021-05-07(35)</td>
					<td>010-0000-0000</td>
					<td>wjdfka954@naver.com</td>
					<td>2021-05-04</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
			</tbody>
			</table>
		</div>
		<div class ="status"> 전체 : 100명</div>
	</div>

</div>
</body>
</html>