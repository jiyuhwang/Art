<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit</title>
<link rel="stylesheet" href="resources/css/JY/edit.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("contentsIn", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2",
		width: "1330",
		height: "500",
		removeButtons: 'Subscript,Superscript,Flash,PageBreak,Iframe,Language,BidiRtl,BidiLtr,CreateDiv,ShowBlocks,Save,NewPage,Preview,Templates,Image'
	});
});
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty sUserNo}">
			<c:import url="header2.jsp"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="header.jsp"></c:import>
		</c:otherwise>
	</c:choose>
	
	<div class="wrap">
		<div class="upload_wrap">
			<input type="button" id="upload" value=""/>
			<div class="upload_txt">작품을 올려주세요.</div>
		</div>
		<div class="select_w">
			<select class="select">
				<option value="0" selected="selected">카테고리</option>
				<option value="1">사진작품관</option>
				<option value="2">그림작품관</option>
				<option value="2">영상작품관</option>
			</select>
		</div>

		<div class="title_input_w"><input id="titleInput" type="text" value="" placeholder="제목을 입력해주세요."></div>
		<div class="contents_in_w"><textarea id="contentsIn" name="contentsIn" cols="80" rows="10" placeholder="작품을 뽐내주세요."></textarea></div>

		<div class="tag_input_w"><input id="tagInput" type="text" value="" placeholder="태그를 입력해주세요.(예 : #구름)"></div>
		<div class="secret">공개 설정</div>
		<div class="public_privacy">
			<input name="public" type="radio" checked="checked" /><label for="public" id="public">공개</label>
			<input name="privacy" type="radio" /><label for="privacy" id="privacy">비공개</label>
		</div>
		<br />
		<div class="save_cancel">
			<input id="btnSave" type="button" value="수정하기">
			<input id="btnCancel" type="button" value="취소하기">
		</div>
	</div>
	
	<c:import url="footer.jsp"></c:import>
</body>
</html>