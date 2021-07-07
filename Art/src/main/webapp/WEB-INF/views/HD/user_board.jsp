<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
<link rel="stylesheet" href="resources/css/HD/user_board.css"/>
<link rel="stylesheet" href="resources/css/HD/login.css"/>
<link rel="stylesheet" href="resources/css/HD/user_detail(byBoard).css">
<link rel="stylesheet" href="resources/css/HD/email.css"/>
<!-- <link rel="stylesheet" href="resources/css/HD/managerSide.css"/> -->


<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
		src="resources/script/HD/user_detailP.js"></script>
<script type="text/javascript">
$(document).ready( function () {
		
	 $(".delete_btn").on("click", function () {
		 $(".PmainL, .PbackgroundL").show();
		
		$("#cancel_btn").on("click", function () {
			$(".PbackgroundL, .PmainL").hide();
		}); 
	});//deletbtn end
	
	
	//----------------------------------------------이메일 띄우기
	$("#email_btn").on("click", function () {
		$(".PmainM, .PbackgroundM").show();
		
		$("#cancel_btnM").on("click", function () {
			$(".PmainM, .PbackgroundM").hide();
		})
	});//end email_btn
	
	//---------------------------------------------------전체선택 기능
	$("#all_check").on("click", function () {
		if($("#all_check").prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			13
			$("input[type=checkbox]").prop("checked",false);
		}
	});
	
	
	
//side 클릭시 변경 script
	var now ='${now}';
	console.log(now);
	$('.'+now).attr("id","active");
	
	$(".side").on("click","div", function () {
		if($(this).attr("id") != "active"){
			$('.'+ now).attr("id","");
			if($(this).attr("class") == "member"){
				location.href = "user_board";
				$(".member").attr("id","active");
			}else if($(this).attr("class") == "tag"){
				location.href = "tag_board";
				$(".tag").attr("id","active");
			}else if($(this).attr("class") == "product"){
				location.href = "product_board";
				$(".product").attr("id","active");
			}else if($(this).attr("class") == "warning"){
				location.href = "warning_board";
				$(".warning").attr("id","active");
			}else if($(this).attr("class") == "gong"){
				location.href = "gong_board";
				$(".gong").attr("id","active");
			}
		}
		
	});
	//side 클릭시 변경 script
	$("#pagingWrap").on("click","span", function () {
		$("#page").val($(this).attr("name"));
		$("#userForm").submit();
	});
	
	//---------------------------------Ajax 상세페이지 그리기, 더블 클릭 상세보기
	$("tbody").on("dblclick","tr", function () {
		$(".Pmain, .background").show();
		$("#userNo").val($(this).attr("name"));
		
		drawPopup();
		
		$(".background").on("click", function () {
			$(".Pmain, .background").hide();
		})
		
	});//end dblclick
});
//document end

function drawPopup() {
	var params = $("#detailForm").serialize();
	
	$.ajax({
		url:"user_datailP",
		type:"post",
		dataType :"json",
		data:params,
		success : function (res) {
			console.log(res);
		},
		error: function (request, status, error) {
			console.log(error);
		}
});
}

/* function drawPopUpDP() {
	var html="";
	
			<div class= "background"></div>
			<div class ="Pmain">
				<div class ="topBar">
					<div class ="blank"></div>
				</div>
				<div class = "profile">
					<div class ="pBox">
						<img class ="img" alt="프로필사진" src="resources/images/HD/profile.png">
						<div class ="cButtonB"></div>
						<div class ="cButtonc">
							<img class ="cButtonI" alt="취소버튼" src="resources/images/HD/cancel.png">
						</div>
					</div>
					<input class ="pName" type ="text" placeholder="nickname" readonly="readonly">
				</div>
				
				<div class ="writeBox" >
					<div class = "blank1">회원상세정보</div>
						<div class = "smallBox">
							<div class ="MsmallBox">
								<div class="informing">이름</div>
								<div class="content_box"></div>
							</div>
							<div class ="MsmallBox">
								<div class="informing">회원번호</div>
								<div class="content_box"></div>
							</div>
							<div class ="MsmallBox">
								<div class="informing">전화번호</div>
								<div class="content_box"></div>
							</div>
							
						</div>
						<div class = "smallBox">
							<div class ="MsmallBox">
								<div class="informing">성별</div>
								<div class="content_box"></div>
							</div>
							<div class ="MsmallBox">
								<div class="informing">생년월일</div>
								<div class="content_box"></div>
							</div>
							<div class ="MsmallBox">
								<div class="informing">이메일</div>
								<div class="content_box"></div>
							</div>
						</div>
						
						<div class="introduce_box">
							<div class="sogea"><b>소개</b></div>
							<div class="sogea_box">
							소개 입력란입니다.
							</div>
						</div>
				</div>
				
				<div class ="middleSection">
					<div class = "brick"></div>
					<button class ="insideMiddle1" id="insideMiddle1">작품</button>
					<button class ="insideMiddle2" id="insideMiddle2">메모</button>
					<div class = "underLine"></div>
				</div>
				<div class ="boxForB">
					<div class ="topOfBox">
						<div class ="topBar"></div>
						<div class ="searchBox">
							<select>
								<option>선택없음</option>
								<option>이거</option>
								<option>저거</option>
							</select>
							<input type="text" placeholder="검색어를 입력하세요" style="font-size:10pt;">
							<button>검색</button>
							<div class = "blank2"></div>
							<button>등록</button>
							<button>수정</button>
							<a herf ="http://localhost:8090/TestWeb/HTML/cssproject.html/remove.html"></a><button>삭제</button></a>
						</div>
					</div>
					<div class ="boxForBoard">
					<table>
					<thead>
						<tr>
							<th>
							<input class = "check" type="checkbox" id="ex_chk"> 
							</th>
							<th> no</th>
							<th> 제목</th>
							<th> 좋아요 개수</th>
							<th> 댓글개수</th>
							<th> 태그</th>
							<th> 신고</th>
							<th> 설명</th>
						</tr>
					</thead>
					<tbody>
	
} */
 
</script>
</head>
<body>
<form action="user_board" id="detailForm" method="psot">
	<input type="hidden" id="userNo" name="userNo">
</form>

<div class="header">

</div>
<div class="content">
	<c:import url="managerSide.jsp"></c:import>
<div class ="main">
		
<form action="user_board" id="userForm" method="post" >
		<input type="hidden" id="page" name="page" value= ${ page}>
		<div class ="blank2"></div>
		
		<div class ="bigClass">
			<div class ="bigClass-1">전체회원</div>
			<div class ="bigClass-2">탈퇴회원</div>
		</div>
		<div class="main1">
			<div class="main1-1">
				<span><span class="font-red">검색어를 입력</span>하여 검색할 수 있습니다.</span><br/>
				<span><span class="font-red">수정버튼</span>을 클릭하시면 수정할 수 있습니다.</span><br/>
				<span><span class="font-red">데이터가 많은 경우</span> 느려질 수 있습니다.</span>
			</div>
		</div>
		<div class ="main2">
			<div class="main2-1">
				<label>회원분류</label>
				<select name="searchType">
					<option value="0"> 전체회원</option>
					<option value="1"> 작년회원</option>
					<option value="2"> 올해회원</option>
				</select>
				<label>검색분류</label>
				<select name="searchGbn">
					<option value="0">회원번호</option>
					<option value="1">이름</option>
					<option value="2">아이디</option>
					<option value="3">전화번호</option>
					<option value="4">성별</option>
					<option value="5">나이</option>
				</select>
			     <input type="text" name="searchTxt" placeholder="검색어를 입력해주세요.">
				<div class="date_search">
					<label>날짜분류</label>
						<input type="date">
						<span> ~ </span>
						<input type="date">
				</div>
				<input type="button" id="searchBtn" value="검색">
			</div>
</form>		
		</div>
		<div class="main3">
			<input type="button" value="등록"/>
			<input type="button" value="이메일" id="email_btn"/>
		</div>
		<div class="main3-table">
			<table>
				<colgroup>
						<col width="2%"/>
						<col width="5%"/>
						<col width="5%"/>
						<col width="5%"/>
						<col width="8%"/>
						<col width="8%"/>
						<col width="5%"/>
						<col width="8%"/>
						<col width="13%"/>
						<col width="13%"/>
						<col width="10%"/>
						<col width="10%"/>
					</colgroup>
			<thead>
				<tr>
					<th>
					<input type="checkbox" id="all_check"> 
					</th>
					<th>번호</th>
					<th>회원번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>닉네임(아이디)</th>
					<th>성별</th>
					<th>생년월일(나이)</th>
					<th>전화번호</th><!--신고자 닉네임(아이디)  -->
					<th>이메일</th>
					<th>가입일</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${list}">
				<tr name="${data.USER_NO}">
					<td><input type="checkbox"> </td>
					<td>${data.RNUM}</td>
					<td>${data.USER_NO}</td>
					<td>${data.NAME}</td>
					<td>${data.USER_ID}</td>
					<td>${data.USER_NICKNAME}</td>
					<td>${data.SEX}</td>
					<td>${data.BIRTHDAY}(만${data.OLD}세)</td>
					<td>${data.PHONE_NO}</td>
					<td>${data.MAIL}</td>
					<td>${data.JOIN_DATE}</td>
					<td><input type="button" value="수정"/>
						<input type="button" value="삭제" class="delete_btn"/>
					</td>
				</tr>
				</c:forEach>
				
			</tbody>
			</table>
		</div>
		<div class ="status"> 전체 : ${cnt}명</div>
<div id="pagingWrap">
<span name="1">처음</span>
<!-- 이전 페이지  -->
<c:choose>
	<c:when test="${page eq 1}">
		<span name="1">이전</span>
	</c:when>
	<c:otherwise>
		<span  name="${page-1 }">이전 </span>
	</c:otherwise>
</c:choose>

<!-- 페이징   -->
<c:forEach var="i" begin="${pb.startPcount}" end="${pb.endPcount}" step="1">
	<c:choose>
		<c:when test="${i eq page}">
			<span name="${i}"><b>${i}</b></span>
		</c:when>
		<c:otherwise>
			<span name="${i}">${i}</span>
		</c:otherwise>
	</c:choose>
</c:forEach>

<!--다음페이지  -->
<c:choose>
	<c:when test="${page eq pb.maxPcount}">
		<span name="${pb.maxPcount}">다음</span>
	</c:when>
	<c:otherwise>
		<span name="${page+1}">다음</span>
	</c:otherwise>
</c:choose>
<span name="${pb.maxPcount}">마지막</span>
</div>
	</div>
</div>
<div>
	<c:import url="login.jsp"></c:import>
</div>

<div>
	<c:import url="user_detail(post).jsp"></c:import>
</div>
<div>
	<c:import url="email(send).jsp"></c:import>
</div>
</body>
</html>