<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gallary</title>
<link rel="stylesheet" href="resources/css/JY/gallary.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
});
</script>
</head>
<body>
	<c:import url="header.jsp"></c:import>
	
	<div class="wrap">
		<div class="gallary">
			<div id="tabs">
				<input id="gallaryMenu1" type="radio" name="tab" checked="checked" />
				<input id="gallaryMenu2" type="radio" name="tab" />
				<input id="gallaryMenu3" type="radio" name="tab" />
				<label for="gallaryMenu1">사진작품관</label>
				<label for="gallaryMenu2">그림작품관</label>
				<label for="gallaryMenu3">영상작품관</label>
				<select id="set">
					<option value="0" selected="selected">최신순</option>
					<option value="1">좋아요순</option>
				</select>
				<div class="gallary_menu1_contents">
					<div class="picture_wrap">
						<div class="picture" id="picture1"></div>
						<div class="picture" id="picture2"></div>
						<div class="picture" id="picture3"></div>
						<div class="picture" id="picture4"></div>
						<div class="picture" id="picture5"></div>
						<div class="picture" id="picture6"></div>
						<div class="picture" id="picture7"></div>
						<div class="picture" id="picture8"></div>
						<div class="picture" id="picture9"></div>
						<div class="picture" id="picture10"></div>
						<div class="picture" id="picture11"></div>
						<div class="picture" id="picture12"></div>
						<div class="picture" id="picture13"></div>
						<div class="picture" id="picture14"></div>
						<div class="picture" id="picture15"></div>
						<div class="picture" id="picture16"></div>
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
	<br />
	
	<c:import url="footer.jsp"></c:import>
</body>
</html>