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
<link rel="stylesheet" href="resources/css/h/memo_detail.css"/>
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
			html +="	<input type=\"hidden\" name=\"rNo\" value=\""+ result.data.REPORT_NO +"\"/>";
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
			html +="			<div class=\"btm_memo\"><table class=\"memo_table\" name=\""+ result.data.REPORT_NO +"\"></table></div>";
			html +="			<div class=\"btn_add\">메모추가</div>";
			html +="			<div class=\"btn_close\">닫기</div>";
			html +="		</div>";
			html +="	</div>";
				
				
				$("body").prepend(html);
				
				$(".background9").hide();
				$(".ctts9").hide();				
				$(".background9").fadeIn();
				$(".ctts9").fadeIn();
				
				drawMeMoTable(result.list);
				
				$(".btn_close").off("click");
				$(".btn_close").on("click", function(){
					closePopup();
				});
				
				$(".background9").off("click");
				$(".background9").on("click", function(){
					closePopup();
				});
				
				$(".btm_memo").off("dbclick");
				$(".btm_memo").on("dblclick", "tr", function(){
					
					if(result.list.length != 0) {
						$("#mNo").val($(this).attr("name"));
						showMeMo();
					} else {
						alert("메모가 없습니다.");
					}
				});

				//-----------------------------------------------------------추가버튼 클릭할 때
				$(".btn_add").off("click");
				$(".btn_add").on("click", function(){

					var html = "";
					
					html += "<div class=\"background8\"></div>";
					html += "<div class=\"ctts8\">";
					html += "		<form id=\"memoForm\">";
					html += "	<div class=\"top_div\">";
					html += "<img class=\"star_img\" id=\"starIconBlack\" alt=\"별\" src=\"resources/images/empty_star_icon.png\">";
					html += "		<div class=\"memo_title\">메모</div>";			
					html += "		<img class=\"close_img\" id=\"closeMemo\" alt=\"닫기\" src=\"resources/images/cross.png\">";
					html += "	</div>";
					html += "	<div class=\"memo_ctts_div\">";
					html +="	<input type=\"hidden\" name=\"marking\" id=\"marking\" value=\"1\"/>";
					html +="	<input type=\"hidden\" name=\"rNo\" value=\""+ result.data.REPORT_NO +"\"/>";
					html +="	<input type=\"hidden\" name=\"admin\" id=\"admin\"/>";
					html += "			<input type=\"hidden\" name=\"uNo\" value=\"" + result.data.R_NO + "\" />";
					html += "			<table>";
					html += "				<tr>";
					html += "					<td>작성자</td>";
					html += "					<td><input type=\"text\" size=\"38\"id=\"a\" /></td>  ";
					html += "				</tr>";		
					html += "				<tr>";
					html += "					<td>발생일</td>";
					html += "					<td colspan=\"3\">";				
					html += "<input type=\"date\" name=\"occur\" id=\"occur\" min=\"2021-01-01\"/>";
					html += "				</td></tr>";
					html += "				<tr>";
					html += "					<td colspan=\"4\"> ";
					html += "<textarea rows=\"16\" name=\"contents\" id=\"contents\"></textarea>";
					html += "					</td> ";
					html += "				</tr> ";
					html += "			</table>";
					html += "		<div class=\"save_btn_div\" id=\"save_btn_div\">	";
					html += "			<input type=\"button\" value=\"저장\" id=\"BtnSave\">";
					html += "			<input type=\"button\" value=\"취소\" id=\"BtnCancel\">	";
					html += "		</div>	";
					html += "	</div>";
					html += "	</form>";
					html += "</div>  ";
					
					$("body").prepend(html);
					
					$(".background8").hide();
					$(".ctts8").hide();
					$(".background8").fadeIn();
					$(".ctts8").fadeIn();
					
					$("#memoForm").on("keypress", "input", function(event){
						if(event.keyCode == 13){
							return false;
						}
					});
					
					
					//-------------------------------------------------------------중요도 아이콘
		 			$(".ctts8").on("click", ".star_img", function(){
						if($(this).attr("src") == "resources/images/empty_star_icon.png"){
							$(".star_img").attr("src", "resources/images/yellow_star_icon.png");
							$("#marking").val(0);
						} else {
							$(".star_img").attr("src", "resources/images/empty_star_icon.png");
							$("#marking").val(1);
						}

					}); 
					
					
					
					$(".background8").off("click");
					$(".background8").on("click", function(){
						closeMemoDetail();
					});
					
					$("#closeMemo").off("click");
					$("#closeMemo").on("click", function(){
						closeMemoDetail();
						fastClosePopup();
						drawPopup();
						//setTimeout(function(){drawPopup();}, 400);
							
					});

					
					//----------------------------------------------취소버튼 누를 때
					$("#BtnCancel").off("click");
					$("#BtnCancel").on("click", function(){
						closeMemoDetail();
					});
					
					//----------------------------------------------저장할 때
					$("#BtnSave").off("click");
					$("#BtnSave").on("click", function(){
						
						var txt = $("#a").val();
						var text = $.trim(txt);
						
						if($("#a").val() == "황지유"){
							$("#admin").val(5);
						} else if(txt == "정희두"){
							$("#a").val(2);
						} else if(txt == "홍길동"){
							$("#admin").val(1);
						} else if(txt == "이영민"){
							$("#admin").val(4);
						} else if(txt == "김현"){
							$("#admin").val(3);
						} else {
							alert("존재하지 않는 관리자 입니다.")
							$("#a").focus();
						}
						
						
						if($.trim($("#admin").val()) == ""){
							alert("관리자를 입력해주세요");
							$("#admin").focus();
						} else if($("#occur").val() == ""){
							alert("발생일을 입력하세요");
							$("#occur").focus();
						} else if($.trim($("#contents").val()) == ""){
							alert("메모를 입력하세요");
							$("#contents").focus();
						}else {
							
							var params = $("#memoForm").serialize();
							
							$.ajax({
								type : "post",
								url : "addMemo",
								dataType : "json",
								data : params,
								success : function(result) {
									
									if(result.msg == "success"){
										closeMemoDetail();
										fastClosePopup();
										drawPopup();
									} else if(result.msg == "failed"){
										alert("저장에 실패했습니다.");
									} else {
										console.log(result);
										alert("저장 중 문제가 발생했습니다.");
									}						
					
								},
								error: function(request, status, error){
									console.log(error);
									
								}
																	
								
							});//addMemo ajax end
						}
					});//저장버튼누르면

				});//메모추가버튼누르묜
				
				
				
			}, error: function(request, status, error){
				console.log(error);
			}
		});
	}
	
	//----------------------------------------------메모 테이블 불러오기
		 function drawMeMoTable(list) {
			var html="";
			var no = 0;
			
			html += "	<colgroup>";
			html += "		<col width=\"100px\"/>";
			html += "		<col width=\"100px\"/>";
			html += "		<col width=\"50px\"/>";
			html += "		<col width=\"700px\"/>";
			html += "	</colgroup>";
			html +=	"	  <thead>";
			html +=	"		  <tr>";
			html +=	"			  <th>번호</th>";
			html +=	"			  <th>날짜</th>";
			html +=	"			  <th></th>";
			html +=	"			  <th>메모내용</th>";
			html +=	"		  </tr>";
			html +=	"	  </thead>";
			html +=	"	  <tbody>";
			
			if(list.length == 0) {
				html += "<tr>";
				html += "<td colspan=\"5\">등록된 글이 없습니다.</td>";
				html += "</tr>";
			} else {
			
					for(var d of list){
						no++;
						html+= "	<tr name=\""+  d.MEMO_NO +"\">";
						html+= "		<td> " + no +"</td>";
						html+= "		<td>  "+ d.REGISTER_DATE +"</td>";
						
						if(d.MARKING == 0){
							html += "	<td><img class=\"star_table_img\" id=\"starIconYellow\" alt=\"중요별\" src=\"resources/images/yellow_star_icon.png\"></td>";	
						} else {
							html+= "		<td> </td>";
						}

						html+= "		<td>  "+ d.CONTENTS +"</td>";
						html+= "	</tr>";
					}
			}		
				html +=	"	</tbody>";
	
				$(".btm_memo table").html(html);
		}
	
		//----------------------------------------------메모 상세보기
		function showMeMo() {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url:"reportMemo",
				type:"post",
				dataType :"json",
				data:params,
				success : function (result) {

			var html = "";
			
			html += "<div class=\"background8\"></div>";
			html += "<div class=\"ctts8\">";
			html += "	<div class=\"top_div\">";
			if(result.memo.MARKING == 0){
				html += "<img class=\"star_img\" id=\"starIconYellow\" alt=\"중요별\" src=\"resources/images/yellow_star_icon.png\">";					
			} else {
				html += "<img class=\"star_img\" id=\"starIconBlack\" alt=\"별\" src=\"resources/images/empty_star_icon.png\">";
			}
			html += "		<div class=\"memo_title\">메모</div>";			
			html += "		<img class=\"close_img\" id=\"closeMemo\" alt=\"닫기\" src=\"resources/images/cross.png\">";
			html += "	</div>";
			html += "	<div class=\"memo_ctts_div\">";
			html += "		<form id=\"memoForm\">";
			html += "			<input type=\"hidden\" name=\"mNo\" value=\"" + result.memo.MEMO_NO + "\" />";
			html += "			<input type=\"hidden\" name=\"marking\" value=\"" + result.memo.MARKING + "\" />";
			html += "			<input type=\"hidden\" name=\"uNo\" value=\"" + result.memo.R_NO + "\" />";
			html += "			<table>";
			html += "				<colgroup>";    
			html += "					<col width=\"210px\"/>";
			html += "					<col width=\"20px\"/>";
			html += "					<col width=\"210px\"/>";
			html += "				</colgroup>";	
			html += "				<tr>";
			html += "					<td>작성자</td>";
			html += "					<td colspan=\"3\">" + result.memo.ADMIN_NAME + "&nbsp;&nbsp;&nbsp;관리자</td>	";
			html += "				</tr>";		
			html += "				<tr>";
			html += "					<td>발생일</td>";
			html += "					<td colspan=\"3\">";
			html += "						<div class=\"accur_div\">" +result.memo.ACCUR_DATE + "</div>";
			html += "<input type=\"text\" class=\"update_input\" size=\"38\" name=\"occur\" id=\"accur\" value=\"" + result.memo.ACCUR_DATE + "\" />";		
			html += "				</td></tr>";
			html += "				<tr>";
			html += "					<td>작성일</td>";
			html += "					<td colspan=\"3\">" + result.memo.MEMO_REGI + "</td>";
			html += "				</tr>";
			html += "				<tr>";
			html += "					<td colspan=\"4\"> ";
			html += "						<div class=\"detail_ctts\">";
			html += result.memo.CONTENTS;
			html += "						</div>";
			html += "<textarea class=\"update_input\" rows=\"16\" name=\"contents\" id=\"contents\">" + result.memo.CONTENTS + "</textarea>";
			html += "					</td> ";
			html += "				</tr> ";
			html += "			</table>";
			html += "		<div class=\"btn_div\" id=\"btn_div\">";
			html += "			<input type=\"button\" value=\"수정\" id=\"BtnUpdate\">";
			html += "			<input type=\"button\" value=\"삭제\" id=\"BtnDelete\">";
			html += "		</div>	";
			html += "		<div class=\"update_btn_div\" id=\"update_btn_div\">	";
			html += "			<input type=\"button\" value=\"저장\" id=\"BtnSave\">";
			html += "			<input type=\"button\" value=\"취소\" id=\"BtnCancel\">	";
			html += "		</div>	";
			html += "	</form>";
			html += "	</div>";
			html += "</div>  ";
			
			$("body").prepend(html);
			
			$(".background8").hide();
			$(".ctts8").hide();
			$(".background8").fadeIn();
			$(".ctts8").fadeIn();
			
			
			//-------------------------------------------------------------중요도 아이콘
 			$(".ctts8").on("click", ".star_img", function(){
				if(($(this).attr("src") == "resources/images/empty_star_icon.png") &&
						result.memo.MARKING == 1){
							
				var params= $("#memoForm").serialize();
				
				$.ajax({
					url : "onStar",
					type : "post",
					dataType : "json",
					data : params,
					success: function(res) {
						$(".star_img").attr("src", "resources/images/yellow_star_icon.png");
					},
					error: function(request, status, error) {
						console.log(error);
					}
				});
			
				} else if(($(this).attr("src") == "resources/images/yellow_star_icon.png") &&
						result.memo.MARKING == 0) {
										
					$.ajax({
						url : "offStar",
						type : "post",
						dataType : "json",
						data : params,
						success: function(res) {
							$(".star_img").attr("src", "resources/images/empty_star_icon.png");
							console.log("검정별");
							
						},
						error: function(request, status, error) {
							console.log(error);
						}
					});
				} else {
					alert("중요도 변경시 오류가 발생했습니다.");
				}

			}); 
			
			
			
			$(".background8").off("click");
			$(".background8").on("click", function(){
				closeMemoDetail();
			});
			
			$("#closeMemo").off("click");
			$("#closeMemo").on("click", function(){
				closeMemoDetail();
				fastClosePopup();
				drawPopup();
				//setTimeout(function(){drawPopup();}, 400);
					
			});
			
			
			//----------------------------------------------수정버튼 누를 때
			$("#BtnUpdate").off("click");
			$("#BtnUpdate").on("click", function(){
				$(".accur_div").css("display", "none");
				$(".detail_ctts").css("display", "none");
				$(".btn_div").css("display", "none");
				$(".update_input").each(function(){
					$(this).css("display", "block");
				});
				$("#update_btn_div").css("display", "block");
			});
			
			//----------------------------------------------취소버튼 누를 때
			$("#BtnCancel").off("click");
			$("#BtnCancel").on("click", function(){
				$(".accur_div").css("display", "block");
				$(".detail_ctts").css("display", "block");
				$(".btn_div").css("display", "block");
				$(".update_input").each(function(){
					$(this).css("display", "none");
				});
				$("#update_btn_div").css("display", "none");
			});
			
			//----------------------------------------------저장할 때
			$("#BtnSave").off("click");
			$("#BtnSave").on("click", function(){
				var params = $("#memoForm").serialize();
				
				$.ajax({
					type : "post",
					url : "saveReportMemo",
					dataType : "json",
					data : params,
					success : function(result) {
						closeMemoDetail();
						alert("수정되었습니다.");
						closePopup();
						drawPopup();					
					},
					error : function(result) {
						alert("수정에 실패했습니다.");
					}
				});
			});
			
			//----------------------------------------------삭제할 때
			
			$("#BtnDelete").off("click");
			$("#BtnDelete").on("click", function(){
				var params = $("#memoForm").serialize();
				
				$.ajax({
					type : "post",
					url : "delReportMemo",
					dataType : "json",
					data : params,
					success : function(result) {
						closeMemoDetail();
						alert("삭제되었습니다.");
						closePopup();
						drawPopup();
					},
					error : function(result) {
						alert("삭제에 실패했습니다.");
					}
				});
			});
			
		},
		error: function(request, status, error){
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
	
	//상세보기 메모 닫기
	function closeMemoDetail() {
		$(".background8").fadeOut(function(){
			$(".background8").remove();
		});
		
		$(".ctts8").fadeOut(function(){
			$(".ctts8").remove();
		});	
	}
	
	function fastClosePopup() {
		$(".ctts8").remove();
		$(".background8").remove();
		$(".background9").remove();
		$(".ctts9").remove();

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
			<input type="hidden" id="mNo" name="mNo"/>
		
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