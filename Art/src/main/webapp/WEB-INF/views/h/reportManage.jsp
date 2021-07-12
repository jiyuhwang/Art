<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고관리 페이지 입니다.</title>
<style type="text/css">
tbody tr:hover {
	background-color: #f2f2f2;
}

</style>
<link rel="stylesheet" href="resources/css/h/report_manage.css"/>
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
	
	//사이드바 해당 메뉴 고정시키기
	$(".report").attr("id", "active");
	$(".menu_tab_wrap div:first-child").attr("class", "tab_selected");
	
	//menuTab 클릭했을 때
	$(".menu_tap_wrap").on("click", "div", function(){
		$(".menu_tap_wrap div").attr("class", "tab");
		$(this).attr("class", "tab_selected");
		
		
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

	});
	
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
			url: "reportList",
			type: "post",
			dataType: "json",
			data: params,
			success: function(result){
				
				drawReportList(result.list);
				drawPaging(result.pb);
				showCnt(result.cnt);
				
			}, error: function(request, status, error){
				console.log(error);
			}
		});
	}

	//-------------------------------------------------------목록그리기
	function drawReportList(list){
		var html = "";
		var no = 0;
		
		if(list.length == 0 && $("#page").val() == 1) {
			html += "<tr>";
			html += "<td colspan=\"5\">등록된 글이 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var d of list){
				++no;
				html +="<tr rno=\"" + d.REPORT_NO + "\" class=\"table_tr\">";
				html +="<td><input type=\"checkbox\"></td>";
				html +="<td>" + no + "</td>";
				html +="<td>" + d.REPORT_NO + "</td>";
				html +="<td>" + d.TYPE_NAME + "</td>";
				html +="<td>" + d.WRITER_NAME + "</td>";
				html +="<td>" + d.WRITER_NICK +"(" + d.WRITER_ID + ")</td>";
				html +="<td>" + d.CONTENTS + "</td>";				
				html +="<td>" + d.R_NAME + "</td>";
				html +="<td>" + d.R_NICK +"(" + d.R_ID + ")</td>";
				html +="<td>" + d.REGISTER_DATE + "</td>";
				html +="<td>" + d.REPORT_STATUS + "</td>";
				html +="</tr>";
			}
			
			
		}
		
		$("tbody").html(html);
		
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
			<div id="gallary" class="tab">게시글목록</div>
			<div id="comment" class="tab">댓글목록</div>		
		</div>
		<div class="menu_txt_wrap">
			<div class="menu_txt">
				<span><span class="font-red">검색어를 입력</span>하여 검색할 수 있습니다.</span><br/>
				<span><span class="font-red">제목</span>을 연속으로 두 번 클릭하시면 상세페이지로 이동합니다.</span><br/>
				<span><span class="font-red">데이터가 많은 경우</span> 느려질 수 있습니다.</span>
			</div>
		</div>
		
		<form action="#" id="actionForm" method="post" >
			<input type="hidden" id="rNo" name="rNo"/>
			<input type="hidden" id="delFlag" name="delFlag" value="-1"/>
			<input type="hidden" id="page" name="page" value="${page}"/>
			<input type="hidden"  value=""/>
		
		<div class ="search_flag_div">
			<div class="search_flag">
				<label>신고분류</label>
				<select name="srhYearFlag" id="srhYearFlag">
					<option value="0"> 올해신고</option>
					<option value="1"> 작년신고</option>
					<option value="" selected="selected"> 전체신고</option>
				</select>
				<label>검색분류</label>
				<select name="searchFlag" id="searchFlag">
					<option value="2" selected="selected">내용</option>
					<option value="3">작성자</option>
					<option value="4">신고번호</option>
					<option value="5">작성일</option>
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
		<table>
			<colgroup>
				<col width="50px"/>
				<col width="70px"/>
				<col width="100px"/>
				<col width="100px"/>
				<col width="70px"/>
				<col width="300px"/>
				<col width="700px"/>
				<col width="70px"/>
				<col width="300px"/>
				<col width="100px"/>
				<col width="100px"/>
				</colgroup>
				<thead>	
				<tr id="tableTh">
					<th>
					<input type="checkbox" id="checkAll"> 
					</th>
					<th>번호</th>
					<th>신고번호</th>
					<th>신고타입</th>
					<th>작성자</th>
					<th>닉네임(아이디)</th>
					<th>신고내용</th>
					<th>신고자</th>
					<th>닉네임(아이디)</th><!--신고자 닉네임(아이디)  -->
					<th>작성일</th>
					<th>처리상태</th>
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