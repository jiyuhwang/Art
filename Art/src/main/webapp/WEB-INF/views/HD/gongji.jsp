<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="resources/css/HD/gongji.css"/>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	loadList();
$(document).ready(function() {
	$('#btnMenu').click(function() {
		if ($('.side_bar').css('display') == 'none') {
			$('.side_bar').slideDown();
		} else {
			$('.side_bar').slideUp();
		}
	});
	
	$('#btnLook').click(function() {
		if ($('#srhW').css('display') == 'none') {
			$('#srhW').show();
		} else {
			$('#srhW').hide();
		}
	});
});

	function check(chk) {
		var obj = document.getElementsByName("check");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	
	//-------------------------------------------------- 게시판 출력 아작스
	function loadList() {
		$("#actionForm").attr("action","gongji_page")
		var params = $("#actionFrom").serialize();
		
		$.ajax({
			url : "gongji_page",
			type : "post",
			dataType : "json",
			data : params,
			success: function (res) {
				console.log(res.list);
					drawList(res.list, res.cnt);
			},
			error : function (request, status, error) {
				console.log(error);
			}
		});
	}
	
	
	
	
	//-------------------------------------------------- 게시판 리스트 출력
	
	function drawList(list,cnt) {
		var html ='';
		
		for(var d of list){
			html+= "	<div class=\"main_ctt2\">";
			html+= "		<div class=\"main_ctt2_cover\">";
			html+= "			<div class=\"second\">";
			if(d.FILE_PATH =="" && d.FILE_PATH == null ){
				html+= "				<img src=\"resources/images/JY/art2.png\" alt=\"content\">";
			}else{
				console.log("여기 실행은 되니? 엘스 창이야");
				html+= "				<img src=\"resources/upload/" + d.FILE_PATH + "\" alt=\"content\">";
			}
			
			html+= "			</div>";
			html+= "			<div class=\"first\">";
			html+= "				<h5> " + d.TITLE + "</h5>";
			html+= "				<div class=\"sub-ctt\">";
			html+= "					<span>" + d.CONTENTS + "</span>";
			html+= "				</div>";
			html+= "				<span class=\"sub-ctt-bottom\">by Art </span>";
			html+= "			</div>";
			html+= "		</div>";
			html+= "	</div>";
		}
		
		$(".main_ctt").append(html);
		
		html = cnt + "개의 글";
		
		$(".left").html(html);
	}


</script>
</head>
<body>
	<form action="#" id="actionFrom" method="post">
		<input type="hidden" id="noticeNo" name="noticeNo">
	</form>
	<div class="hdr">
	<div class="inner_hdr">
		<img src="resources/images/JY/menu.png" id="btnMenu" alt="메뉴" width="35px" height="40px">
		<a href="main.html"><img src="resources/images/JY/art2.png" id="btnLogo" alt="로고" width="70px" height="40px"></a>
		<div id="srhW"><input type="text" id="btnSrh"></div>
		<img src="resources/images/JY/look.png" id="btnLook" alt="돋보기" width="40px" height="40px">
	</div>
	<div class="side_bar">
		<div class="pfe">
			<img class="pfe_img" src="resources/images/JY/짱구1.jpg" alt="짱구1" width="300px"
				height="300px">
		</div>
		<div id="pfeName">짱구</div>
		<a href="writing.html"><input type="button" id="btnUod"
			value="작품등록"></a>
		<div class="side_bar_menu">
			<div id="sideBarMenu1">
				<a href="mygallary.html">나의 작업실</a>
			</div>
			<br />
			<div id="sideBarMenu2">
				<a href="gallary.html">작품 보러가기</a>
			</div>
			<br />
			<div id="sideBarMenu3">
				<a href="#">개인정보 수정</a>
			</div>
		</div>
		<input type="button" id="btnLot" value="로그아웃">
	</div>
	<!-----------------------------------------------------------------header 검색하는 부분  -->
	<div class="ctts">
		<span class="gong">공지사항</span>
	</div>
</div>
			<!-------------------------------------------------만약 검색어가 없을 경우  -->
<div class="main">	
	<div class="ctts_wrap">
		<div class="main_ctt">
			<div class="left">n개의 글</div>
			<div class="right">
				<ul>
					<li>오래된</li>
					<li>최신</li>
				</ul>
			</div>
		</div>
		
	</div>
</div>
<div class="ftr">
	<a href="main.html"><img src="resources/images/JY/art2_w.png" id="btnLogo2" alt="로고" width="70px" height="50px"></a>
	<div class="ftr_pae">You can be an art writer.</div>
	<div id="ftr1"><a href="#">관리방침 안내</a></div>
	<div id="ftr2"><a href="#">도움말 안내</a></div>
	<div id="ftr3"><a href="#">회원가입 및 글게시 안내</a></div>
	<div id="ftr4"><a href="#">홈페이지 서비스 안내</a></div>
</div>

</body>
</html>