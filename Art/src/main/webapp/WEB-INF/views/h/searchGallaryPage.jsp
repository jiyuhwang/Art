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
	
	$(".tabs").on("change", "[type='radio']", function() {
		//$("#page").val("1");
		//정확도 좋아요 최신 벨류 0
		reloadList();
	});
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//---------------------------------------------------------탭 클릭시
	function reloadList() {
		var params= $("#actionForm").serialize();
		
		var urlTxt = "";
		switch($(".tabs [type='radio']:checked").val()) {
		case "0" :
			urlTxt = "searchPic";
			break;
		case "1" :
			urlTxt = "searchDraw";
			break;
		case "2" :
			urlTxt = "searchVideo";
			break;
		case "3" :
			urlTxt = "searchWriter";
			break;
		}
		
		$.ajax({
			url: urlTxt, 
			type: "post", 
			dataType: "json", 
			data: params, 
			success: function(res) { 
				switch($(".tabs [type='radio']:checked").val()) {
				case "0" :
					picList(res.list);
					break;
				case "1" :
					drawList(res.list);
					break;
				case "2" :
					videoList(res.list);
					break;
				case "3" :
					writerList(res.list);
					break;
				}
				
				drawPaging(res.pb);	
			},
			error: function(request, status, error) { // 실패 시 다음 함수 실행
				console.log(error);
			}
		});
	}
	
	
	
/* 	
	
	<div class="gallary_div">
		<img id="boxImg3" class="box_img"/>
		<div class="box_img_txt">
			<div class="box_img_txt_title">제목나온다</div>
			<div class="box_img_txt_writer_div">
				<span class="writer_flag">by </span>
				<span class="box_img_txt_writer">내가작가다</span>
			</div>
		</div>
	</div>

	 */

	
	function picList(list) {
		var html = "";
		for(var p of list) {
			                                                                    
		html +=" <div class=\"gallary_div\">";
		html += "<div pno = \"" + p.POST_NO + "\"class = \"box_img\" id=\"pic" + p.POST_NO + "\">";
		html +=" 		<div class=\"box_img_txt\">";
		html +=" 			<div class=\"box_img_txt_title\">" + p.TITLE + "다</div>";
		html +=" 			<div class=\"box_img_txt_writer_div\">";
		html +=" 				<span class=\"writer_flag\">by </span>";
		html +=" 				<span class=\"box_img_txt_writer\"> " + p.USER_NICKNAME + "</span>";
		html +=" 			</div>";
		html +=" 		</div>";
		html +=" 	</div>";
	
		}
		$(".gallary_contents").html(html);
		for(var p of list) {
			$('#pic' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
		}		
}

	function drawList(list) {
		var html = "";
		for(var p of list) {

	
		}
		$(".draw_wrap").html(html);
		for(var p of list) {
			$('#draw' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
		}		
	}

	function videoList(list) {
		var html = "";
		for(var p of list) {

	
		}
		$(".video_wrap").html(html);
		for(var p of list) {
			$('#video' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
		}		
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});//document end

</script>
</head>
<body>
	<c:import url="../JY/header.jsp"></c:import>
	<div class="input_txt_wrap">
		<div id="srhTxt">
		<form action="#" id="actionForm" method="post">
			<input type="hidden" id="visibility" name="visibility" value="0"/>
			<input type="text" name="searchTxt" placeholder="검색어를 입력해주세요."/>




		</form>
		</div>		
	</div>
	<div class="search_tab_wrap">
		<div class="tabs">
			<input id="tabP" type="radio" value="0" name="tab" checked="checked" />
			<input id="tabD" type="radio" value="1" name="tab" />
			<input id="tabV" type="radio" value="2" name="tab" />
			<input id="tabW" type="radio" value="3" name="tab" />		
			<label for="tabP">사진</label>
			<label for="tabD">그림</label>
			<label for="tabV">영상</label>
			<label for="tabW">작가</label>
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
			<div class="gallary_contents"></div>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			<!-------------------------------------------------------------작가검색시  -->


			<div class="writer_contents">
				<div class="writer_div">
					<img id="writerImg1" class="writer_img"/>
					<div class="writer_box_txt">
						<div class="writer_name"><h5>나는 작가다.</h5></div>
						<div class="writer_introduce">
							<span> 소개입니다.</span>
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