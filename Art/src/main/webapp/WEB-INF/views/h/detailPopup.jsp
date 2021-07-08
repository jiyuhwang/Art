<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!--EL Tag 확장기능  --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기팝업</title>
<link rel="stylesheet" href="resources/css/h/detail_popup.css">
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	loadDetail();
	
	
	
	$("#listBtn").on("click", function(){
		//history.back(); 상세보기에서 수정으로 이동했다가 돌아가면 쓰던 창으로 돌아가니까 location으로 바꿈
		$("#goForm").attr("action", "gallaryManage");
		$("#goForm").submit();
	});
	
	$("#updateBtn").on("click", function(){
		$("#goForm").attr("action", "detailUpdatePopup");
		$("#goForm").submit();
	});
	
	$("#deleteBtn").on("click", function(){
		if(confirm("삭제하시겠습니까?")){//삭제 아작스로 돌릴거다.
			
			var params = $("#goForm").serialize();
			
			$.ajax({
				url: "detailDeletePopup",//접속주소
				type: "post",
				dataType: "json",//받아올 데이터 형식
				data: params, //얘랑 21번째 var 랑 이름 맞추기만 하면 됨
				success: function(res){ //성공시 다음 함수 실행
					
					if(res.msg == "success"){
						location.href = "gallaryManage";	
					} else if(res.msg == "failed"){
						alert("작성에 실패하였습니다.");
					} else {
						alert("작성 중 문제가 발생하였습니다.");
					}
					
					
				},//실패시 다음함수 실행, 값이 돌아오지 않는다든지에 대한 에러. 인터넷이 끊어지지않는이상 안터질거다 여기서는
				error: function(request, status, error){
					console.log(error);
					
				}
			
			});

		}
		
	});
	//만약 사진 없으면 관리자니까 ART그림 불러오게하기
	//파일 왜 안뜨니
	//좋아요, 공유버튼 나오게 하는거(상단에)
	//태그, 댓글 처리하기
	
	
	
	//-------------------------------------------------------ajax실행

	
	
	
	
	
	
	
	
	

	
	
});

</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="postNo" value="${data.POST_NO}"/><!--글 번호를 알아야 수정할 수 있다.  -->
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchFlag" value="${param.searchFlag}"/>
	<input type="hidden" name="searchTxt" value="${param.searchTxt}"/>
</form>

<c:if test="${!empty data.POST_FILE}">
<!-- set: 변수 -->
<%-- <c:set var="len" value="${fn:length(data.B_FILE)}"></c:set>
첨부파일: <!--a의 download: 해당 주소를 다운로드 하겠다. 값이 있는 경우 해당이름으로 다운받겠다.  -->
<a href="resources/upload/${data.B_FILE}" download="${fn:substring(data.B_FILE, 20, len)}">${fn:substring(data.B_FILE, 20, len)}</a><br/><!--이클립스가 못읽는거니 신경은 안써도된다..  -->
--%>
첨부파일: <a href="resources/upload/${data.POST_FILE}" download="${data.POST_UFILE}">
${data.POST_UFILE}</a><br/>
</c:if>
태그 받기:<br/>
댓글 받기:<br/>
<br/>



<input type="button" value="수정" id="updateBtn"/>
<input type="button" value="삭제" id="deleteBtn"/>
<input type="button" value="목록가기" id="listBtn"/>


<div class="wrap">
		<div class="contents_wrap">
			<img class="contents_img" src="resources/images/JY/짱구1.jpg">
		</div>
		<div class="category">${data.CATEGORY_NAME}</div>
		<div class="title">${data.TITLE}</div>
		<div class="contents_date">${data.REGISTER_DATE}</div><br/><br/>
		<div class="contents">${data.EXPLAIN}</div>
		<div class="tag_wrap">
		<c:choose>
			<c:when test="${!empty data.TAGS}">
				<c:set var="tagSplit" value="${fn:split(data.TAGS,',')}"></c:set>
				<c:forEach var="i" items="${tagSplit}">
					<i class="tag"># ${i}</i>
				</c:forEach>
			</c:when>
		</c:choose>
			<div class="comment_wrap">
				<img class="comment_img" src="resources/images/JY/comment.png">
				<div class="comment">댓글 ${data.COMMENT_CNT}개</div>
			</div>		
		</div><br/>
	<div class="mini_profile_wrap">
		<div class="mini_profile">
			<img class="profile_img2" src="resources/images/JY/짱구1.jpg" alt="짱구1">
		${data.PROFILE_IMG_PATH}</div>
		<div class="mini_profile_name">${data.USER_NICKNAME}</div>
		<div class="profile_introduce">${data.INTRODUCE}</div>
	</div>
</div>
</body>
</html>