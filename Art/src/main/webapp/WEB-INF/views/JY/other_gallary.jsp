<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>other_gallary</title>
<link rel="stylesheet" href="resources/css/JY/other_gallary.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

});

	function heart() {
		var heart = document.getElementById('heart')

		if (heart.src.match("resources/images/JY/heart.png")) {
			heart.src = "resources/images/JY/heart2.png";
		} else {
			heart.src = "resources/images/JY/heart.png";
		}
	}
</script>
</head>
<body>
	<c:import url="header.jsp"></c:import>
	
	<div class="wrap">
		<div class="profile_wrap">
		<img id="heart" src="resources/images/JY/heart.png" alt="하트" onclick="heart();" width="35px" height="35px">
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
					<select id="select">
						<option value="0" selected="selected">최신순</option>
						<option value="1">좋아요순</option>
					</select>
					<div class="gallary_menu1_contents">
						<div class="pic_wrap">
							<div class="pic" id="pic1">
								<img src="resources/images/JY/짱구1.jpg" alt="짱구1" width="300px" height="300px">
							</div>
							<div class="pic" id="pic2">
								<img src="resources/images/JY/짱구2.jpg" alt="짱구2" width="300px" height="300px">
							</div>
							<div class="pic" id="pic3">
								<img src="resources/images/JY/짱구3.jpg" alt="짱구3" width="300px" height="300px">
							</div>
							<div class="pic" id="pic4">
								<img src="resources/images/JY/짱구4.jpg" alt="짱구4" width="300px" height="300px">
							</div>
							<div class="pic" id="pic5">
								<img src="resources/images/JY/짱구1.jpg" alt="짱구1" width="300px" height="300px">
							</div>
							<div class="pic" id="pic6">
								<img src="resources/images/JY/짱구2.jpg" alt="짱구2" width="300px" height="300px">
							</div>
							<div class="pic" id="pic7">
								<img src="resources/images/JY/짱구3.jpg" alt="짱구3" width="300px" height="300px">
							</div>
							<div class="pic" id="pic8">
								<img src="resources/images/JY/짱구4.jpg" alt="짱구4" width="300px" height="300px">
							</div>
							<div class="pic" id="pic9">
								<img src="resources/images/JY/짱구1.jpg" alt="짱구1" width="300px" height="300px">
							</div>
						</div>
					</div>

					<div class="gallary_menu2_contents">addfasd</div>
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