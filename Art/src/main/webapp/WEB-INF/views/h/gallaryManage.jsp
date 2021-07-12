<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!--EL Tag 확장기능  --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
<style type="text/css">
tbody tr:hover {
	background-color: #f2f2f2;
}

</style>

<link rel="stylesheet" href="resources/css/h/gallary_manage.css"/>
<!-- Popup CSS -->
<link rel="stylesheet" href="resources/css/h/detail_popup.css">
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	if("${param.searchFlag}" != "")
		$("#searchFlag").val("${param.searchFlag}");
	
	if("${param.srhYearFlag}" != "")
		$("#srhYearFlag").val("${param.srhYearFlag}");
	
	if("${param.startFlag}" != "")
		$("#startFlag").val("${param.startFlag}");
	
	if("${param.endFlag}" != "")
		$("#endFlag").val("${param.endFlag}");
	
	$("#page").val(1);
	
	//---------------------------------------데이터 가져오기
	loadPostList();
	
	//사이드바, 탭 고정시키기
	$(".gallary").attr("id", "active");
	$(".menu_tab_wrap div:first-child").attr("class", "tab_selected");
	
	//menuTab클릭했을 때 
	$(".menu_tab_wrap").on("click", "div", function(){
		
		$(".menu_tab_wrap div").attr("class", "tab");
		$(this).attr("class", "tab_selected");
		
/* 		if($(this).attr("id", "entire")){
			
		} else if($(this).attr("id", "picture")){
			
		} else if($(this).attr("id", "drawing")){

			
		} else{
			
		}	 */
		
		
		loadPostList();
		
	});
	
	//상세보기
	$("tbody").on("dblclick", "tr", function(){
		$("#postNo").val($(this).attr("pno"));
		drawPopup();
	});
	
	//검색버튼 누르면 준비중입니다 알람
	$(".btn_notyet").on("click", function(){
		alert("준비중입니다.");
	});
	
	//검색시
	$("#searchBtn").on("click", function(){
		$("#page").val(1);
		$("#searchOldTxt").val($("#searchTxt").val());
		loadPostList();
	});//예전 검색어 다시 확인하기 flag들 확인하기
	
	//삭제된,삭제제외,삭제포함 버튼 클릭시
	$("#BtnWith").off("click");
	$("#BtnWith").on("click", function(){
		$("#delFlag").val("");
		console.log($("#delFlag").val());
		loadPostList();
	});

	$("#BtnWithDel").off("click");
	$("#BtnWithDel").on("click", function(){
		$("#delFlag").val("0");
		loadPostList();
	});
	
	$("#BtnWithoutDel").off("click");
	$("#BtnWithoutDel").on("click", function(){
		$("#delFlag").val("1");
		loadPostList();
	});
	
	
	
	
	//전체체크하면 전체적으로 체크되게 하기
	$("#checkAll").on("click", function(){
		if($(this).is(":checked")){
			$(".result_table input").prop("checked", true);
		} else {
			$(".result_table input").prop("checked", false);
		}
	});
	
	//하나라도 체크 풀면 전체체크박스 해제되기
	$(".result_table").on("click", "[type='checkbox']", function(){
		if($(".table_tr [type='checkbox']").length
				== $(".table_tr [type='checkbox']:checked").length){
			$("#checkAll").prop("checked", true);
		} else {
			$("#checkAll").prop("checked", false);
		}

		//console.log($(".result_table [type='checkbox']").length);
		//console.log($("#tableTr [type='checkbox']:checked").length);
	});

	
	
	
	
	
	
	
/* 	//클릭시 색상 변하기.............미완성
	$(".result_table").on("click", "tr", function(){
		if( $(this).attr("id") == "c"){
			$("#c [type='checkbox']").prop("checked", false);
			$(this).attr("id", "");
			
		} else {
			$(this).attr("id", "c");
			$("#c [type='checkbox']").prop("checked", true);
		}
			
	}); */

	
	
	
	
	


	

	
	$("#pagingWrap").on("click", "span", function(){
		$("#page").val($(this).attr("name"));	
		$("#searchTxt").val($("#searchOldTxt").val());
		loadPostList();
	});
	
	
	
	
	//-------------------------------------------------------ajax실행
	function loadPostList(){
		var params = $("#actionForm").serialize();
		console.log(params);
		$.ajax({
			url: "entireList",
			type: "post",
			dataType: "json",
			data: params,
			success: function(result){
				
				drawList(result.list);
				drawPaging(result.pb);
				showCnt(result.cnt);
				
			}, error: function(request, status, error){
				console.log(error);
			}
		});
	}

	
	//-------------------------------------------------------목록그리기
	function drawList(list){
		var html = "";
		var no = 0;
		
		if(list.length == 0 && $("#page").val() == 1) {
			html += "<tr>";
			html += "<td colspan=\"5\">등록된 글이 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var d of list){
				++no;
				html +="<tr pno=\"" + d.POST_NO + "\" class=\"table_tr\">";
				html +="<td><input type=\"checkbox\"></td>";
				html +="<td>" + no + "</td>";
				html +="<td>" + d.POST_NO + "</td>";
				html +="<td>" + d.CATEGORY_NAME + "</td>";
				html +="<td>" + d.TITLE + "</td>";
				html +="<td>" + d.NAME + "</td>";
				html +="<td>" + d.NICKNAME +"(" + d.USER_ID + ")</td>";
				html +="<td>" + d.R_DATE + "</td>";
				html +="<td>" + d.VIEWS + "</td>";
				html +="<td>" + d.LIKE_CNT + "</td>";
				html +="</tr>";
			}
			
			
		}
		
		$("tbody").html(html);
		
	}
	
	//-------------------------------------------------------상세보기그리기
	function drawPopup(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url: "drawUserPopup",
			type: "post",
			dataType: "json",
			data: params,
			success: function(result){
				var html = "";
                
				html +="	<div class=\"background\"></div>";
				html +="	<div class=\"wrap\">";
				html +="	<div class=\"popup_title\">관리자용 상세보기</div>";
				html +="	<div class=\"close_btn_wrap\">";
				html +="	<input type=\"button\" id=\"BtnUpdate\" value=\"수정\"/>";
				html +="	<input type=\"button\" id=\"BtnClose\" value=\"닫기\"/>";
				html +="	</div>";
				html +="	<div class=\"contents_wrap\">";
				
				if(result.data.POST_FILE != null && result.data.POST_FILE != "") {
					html +=" <img class=\"contents_img\" src=\"resources/upload/"+ result.data.POST_FILE
								+"\" alt=\"작품이미지\" download=\""+ result.data.POST_UFILE +"\">";
				} else {
					html +=" <img class=\"contents_img\" src=\"resources/images/JY/짱구1.jpg\" alt=\"사랑스런짱구\">";
				}

				html +="	</div>";
				html +="	<div class=\"category\">"+ result.data.CATEGORY_NAME +"</div>";
				html +="	<div class=\"title\">"+ result.data.TITLE +"</div>";
				html +="	<div class=\"contents_date\"> 작성시간: "+ result.data.REGISTER_DATE +"&nbsp;&nbsp;"
								
					var checkV = result.data.VISIBILITY;
					
					if(checkV == "0"){
						 html +="	공개&nbsp;&nbsp;";						
					} else {
						 html +="	비공개&nbsp;&nbsp;";
					}
				
				html +="조회수: "+ result.data.VIEWS +"&nbsp;&nbsp;좋아요수: "+ result.data.LIKE_CNT +"</div><br/><br/>";					
				html +="	<div class=\"contents\">"+ result.data.EXPLAIN +"</div>";
				html +="	<div class=\"tag_wrap\">";

				if(result.data.TAGS != null && result.data.TAGS != "") {
					
					var tagSplit = (result.data.TAGS).split(",");
					
					for(var t of tagSplit){
						html +="<i class=\"small_tag\"># "+ t +"</i>";
					}
				}
				     
				html +="	<div class=\"comment_wrap\">";
				html +="	<img class=\"comment_img\" src=\"resources/images/JY/comment.png\" alt=\"댓글아이콘\">";
				html +="	<div class=\"comment\">댓글 "+ result.data.COMMENT_CNT+"개</div>";
				html +="	</div></div><br/>";
				html +="	<div class=\"mini_profile_wrap\">";
				html +="	<div class=\"mini_profile\">";
				
				if(result.data.PROFILE_IMG_PATH != null && result.data.PROFILE_IMG_PATH != "") {
					html +=" <img class=\"profile_img2\" src=\"resources/upload/"+ result.data.PROFILE_IMG_PATH
								+"\" alt=\"프로필이미지\" download=\""+ result.data.PROFILE_IMG_UPATH+"\">";
				} else {
					html +=" <img class=\"profile_img2\" src=\"resources/images/JY/who.png\" alt=\"기본프로필\">";
				}
				
				html +="	</div><div class=\"mini_profile_name\">"+ result.data.USER_NICKNAME +"</div>";
				html +="	<div class=\"profile_introduce\">"+ result.data.INTRODUCE +"</div>";
				html +="	</div>";
				html +="	</div>";
				html +="	</form>";
				
				$("body").prepend(html);
				
				$(".background").hide();
				$(".wrap").hide();
				
				$(".background").fadeIn();
				$(".wrap").fadeIn();
				
				$("#BtnUpdate").off("click");
				$("#BtnUpdate").on("click", function(){
					updatePopup();
				});
				
				
				$("#BtnClose").off("click");
				$("#BtnClose").on("click", function(){
					closePopup();
				});
				
				$(".background").off("click");
				$(".background").on("click", function(){
					closePopup();
				});
				
			}, error: function(request, status, error){
				console.log(error);
			}
		});
	}
	
	//-------------------------------------------------------상세보기그리기
	function updatePopup(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url: "updatePopup",
			type: "post",
			dataType: "json",
			data: params,
			success: function(result){
				var html = "";
                
				html +="	<div class=\"background\"></div>";
				html +="	<div class=\"wrap\">";
				html +="	<div class=\"popup_title\">관리자용 상세보기</div>";
				html +="	<div class=\"close_btn_wrap\">";
				html +="	<input type=\"button\" id=\"BtnUpdate\" value=\"수정\"/>";
				html +="	<input type=\"button\" id=\"BtnClose\" value=\"닫기\"/>";
				html +="	</div>";
				html +="	<div class=\"contents_wrap\">";
				
				if(result.data.POST_FILE != null && result.data.POST_FILE != "") {
					html +=" <img class=\"contents_img\" src=\"resources/upload/"+ result.data.POST_FILE
								+"\" alt=\"작품이미지\" download=\""+ result.data.POST_UFILE +"\">";
				} else {
					html +=" <img class=\"contents_img\" src=\"resources/images/JY/짱구1.jpg\" alt=\"사랑스런짱구\">";
				}

				html +="	</div>";
				html +="	<div class=\"category\">"+ result.data.CATEGORY_NAME +"</div>";
				html +="	<div class=\"title\">"+ result.data.TITLE +"</div>";
				html +="	<div class=\"contents_date\"> 작성시간: "+ result.data.REGISTER_DATE +"&nbsp;&nbsp;"
								
					var checkV = result.data.VISIBILITY;
					
					if(checkV == "0"){
						 html +="	공개&nbsp;&nbsp;";						
					} else {
						 html +="	비공개&nbsp;&nbsp;";
					}
				
				html +="조회수: "+ result.data.VIEWS +"&nbsp;&nbsp;좋아요수: "+ result.data.LIKE_CNT +"</div><br/><br/>";					
				html +="	<div class=\"contents\">"+ result.data.EXPLAIN +"</div>";
				html +="	<div class=\"tag_wrap\">";

				if(result.data.TAGS != null && result.data.TAGS != "") {
					
					var tagSplit = (result.data.TAGS).split(",");
					
					for(var t of tagSplit){
						html +="<i class=\"small_tag\"># "+ t +"</i>";
					}
				}
				     
				html +="	<div class=\"comment_wrap\">";
				html +="	<img class=\"comment_img\" src=\"resources/images/JY/comment.png\" alt=\"댓글아이콘\">";
				html +="	<div class=\"comment\">댓글 "+ result.data.COMMENT_CNT+"개</div>";
				html +="	</div></div><br/>";
				html +="	<div class=\"mini_profile_wrap\">";
				html +="	<div class=\"mini_profile\">";
				
				if(result.data.PROFILE_IMG_PATH != null && result.data.PROFILE_IMG_PATH != "") {
					html +=" <img class=\"profile_img2\" src=\"resources/upload/"+ result.data.PROFILE_IMG_PATH
								+"\" alt=\"프로필이미지\" download=\""+ result.data.PROFILE_IMG_UPATH+"\">";
				} else {
					html +=" <img class=\"profile_img2\" src=\"resources/images/JY/who.png\" alt=\"기본프로필\">";
				}
				
				html +="	</div><div class=\"mini_profile_name\">"+ result.data.USER_NICKNAME +"</div>";
				html +="	<div class=\"profile_introduce\">"+ result.data.INTRODUCE +"</div>";
				html +="	</div>";
				html +="	</div>";
				html +="	</form>";
				
				$("body").prepend(html);
				
				$(".background").hide();
				$(".wrap").hide();
				
				$(".background").fadeIn();
				$(".wrap").fadeIn();
				
				$("#BtnUpdate").off("click");
				$("#BtnUpdate").on("click", function(){
					updatePopup();
				});
				
				
				$("#BtnClose").off("click");
				$("#BtnClose").on("click", function(){
					closePopup();
				});
				
				$(".background").off("click");
				$(".background").on("click", function(){
					closePopup();
				});
				
			}, error: function(request, status, error){
				console.log(error);
			}
		});
	}
	

	//상세팝업닫기
	function closePopup() {
		$(".background").fadeOut(function(){
			$(".background").remove();
		});
		
		$(".wrap").fadeOut(function(){
			$(".wrap").remove();
		});
	}
			
			

	
	
	
	
	
	
	
	
	//총 tr 개수 가져오기
	function showCnt(cnt){
		var html = "";		
		
		html += "<div class=\"result_cnt\">결과: " + cnt +"개</div>";
		html += "<div class=\"button_wrap\">";
		html += "<input type=\"button\" value=\"복원\" class=\"btn_notyet\"/>&nbsp;&nbsp;&nbsp;";
		html += "<input type=\"button\" value=\"삭제\" class=\"btn_notyet\"/>";
		html += "</div>";
		
		$(".cnt_wrap").html(html);
		
	}
	
	
	
	//-------------------------------------------------------페이징 그리기
	function drawPaging(pb){
		var html = "";
		
		html += "<span name=\"1\">처음</span>";
		
		if($("#page").val()== "1"){
			html += "<span name=\"1\">이전</span>";
			
		} else {
			html += "<span name=\"" + ($("#page").val() - 1) + "\">이전</span>";	
		}
		
		for(var i = pb.startPcount; i<= pb.endPcount; i++){
			if($("#page").val() == i){
				html += "<span name=\"" + i + "\"><b>" + i + "</b></span>";
				
			} else {
				html += "<span name=\"" + i + "\">" + i + "</span>";
			}
		}
		
		if($("#page").val() == pb.maxPcount){
			html += "<span name=\"" + pb.maxPcount + "\">다음</span>";
			
		} else {
			html += "<span name=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>";
		}
			
		html += "<span name=\"" + pb.maxPcount + "\">마지막</span>";
		
		$("#pagingWrap").html(html);
	}	
	
	
	
	

	
});//ready


</script>
</head>
<body>
<div class="main">
	<c:import url="managerSidebar.jsp"></c:import>
	<div class ="ctts">
<!------------------------------게시글 신고 관리  -->
		<div class ="blank2"></div>
		
		<div class="menu_tab_wrap">
			<div id="entire" class="tab">전체목록</div>
			<div id="picture" class="tab">사진</div>
			<div id="drawing" class="tab">그림</div>
			<div id="movie" class="tab">영상</div>
		</div>
		<div class="menu_txt_wrap">
			<div class="menu_txt">
				<span><span class="font-red">검색어를 입력</span>하여 검색할 수 있습니다.</span><br/>
				<span><span class="font-red">제목</span>을 연속으로 두 번 클릭하시면 수정페이지로 이동합니다.</span><br/>
				<span><span class="font-red">데이터가 많은 경우</span> 느려질 수 있습니다.</span>
			</div>
		</div>
<!-----------------------------------------------데이터 전송  -->
<form action="#" id="actionForm" method="post" >
	<input type="hidden" id="postNo" name="postNo"/>
	<input type="hidden" id="delFlag" name="delFlag" value="-1"/>
	<input type="hidden" id="page" name="page" value="${page}"/>
	<input type="hidden"  value=""/>
	
		<div class ="search_flag_div">
			<div class="search_flag">
				<label>회원분류</label>
				<select name="srhYearFlag" id="srhYearFlag">
					<option value="0"> 올해작품</option>
					<option value="1"> 작년작품</option>
					<option value="3" selected="selected"> 전체작품</option>
				</select>
				<label>검색분류</label>
				<select name="searchFlag" id="searchFlag">
					<option value="2" selected="selected">제목</option>
					<option value="3">내용</option>
					<option value="4">작성자</option>
					<option value="5">번호</option>
					<option value="6">분류</option>
					<option value="7">제목+내용</option>
					<option value="8">작성일</option>
				</select>
				<input type="hidden" id="searchOldTxt" value="${param.searchTxt}"/>
				<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" placeholder="검색어를 입력해주세요."/>
				<div class="date_srh">
					<label>날짜분류</label>
						<input type="date" id="startFlag" name="startFlag">
						<span> ~ </span>
						<input type="date" id="endFlag" name="endFlag" min="2021-01-01">
						<input type="button" value="검색" id="searchBtn"/>
						<input type="button" value="삭제된" id="BtnWithDel"/>
						<input type="button" value="삭제안된" id="BtnWithoutDel"/>
						<input type="button" value="삭제포함" id="BtnWith"/>
				</div>
			</div>
		</div>
		<div class="cnt_wrap"></div>
</form>
		<!-----------------------------------------------------------테이블 -->
		
		
		<div class="result_table" id="tabResult1">
			<table class="table1">
				<colgroup>
						<col width="2%"/>
						<col width="3%"/>
						<col width="4%"/>
						<col width="10%"/>
						<col width="24%"/>
						<col width="8%"/>
						<col width="20%"/>
						<col width="10%"/>
						<col width="4%"/>
						<col width="4%"/>
					</colgroup>
				<thead>	
				<tr id="tableTh">
					<th>
					<input type="checkbox" id="checkAll"> 
					</th>
					<th>번호</th>
					<th>글번호</th>
					<th>게시판</th>
					<th>제목</th>
					<th>작성자</th>
					<th>닉네임(아이디)</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>좋아요수</th>
				</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<div id="pagingWrap"></div>
	</div>
</div>
</body>
</html>