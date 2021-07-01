<%@ page language="java" contentType="text/html; charselect=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charselect="UTF-8">
<title>mygallary</title>
<link rel="stylesheet" href="resources/css/JY/mygallary.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#btnGoUpload').click(function() {
		location.href =	"writing";
	})
	
});
</script>
</head>
<body>
	<c:import url="header.jsp"></c:import>
	
	<div class="wrap">
		<div class="profile_wrap">
			<div class="profile2">
				<img class="profile_img2" src="resources/images/JY/짱구1.jpg" alt="짱구1"
					width="200px" height="200px">
			</div>
			<div id="profileName2">짱구</div>
			<div id="profileLike">좋아요수</div>
			<div id="profileIntroduce">
				<div id="profileIntroduceIn">작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개
				작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개
				</div>
			</div>
		</div>
		<div class="gallary_wrap">
			<div class="gallary">
				<div id="tabs">
					<input id="gallaryMenu1" type="radio" name="tab" checked="checked" />
					<input id="gallaryMenu2" type="radio" name="tab" />
					<input id="gallaryMenu3" type="radio" name="tab" />
					<label for="gallaryMenu1">사진작품관</label>
					<label for="gallaryMenu2">그림작품관</label>
					<label for="gallaryMenu3">영상작품관</label>
					<input id="btnGoUpload" type="button" value="작품 등록하기">
					<select id="select">
						<option value="0" selected="selected">최신순</option>
						<option value="1">좋아요순</option>
					</select>
					<div class="gallary_menu1_contents">
						<div class="pic_wrap">
							<div class="pic" id="pic1"></div>
							<div class="pic" id="pic2"></div>
							<div class="pic" id="pic3"></div>
							<div class="pic" id="pic4"></div>
							<div class="pic" id="pic5"></div>
							<div class="pic" id="pic6"></div>
							<div class="pic" id="pic7"></div>
							<div class="pic" id="pic8"></div>
							<div class="pic" id="pic9"></div>
						</div>
					</div>

					<div class="gallary_menu2_contents"></div>
					<div class="gallary_menu3_contents"></div>
				</div>
			</div>
			<div class="pagination">
				<a href="#">&laquo;</a> <a href="#" class="active">1</a> <a href="#">2</a>
				<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
				<a href="#">&raquo;</a>
			</div>
		</div>
	</div>
	<br />
	
	<c:import url="footer.jsp"></c:import>
</body>
</html>