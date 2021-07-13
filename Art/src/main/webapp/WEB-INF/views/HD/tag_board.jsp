<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>태그 관리자</title>
    <link rel="stylesheet" href="resources/css/HD/tag_board.css">
    <link rel="stylesheet" href="resources/css/HD/managerSide.css"/>
	<script type="text/javascript"
			src="resources/script/jquery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready( function () {
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
		});
		//document ready done
	</script>
</head>
<body>
    <div class="wrapper">
    <div class="content">
       <c:import url="managerSide.jsp"></c:import>
        <div class ="main">
            
            <div class ="blank2"></div>
            
            <div class ="bigClass">
                <div class ="bigClass-1">태그</div>
                <!-- <div class ="bigClass-2">금지어</div> -->
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
                    <label>검색</label>
                     <input type="text" placeholder="태그를 입력해주세요.">
                     <button>검색</button>
                    <div class="date_search">
                        <label>날짜분류</label>
                            <input type="date">
                            <span> ~ </span>
                            <input type="date">
                            <button>검색</button>
                        </div>
                    </div>
                    <div class="main3">
                        <input type="button" value="등록"/>
                        <input type="button" value="삭제"/>
                    </div>
            </div>
            <div class="main3-table">
                <table>
                   <colgroup>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            
                    </colgroup>
                    <tr>
                    <%-- <c:forEach var>
                        <td>#태그</td>
                    </c:forEach> --%>
                    </tr>
                    
                   
                </table>
            </div>
            <div class ="status"> 전체 : 100개</div>
        </div>
    
    </div>
</div><!-- wrapper end  -->
</body>
</html>