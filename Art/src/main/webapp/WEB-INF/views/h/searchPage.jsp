<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/h/search_page.css"/>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".srh_result").hide();//hide all contents
	$("#srhTab li:first").addClass("tab_selected").show();//active first tab
	$(".srh_result:first").show();
	
	//srhTab클릭했을 때 
	$("#srhTab").on("click", "li", function(){
		
		$("#srhTab li").attr("class", "");
		$(this).attr("class", "tab_selected");
		$(".srh_result").hide();
		
		var tab = $(this).find("a").attr("href");
		$(tab).fadeIn("fast");
		return false;//이걸 안하면 스크롤이 중간에...
		
	});

});//document end

</script>
</head>
<body>
	<c:import url="../JY/header.jsp"></c:import>
	<div class="input_txt_wrap">
		<div id="srhTxt">
			<form action="searchGallaryPage" id="searchForm" method="post">
			<input type="text" placeholder="검색어를 입력해주세요."/>
			</form>
		</div>		
	</div>
	<div class="search_tab_wrap">
		<div id="srhTab">
			<ul>
				<li><a href="#tab1">작품</a></li>
				<li><a href="#tab2">작가</a></li>
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
			<div class="search_result">
				<div class="search_nothing">
					<b>검색어</b>에 대한 검색결과가 없습니다.<br/>
					다시 검색해 보세요.
				</div>
			</div>
		<!------------------------------------------------------------------------ 페이징 -->
			<div class="paging_area">
				<div id="pagingWrap">
				<span>&laquo;</span>
				<span class="paging_selected">1</span>
				<span>&raquo;</span>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../JY/footer.jsp"></c:import>
</body>
</html>