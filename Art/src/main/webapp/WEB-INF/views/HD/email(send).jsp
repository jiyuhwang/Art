<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class= "PbackgroundM"></div>
<div class ="PmainM">
<form action="fileUploadAjax" id="fileForm" method="post" enctype="multipart/form-data">
	<input type="file" id="attMail" name="attMail"> 
</form>
<form action="#" method="post" id="mailForm">
	<input type="hidden" id="emailForm" name="emailAdd">
	<input type="hidden" id="contentsForm" name="ctt">
	<input type="hidden" >
	<input type="hidden" id="fileFormM" name="file">
</form>
	<div class = "blank"></div>
	<div class = "blank"> 이메일 전송</div>
	<div class = "blank1"></div>
	<div class = "sideBlank"></div>
	<div class = "contentBoard">
			<div class = "forTitle">
				<span>제목</span><input type="text" id="titleForm" name="title" placeholder="제목을 입력하세요.">
			</div>
			<div class = "contentBlank"></div>
			<div class = "forTitle">
				<span>첨부</span><input class = "downSide" type="text" placeholder="제목을 입력하세요.">
				<input type="button" value="불러오기" id="fileBtn">
			</div>
			<div class = "forText">
				<span>내용</span><br>
				<textarea placeholder="내용을 입력하세요." class="getContents"></textarea>
			</div>
	</div>
	<div class = "contentBoard2">
			<div class = "forTitle">
				
			</div>
			<div class = "contentBlank">
			</div>
			<div class = "contentBlank2">
				<div id="selectUser" >선택된 회원</div>
			</div>
			<div class = "forBoard">
				<table>
				<thead>
					<tr>
						<th> no</th>
						<th> 이름</th>
						<th> 이메일</th>
						<th> 전화번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> rowNtm</td>
						<td> 홍길동</td>
						<td> wkljdf@naver.com</td>
						<td> 010-4395-7130</td>
					</tr>
				</tbody>
				</table>
			</div>
			<div class = "forButton">
				<div class = "contentBlank2"></div>
				<input type="button" value="보내기" id="sendBtnM">
				<input type="button" value="취소" id="canel_btnM">
			</div>
	</div>
</div>
</body>
</html>