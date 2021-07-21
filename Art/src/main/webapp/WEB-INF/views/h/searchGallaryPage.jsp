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
	
	$("#searchTxt").on("keypress", function(event){
		if(event.keyCode == 13){
			
			if($.trim($("#searchTxt").val()) == ""){
				alert("검색어가 없습니다.");
				$("#searchTxt").focus();
			} else {
				$("#page").val("1");
				$("#orderFlag").val("0");
				
				reloadList();	
			}
		}
	});
	
 	$(".tabs").on("change", "[type='radio']", function() {
		$("#page").val("1");
		$("#orderFlag").val("0");
		reloadList();
	});
	
	$(".srh_flag").on("click", "li", function(){
		if($(this).attr("class") == "accuracy"){
			console.log("정확도 순이다");
			$("#orderFlag").val("0");
		} else if($(this).attr("class") == "views_order"){
			console.log("조회수 순이다");
			$("#orderFlag").val("1");
		} else {
			console.log("최신 순이다");
			$("#orderFlag").val("2");
		}
		
	});

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//---------------------------------------------------------탭 클릭시
	function reloadList() {
		var params= $("#actionForm").serialize();
		var urlTxt = "";
		
		switch($(".tabs [type='radio']:checked").val()) {
		case "0" :
			$("#tabFlag").val(0);
			urlTxt = "picSearch";
			break;
		case "1" :
			$("#tabFlag").val(1);
			urlTxt = "drawSearch";
			break;
		case "2" :
			$("#tabFlag").val(2);
			urlTxt = "videoSearch";
			break;
		case "3" :
			$("#tabFlag").val(3);
			urlTxt = "writerSearch";
			break;
		}

		$.ajax({
			url: urlTxt, 
			type: "post", 
			dataType: "json", 
			data: params, 
			success: function(res) {
				
/* 				if($("#page").val() == 1) {
						html +="<div class=\"search_result\">";
						html +="	<div class=\"search_nothing\">";
						html +="		<b>검색어</b>에 대한 검색결과가 없습니다.<br/>";
						html +="		다시 검색해 보세요.";
						html +="	</div>";
						html +="</div>";
						
					drawPaging(res.pb);	
					break;
				}  */
					
					switch($(".tabs [type='radio']:checked").val()) {
					case "0" :
						picSearch(res.list);
						break;
					case "1" :
						drawSearch(res.list);
						break;
					case "2" :
						videoSearch(res.list);
						break;
					case "3" :
						writerSearch(res.list);
						break;
					 }
					drawPaging(res.pb);	
					
			},
			error: function(request, status, error) { // 실패 시 다음 함수 실행
				console.log(error);
			}
		});
	}

	
	function picSearch(list) {
		var html = "";

		for(var p of list) {
			                                                                    
		html +=" <div class=\"gallary_div\">";
		html += "	<div pno = \"" + p.POST_NO + "\"class = \"box_img\" id=\"pic" + p.POST_NO + "\">";
		html +=" 		<div class=\"box_img_txt\">";
		html +=" 			<div class=\"box_img_txt_title\">" + p.TITLE + "</div>";
		html +=" 			<div class=\"box_img_txt_writer_div\">";
		html +=" 				<span class=\"writer_flag\">by </span>";
		html +=" 				<span class=\"box_img_txt_writer\"> " + p.USER_NICKNAME + "</span>";
		html +=" 			</div>";
		html +=" 	</div>";
		html +=" </div>";
	
		}
		
		$(".gallary_contents").html(html);
		
		for(var p of list) {
			
			if(p.POST_FILE != null && p.POST_FILE != "") {
				$('#pic' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
			} else {
				$('#pic' + p.POST_NO).css('background-image', 'url(\'resources/images/JY/짱구1.jpg\')');
			}
		}
	}
	
	function drawSearch(list) {
		var html = "";

		for(var p of list) {
			                                                                    
		html +=" <div class=\"gallary_div\">";
		html += "	<div pno = \"" + p.POST_NO + "\"class = \"box_img\" id=\"draw" + p.POST_NO + "\">";
		html +=" 		<div class=\"box_img_txt\">";
		html +=" 			<div class=\"box_img_txt_title\">" + p.TITLE + "</div>";
		html +=" 			<div class=\"box_img_txt_writer_div\">";
		html +=" 				<span class=\"writer_flag\">by </span>";
		html +=" 				<span class=\"box_img_txt_writer\"> " + p.USER_NICKNAME + "</span>";
		html +=" 			</div>";
		html +=" 	</div>";
		html +=" </div>";
	
		}
		
		$(".gallary_contents").html(html);
		
		for(var p of list) {
			
			if(p.POST_FILE != null && p.POST_FILE != "") {
				$('#draw' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
			} else {
				$('#draw' + p.POST_NO).css('background-image', 'url(\'resources/images/JY/짱구1.jpg\')');
			}
		}
	}
	
	function videoSearch(list) {
		var html = "";

		for(var p of list) {
			                                                                    
		html +=" <div class=\"gallary_div\">";
		html += "	<div pno = \"" + p.POST_NO + "\"class = \"box_img\" id=\"video" + p.POST_NO + "\">";
		html +=" 		<div class=\"box_img_txt\">";
		html +=" 			<div class=\"box_img_txt_title\">" + p.TITLE + "</div>";
		html +=" 			<div class=\"box_img_txt_writer_div\">";
		html +=" 				<span class=\"writer_flag\">by </span>";
		html +=" 				<span class=\"box_img_txt_writer\"> " + p.USER_NICKNAME + "</span>";
		html +=" 			</div>";
		html +=" 	</div>";
		html +=" </div>";
	
		}
		
		$(".writer_contents").hide();
		$(".gallary_contents").html(html);
		
		for(var p of list) {
			
			if(p.POST_FILE != null && p.POST_FILE != "") {
				$('#video' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
			} else {
				$('#video' + p.POST_NO).css('background-image', 'url(\'resources/images/JY/짱구1.jpg\')');
			}
		}
	}


	function writerSearch(list) {
		var html = "";

		for(var p of list) {
			                                                                    
		html +=" <div class=\"writer_div\">";
		html += "	<div name = \"" + p.USER_NO + "\"class = \"writer_img\" id=\"writer" + p.USER_NO + "\"></div>";
		html +=" 	<div class=\"writer_box_txt\">";
		html +=" 		<div class=\"writer_name\"><h5>" + p.USER_NICKNAME + "</h5></div>";
		html +=" 		<div class=\"writer_introduce\">";
		html +=" 			<span> " + p.INTRODUCE + "</span>";
		html +=" 		</div>";
		html +=" 	</div>";
		html +=" </div>";
	
		}
		
		$(".gallary_contents").hide();
		$(".writer_contents").html(html);
		
		for(var p of list) {
			
			if(p.PROFILE_IMG_PATH != null && p.PROFILE_IMG_PATH != "") {
				$('#writer' + p.USER_NO).css('background-image', 'url(\'resources/upload/' + p.PROFILE_IMG_PATH + '\')');
			} else {
				$('#writer' + p.USER_NO).css('background-image', 'url(\'resources/images/JY/who.png\')');
			}
		}
	}
	
	
	
	function drawPaging(pb) {
		var html ="";
		
		html += "<a page=\"1\"><<</a>";
		if($("#page").val() == "1") {
			html += "<a page=\"1\"><</a>";		
		} else {
			html += "<a page=\"" + ($("#page").val() - 1) + "\"><</a>";
		}
		
		for(var i = pb.startPcount ; i <= pb.endPcount; i++){
			if($("#page").val() == i) {
				html += "<a class=\"on\" page=\"" + i + "\">" + i + "</a>";			
			} else {
				html += "<a page=\"" + i + "\">" + i + "</a>";			
				
			}
		}
		
		if($("#page").val() == pb.maxPcount) {
			html += "<a page=\"" + pb.maxPcount + "\">></a>";
		} else {
			html += "<a page=\"" + ($("#page").val() * 1 + 1) + "\">></a>";
		}
		
		html += "<a page=\"" + pb.maxPcount + "\">>></a";
		
		$(".paging_area").html(html);
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
			<input type="text" id="searchTxt" name="searchTxt" placeholder="검색어를 입력해주세요." value="${param.searchTxt}"/>
			<input type="hidden" id="searchOldTxt" value="${param.searchTxt}"/>
			<input type="hidden" id="tabFlag" name="tabFlag" value="0">
			<input type="hidden" id="orderFlag" name="orderFlag" value="0">
			<input type="hidden" id="pNo" name="pNo" />
			<input type="hidden" id="page" name="page" value="${page}" />
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
				<span class="srh_cnt">작품 검색 결과 ${cnt.cnt}건</span>
				<div class="srh_flag_div">
					<ul class="srh_flag">
						<li class="accuracy">정확도</li>
						<li class="views_order">조회수</li>
						<li class="recency">최신</li>
					</ul>
				</div>
			</div>
			<div class="gallary_contents"></div>
			<!-------------------------------------------------------------작가검색시  -->
			<div class="writer_contents"></div>
			<!------------------------------------------------------------------------ 페이징 -->
			<div class="paging_area"></div>
		</div>
	</div>
	<c:import url="../JY/footer.jsp"></c:import>
</body>
</html>