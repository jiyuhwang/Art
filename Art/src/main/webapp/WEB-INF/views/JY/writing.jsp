<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writing</title>
<link rel="stylesheet" href="resources/css/JY/writing.css">
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
	<c:import url="header.jsp"></c:import>
	
	<div class="wrap">
		<!-- <div id="editPage">작품올리기</div> -->
		<!-- <div id="glySet">작품관 선택</div>
		<br /> -->
		<div id="uploadWrap">
			<input type="button" id="upload" value=""/>
			<div id="uploadTxt">작품을 올려주세요.</div>
		</div>
		<div id="setW">
			<select id="set">
				<option value="0" selected="selected">카테고리</option>
				<option value="1">사진작품관</option>
				<option value="2">그림작품관</option>
				<option value="2">영상작품관</option>
			</select>
		</div>
		<!-- <div id="title">제목</div> -->
		<div id="titleInputW"><input id="titleInput" type="text" value="" placeholder="제목을 입력해주세요."></div>
		<!-- <div id="contents">작품설명</div> -->
		<div id="contentsInW"><textarea id="contentsIn" name="contentsIn" cols="80" rows="10" placeholder="작품을 뽐내주세요."></textarea></div>
		<!-- <div id="tag">태그</div> -->
		<div id="tagInputW"><input id="tagInput" type="text" value="" placeholder="태그를 입력해주세요.(예 : #구름)"></div>
		<div id="srt">공개 설정</div>
		<div id="publicPrivate">
			<input name="public" type="radio" checked="checked" /><label for="public" id="public">공개</label>
			<input name="public" type="radio" /><label for="private" id="private">비공개</label>
		</div>
		<br />
		<div class="save_cancel">
			<input id="btnSave" type="button" value="저장하기">
			<input id="btnCancel" type="button" value="취소하기">
		</div>
	</div>
	
	<c:import url="footer.jsp"></c:import>
</body>
</html>