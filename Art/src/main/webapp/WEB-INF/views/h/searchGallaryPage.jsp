<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 검색페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/h/search_gallary_page.css"/>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//우측 상단 클릭하면 사이드바 올라가거나 내려가기
	$('#btnMenu').click(function() {
		if ($('.side_bar').css('display') == 'none') {
			$('.side_bar').slideDown();
		} else {
			$('.side_bar').slideUp();
		}
	})
	
});//document end

</script>
</head>
<body>
	<c:import url="../JY/header.jsp"></c:import>
	<div class="input_txt_div">
		<div id="srhTxt">
			<form action="searchPage" id="srhForm" method="post">
			<input type="text" placeholder="검색어를 입력해주세요."/>
			</form>
		</div>		
	</div>
	<div class="srhTab_div">
		<div id="srhTab">
			<ul>
				<li class="tab_item1"><a class="tab_item_txt">작품</a></li>
				<li class="tab_item2"><a class="tab_item_txt">작가</a></li>
			</ul>
		</div>
	</div>
	<div class="main">
		<div class="ctts">
			<div class="srh_cnt_box">
				<span class="srh_cnt">작품 검색 결과 4건</span>
				<div class="srh_flag_div">
					<ul class="srh_flag">
						<li>정확도</li>
						<li>좋아요</li>
						<li>최신</li>
					</ul>
				</div>
			</div>
			<div class="srh_result">
				<div class="img_box">
					<img id="boxImg3" class="box_img"/>
					<div class="box_img_txt">
						<div class="box_img_txt_title">제목나온다</div>
						<div class="box_img_txt_writer_div">
							<span class="writer_flag">by </span>
							<span class="box_img_txt_writer">내가작가다</span>
						</div>
					</div>
				</div>
				<div class="img_box">
					<img id="boxImg1" class="box_img"/>
					<div class="box_img_txt">
						<div class="box_img_txt_title">제목나온다 제목을 짧게도 적을 수 있고 길게도 적을 수 있고 이렇게 &nbsp;&nbsp;&nbsp;&nbsp; 여백을 줄 수도 있고</div>
						<div class="box_img_txt_writer_div">
							<span class="writer_flag">by </span>
							<span class="box_img_txt_writer">내가작가다</span>
						</div>
					</div>
				</div>
				<div class="img_box">
					<div id="boxImg2" class="box_img"></div>
					<div class="box_img_txt">
						<div class="box_img_txt_title">제목나온다</div>
						<div class="box_img_txt_writer_div">
							<span class="writer_flag">by </span>
							<span class="box_img_txt_writer">내가작가다</span>
						</div>
					</div>
				</div>
				<div class="img_box">
					<img id="boxImg3" class="box_img"/>
					<div class="box_img_txt">
						<div class="box_img_txt_title">제목나온다</div>
						<div class="box_img_txt_writer_div">
							<span class="writer_flag">by </span>
							<span class="box_img_txt_writer">내가작가다</span>
						</div>
					</div>
				</div>
				<div class="img_box">
					<img id="boxImg4" class="box_img"/>
					<div class="box_img_txt">
						<div class="box_img_txt_title">제목나온다</div>
						<div class="box_img_txt_writer_div">
							<span class="writer_flag">by </span>
							<span class="box_img_txt_writer">내가작가다</span>
						</div>
					</div>
				</div>
			</div>
			<!------------------------------------------------------------------------ 페이징 -->
			<div class="paging_area">
				<div id="pagingWrap">
					<span>&laquo;</span>
					<span class="paging_selected">1</span>
					<span>2</span>
					<span>3</span>
					<span>4</span>
					<span>5</span>
					<span>&raquo;</span>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../JY/footer.jsp"></c:import>
</body>
</html>