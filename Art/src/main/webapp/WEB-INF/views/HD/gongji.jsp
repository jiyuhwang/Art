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

var loadFlag = true;
	loadList();
$(document).ready(function() {
	$("#recentPost").attr("class","selected");
	
	//------------------------------------------- 사이드바 
		$('#btnMenu, #btnMenu2').click(function() {
			if($("#userNo").val() != "") {
				if ($('.side_bar').css('display') == 'none') {
					$('.side_bar').slideDown();
				} else {
					$('.side_bar').slideUp();
				}
			} else {
				if ($('.side_bar2').css('display') == 'none') {
					$('.side_bar2').slideDown();
				} else {
					$('.side_bar2').slideUp();
				}
			}
		})
	
	$(document).mouseup(function (e){

		var container = $(".side_bar, .side_bar2");
	
		if( container.has(e.target).length === 0)
	
		container.slideUp();

	});
	
	
//---------------------------------------------------------- 무한 스크롤 페이지	

 /* $(".main").scroll(function () {
	if(loadFlag) {
		if($(".ctts_wrap").height() <= $(".main").scrollTop() + $(".main").height()){

			
			$("#page").val(($("#page").val()*1) +1);
			
			loadList();
			console.log("이제 여기에 아작스 찍자");
			console.log($(".ctts_wrap").innerHeight() );
		console.log("문서 높이" + $(document).height());
		console.log("cttwrap 총 높이"+$(".ctts_wrap").height());
		console.log("cttwrap 높이"+$(".ctts_wrap").scrollTop());
		console.log("window 높이"+$(window).scrollTop());
		console.log("window 높이"+$(window).height());
		console.log("window 높이"+$(window).innerHeight());
		
		}
	} 
});
 */
	$(".main").scroll(function(){
			console.log($(this).innerHeight());
			console.log($(this)[0].scrollHeight);
			console.log($(this).scrollTop());
			console.log($(this).prop('scrollHeight'));
		if($(this).scrollTop() + $(this).innerHeight() >= $(this).prop('scrollHeight')){
			$("#page").val($("#page").val() * 1 + 1);
			loadList();
		} 
	
});









//--------------------------------------------------------------
	
	$('#btnMenu').click(function() {
		if ($('.side_bar').css('display') == 'none') {
			$('.side_bar').slideDown();
		} else {
			$('.side_bar').slideUp();
		}
	});
	
	$('#btnLook').click(function() {
		location.href="searchGallaryPage";
	});
	//--------------------------------------- 오래된 클릭
	$("#oldPost").on("click", function () {
		$("#oldPost").attr("class","selected");
		$("#recentPost").attr("class","recentPost");
		$("#sortO").val("0");
		$("#page").val("1");
		$("div .main_ctt2").remove();
		loadList();
	});
	
	
	//---------------------------------------- 최신 클릭
	$("#recentPost").on("click", function () {
		$("#recentPost").attr("class","selected");
		$("#oldPost").attr("class","recentPost");
		$("#sortO").val("1");
		$("#page").val("1");
		$("div .main_ctt2").remove();
		loadList();
	});
	
	
	//---------------------------------------- 더블 클릭시 해당 상세페이지로 이동 시키기
	
	$("body").on("dblclick",".main_ctt2_cover", function () {
		$("#noticeNo").val($(this).attr("name"));
		$("#actionFrom").attr("action","gong_detail");
		$("#actionFrom").submit();
		console.log("실행 여부 확인");
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
		console.log("발동");
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
		if(list == null || list.length == 0) {
			loadFlag = false;
		}
		for(var d of list){
			html+= "	<div class=\"main_ctt2\">";
			html+= "		<div class=\"main_ctt2_cover\" name=\"" + d.NOTICE_NO + "\">";
			html+= "			<div class=\"second\" >";
			if(d.FILE_PATH =="" && d.FILE_PATH == null ){
				html+= "				<img src=\"resources/images/JY/art2.png\" alt=\"content\">";
			}else{
				console.log("여기 실행은 되니? 엘스 창이야");
				html+= "				<img src=\"resources/images/JY/art2.png\" alt=\"content\">";
				/* html+= "				<img src=\"resources/upload/" + d.FILE_PATH + "\" alt=\"content\">"; */
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
		
		$(".ctts_wrap").append(html);
		
		html = cnt + "개의 글";
		
		$(".left").html(html);
	}


</script>
</head>
<body>
	<form action="#" id="actionFrom" method="post">
		<input type="hidden" id="noticeNo" name="noticeNo">
		<input type="hidden" id="sortO" name="sortO" >
		<input type="hidden" id="page" name="page" value="1">
	</form>
	<div class="hdr">
	<div class="inner_hdr">
		<img src="resources/images/JY/menu.png" id="btnMenu" alt="메뉴" width="35px" height="40px">
		<a href="main.html"><img src="resources/images/JY/art2.png" id="btnLogo" alt="로고" width="70px" height="40px"></a>
		<div id="srhW"><input type="text" id="btnSrh"></div>
		<img src="resources/images/JY/look.png" id="btnLook" alt="돋보기" width="40px" height="40px">
	</div>
	<div class="side_bar">
		<c:choose>
				<c:when test="${empty sUserProfileImg}">
					<div class="profile">
						<img class="profile_img" src="resources/images/JY/who.png" alt="프로필사진" width="300px" height="300px">
				    </div>
				</c:when>
				<c:otherwise>
					<div class="profile">
						<img class="profile_img" src="resources/upload/${sUserProfileImg}" alt="프로필사진" width="300px" height="300px">
				    </div>
				</c:otherwise>
		</c:choose>
		<div class="profile_name">${sUserNickname}</div>
		<a href="write"><input type="button" id="btnUpload" value="작품등록"></a>
		<div class="side_bar_menu">
			<span>--------------</span>
			<div class="side_bar_menu1"><a href="mygallary">나의 작업실</a></div>
			<br />
			<div class="side_bar_menu1"><a href="gallary">작품 보러가기</a></div>
			<br />
			<div class="side_bar_menu3"><a href="profile">마이페이지</a></div>
			<br />
			<div class="side_bar_menu4"><a href="gongji">공지사항</a></div>
		</div>
		<input type="button" id="btnLogout" value="로그아웃">
	</div>
	
	
	
	
	<div class="side_bar2">
		<img id="sideBarLogo" src="resources/images/JY//art2.png" alt="로고" width="80px"
			height="50px">
		<div class="side_bar_phrase">You can be an art writer.</div>
		<input type="button" id="btnStart" value="Art 시작하기">
		<div class="side_bar_menux">
			<div class="side_bar_menu1x">
				<a href="main">Art 홈</a>
			</div>
			<br />
			<div class="side_bar_menu2x">
				<a href="gallary">작품 보러가기</a>
			</div>
		</div>
		<div class="forget">
			<a href="idfind">계정을 잊어버리셨나요?</a>
		</div>
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
					<li id="oldPost" class="oldPost">오래된</li>
					<li id="recentPost" class="recentPost">최신</li>
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