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
	//---------------------------------------데이터 가져오기
	loadPostList();

	
	
	
	
	
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
	$(".side_bar div div").attr("class", "manage");
	$("#gallary").attr("class", "manage_selected");
	
	
	//처음화면에 그릴 때
	$(".result_table").hide();//hide all contents
	$(".menu_tab_wrap div:first").attr("class", "tab_selected").show();//active first tab
	$(".result_table:first").show();
	
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
	
	//-------------------------------------------------------목록그리기
	function drawList(list){
		var html = "";
		var no = 0;
		
	
		for(var d of list){
			++no;
			html +="<tr name=\"" + d.POST_NO + "\">";
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
		<div class ="search_flag_div">
			<div class="search_flag">
				<label>회원분류</label>
				<select>
					<option> 전체회원</option>
					<option> 작년회원</option>
				</select>
				<label>검색분류</label>
				<select>
					<option value="title">제목</option>
					<option selected="selected">내용</option>
					<option value="writer">작성자</option>
					<option value="number">번호</option>
					<option value="content">분류</option>
					<option value="repoter">제목+내용</option>
					<option value="process">작성일</option>
				</select>
			     <input type="text" placeholder="검색어를 입력해주세요.">
			     <input type="button" value="검색" class="btn_notyet"/>
				<div class="date_srh">
					<label>날짜분류</label>
						<input type="date">
						<span> ~ </span>
						<input type="date">
						<input type="button" value="검색" class="btn_notyet"/>
						<input type="button" value="삭제제외" class="btn_notyet"/>
						<input type="button" value="삭제포함" class="btn_notyet"/>
				</div>
			</div>
		</div>
		<div class="button_wrap">
			<input type="button" value="복원" class="btn_notyet"/>
			<input type="button" value="삭제" class="btn_notyet"/>
		</div>
		<!-----------------------------------------------------------테이블 -->
		<form action="#" id="actionForm" method="post" >
			<input type="hidden" id="postNo" name="pmo"/>
		
		
		
		
		</form>
		
		
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
					<th>추천수</th>
				</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>	
		<div class="result_table" id="tabResult2">
			<table class="table2">
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
				<tr>
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
					<th>추천수</th>
				</tr>
				<tr id="tableTr">
					<td><input type="checkbox"> </td>
					<td>9</td>
					<td>1242</td>
					<td>
						<select>
							<option>게시판</option>
							<option selected="selected">사진</option>
							<option>그림</option>
							<option>영상</option>
						</select>
					</td>
					<td><a href="#">사진은 이렇게 찍어야  예술입니다!</a></td>
					<td>김철민</td>
					<td>닉네임(example)</td>
					<td>2021-05-15</td>
					<td>2</td>
					<td>0</td>
				</tr>
			</table>
		</div>	
		<div class="result_table" id="tabResult3">
			<table class="table3">
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
				<tr>
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
					<th>추천수</th>
				</tr>
			</table>
		</div>
		<div class="result_table" id="tabResult4">
			<table class="table4">
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
				<tr>
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
					<th>추천수</th>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>