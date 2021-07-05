<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고관리 페이지 입니다.</title>
<link rel="stylesheet" href="resources/css/h/report_manage.css"/>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//전체체크하면 전체적으로 체크되게 하기
	$("#checkAll").on("click", function(){
		if($(this).is(":checked")){
			$(".result_table input").prop("checked", true);
			$(".result_table input").attr("id", "c");
		} else {
			$(".result_table input").attr("id", "");
			$(".result_table input").prop("checked", false);
		}
	});//checkAll
	
	
	//하나라도 체크 풀면 전체체크박스 해제되기
	$(".result_table").on("click", "[type='checkbox']", function(){
		if($(".result_table [type='checkbox']").length
				== $(".result_table [type='checkbox']:checked").length){
			$("#checkAll").prop("checked", true);
			$(".result_table input").attr("id", "c");
		} else {
			$("#checkAll").prop("checked", false);
		}
	});
	
	//클릭시 색상 변하기.............미완성
	$(".result_table").on("click", "tr", function(){
		if( $(this).attr("id") == "c"){
			$("#c [type='checkbox']").prop("checked", false);
			$(this).attr("id", "");
			
		} else {
			$(this).attr("id", "c");
			$("#c [type='checkbox']").prop("checked", true);
		}
			
	});
	
	
	//검색버튼 누르면 준비중입니다 알람
	$(".btn_notyet").on("click", function(){
		alert("준비중입니다.");
	});
	
	//사이드바 고정시키기
	$(".side_bar div div").attr("class", "manage");
	$("#report").attr("class", "manage_selected");
	
	
	
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
			<div id="gallary" class="tab"><a href="#tabResult1">게시글목록</a></div>
			<div id="comment" class="tab"><a href="#tabResult2">댓글목록</a></div>
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
			<input type="button" value="저장" class="btn_notyet"/>
			<input type="button" value="복원" class="btn_notyet"/>
			<input type="button" value="삭제" class="btn_notyet"/>
		</div>
		<div class="result_table" id="tabResult1">
		<table>
			<colgroup>
					<col width="2%"/>
					<col width="3%"/>
					<col width="4%"/>
					<col width="4%"/>
					<col width="5%"/>
					<col width="8%"/>
					<col width="40%"/>
					<col width="5%"/>
					<col width="8%"/>
					<col width="6%"/>
					<col width="10%"/>
				</colgroup>
				<tr>
					<th>
					<input type="checkbox" id="checkAll"> 
					</th>
					<th>번호</th>
					<th>회원번호</th>
					<th>신고타입</th>
					<th>작성자</th>
					<th>닉네임(아이디)</th>
					<th>신고내용</th>
					<th>신고자</th>
					<th>닉네임(아이디)</th><!--신고자 닉네임(아이디)  -->
					<th>작성일</th>
					<th>처리상태</th>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>20</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="#popup">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>19</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>18</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>17</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>16</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>15</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>14</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>13</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>12</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>11</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>10</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>9</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="#popup">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>철회</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>8</td>
					<td>1234</td>
					<td>B</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td>신고자2(admin)</td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>처리중</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>7</td>
					<td>1234</td>
					<td>A</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td><a href="popup2_user_report_page.html">신고자2(admin)</a></td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>처리중</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>6</td>
					<td>1234</td>
					<td>A</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td><a href="popup2_user_report_page.html">신고자2(admin)</a></td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>처리중</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>5</td>
					<td>1234</td>
					<td>A</td>
					<td>홍길동</td>
					<td><a href="popup_user_report_page.html">닉네임2(example)</a></td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td><a href="popup2_user_report_page.html">신고자2(admin)</a></td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>처리중</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>4</td>
					<td>1234</td>
					<td>A</td>
					<td>홍길동</td>
					<td><a href="popup_user_report_page.html">닉네임2(example)</a></td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td><a href="popup2_user_report_page.html">신고자2(admin)</a></td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>처리중</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>3</td>
					<td>1234</td>
					<td>A</td>
					<td>홍길동</td>
					<td><a href="popup_user_report_page.html">닉네임2(example)</a></td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td><a href="popup2_user_report_page.html">신고자2(admin)</a></td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>처리중</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>2</td>
					<td>1234</td>
					<td>A</td>
					<td>홍길동</td>
					<td><a href="popup_user_report_page.html">닉네임2(example)</a></td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요</a></td>
					<td>김철민</td>
					<td><a href="popup2_user_report_page.html">신고자2(admin)</a></td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>처리중</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> </td>
					<td>1</td>
					<td>1234</td>
					<td>A</td>
					<td>홍길동</td>
					<td>닉네임2(example)</td>
					<td><a href="detail-report-content.html">내용이있습니다.있을까요?없을까요 더길게적으면 더 길게 적을 수 있지요오</a></td>
					<td>김철민</td>
					<td><a href="popup2_user_report_page.html">신고자2(admin)</a></td>
					<td>2021-05-15</td>
					<td>
						<select>
							<option>대기중</option>
							<option>접수완료</option>
							<option>처리중</option>
							<option>처리완료</option>
						</select>
					</td>
				</tr>
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
			</table>
		</div>
	</div>
	</div>
</body>
</html>