<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="resources/css/JY/main.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	
});
	
	function heart() {
		var heart = document.getElementById('contentsHeart');

		if (heart.src.match("resources/images/JY/heart3.png")) {
			heart.src = "resources/images/JY/heart2.png";
		} else {
			heart.src = "resources/images/JY/heart3.png";
		}
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty sUserNo}">
			<c:import url="header_main2.jsp"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="header_main.jsp"></c:import>
		</c:otherwise>
	</c:choose>
	<div class="wrap">
		<div class="pic_wrap">
			<div class="pic_title">사진갤러리</div>
			<div class="img_wrap">
				<img src="resources/images/JY/left_arrow2.png" id="leftArrow" alt="왼쪽 화살표" width="100px" height="100px">
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
			<img src="resources/images/JY/right_arrow2.png" id="rightArrow" alt="오른쪽 화살표" width="100px" height="100px"> <br />
			</div>	
			<div class="more">
				<a href="gallary">더 많은 작품 보러가기 ></a>
			</div>
		</div>
		<br />
		<div class="drawing_wrap">
			<div class="drawing_title">그림갤러리</div>
			<div class="img_wrap2">
				<img src="resources/images/JY/left_arrow2.png" id="leftArrow" alt="왼쪽 화살표" width="100px" height="100px">
				<div class="drawing" id="drawing1">
					<div id="bg"></div>
				</div>
				<div class="drawing" id="drawing2">
					<div id="bg"></div>	
				</div>
				<div class="drawing" id="drawing3">
					<div id="bg"></div>
				</div>
				<div class="drawing" id="drawing4">
					<div id="bg"></div>
				</div>
				<img src="resources/images/JY/right_arrow2.png" id="rightArrow" alt="오른쪽 화살표" width="100px" height="100px">
			</div>
				<div class="more">
					<a href="gallary">더 많은 작품 보러가기 ></a>
				</div>
		</div>
		<br />
		<div class="video_wrap">
			<div class="video_title">영상갤러리</div>
			<div class="img_wrap3">
				<img src="resources/images/JY/left_arrow2.png" id="leftArrow" alt="왼쪽 화살표" width="100px" height="100px">
				<div class="video" id="video1"></div>
				<div class="video" id="video2"></div>
				<div class="video" id="video3"></div>
				<div class="video" id="video4"></div>
				<img src="resources/images/JY/right_arrow2.png" id="rightArrow" alt="오른쪽 화살표" width="100px" height="100px">
			</div>
				<div class="more">
					<a href="gallary">더 많은 작품 보러가기 ></a>
				</div>
		</div>
	</div>
	
	<c:import url="footer.jsp"></c:import>

</body>
</html>
