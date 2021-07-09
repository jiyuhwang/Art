<%@ page language="java" contentType="text/html; charselect=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리</title>
<link rel="stylesheet" href="resources/css/JY/othergallary.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	console.log($('#userNo').val());
	reloadList();
	console.log("aa");

	$("html, body").animate({ scrollTop: 0 }, "fast")

	
	
	$(".pagination").on("click", "a",  function() {
		$("#page").val($(this).attr("page"));
		$('html').scrollTop(0);
		reloadList();
	});
	
	$(".pic_wrap").on("click", "div", function() {
		$("#pNo").val($(this).attr("pno"));
		$("#actionForm").attr("action", "detail");
		$("#actionForm").submit();
	});
	
	$(".draw_wrap").on("click", "div", function() {
		$("#pNo").val($(this).attr("pno"));
		$("#actionForm").attr("action", "detail");
		$("#actionForm").submit();
	});
	
	$(".tabs").on("change", "[type='radio']", function() {
		$("#page").val("1");
		reloadList();
	});
	
});


function reloadList() {
	var params= $("#actionForm").serialize();
	
	var urlTxt = "";
	switch($(".tabs [type='radio']:checked").val()) {
	case "0" :
		urlTxt = "otherpicgallarys";
		break;
	case "1" :
		urlTxt = "otherdrawgallarys";
		break;
	}
	
	$.ajax({
		url: urlTxt, // 접속 주소
		type: "post", // 전송 방식: get, post
		dataType: "json", // 받아올 데이터 형태
		data: params, // 보낼 데이터(문자열 형태)
		success: function(res) { // 성공 시 다음 함수 실행
			switch($(".tabs [type='radio']:checked").val()) {
			case "0" :
				picList(res.list);
				break;
			case "1" :
				drawList(res.list);
				break;
			}
			
			drawPaging(res.pb);	
		},
		error: function(request, status, error) { // 실패 시 다음 함수 실행
			console.log(error);
		}
	});
}

function picList(list) {
		var html = "";
		for(var p of list) {
			html += "<div pno = \"" + p.POST_NO + "\"class = \"pic\" id=\"pic" + p.POST_NO + "\">";					
			html += "<div class=\"bg\">";
			html += "<div class=\"contents_title\">" + p.TITLE + "</div>";
			html += "<div class=\"contents_in\">" + p.EXPLAIN + "</div>";
			html += "<img class=\"contents_heart\" src=\"resources/images/JY/heart3.png\" alt=\"하트\" onclick=\"heart();\" width=\"40px\" height=\"40px\">";
			html += "<div class=\"contents_name\"> " + p.USER_NICKNAME + "</div>";
			html += "</div>";
			html += "</div>";
	
		}
		$(".pic_wrap").html(html);
		for(var p of list) {
			$('#pic' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
		}		
}

function drawList(list) {
	var html = "";
	for(var p of list) {
		html += "<div pno = \"" + p.POST_NO + "\"class = \"pic\" id=\"draw" + p.POST_NO + "\">";					
		html += "<div class=\"bg\">";
		html += "<div class=\"contents_title\">" + p.TITLE + "</div>";
		html += "<div class=\"contents_in\">" + p.EXPLAIN + "</div>";
		html += "<img class=\"contents_heart\" src=\"resources/images/JY/heart3.png\" alt=\"하트\" onclick=\"heart();\" width=\"40px\" height=\"40px\">";
		html += "<div class=\"contents_name\"> " + p.USER_NICKNAME + "</div>";
		html += "</div>";
		html += "</div>";

	}
	$(".draw_wrap").html(html);
	for(var p of list) {
		$('#draw' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
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
	
	$(".pagination").html(html);
}
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
<form action="#" id="actionForm" method="post">
		<input type="hidden" id="pNo" name="pNo" />
		<input type="hidden" id="userNo" name="userNo" value="${param.authorNo}" />
		<input type="hidden" id="page" name="page" value="${page}" />
	<div class="wrap">
		<div class="profile_wrap">
			<img id="heart" src="resources/images/JY/heart.png" alt="하트" onclick="heart();" width="35px" height="35px">
	

			<c:choose>
				<c:when test="${empty param.userProfileImg}">
					<div class="profile2">
						<img class="profile_img2" src="resources/images/JY/who.png" alt="프로필사진" width="200px" height="200px">
				    </div>
				</c:when>
				<c:otherwise>
					<div class="profile2">
						<img class="profile_img2" src="resources/upload/${param.userProfileImg}" alt="프로필사진" width="200px" height="200px">
					</div>
				</c:otherwise>
			</c:choose>
			
			<div class="profile_name2">${param.userNickname}</div>
			<div class="profile_like">좋아요수
				<span class="profile_like_cnt">30</span>
			</div>
			
			
			<div class="profile_introduce">
				<div class="profile_introduce_in">${param.userIntroduce}</div>
			</div>
		</div>
		<div class="gallary_wrap">
			<div class="gallary">
				<div class="tabs">
					<input id="gallaryMenu1" type="radio" value="0" name="tab" checked="checked" />
					<input id="gallaryMenu2" type="radio" value="1" name="tab" />
					<input id="gallaryMenu3" type="radio" value="2" name="tab" />
					<label for="gallaryMenu1">사진작품관</label>
					<label for="gallaryMenu2">그림작품관</label>
					<label for="gallaryMenu3">영상작품관</label>
					<select class="select" name="searchGbn">
						<option value="0" selected="selected">최신순</option>
						<option value="1">좋아요순</option>
					</select>
					<div class="gallary_menu1_contents">
						<div class="pic_wrap"></div> 
					</div>
					<div class="gallary_menu2_contents">
						<div class="draw_wrap"></div> 
					</div>
					<div class="gallary_menu3_contents">
						<div class="video_wrap"></div> 
					</div>
				</div>
			</div>
			<div class="pagination"></div>
		</div>
	</div>
</form>
	<br />
	
	<c:import url="footer.jsp"></c:import>
</body>
</html>