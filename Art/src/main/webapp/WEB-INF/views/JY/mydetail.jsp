<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mydetail</title>
<link rel="stylesheet" href="resources/css/JY/mydetail.css">
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
	
	$(document).mouseup(function (e){

		var container = $(".side_bar");
	
		if( container.has(e.target).length === 0)
	
		container.slideUp();

	});
	
	$('#btnShare').click(function() {
		if ($('.share_wrap').css('display') == 'none') {
			$('.share_wrap').show();
		} else {
			$('.share_wrap').hide();
		}
	})
	
	$('.comment_wrap1').click(function() {
		if ($('.comment_wrap2').css('display') == 'none') {
			$('.comment_wrap2').show();
		} else {
			$('.comment_wrap2').hide();
		}
	})
	
	$('#btnReplyUpload').click(function() {
		if ($('.reply_comment_form1_w1').css('display') == 'none') {
			$('.reply_comment_form1_w1').show();
		} else {
			$('.reply_comment_form1_w1').hide();
		}
	})
	
	$('#btnShare').hide();
	$('#btnLike').hide();
	$("#btnDot2").hide();
	$(".like_cnt").hide();
	
	
	$('#btnDot1').click(function() {
		$('#btnShare').show();
		$('#btnLike').show();
		$('.like_cnt').show();
		$('#btnEdit').hide();
		$('#btnDelete').hide();
		$('#btnComment').hide();
		$('.comment_cnt').hide();
		$(this).hide();
		$("#btnDot2").show();
	})
	
	$('#btnDot2').click(function() {
		$('#btnEdit').show();
		$('#btnDelete').show();
		$('#btnShare').hide();
		$('#btnLike').hide();
		$('.like_cnt').hide();
		$('#btnComment').show();
		$('.comment_cnt').show();
		$(this).hide();
		$("#btnDot1").show();
	})
	
	$('#btnComment, .comment_cnt').click(function(){
			$(".comment_wrap1").show();
			var offset = $('.comment_wrap1').offset();

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
		<img src="resources/images/JY/heart.png" id="btnLike" onclick="heart();" alt="좋아요" width="25px" height="25px">
		<span class="like_cnt">23</span>
		<img src="resources/images/JY/comment2.png" id="btnComment" alt="댓글" width="20px" height="20px">
		<span class="comment_cnt">30</span>
		<img src="resources/images/JY/share.png" id="btnShare" alt="공유" width="20px" height="20px">
		<img src="resources/images/JY/dot1.png" id="btnDot1" alt="메뉴" width="25px" height="25px">
		<img src="resources/images/JY/dot2.png" id="btnDot2" alt="메뉴" width="25px" height="25px">
		<img src="resources/images/JY/edit.png" id="btnEdit" alt="수정" width="20px" height="20px">
		<img src="resources/images/JY/delete.png" id="btnDelete" alt="삭제" width="25px" height="25px">
	</div>
	<div class="share_wrap">
		<div class="share">아트 글을 공유해보세요.</div>
		<input type="text" id="shareAddress" value="http://localhost:8090/TestWeb/JY/NewFile"/>
		<input type="button" id="btnShareAddress" value="Copy"/>
	</div>
	<div class="side_bar">
		<div class="profile">
			<img class="profile_img" src="resources/upload/${sUserProfileImg}" alt="짱구1" width="300px" height="300px">
		</div>
		<div class="profile_name">${sUserNickname}</div>
		<a href="writing"><input type="button" id="btnUpload" value="작품등록"></a>
		<div class="side_bar_menu">
			<span>--------------</span>
			<div class="side_bar_menu1"><a href="mygallary">나의 작업실</a></div>
			<br />
			<div class="side_bar_menu1"><a href="gallary">작품 보러가기</a></div>
			<br />
			<div class="side_bar_menu3"><a href="profile">개인정보 수정</a></div>
			<br />
			<div class="side_bar_menu4"><a href="#">공지사항</a></div>
		</div>
		<input type="button" id="btnLogout" value="로그아웃">
	</div>
	<div class="wrap">
		<div class="contents_wrap">
			<img class="contents_img" src="resources/images/JY/짱구1.jpg" width="700px" height="500px">
		</div>
		<div class="category">사진갤러리</div>
		<div class="title">스마일 짱구</div>
		<div class="contents_date">2021.06.28 15:00</div>
		<br />
		<br />
		<div class="contents">작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명작품설명</div>
		<div class="tag_wrap">
			<i class="tag">#복숭아</i>		
			<i class="tag">#나무</i>		
			<i class="tag">#공원</i>
			<div class="comment_wrap1">
				<img class="comment_img" src="resources/images/JY/comment.png" width="30px" height="30px">
				<div class="comment">댓글</div>
			</div>
		</div>
		<br />
		<div class="comment_wrap2">
			<div class="comment_title">댓글 <span class="comment_cnt2"> 5</span></div>
			<div class="comment_write_w"><input id="commentWrite" type="text" placeholder="댓글을 남겨보세요."></div>
			<div class="btn_comment_upload_w"><input type="button" id="btnCommentUpload" value="댓글 작성"></div>
			
			<hr>
			
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구2.jpg" alt="짱구2" width="30px" height="30px">
				</div>
				<div class="comment_name1"><a href="other_gallary">짱구</a></div>
				<div class="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div class="comment1_date">2021.05.11.12:18 <a class="comment_declation" href="#">신고하기</a></div>
				<div class="btn_reply_upload_comment_delete_w">
					<input type="button" id="btnReplyUpload" value="답글">
					<input type="button" id="btnCommentDelete" value="삭제">
				</div>
			</div>
			
			<div class="reply_comment_form1_w1">
				<span class="reply"></span>
				<div class="reply_comment_write_w"><input id="replyCommentWrite" type="text" placeholder="답글을 남겨보세요."></div>
				<div class="reply_btn_comment_upload_w"><input type="button" id="replyBtnCommentUpload" value="답글 작성"></div>
			</div>
			
			<div class="reply_comment_form1_w2">
				<span class="reply"></span>
				<div class="reply_comment_form1">
					<!-- <div id="replyCommentWriteW"><input id="replyCommentWrite" type="text" placeholder="답글을 남겨보세요."></div>
					<div id="replyBtnCommentUploadW"><input type="button" id="replyBtnCommentUpload" value="답글 작성"></div> -->
					<div class="reply_profile3">
						<img class="reply_profile_img3" src="resources/images/JY/짱구2.jpg" alt="짱구2" width="30px" height="30px">
					</div>
					<div class="reply_comment_name1"><a href="other_gallary">구구</a></div>
					<div class="reply_comment1">답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성</div>
					<div class="reply_comment1_date">2021.05.11.12:18 <a class="reply_comment_declation" href="#">신고하기</a></div>
					<div class="reply_btn_reply_upload_comment_delete_w">
						<!-- <input type="button" id="replyBtnReplyUpload" value="답글"> -->
						<input type="button" id="replyBtnCommentDelete" value="삭제">
					</div>
				</div>
			</div>
			
			<div class="reply_comment_form1_w2">
				<span class="reply"></span>
				<div class="reply_comment_form1">
					<!-- <div id="replyCommentWriteW"><input id="replyCommentWrite" type="text" placeholder="답글을 남겨보세요."></div>
					<div id="replyBtnCommentUploadW"><input type="button" id="replyBtnCommentUpload" value="답글 작성"></div> -->
					<div class="reply_profile3">
						<img class="reply_profile_img3" src="resources/images/JY/짱구2.jpg" alt="짱구2" width="30px" height="30px">
					</div>
					<div class="reply_comment_name1"><a href="other_gallary">구구</a></div>
					<div class="reply_comment1">답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성답글작성</div>
					<div class="reply_comment1_date">2021.05.11.12:18 <a class="reply_comment_declation" href="#">신고하기</a></div>
					<div class="reply_btn_reply_upload_comment_delete_w">
						<!-- <input type="button" id="replyBtnReplyUpload" value="답글"> -->
						<input type="button" id="replyBtnCommentDelete" value="삭제">
					</div>
				</div>
			</div>
			
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구2.jpg" alt="짱구2" width="30px" height="30px">
				</div>
				<div class="comment_name1"><a href="other_gallary">짱구</a></div>
				<div class="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div class="comment1_date">2021.05.11.12:18 <a class="comment_declation" href="#">신고하기</a></div>
				<div class="btn_reply_upload_comment_delete_w">
					<input type="button" id="btnReplyUpload" value="답글">
					<input type="button" id="btnCommentDelete" value="삭제">
				</div>
			</div>
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구2.jpg" alt="짱구2" width="30px" height="30px">
				</div>
				<div class="comment_name1"><a href="other_gallary">짱구</a></div>
				<div class="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div class="comment1_date">2021.05.11.12:18 <a class="comment_declation" href="#">신고하기</a></div>
				<div class="btn_reply_upload_comment_delete_w">
					<input type="button" id="btnReplyUpload" value="답글">
					<input type="button" id="btnCommentDelete" value="삭제">
				</div>
			</div>
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구2.jpg" alt="짱구2" width="30px" height="30px">
				</div>
				<div class="comment_name1"><a href="other_gallary">짱구</a></div>
				<div class="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div class="comment1_date">2021.05.11.12:18 <a class="comment_declation" href="#">신고하기</a></div>
				<div class="btn_reply_upload_comment_delete_w">
					<input type="button" id="btnReplyUpload" value="답글">
					<input type="button" id="btnCommentDelete" value="삭제">
				</div>
			</div>
			<div class="comment_form1">
				<div class="profile3">
					<img class="profile_img3" src="resources/images/JY/짱구2.jpg" alt="짱구2" width="30px" height="30px">
				</div>
				<div class="comment_name1"><a href="other_gallary">짱구</a></div>
				<div class="comment1">댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성댓글작성</div>
				<div class="comment1_date">2021.05.11.12:18 <a class="comment_declation" href="#">신고하기</a></div>
				<div class="btn_reply_upload_comment_delete_w">
					<input type="button" id="btnReplyUpload" value="답글">
					<input type="button" id="btnCommentDelete" value="삭제">
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
			<div class="profile_name2"><a href="other_gallary">짱구</a></div>
			<div class="profile_introduce">소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개</div>
		</div>
	</div>

	<c:import url="footer.jsp"></c:import>
</body>
</html>