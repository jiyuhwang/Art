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
	reloadList();
	

	
	$(".go_pic").on("click", function() {
		$("#tab").val("0");
		$("#actionForm").attr("action", "gallary");
		$("#actionForm").submit();
	});
	
	$(".go_draw").on("click", function() {
		$("#tab").val("1");
		$("#actionForm").attr("action", "gallary");
		$("#actionForm").submit();
	});
	
	$(".go_video").on("click", function() {
		$("#tab").val("2");
		$("#actionForm").attr("action", "gallary");
		$("#actionForm").submit();
	});
	
	
	var a = 0;
	var b = 0;
	var c = 0;
	$("#leftArrow").hide();
	$("#leftArrow2").hide();
	$("#leftArrow3").hide();
	
	$('#rightArrow').click( function() {
        $('.pic_main_wrap').animate({
         	 'margin-left': '-=25%'
        }); 
		a++;
		if(a == 12) {
			$("#rightArrow").hide();
		} else {
			$("#leftArrow").show();
			$("#rightArrow").show();
		}
   });
	
	$("#leftArrow").on("click", function() {
		$(".pic_main_wrap").animate({
			'margin-left': "+=25%",
		}, 300);
		a--;
		if(a == 0) {
			$("#leftArrow").hide();
		} else {
			$("#rightArrow").show();
		}
		
	});

	 
	$("#rightArrow2").on("click", function() {

		$(".draw_main_wrap").animate({
			'margin-left': "-=25%"
		}, 300);
		
		b++;
		if(b == 12) {
			$("#rightArrow2").hide();
		} else {
			$("#leftArrow2").show();
			$("#rightArrow2").show();
		}

	});
	
	 
	$('#leftArrow2').click( function() {
         $('.draw_main_wrap').animate({
          	 'margin-left': '+=25%'
         });
         
         b--;
 		if(b == 0) {
 			$("#leftArrow2").hide();
 		} else {
 			$("#rightArrow2").show();
 		}
    });
	 
	$("#rightArrow3").on("click", function() {

		$(".video_main_wrap").animate({
			'margin-left': "-=25%"
		}, 300);
		
		c++;
		if(c == 12) {
			$("#rightArrow3").hide();
		} else {
			$("#leftArrow3").show();
			$("#rightArrow3").show();
		}
	});
  

	$('#leftArrow3').click( function() {
        $('.video_main_wrap').animate({
         	 'margin-left': '+=25%'
        });
        
        c--;
		if(c == 0) {
			$("#leftArrow3").hide();
		} else {
			$("#rightArrow3").show();
		}
   });
	
	
	
	$(".pic_main_wrap, .draw_main_wrap, .video_main_wrap").on("dblclick", "div", function() {
		$("#pNo").val($(this).attr("pno"));
		//$("#postNo").val($(this).attr("pno"));
		$("#actionForm").attr("action", "detail");
		$("#actionForm").submit();
	});
	
	$(".wrap").on("click", '.contents_heart', function() {
		if($('#userNo').val() != "") {
		
		if ($(this).attr("src") == "resources/images/JY/heart3.png") {
			//console.log($(this).parent().parent().attr("pno"));
			$(this).attr("src", "resources/images/JY/heart2.png");
			$("#postNo").val($(this).parent().parent().attr("pno"));

			
			var params= $("#actionForm").serialize();
			
			$.ajax({
				url : "postOnHeart",
				type : "post",
				dataType : "json",
				data : params,
				success: function(res) { // 성공 시 다음 함수 실행
					if(res.msg == "success") {
						//alert("좋아요가 눌렸습니다.");
						
					} else if(res.msg == "failed") {
						alert("로그인 후 이용해주세요.");
						location.href = "login";
					} else {
						alert("로그인 후 이용해주세요.");
						location.href = "login";
					}
				},
				error: function(request, status, error) { // 실패 시 다음 함수 실행
					console.log(error);
				}
			});

		} else {
			$("#postNo").val($(this).parent().parent().attr("pno"));
			
			$(this).attr("src", "resources/images/JY/heart3.png");
			
			var params= $("#actionForm").serialize();
			
			$.ajax({
				url : "postOffHeart",
				type : "post",
				dataType : "json",
				data : params,
				success: function(res) { // 성공 시 다음 함수 실행
					if(res.msg == "success") {
						//alert("좋아요를 취소하였습니다.");
						
					} else if(res.msg == "failed") {
						alert("에러 발생");
						location.href = "login";
					} else {
						alert("문제 발생");
						
					}

				},
				error: function(request, status, error) { // 실패 시 다음 함수 실행
					console.log(error);
				}
			});
		}
		} else {
			alert("로그인 후 이용해주세요.");
			location.href = "login";
		}
	});
});

function reloadList() {
	var params= $("#actionForm").serialize();

	
	$.ajax({
		url: "mainList", // 접속 주소
		type: "post", // 전송 방식: get, post
		dataType: "json", // 받아올 데이터 형태
		data: params, // 보낼 데이터(문자열 형태)
		success: function(res) { // 성공 시 다음 함수 실행
			picList(res.list1);
			drawList(res.list2);
			videoList(res.list3);

		},
		error: function(request, status, error) { // 실패 시 다음 함수 실행
			console.log(error);
		}
	});
}

function picList(list1) {
		var html = "";
		for(var p of list1) {
			html += "<div pno = \"" + p.POST_NO + "\"class=\"pic\" id=\"pic" + p.POST_NO + "\">";	
			html += "<div class=\"bg\">"
			html += "<div class=\"contents_title\">" +  p.TITLE + "</div>"
			html += "<div class=\"contents_in\">" + p.EXPLAIN  + "</div>"
	
		if(p.REGISTER_DATE == null) {
			html += "<img class=\"contents_heart\" src=\"resources/images/JY/heart3.png\" alt=\"투명하트\" width=\"40px\" height=\"40px\">";
		} else {
			html += "<img class=\"contents_heart\" src=\"resources/images/JY/heart2.png\" alt=\"빨간하트\" width=\"40px\" height=\"40px\">";
		}
		
			html += "<div class=\"contents_name\"> " + p.USER_NICKNAME + "</div>";
			html += "</div>";
			html += "</div>";
	
		}
		$(".pic_main_wrap").html(html);
		for(var p of list1) {
			$('#pic' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
		}		
}

function drawList(list2) {
	var html = "";
	for(var p of list2) {
		html += "<div pno = \"" + p.POST_NO + "\"class=\"pic\" id=\"draw" + p.POST_NO + "\">";	
		html += "<div class=\"bg\">"
		html += "<div class=\"contents_title\">" +  p.TITLE + "</div>"
		html += "<div class=\"contents_in\">" + p.EXPLAIN  + "</div>"

	if(p.REGISTER_DATE == null) {
		html += "<img class=\"contents_heart\" src=\"resources/images/JY/heart3.png\" alt=\"투명하트\" width=\"40px\" height=\"40px\">";
	} else {
		html += "<img class=\"contents_heart\" src=\"resources/images/JY/heart2.png\" alt=\"빨간하트\" width=\"40px\" height=\"40px\">";
	}
	
		html += "<div class=\"contents_name\"> " + p.USER_NICKNAME + "</div>";
		html += "</div>";
		html += "</div>";

	}
	$(".draw_main_wrap").html(html);
	for(var p of list2) {
		$('#draw' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
	}
}

function videoList(list3) {
	var html = "";
	for(var p of list3) {
		html += "<div pno = \"" + p.POST_NO + "\"class=\"pic\" id=\"video" + p.POST_NO + "\">";	
		html += "<div class=\"bg\">"
		html += "<div class=\"contents_title\">" +  p.TITLE + "</div>"
		html += "<div class=\"contents_in\">" + p.EXPLAIN  + "</div>"

	if(p.REGISTER_DATE == null) {
		html += "<img class=\"contents_heart\" src=\"resources/images/JY/heart3.png\" alt=\"투명하트\" width=\"40px\" height=\"40px\">";
	} else {
		html += "<img class=\"contents_heart\" src=\"resources/images/JY/heart2.png\" alt=\"빨간하트\" width=\"40px\" height=\"40px\">";
	}
	
		html += "<div class=\"contents_name\"> " + p.USER_NICKNAME + "</div>";
		html += "</div>";
		html += "</div>";

	}
	$(".video_main_wrap").html(html);
	for(var p of list3) {
		$('#video' + p.POST_NO).css('background-image', 'url(\'resources/upload/' + p.POST_FILE + '\')');
	}		
}
	
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty sUserNo}">
			<c:import url="header_main2.jsp">
				<c:param name="url" value="main"></c:param>
			</c:import>
		</c:when>
		<c:when test="${!empty sAdminNo}">
			<c:import url="header_main.jsp"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="header_main.jsp"></c:import>
		</c:otherwise>
	</c:choose>
	

	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="userNo" name="userNo" value="${sUserNo}" />
		<input type="hidden" id="pNo" name="pNo" />
		<input type="hidden" id="postNo" name="postNo" />
		<input type="hidden" id="tab" name="tab" />
		<input type="hidden" id="page" name="page" value="1" />
	</form>
	<div class="background_wrap">

	<div class="wrap">
		<div class="pic_wrap">
			<div class="img_wrap">
			<div class="pic_title">사진갤러리</div>
				<img src="resources/images/JY/left_arrow2.png" id="leftArrow" alt="왼쪽 화살표" width="100px" height="100px">
			<div class="pic_main_wrap"></div>
			<img src="resources/images/JY/right_arrow2.png" id="rightArrow" alt="오른쪽 화살표" width="100px" height="100px"> <br />
			</div>	
			<div class="more">
				<div class="go_pic">더 많은 작품 보러가기 ></div>
			</div>
		</div>
		<br />
		<div class="draw_wrap">
			<div class="draw_title">그림갤러리</div>
			<div class="img_wrap2">
				<img src="resources/images/JY/left_arrow2.png" id="leftArrow2" alt="왼쪽 화살표" width="100px" height="100px">
				<div class="draw_main_wrap"></div>
				<img src="resources/images/JY/right_arrow2.png" id="rightArrow2" alt="오른쪽 화살표" width="100px" height="100px">
			</div>
				<div class="more">
					<div class="go_draw">더 많은 작품 보러가기 ></div>
				</div>
		</div>
		<br />
		<div class="video_wrap">
			<div class="video_title">영상갤러리</div>
			<div class="img_wrap3">
				<img src="resources/images/JY/left_arrow2.png" id="leftArrow3" alt="왼쪽 화살표" width="100px" height="100px">
				<div class="video_main_wrap"></div>
				<img src="resources/images/JY/right_arrow2.png" id="rightArrow3" alt="오른쪽 화살표" width="100px" height="100px">
			</div>
				<div class="more">
					<div class="go_video">더 많은 작품 보러가기 ></div>
				</div>
		</div>
	</div>
	</div>
	
	<c:import url="footer.jsp"></c:import>

</body>
</html>
