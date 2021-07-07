<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	if("${param.searchFlag}" != ""){
		$("#searchFlag").val("${param.searchFlag}");
	}
	
	if("${param.srhYearFlag}" != ""){
		$("#srhYearFlag").val("${param.srhYearFlag}");
	}
	
	//---------------------------------------데이터 가져오기
	loadPostList();
	
	//사이드바 해당 메뉴 고정시키기
	$(".gallary").attr("id", "active");
	
	//메뉴탭 고정시키기
	$(".menu_tab_wrap div:first-child").attr("class", "tab_selected");
	
	
	//상세보기
	$("tbody").on("click", "tr", function(){
		$("#postNo").val($(this).attr("pno"));
		confirm("상세페이지로 이동합니다.");
		$("#actionForm").attr("action", "detailPopup");
		$("#actionForm").submit();
	});
	
	//검색시
	$("#searchBtn").on("click", function(){
		$("#searchOldTxt").val($("#searchTxt").val());
		loadPostList();
	});
	
	

	
	
	
	
	
	//전체체크하면 전체적으로 체크되게 하기
	$("#checkAll").on("click", function(){
		if($(this).is(":checked")){
			$("#tableTr input").prop("checked", true);
		} else {
			$("#tableTr input").prop("checked", false);
		}
	});//checkAll
	
	
	//하나라도 체크 풀면 전체체크박스 해제되기
	$(".result_table").on("click", "[type='checkbox']", function(){
		if($("#tableTr [type='checkbox']").length
				== $("#tableTr [type='checkbox']:checked").length){
			$("#checkAll").prop("checked", true);
		} else {
			$("#checkAll").prop("checked", false);
		}
		
		//console.log($(".result_table [type='checkbox']").length);
		//console.log($("#tableTr [type='checkbox']:checked").length);
	});
	
	//체크다하면 전체체크되게
	
	
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

	
	
	
	
	
	//검색버튼 누르면 준비중입니다 알람
	$(".btn_notyet").on("click", function(){
		alert("준비중입니다.");
	});
	
	//사이드바 해당 메뉴 고정시키기
	$(".gallary").attr("class", "manage_selected");
	
	
	
	//menuTab클릭했을 때 
	$(".menu_tab_wrap").on("click", "div", function(){
		
		$(".menu_tab_wrap div").attr("class", "tab");
		$(this).attr("class", "tab_selected");
		$(".result_table").hide();
		
		var selected = $(this).find("a").attr("href");
		$(selected).fadeIn("fast");
		return false;//이걸 안하면 스크롤이 중간에...
		
	});
	
	
	
	
	
	
	//-------------------------------------------------------ajax실행
	function loadPostList(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url: "entire",
			type: "post",
			dataType: "json",
			data: params,
			success: function(result){
				
				drawList(result.list);
				
			}, error: function(request, status, error){
				console.log(error);
			}
		});
	}
	
	function loadDetail(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url: "detailPopup",
			type: "post",
			dataType: "json",
			data: params,
			success: function(result){
				
				drawData(result.data);
				
			}, error: function(request, status, error){
				console.log(error);
			}
		});
	}
	
	
	
	
	//-------------------------------------------------------목록그리기
	function drawList(list){
		var html = "";
		var no = 0;
		
	
		for(var d of list){
			++no;
			html +="<tr pno=\"" + d.POST_NO + "\" id=\"#tableTr\">";
			html +="<td><input type=\"checkbox\"></td>";
			html +="<td>" + no + "</td>";
			html +="<td>" + d.POST_NO + "</td>";
			html +="<td>" + d.CATEGORY_NAME + "</td>";
			html +="<td>" + d.TITLE + "</td>";
			html +="<td>" + d.NAME + "</td>";
			html +="<td>" + d.NICKNAME +"(" + d.USER_ID + ")</td>";
			html +="<td>" + d.R_DATE + "</td>";
			html +="<td>" + d.VIEWS + "</td>";
			html +="<td>" + d.CNT + "</td>";
			html +="</tr>";
		}                             
		
		$("tbody").html(html);
	}
	
	//-------------------------------------------------------상세보기그리기
	function drawData(data){
		var html = "";
		
		
		for(var d of data){
			html +="<div class=\"wrap\">";
			html +="<div class=\"contents_wrap\">";
			html +="<img class=\"contents_img\" src=\"resources/images/JY/짱구1.jpg\" width=\"700px\" height=\"500px\">";
			html +="</div>";
			html +="<div class=\"category\">"+ d.CATEGORY_NAME +"</div>";
			html +="<div class=\"title\">"+ d.TITLE +"</div>";
			html +="<div class=\"contents_date\">"+ d.REGISTER_DATE +"</div>";
			html +="<br/>";
			html +="<br/>";
			html +="<div class=\"contents\">"+ d.EXPLAIN +"</div>";
			html +="<div class=\"tag_wrap\">";
			
			
			if(d.TAGS != null){
				var tags = d.TAGS;
				var tagSplit = tags.split(",");
					
				for(var i=0; i<tagSplit.lenth; i++){
					html +="<i class=\"tag\">#"+ tagSplit[i] +"</i>";
				}
				
			}
			
			
			
			html +="<div class=\"comment_wrap1\">";
			html +="<img class=\"comment_img\" src=\"resources/images/JY/comment.png\" width=\"30px\" height=\"30px\">";
			html +="<div class=\"comment\">댓글</div>";
			html +="</div>";
			html +="</div><br/>";
			html +="<div class=\"profile2_wrap\">";
			html +="<div class=\"profile2\">";
			html +="<img class=\"profile_img2\" src=\"resources/images/JY/짱구1.jpg\" alt=\"짱구1\" width=\"40px\" height=\"40px\">";
			html +=${data.PROFILE_IMG_PATH} +"</div>";
			html +="<div class=\"profile_name2\">"+ d.USER_NICKNAME +"</div>";
			html +="<div class=\"profile_introduce\">"+ d.INTRODUCE +"</div>";
			html +="</div>                                                                                              ";
			html +="</div>                                                                                              ";
		}
		
		$("tbody").html(html);
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
			<div id="entire" class="tab"><a href="#tabResult1">전체목록</a></div>
			<div id="picture" class="tab"><a href="#tabResult2">사진</a></div>
			<div id="drawing" class="tab"><a href="#tabResult3">그림</a></div>
			<div id="movie" class="tab"><a href="#tabResult4">영상</a></div>
		</div>
		<div class="menu_txt_wrap">
			<div class="menu_txt">
				<span><span class="font-red">검색어를 입력</span>하여 검색할 수 있습니다.</span><br/>
				<span><span class="font-red">제목</span>을 클릭하시면 수정페이지로 이동합니다.</span><br/>
				<span><span class="font-red">데이터가 많은 경우</span> 느려질 수 있습니다.</span>
			</div>
		</div>
<!-----------------------------------------------데이터 전송  -->
<form action="#" id="actionForm" method="post" >
	<input type="hidden" id="postNo" name="postNo"/>
	<input type="hidden" id="start"/>
	<input type="hidden"/>
	
		<div class ="search_flag_div">
			<div class="search_flag">
				<label>회원분류</label>
				<select name="srhYearFlag" id="srhYearFlag">
					<option value="0"> 올해회원</option>
					<option value="1"> 작년회원</option>
					<option value="3" selected="selected"> 전체회원</option>
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
						<input type="button" value="삭제제외" class="btn_notyet"/>
						<input type="button" value="삭제포함" class="btn_notyet"/>
				</div>
			</div>
		</div>
		<div class="button_wrap">
			<input type="button" value="복원" class="btn_notyet"/>
			<input type="button" value="삭제" class="btn_notyet"/>
		</div>
</form>
		<!-----------------------------------------------------------테이블 -->
		
		
		<div class="result_table" id="tabResult1">
			<table class="table1" >
				<colgroup>
						<col width="2%"/>
						<col width="3%"/>
						<col width="4%"/>
						<col width="4%"/>
						<col width="40%"/>
						<col width="8%"/>
						<col width="10%"/>
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
	</div>
</div>
</body>
</html>