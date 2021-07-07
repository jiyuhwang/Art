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
	<c:choose>
		<c:when test="${empty sUserNo}">
			<c:import url="header2.jsp"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="header.jsp"></c:import>
		</c:otherwise>
	</c:choose>
	
	<div class="wrap">
		<div class="profile_wrap">
			<div class="profile2">
				<img class="profile_img2" src="resources/images/JY/짱구1.jpg" alt="짱구1"
					width="200px" height="200px">
			</div>
			<div class="profile_name2">${sUserNickname}</div>
			<div class="profile_like">좋아요수
				<span class="profile_like_cnt">30</span>
			</div>
			<div class="profile_introduce">
				<div class="profile_introduce_in">${sUserIntroduce}</div>
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
					<input id="btnGoUpload" type="button" value="작품 등록하기">
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