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
<link rel="stylesheet" href="resources/css/h/report_detail_popup.css"/>
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
		$("#page").val(1);
		console.log($("#delFlag").val());
		loadPostList();
	});

	$("#BtnWithDel").off("click");
	$("#BtnWithDel").on("click", function(){
		$("#delFlag").val("0");
		$("#page").val(1);
		loadPostList();
	});
	
	$("#BtnWithoutDel").off("click");
	$("#BtnWithoutDel").on("click", function(){
		$("#delFlag").val("1");
		$("#page").val(1);
		loadPostList();
	});
	
	$("tbody").on("dblclick", "tr", function(){
		$("#rNo").val($(this).attr("name"));
		drawPopup();
	});
	
	
	
	
	//삭제버튼 클릭시
	$("#BtnDelete").on("click", function(){
		var confirmFlag = confirm("삭제 하시겠습니까?");
					
		if(confirmFlag){
			var checkCnt = $("tbody [name=checkbox]:checked").length;
			
			if(checkCnt == 0){
				alert("선택된 작품이 없습니다.");
			} else {
			
				var checkArr = new Array();
			
				$("tbody [name=checkbox]:checked").each(function() {
					checkArr.push($(this).val());//item이 this라서 this로 많이쓴다나~
				});
								
				$("#checkedArr").val(checkArr);					
				deleteChecked();
				
			}//else
		}	
	});//delete btn click
	
	//복원버튼 클릭시
	$("#BtnReturn").on("click", function(){
		var confirmFlag = confirm("복원 하시겠습니까?");
					
		if(confirmFlag){
			var checkCnt = $("tbody [name=checkbox]:checked").length;
			
			if(checkCnt == 0){
				alert("선택된 작품이 없습니다.");
			} else {
			
				var checkArr = new Array();
			
				$("tbody [name=checkbox]:checked").each(function() {
					checkArr.push($(this).val());//item이 this라서 this로 많이쓴다나~
				});
								
				$("#checkedArr").val(checkArr);					
				returnChecked();
				
			}//else
		}	
	});//return btn click
	
	
	
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
				html +="<tr name=\"" + d.REPORT_NO + "\" class=\"table_tr\">";
				html +="<td><input type=\"checkbox\" name=\"checkbox\" value=\"" + d.REPORT_NO + "\"></td>";
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
	
	//-------------------------------------------체크된 테이블 행을 삭제하는 아작스
	function deleteChecked(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url: "deleteReport",
			type: "post",
			dataType: "json",
			data: params,
			success: function(res){ 
				
				if(res.msg == "success"){
					$("#checkAll").prop("checked", false);
					loadPostList();
				} else if(res.msg == "failed"){
					alert("삭제에 실패하였습니다.");
				} else {
					alert("삭제 중 문제가 발생하였습니다.");
				}						
			},
			error: function(request, status, error){
				console.log(error);
				
			}
		
		});			
	}
	
	//-------------------------------------------삭제된거 복구하는 아작스
	function returnChecked(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url: "returnDelr",
			type: "post",
			dataType: "json",
			data: params,
			success: function(res){ 
				
				if(res.msg == "success"){
					$("#checkAll").prop("checked", false);
					location.href = "reportManage";	
				} else if(res.msg == "failed"){
					alert("복원에 실패하였습니다.");
				} else {
					alert("복원 중 문제가 발생하였습니다.");
				}						
			},
			error: function(request, status, error){
				console.log(error);
				
			}
		
		});			
	}
	
	
	//-------------------------------------------------------상세보기그리기
	function drawPopup(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url: "drawReportPopup",
			type: "post",
			dataType: "json",
			data: params,
			success: function(result){
				
				var html = "";
                								
			html +="	<div class=\"background9\"></div>";
			html +="	<div class=\"ctts9\">";
			html +="	<span class=\"report_no\">신고번호 "+ result.data.REPORT_NO +"</span>";
			html +="	<form id=\"detailForm\">";
			html +="	<input type=\"hidden\" name=\"rNo\" value=\"rNo\"/>";
			html +="	</form>";
			html +="		<div class=\"top_info\">";
			html +="			<div class=\"info1\">";
			html +="				<div>신고내용</div>";
			html +="			</div>";
			html +="			<div class=\"info2\">";
			html +="			최근 6개월동안 신고한 내용을 확인할 수 있습니다.";
			html +="			</div>";
			html +="			<div class=\"info3\">";
			html +="			신고 내용 중 개인정보가 포함되어 있거나 중복된 경우 삭제될 수 있습니다.";
			html +="			</div>";
			html +="			<div class=\"top_date\">";
			html +="				<div class=\"date1\"><div>신고날짜</div></div>";
			html +="				<div class=\"date2\"><div>"+ result.data.REGISTER_DATE +"</div></div>";
			html +="				<div class=\"status1\"><div>처리상태</div></div>";
			html +="				<div class=\"status2\"><div>";
			
				if(result.data.REPORT_STATUS == 0){
					html += "대기중";
				} else if(result.data.REPORT_STATUS == 1){
					html += "철회";
				} else if(result.data.REPORT_STATUS == 2){
					html += "접수완료";
				}else {
					html += "처리완료";
				}					
			
			html +="</div></div>";
			html +="			</div>";
			html +="			<div class=\"top_writer\">";
			html +="				<div class=\"writer1\">작가 닉네임</div>";
			html +="				<div class=\"writer2\">"+ result.data.WRITER_NICK +"</div>";
			html +="				<div class=\"writer3\">작가 이름(아이디)</div>";
			html +="				<div class=\"writer4\">"+ result.data.WRITER_NAME + "(" + result.data.WRITER_ID +")</div>";
			html +="			</div>";
			html +="			<div class=\"top_post\">";
			html +="				<div class=\"post1\">신고된 작품 제목</div>";
			html +="				<div class=\"post2\">"+ result.data.TITLE +"</div>";
			html +="			</div>";
			html +="			<div class=\"top_flag\">";
			html +="				<div class=\"flag1\">신고사유</div>";
			html +="				<div class=\"flag2\">"+ result.data.TYPE_NAME +"</div>";
			html +="			</div>";
			html +="			<div class=\"top_content\">";
			html +="				<div class=\"content1\">내용</div>";
			html +="				<div class=\"content2\">"+ result.data.CONTENTS +"</div>";
			html +="			</div>";
			html +="		</div>";
			html +="		<div class=\"btm_ctts\">";
			html +="			<div class=\"btm_reporter\">";
			html +="				<div class=\"reporter1\">신고자</div>";
			html +="				<div class=\"reporter2\">닉네임: "+ result.data.R_NICK +"&nbsp;&nbsp;";	
			html +="이름(아이디): " + result.data.R_NAME + "(" + result.data.R_ID +")</div>";
			html +="			</div>";
			html +="			<div class=\"btm_memo\">메모</div>";
			html +="			<a class=\"btn_update\">수정</a>";
			html +="			<a class=\"btn_close\">닫기</a>";
			html +="		</div>";
			html +="	</div>";
				
				
				$("body").prepend(html);
				
				$(".background9").hide();
				$(".ctts9").hide();				
				$(".background9").fadeIn();
				$(".ctts9").fadeIn();
				
				$(".btn_close").off("click");
				$(".btn_close").on("click", function(){
					closePopup();
				});
				
				$(".background9").off("click");
				$(".background9").on("click", function(){
					closePopup();
				});
				
				/*----------------------------------------------수정버튼 클릭할 때  */
				$(".btn_update").off("click");
				$(".btn_update").on("click", function(){
					closePopup();

				});
				
				
				
			}, error: function(request, status, error){
				console.log(error);
			}
		});
	}
	
	
	

	//상세팝업닫기
	function closePopup() {
		$(".background9").fadeOut(function(){
			$(".background9").remove();
		});
		
		$(".ctts9").fadeOut(function(){
			$(".ctts9").remove();
		});
		
	}
	
	
	
	
	
	
	
	//총 tr 개수 가져오기
	function showCnt(cnt){
		var html = "";		
		
		html += "<div class=\"result_cnt\">결과: " + cnt +"개</div>";
		html += "<div class=\"button_wrap\">";
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
				<span><span class="font-red">신고내용</span>을 연속으로 두 번 클릭하시면 상세페이지로 이동합니다.</span><br/>
				<span><span class="font-red">데이터가 많은 경우</span> 느려질 수 있습니다.</span>
			</div>
		</div>
		
		<form action="#" id="actionForm" method="post" >
			<input type="hidden" id="rNo" name="rNo"/>
			<input type="hidden" id="delFlag" name="delFlag" value="-1"/>
			<input type="hidden" id="page" name="page" value="${page}"/>
			<input type="hidden" id="checkedArr" name="checkedArr"/>
		
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
		<div class="del_wrap">
			<input type="button"  id="BtnReturn" value="복원"/>
			<input type="button" id="BtnDelete" value="삭제"/>		
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