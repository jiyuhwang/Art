<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<link rel="stylesheet" type="text/css" href="resources/css/h/user_report_popup.css"/>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnDeclation2").on("click", function(){
		reportPopup();
		
	});
	
	function reportPopup(){
		var html = "";
							                                                                                                                                   
		html +="<div class=\"background_r\"></div>";
		html +="	<div class=\"ctts_r\">";
		html += "	<form id=\"reportForm\">";
/* 		html += "		<input type=\"hidden\" name=\"\" value=\"" +  + "\" />";
		html += "		<input type=\"hidden\" name=\"\" value=\"" +  + "\" />";
		html += "		<input type=\"hidden\" name=\"\" value=\"" +  + "\" />"; */
		html +="		<div class=\"top_ctt\">";
		html +="			<div class=\"top_ctt1\">";
		html +="			<div>신고하기</div>";
		html +="			</div>";
		html +="			<div class=\"top_ctt2\">";
		html +="			<b>신고합니다.</b>";
		html +="			</div>";
		html +="			<div class=\"top_ctt3\">";
		html +="			아래 내용을 제출합니다.";
		html +="			</div>";
		html +="			<div class=\"top_ctt4\">";
		html +="				<div class=\"top_ctt4-1\">신고사유</div>";
		html +="				<div class=\"checkbox_div\">";
		html +="					<div class=\"check_one\">";
		html +="						<input type=\"checkbox\" value=\"홍보,영리목적\"/><label for=c1>홍보,영리목적</label>";
		html +="					</div>";
		html +="					<div class=\"check_one\">";
		html +="						<input type=\"checkbox\" value=\"부적절한 홍보\"/><label for=c2>부적절한 홍보</label>";
		html +="					</div>";
		html +="					<div class=\"check_one\">";
		html +="						<input type=\"checkbox\" value=\"불법정보\"/><label for=c3>불법정보</label>";
		html +="					</div>";
		html +="					<div class=\"check_one\">";
		html +="						<input type=\"checkbox\" value=\"음란 또는 청소년에게 부적합한 내용\"/><label for=c4>음란 또는 청소년에게한 내용</label>";
		html +="					</div>";
		html +="					<div class=\"check_one\">";
		html +="						<input type=\"checkbox\" value=\"욕설비방차별혐오\"/><label for=c5>욕설비방차별혐</label>";
		html +="					</div>";
		html +="					<div class=\"check_one\">";
		html +="						<input type=\"checkbox\" value=\"도배 스팸\"/><label for=c6>도배 스팸</label>";
		html +="					</div>";
		html +="					<div class=\"check_one\">";
		html +="						<input type=\"checkbox\" value=\"개인정보 노출거래\"/><label for=c7>개인정보 노출거래</label>";
		html +="					</div>";
		html +="					<div class=\"check_one\">";
		html +="						<input type=\"checkbox\" value=\"저작권 및 명예훼손\"/><label for=c8>저작권 및 명예훼손</label>";
		html +="					</div>";
		html +="					<div class=\"check_one\">";
		html +="						<input type=\"checkbox\" value=\"기타\"/><label for=c9>기타</label>";
		html +="					</div>";
		html +="				</div>";
		html +="			</div>";
		html +="			<div class=\"r_content_div\">";
		html +="				<div class=\"r_content-1\">내용<br/><span id=\"cttCnt\"></span></div>";
		html +="				<div class=\"report_content\">";
		html +="<textarea rows=\"16\" cols=\"78\" name=\"reportCtt\" id=\"reportCtt\"></textarea></div>";
		html +="			</div>";
		html +="		</div><!-- --------------------------------------------top-ctt -->";
		html +="		<div class=\"btm-ctt\">";
		html +="			<div class=\"btm-ctt1\">";
		html +="				<ul>";
		html +="					<li><span class=\"font-red\">허위신고</span>일 경우 신고자에 대한 제재가 있을 수 있습니다.</li>";
		html +="					<li>신고내용의 사유에 따라 사용자를 처벌하는 시간이 다소 걸릴 수 있습니다.</li>";
		html +="					<li>이 글이 신고사유에 해당하는 글인지 다시 한 번 <span class=\"font-red\">확인</span>하시기 바랍니다.<br/>";
		html +="					<li>신고하게 된 이유를 자세히 써주시면 운영자의 관련 결정에 도움이 됩니다.</li>";
		html +="					신고기능은 글 작성자에게 <span class=\"font-red\">피해</span>를 줄 수 있으며, <span class=\"font-red\">3회</span> 부정신고 시";
		html +="					<span class=\"font-red\">영구적</span>으로 이용이 제한됩니다.</li>";
		html +="				</ul>";
		html +="			</div>";
		html +="			<div class=\"btm-ctt2\">";
		html +="			<div class=\"btm-ctt3\">";
		html +="				<div class=\"btn_rot\">신고</div>";
		html +="				<div class=\"btn_cancel\">취소</div>";
		html +="			</div>";
		html +="			</div>";
		html +="		</div>";
		html += "	</form>";
		html +="	</div>";

			
			
			$("body").prepend(html);
			
			$(".background_r").hide();
			$(".ctts_r").hide();				
			$(".background_r").fadeIn();
			$(".ctts_r").fadeIn();
			
			
			
			//신고하기 textarea 글자수 제한
			$("#reportCtt").on("keyup", function(){
				
				$("#cttCnt").html("(" + $(this).val().length + "/ 500)");
				
				if($(this).val().length > 500){
					$(this).val($(this).val().substring(0,500));
					$("#cttCnt").html("(500 / 500)");
				}				
			});
			
			//체크박스 값 보내기
			$(".")
						
			//----------------------------------------------신고할 때
				$("#btn_rot").off("click");
				$("#btn_rot").on("click", function(){
					
					//자기자신이 신고할 수 없도록 하는 코드
					
					
					
											
					var params = $("#reportForm").serialize();
					
					$.ajax({
						type : "post",
						url : "userReports",
						dataType : "json",
						data : params,
						success : function(result) {
							
							if(result.msg == "success"){
								closePopup();

							} else if(result.msg == "failed"){
								alert("신고에 실패했습니다.");
							} else {
								console.log(result);
								alert("신고 전송 중 문제가 발생했습니다.");
							}						
			
						},
						error: function(request, status, error){
							console.log(error);
							
						}
					
					});//ajax
				});//신고하기버튼누르면	
		
		//닫기
		$(".btn_cancel").off("click");
		$(".btn_cancel").on("click", function(){
			closePopup();
		});
		
			$(".background_r").off("click");
		$(".background_r").on("click", function(){
			closePopup();
		}); 
	};//popup end

		

	
	
	
	//신고하기 팝업 닫기
	function closePopup() {
		$(".background_r").fadeOut(function(){
			$(".background_r").remove();
		});
		
		$(".ctts_r").fadeOut(function(){
			$(".ctts_r").remove();
		});	
	}
	
	
	
	
	
	
});//ready
</script>
</head>
<body>
	<img src="resources/images/JY/share.png" id="btnShare2" alt="공유" width="20px" height="20px">
	<img src="resources/images/JY/dot1.png" id="btnDot12" alt="메뉴" width="25px" height="25px">
	<img src="resources/images/JY/dot2.png" id="btnDot22" alt="메뉴" width="25px" height="25px">
	<img src="resources/images/JY/declation.png" id="btnDeclation2" alt="신고" width="20px" height="20px">
	
</body>
</html>