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
			<div class="profile_name2">짱구</div>
			<div class="profile_like">좋아요수
				<span class="profile_like_cnt">30</span>
			</div>
			<div class="profile_introduce">
				<div class="profile_introduce_in">작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개
				작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개작가소개
				</div>
			</div>
		</div>
		<div class="gallary_wrap">
			<div class="gallary">
				<div class="tabs">
					<input id="gallaryMenu1" type="radio" name="tab" checked="checked" />
					<input id="gallaryMenu2" type="radio" name="tab" />
					<input id="gallaryMenu3" type="radio" name="tab" />
					<label for="gallaryMenu1">사진작품관</label>
					<label for="gallaryMenu2">그림작품관</label>
					<label for="gallaryMenu3">영상작품관</label>
					<select class="select">
						<option value="0" selected="selected">최신순</option>
						<option value="1">좋아요순</option>
					</select>
					<div class="gallary_menu1_contents">
						<div class="pic_wrap">
							<div class="pic" id="pic1">
								<div class="bg">
									<div class="contents_title">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
									<div class="contents_in">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
									<img class="contents_heart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
									<div class="contents_name">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
								</div>
							</div>
							<div class="pic" id="pic2">
								<div class="bg">
									<div class="contents_title">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
									<div class="contents_in">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
									<img class="contents_heart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
									<div class="contents_name">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
								</div>
							</div>
							<div class="pic" id="pic3">
								<div class="bg">
									<div class="contents_title">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
									<div class="contents_in">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
									<img class="contents_heart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
									<div class="contents_name">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
								</div>
							</div>
							<div class="pic" id="pic4">
								<div class="bg">
									<div class="contents_title">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
									<div class="contents_in">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
									<img class="contents_heart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
									<div class="contents_name">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
								</div>
							</div>
							<div class="pic" id="pic5">
								<div class="bg">
									<div class="contents_title">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
									<div class="contents_in">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
									<img class="contents_heart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
									<div class="contents_name">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
								</div>
							</div>
							<div class="pic" id="pic6">
								<div class="bg">
									<div class="contents_title">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
									<div class="contents_in">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
									<img class="contents_heart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
									<div class="contents_name">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
								</div>
							</div>
							<div class="pic" id="pic7">
								<div class="bg">
									<div class="contents_title">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
									<div class="contents_in">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
									<img class="contents_heart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
									<div class="contents_name">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
								</div>
							</div>
							<div class="pic" id="pic8">
								<div class="bg">
									<div class="contents_title">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
									<div class="contents_in">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
									<img class="contents_heart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
									<div class="contents_name">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
								</div>
							</div>
							<div class="pic" id="pic9">
								<div class="bg">
									<div class="contents_title">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
									<div class="contents_in">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
									<img class="contents_heart" src="resources/images/JY/heart3.png" alt="하트" onclick="heart();" width="40px" height="40px">
									<div class="contents_name">짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구짱구</div>
								</div>
							</div>
						</div>
					</div>

					<div class="gallary_menu2_contents"></div>
					<div class="gallary_menu3_contents"></div>
				</div>
			</div>
			<div class="pagination">
				<a href="#">&laquo;</a> <a href="#" class="active">1</a> <a href="#">2</a>
				<a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
				<a href="#">&raquo;</a>
			</div>
		</div>
	</div>
	<br />
	
	<c:import url="footer.jsp"></c:import>
</body>
</html>