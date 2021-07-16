<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기 팝업</title>
<link rel="stylesheet" href="resources/css/h/user_report_popup.css">
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
</head>
<body>
<div class="bkod">
	<div class="ctt">
		<div class="top-ctt">
			<div class="top-ctt1">
			<div>신고하기</div>
			</div>
			<div class="top-ctt2">
			<b>신고합니다.</b>
			</div>
			<div class="top-ctt3">
			아래 내용을 제출합니다.
			</div>
			<div class="top-ctt4">
				<div class="top-ctt4-1"><div>신고날짜</div></div>
				<div class="top-ctt4-2"><div>0000-000-000</div></div>
				<div class="top-ctt4-3"><div>신고자</div></div>
				<div class="top-ctt4-4"><div>닉네임(아이디)</div></div>
			</div>
			<div class="top-ctt5">
				<div class="top-ctt5-1">작가</div>
				<div class="top-ctt5-2">닉네임(아이디)</div>
			</div>
			<div class="top-ctt6">
				<div class="top-ctt6-1">신고사유</div> <!--------------------- 기타시 글작성가능 입력창 스크롤 최대 500자  -->
				<div class="top-ctt6-2">
					<div class="top-ctt6-2-1">
						<input type="checkbox" value="홍보,영리목적"/><label for=c1>홍보,영리목적</label>
					</div>
					<div class="top-ctt6-2-2">
						<input type="checkbox" value="부적절한 홍보"/><label for=c2>부적절한 홍보</label>
					</div>
					<div class="top-ctt6-2-3">
						<input type="checkbox" value="불법정보"/><label for=c3>불법정보</label>
					</div>
					<div class="top-ctt6-2-4">
						<input type="checkbox" value="음란 또는 청소년에게 부적합한 내용"/><label for=c4>음란 또는 청소년에게 부적합한 내용</label>
					</div>
					<div class="top-ctt6-2-5">
						<input type="checkbox" value="욕설비방차별혐오"/><label for=c5>욕설비방차별혐</label>
					</div>
					<div class="top-ctt6-2-6">
						<input type="checkbox" value="도배 스팸"/><label for=c6>도배 스팸</label>
					</div>
					<div class="top-ctt6-2-7">
						<input type="checkbox" value="개인정보 노출거래"/><label for=c7>개인정보 노출거래</label>
					</div>
					<div class="top-ctt6-2-8">
						<input type="checkbox" value="저작권 및 명예훼손"/><label for=c8>저작권 및 명예훼손</label>
					</div>
					<div class="top-ctt6-2-9">
						<input type="checkbox" value="기타"/><label for=c9>기타</label>
					</div>
				</div>
			</div>
			<div class="top-ctt7">
				<div class="top-ctt7-1">내용</div>
				<div class="top-ctt7-2">이사람을 신고합니다.overflow</div>
			</div>
		</div><!-- --------------------------------------------top-ctt -->
		<div class="btm-ctt">
			<div class="btm-ctt1">
				<ul>
					<li>신고 내용은 자동으로 저장됩니다.</li>
					<li>신고내용의 사유에 따라 사용자를 처벌하는 시간이 다소 걸릴 수 있습니다.</li>
					<li><span class="font-red">허위신고</span>일 경우 신고자에 대한 제재가 있을 수 있습니다.</li>
					<li>이 글이 신고사유에 해당하는 글인지 다시한 번 <span class="font-red">확인</span>하시기 바랍니다.<br/>
					신고기능은 글 작성자에게 <span class="font-red">피해</span>를 줄 수 있으며, <span class="font-red">3회</span> 부정신고 시
					<span class="font-red">영구적</span>으로 이용이 제한됩니다.</li>
				</ul>
			</div>
			<div class="btm-ctt2">
			<div>
				<a class="btn_rot" href="#">신고</a>
				<a class="btn_ccl" href="#">취소</a>
			</div>
			</div>
		</div>
	</div>
</div> <!--백그라운드  -->
</body>
</html>