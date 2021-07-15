<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리 페이지</title>
<link rel="stylesheet" href="resources/css/HD/gong_board.css"/>
<link rel="stylesheet" href="resources/css/HD/managerSide.css"/>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		var now ='${now}';
		console.log('.'+now);
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
	}); // document end
</script>
</head>
<body>
<div class="header">

</div>
<div class="content">
	<!-- 사이드 통일  -->
	<c:import url="managerSide.jsp"></c:import>
	<div class ="main">
		
		<div> </div>
		<div class ="blank2"></div>
		
		<div class ="bigClass">
			<div class ="bigClass-1">공지사항</div>
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
				<label>검색분류</label>
				<select>
					<option value="title">공지번호</option>
					<option value="writer">제목</option>
					<option value="number">관리자번호</option>
					<option value="number">삭제여부</option>
				</select>
			     <input type="text" placeholder="검색어를 입력해주세요.">
			     <button>검색</button>
				<div class="date_search">
					<label>날짜분류</label>
						<input type="date">
						<span> ~ </span>
						<input type="date">
						<button>검색</button>
				</div>
			</div>
		</div>
		<div class="main3">
			<input type="button" value="작성"/>
		</div>
		<div class="main3-table">
			<table>
				    <colgroup>
						<col width="2%"/>
						<col width="5%"/>
						<col width="5%"/>
						<col width="20%"/>
						<col width="8%"/>
						<col width="10%"/>
						<col width="5%"/>
						<col width="5%"/>
						<col width="5%"/>
						<col width="8%"/>
					</colgroup>
	
				<tr>
					<th>
					<input type="checkbox" id="ex_chk"> 
					</th>
					<th>공지번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>관리자번호</th>
					<th>첨부파일</th>
					<th>조회수</th>
					<th>등록일</th>
					<th>삭제여부</th>
					<th>수정/삭제</th>
				</tr>
				<%-- <c:forEach var="data" items=list></c:forEach> --%>
					<tr>
						<td>
	                        <input type="checkbox" id="ex_chk"> 
	                    </td>
						<td>20</td>
						<td>1234</td>
						<td>홍길동</td>
						<td>dfjg234</td>
						<td>닉네임2(example)</td>
						<td>5</td>
						<td>2021-06-30</td>
						<td>o</td>
						<td><input type="button" value="수정"/>
	                        <input type="button" value="삭제"/></td>
						
					</tr>
				
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
				<tr>
					<td>
                        <input type="checkbox" id="ex_chk"> 
                    </td>
					<td>20</td>
					<td>1234</td>
					<td>홍길동</td>
					<td>dfjg234</td>
					<td>닉네임2(example)</td>
					<td>2</td>
					<td>2021-06-30</td>
					<td>x</td>
					<td><input type="button" value="수정"/>
                        <input type="button" value="삭제"/></td>
				</tr>
			</table>
		</div>
		<div class ="status"> 전체 : n개</div>
	</div>

</div>
</body>
</html>