<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 수정하기</title>
<link rel="stylesheet" href="resources/css/JY/edit.css">

<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
function enterValue(){
	
	
		var tagSpan = document.createElement('span');
		var x = document.createElement('span');	
		var xMark = 'x';
		var result = document.getElementById('tag');
		var input = document.getElementById('tagId');
		tagSpan.className='badge';
		x.setAttribute( 'onclick', 'removeTag()' );
		x.className='xClass';

				
		var content =  document.getElementById('tagId');
		var string = content.value;
		var string2 = string.trim();
		var string3 = string2.replace("," , "");
		
		
		
		if(string3 !== ""){
			tagSpan.append(string3);  
			x.append(xMark);
			tagSpan.append(x);
			result.append(tagSpan);  			
			input.value = null;		
		}else if(string3 == string){}

	}
	
	function removeTag(){
		var listSpan = document.getElementById("tag");
		listSpan.removeChild(listSpan.childNodes[0]);
	}





$(document).ready(function() {
	console.log($('#postNo').val());
	console.log($('#uploadFile').attr("src"));
	console.log($('#uploadFile').attr("src").substring(18)); 
	//var filekeep = $('#uploadFile').attr("src").substring(18);
	
	$("#btnCancel").on("click", function () {
		var Text = $( '.badge' ).text();
		var Tag = Text.split('x');
		$('#tag2').val(Tag);
		console.log($('#tag2').val());
	});
	
	CKEDITOR.replace("contentsIn", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2",
		width: "1330",
		height: "500",
		removeButtons: 'Subscript,Superscript,Flash,PageBreak,Iframe,Language,BidiRtl,BidiLtr,CreateDiv,ShowBlocks,Save,NewPage,Preview,Templates,Image'
	});
	
	
	$("#upload").on("click", function () {
		$("#postFile").click();
	});
	

	$("#btnSave").on("click", function(){
		
		$("#contentsIn").val(CKEDITOR.instances['contentsIn'].getData());

		var Text = $( '.badge' ).text();
		var Tag = Text.split('x');
		$('#tag2').val(Tag);
		console.log($('#tag2').val());
		
		
		// 사진 수정을 안 할 경우
		var filekeep = $('#uploadFile').attr("src").substring(17);
		
		if($('#postFileKeep').val() == filekeep) {
			$('#postFile2').val(filekeep);
		}
		console.log($('#postFile2').val());
		
		if($("#uploadFile").attr("src") == "") {
			alert("작품을 올려주세요");
			return false;// ajaxForm 실행 불가
		} else if($("select[name=category]").val() == '0') {
			alert("작품 카테고리를 선택해주세요.");
			$(".select").focus();
			return false;
		} else if($("#titleInput").val() == "") {
			$("#titleInput").focus();
			return false;
		} else if($("#contentsIn").val() == "") {
			$("#contentsIn").focus();
			return false;
		} else {
			

			
			var params= $("#updateForm").serialize();
			
			$.ajax({
				url: "edits", // 접속 주소
				type: "post", // 전송 방식: get, post
				dataType: "json", // 받아올 데이터 형태
				data: params, // 보낼 데이터(문자열 형태)
				success: function(res) { // 성공 시 다음 함수 실행
				    if(res.msg == "success") {
				    	alert("정상적으로 작품 수정되었습니다.");
				    	history.back();
					} else if(res.msg == "failed") {
						alert("작품 수정에 실패하였습니다.");
					} else {
						alert("작성 중 문제가 발생하였습니다.");
					}
				},
				error: function(request, status, error) { // 실패 시 다음 함수 실행
					console.log(error);
				}
			});
	  	}
	    
	});
	

	$("#postFile").on("change", function() {
			
			var fileForm = $("#fileForm");
			
	
			fileForm.ajaxForm({
				beforeSubmit : function() {
				
	
			},
			success : function(res) {
				if(res.result = "SUCCESS") {
					 // 올라간 파일명 저장
					 if(res.fileName.length > 0) {
						 $("#postFile2").val(res.fileName[0]);
					 }
					  
					$("#uploadFile").attr("src", "resources/upload/" + $('#postFile2').val());
		 
					
					} else {
						alert("파일업로드 중 문제 발생");
					}
				},
				error : function() {
					alert("파일업로드 중 문제 발생");
				} 
			}); // ajaxForm End
	
			fileForm.submit();
		});	// postFile click End
});
</script>
</head>
<body>
<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
		<input type="file" name="postFile" id="postFile" />
</form>
<form action="#" id="updateForm" method="post">
	<input type="hidden" id="tag2" name="tag" value="">
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" id="postNo" name="postNo" value="${param.pNo}" />
	<c:choose>
		<c:when test="${empty sUserNo}">
			<c:import url="header2.jsp"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="header.jsp"></c:import>
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="userNo" value="${data.USER_NO}">
	<div class="wrap">
		<div class="upload_wrap">
			<img id="uploadFile" src="resources/upload/${data.POST_FILE}" width="400px" height="400px">
			<input type="hidden" id="postFileKeep" value="${data.POST_FILE}"/>  			
			<input type="button" id="upload"/>
			<input type="hidden" name="postFile2" id="postFile2" value=""/>  
		</div>
		<div class="select_w">
		<c:set var="Category" value="${data.CATEGORY_NO}" />
			<select name="category" class="select">
				<option value="0">카테고리</option>
				<option value="1" <c:if test="${Category eq '1'}">selected</c:if>>사진작품관</option>
				<option value="2" <c:if test="${Category eq '2'}">selected</c:if>>그림작품관</option>
				<option value="3" <c:if test="${Category eq '3'}">selected</c:if>>영상작품관</option>
			</select>

		</div>
			
		<div class="title_input_w"><input name="title" id="titleInput" type="text" value="${data.TITLE}" placeholder="제목을 입력해주세요."></div>
		<div class="contents_in_w"><textarea id="contentsIn" name="explain" cols="80" rows="10" placeholder="작품을 뽐내주세요.">${data.EXPLAIN}</textarea></div>

		<div class="tag_input_w">
			<%-- <c:forEach var="i" items="${array}">
				<input id="tagId" value ="${i}" type="text" placeholder="태그 입력 후 스페이스나 엔터를 눌러주세요."  onkeyup="if(window.event.keyCode==13||window.event.keyCode==32||window.event.keyCode==188){(enterValue())}"/>
			</c:forEach> --%>
			<input id="tagId" value ="${data.TAG_NAME}" type="text" placeholder="태그 입력 후 스페이스나 엔터를 눌러주세요."  onkeyup="if(window.event.keyCode==13||window.event.keyCode==32||window.event.keyCode==188){(enterValue())}"/>
			<div id="tag" class="tagsinput"></div>
		</div>
		<div class="secret">공개 설정</div>
		
		<div class="public_privacy">
			<c:choose>
				<c:when test="${data.VISIBILITY == 0}">
					<input name="public_privacy" value="0" type="radio" checked="checked" /><label id="public">공개</label>
					<input name="public_privacy" value="1" type="radio" /><label id="privacy">비공개</label>
				</c:when>
				<c:otherwise>
					<input name="public_privacy" value="0" type="radio" /><label id="public">공개</label>
					<input name="public_privacy" value="1" type="radio" checked="checked" /><label id="privacy">비공개</label>
				</c:otherwise>
			</c:choose>
			
		</div>
		<br />
		<div class="save_cancel">
			<input id="btnSave" type="button" value="수정하기">
			<input id="btnCancel" type="button" value="취소하기">
		</div>
	</div>
</form>	
	<c:import url="footer.jsp"></c:import>
</body>
</html>