<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>other_detail</title>
<link rel="stylesheet" href="resources/css/JY/other_detail.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#btnMenu').click(function() {
		if ($('.side_bar').css('display') == 'none') {
			$('.side_bar').slideDown();
		} else {
			$('.side_bar').slideUp();
		}
	})
	
	$('#btnShare').click(function() {
		if ($('.share_wrap').css('display') == 'none') {
			$('.share_wrap').show();
		} else {
			$('.share_wrap').hide();
		}
	})
	
	$('#commentWrap').click(function() {
		if ($('.comment_wrap').css('display') == 'none') {
			$('.comment_wrap').show();
		} else {
			$('.comment_wrap').hide();
		}
	})
	
	$('#btnDeclation').hide();
	$("#btnDot2").hide();

	$('#btnDot1').click(function() {
		$('#btnShare').hide();
		$('#btnLike').hide();
		$('#likeCnt').hide();
		$('#btnDeclation').show();
		$('#btnComment').hide();
		$('#commentCnt').hide();
		$(this).hide();
		$("#btnDot2").show();
	})
	
	$('#btnDot2').click(function() {
		$('#btnDeclation').hide();
		$('#btnShare').show();
		$('#btnLike').show();
		$('#likeCnt').show();
		$('#btnComment').show();
		$('#commentCnt').show();
		$(this).hide();
		$("#btnDot1").show();
	})
	
	$('#btnComment, #commentCnt').click(function(){
			$(".comment_wrap").show();
			var offset = $('#commentWrap').offset();

	        $('html').animate({scrollTop : offset.top}, 400);
	})
});

function heart() {
	var heart = document.getElementById('btnLike')

	if (heart.src.match("resources/images/JY/heart.png")) {
		heart.src = "resources/images/JY/heart2.png";
	} else {
		heart.src = "resources/images/JY/heart.png";
	}
}
</script>
</head>
<body>
	<div class="header">
		<img src="resources/images/JY/menu.png" id="btnMenu" alt="메뉴" width="35px" height="40px">
		<a href="main"><img src="resources/images/JY/art2.png" id="btnLogo" alt="로고" width="70px" height="40px"></a>
		<!-- <div id="srhW"><input type="text" id="btnSrh"></div> -->
		<img src="resources/images/JY/comment2.png" id="btnComment" alt="댓글" width="20px" height="20px">
		<span id="commentCnt">30</span>
		<img src="resources/images/JY/heart.png" id="btnLike" onclick="heart();" alt="좋아요" width="25px" height="25px">
		<span id="likeCnt">23</span>
		<img src="resources/images/JY/share.png" id="btnShare" alt="공유" width="20px" height="20px">
		<img src="resources/images/JY/dot1.png" id="btnDot1" alt="메뉴" width="25px" height="25px">
		<img src="resources/images/JY/dot2.png" id="btnDot2" alt="메뉴" width="25px" height="25px">
		<img src="resources/images/JY/declation.png" id="btnDeclation" alt="신고" width="20px" height="20px">
	</div>
	<div class="share_wrap">
		<div id="share">아트 글을 공유해보세요.</div>
		<input type="text" id="shareAddress" value="http://localhost:8090/TestWeb/JY/NewFile"/>
		<input type="button" id="btnShareAddress" value="Copy"/>
	</div>
	<div class="side_bar">
		<div class="profile">
			<img class="profile_img" src="resources/images/JY/짱구1.jpg" alt="짱구1" width="300px" height="300px">
		</div>
		<div id="profileName">짱구</div>
		<a href="writing"><input type="button" id="btnUpload" value="작품등록"></a>
		<div class="side_bar_menu">
			<span>--------------</span>
			<div id="sideBarMenu1"><a href="mygallary">나의 작업실</a></div>
			<br />
			<div id="sideBarMenu2"><a href="gallary">작품 보러가기</a></div>
			<br />
			<div id="sideBarMenu3"><a href="profile">개인정보 수정</a></div>
			<br />
			<div id="sideBarMenu4"><a href="#">공지사항</a></div>
		</div>
		<input type="button" id="btnLogout" value="로그아웃">
	</div>
	<div class="wrap">
		<div class="contents_wrap">
			<img id="contentsImg" src="resources/images/JY/짱구1.jpg" width="700px" height="500px">
		</div>
		<div id="category">사진갤러리</div>
		<div id="title">스마일 짱구</div>
		<div id="contentsDate">2021.06.28 15:00</div>
		<!-- <div class="btn_edit_dee">
			<input type="button" id="btncontentsEdit" value="수정하기">
			<input type="button" id="btncontentsDee" value="삭제하기">
		</div> -->
		<br />
		<br />
		<div class="contents">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
		<div class="tag_wrap">
			<i class="tag">#복숭아</i>		
			<i class="tag">#나무</i>		
			<i class="tag">#공원</i>
			<div id="commentWrap">
				<img id="commentImg" src="resources/images/JY/comment.png" width="30px" height="30px">
				<div id="comment">댓글</div>
			</div>
		</div>
		<br />
		<div class="comment_wrap">
			<div id="commentTitle">댓글 <span id="commentCnt2"> 5</span></div>
			<div id="commentWriteW"><input id="commentWrite" type="text" placeholder="댓글을 남겨보세요."></div>
			<div id="btnCommentUploadW"><input type="button" id="btnCommentUpload" value="댓글 작성"></div>
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구2.jpg" alt="짱구2" width="30px" height="30px">
				</div>
				<div id="commentName1"><a href="other_gallary">짱구</a></div>
				<div id="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div id="comment1Date">2021.05.11.12:18 <a id="commentDeclaration" href="#">신고하기</a></div>
			</div>
			<div class="btn_reply_upload_W">
				<input type="button" id="btnReplyUpload" value="답글">
			</div>
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구3.jpg" alt="짱구3" width="30px" height="30px">
				</div>
				<div id="commentName1"><a href="other_gallary">짱아</a></div>
				<div id="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div id="comment1Date">2021.05.12.13:20 <a id="commentDeclaration" href="#">신고하기</a></div>
				<div class="btn_reply_upload">
					<input type="button" id="btnReplyUpload" value="답글">
				</div>
			</div>
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구3.jpg" alt="짱구3" width="30px" height="30px">
				</div>
				<div id="commentName1"><a href="other_gallary">짱아</a></div>
				<div id="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div id="comment1Date">2021.05.12.13:20 <a id="commentDeclaration" href="#">신고하기</a></div>
				<div class="btn_reply_upload">
					<input type="button" id="btnReplyUpload" value="답글">
				</div>
			</div>
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구3.jpg" alt="짱구3" width="30px" height="30px">
				</div>
				<div id="commentName1"><a href="other_gallary">짱아</a></div>
				<div id="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div id="comment1Date">2021.05.12.13:20 <a id="commentDeclaration" href="#">신고하기</a></div>
				<div class="btn_reply_upload">
					<input type="button" id="btnReplyUpload" value="답글">
				</div>
			</div>
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구3.jpg" alt="짱구3" width="30px" height="30px">
				</div>
				<div id="commentName1"><a href="other_gallary">짱아</a></div>
				<div id="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div id="comment1Date">2021.05.12.13:20 <a id="commentDeclaration" href="#">신고하기</a></div>
				<div class="btn_reply_upload">
					<input type="button" id="btnReplyUpload" value="답글">
				</div>
			</div>
			<div class="pagination">
					<a href="#">&laquo;</a>
					<a href="#" class="active">1</a> 
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">&raquo;</a>
			</div>
		</div>
		<div class="profile2_wrap">
			<div class="profile2">
				<img class="profile_img2" src="resources/images/JY/짱구1.jpg" alt="짱구1" width="40px" height="40px">
			</div>
			<!-- <div id="share"><a href="#"><img src="resources/images/JY/share.png" alt="공유하기" width="20px" height="20px"></a></div> -->
			<div id="profileName2"><a href="other_gallary">짱구</a></div>
			<div id="profileIntroduce">소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개</div>
		</div>
	</div>


	<div class="footer">
		<a href="main"><img src="resources/images/JY/art2_w.png" id="btnLogo2" alt="로고" width="70px" height="50px"></a>
		<div class="footer_phrase">You can be an art writer.</div>
		<div id="footer1"><a href="#">관리방침 안내</a></div>
		<div id="footer2"><a href="#">도움말 안내</a></div>
		<div id="footer3"><a href="#">회원가입 및 글게시 안내</a></div>
		<div id="footer4"><a href="#">홈페이지 서비스 안내</a></div>
	</div>
</body>
</html>