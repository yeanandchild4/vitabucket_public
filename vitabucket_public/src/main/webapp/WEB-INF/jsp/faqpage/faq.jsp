<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/productDetail.css">

<style>
	body, html {
  margin: 0;
  padding: 0;
  text-align: center;
  font-family: "Noto Sans KR", sans-serif;
}



.main{
	height: 970px;
	overflow: auto;
	scrollbar-width: none;
	
}

.container {
	display: flex;
	width: 900px;
	margin: 0 auto;
	padding-top: 80px;
	box-sizing: border-box;
	padding-bottom: 250px;
}

.container .section {
	width: 100%
}

h3{ 
	margin:0;
	margin-top: 33px;
	font-size: 28px;
	font-weight: 500;
}

.sub{padding-left: 20px;}
.sub>li{
	font-size: medium;
}
main {
	width: 100%;
	float: left;
	margin: 0 auto;
}

.questiondata{
	 display: flex;
    align-items: center;
}

.questionContents>p{
	    font-size: 14px;
    line-height: 30px;
}

</style>
<script 
	src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script> 
<script>
	/* 상품문의 내용+답글 토글 */
$(document).ready(function(){
    $('.board_content').hide();
    $('.board_comment').hide();

    // 제목을 클릭하면 해당 행의 숨겨진 내용이 토글됩니다.
    $('.inq_content').click(function(){
        // 해당 행의 .board_content 요소를 찾습니다.
        $(this).closest('tr').next('.board_content').toggle();
        
        // 해당 행의 .board_comment 요소를 찾습니다.
        $(this).closest('tr').next('.board_comment').toggle();

    });
});
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<div class="container">

		<main>
		<div>
			<div id="inquiryTag"><h2>자주 묻는 질문</h2></div>
			<div id="inq_notice">
				<ul>
					<li>이용안내 FAQ입니다.</li>
				</ul>
			</div>
			<table class="inquiry">
				<thead><tr><th class="title">제목</th><th class="author">작성자</th><th class="posted">작성일</th><th class="status">답변상태</th></tr></thead>
				
				<tr class="inq_content">
					<td class="b_title">배송안내</td>
					<td>vitabucket</td>
					<td>2024-02-15</td>
					<td>답변완료</td>
				</tr>
				<tr class="board_content">
					<td colspan="4">
						<div class="board_C">
							<div><i class="fa-solid fa-q" style="background-color: #FFA500; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							<div class="questiondata">배송안내</div>
						</div>
						
						<div class="board_C">
							<div><i class="fa-solid fa-a" style="background-color: #FF8339; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							
							<div style="">
								<div class="questiondata">VitaBucket 배송</div>
								<div class="questionContents" style="margin-top: 10px;">
									<p>배송 방법 : 택배</p>
									<p>택배사 : CJ대한통운</p>
									<p>배송 지역 : 전국지역</p>
									<p>배송 기간 : 출고일로부터 1일 ~ 4일</p>
									<p>배송 안내 : 산간 도서지방은 추가 배송비가 있습니다.</p>
									<p>
										평일 오후 12시에 배송마감 되며, 그 이후 주문건은 익일(평일 기준) 출고됩니다.<br>
										토요일, 일요일 공휴일에는 출고되지 않으며 돌아오는 평일에 출고가 진행됩니다.<br>
										택배사 또는 내부사정으로 인해 당일 출고가 되지 않을 수 있습니다.<br>
										택배사의 사정에 따라 배송기간이 길어질 수 있습니다.
									</p>
								</div>
							</div>
						</div>
						<%-- <div>${q.comment.comm_date}</div> --%>
					</td>
				</tr>
				<tr class="inq_content">
					<td class="b_title">주문/결제</td>
					<td>vitabucket</td>
					<td>2024-02-15</td>
					<td>답변완료</td>
				</tr>
				<tr class="board_content">
					<td colspan="4">
						<div class="board_C">
							<div><i class="fa-solid fa-q" style="background-color: #FFA500; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							<div class="questiondata">주문/결제 안내</div>
						</div>
						
						<div class="board_C">
							<div><i class="fa-solid fa-a" style="background-color: #FF8339; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							
							<div style="">
								<div class="questiondata">VitaBucket 주문/결제</div>
								<div class="questionContents" style="margin-top: 10px;">
									<p>
										고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. <br>
										확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.
									</p>
									<p style="margin-top:5px;">	
										무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. <br>
										주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금해야 합니다. 기간 내에 입금되지 않은 주문은 자동취소 됩니다. 
									</p>
								</div>
							</div>
						</div>
						<%-- <div>${q.comment.comm_date}</div> --%>
					</td>
				</tr>
				<tr class="inq_content">
					<td class="b_title">교환</td>
					<td>vitabucket</td>
					<td>2024-02-15</td>
					<td>답변완료</td>
				</tr>
				<tr class="board_content">
					<td colspan="4">
						<div class="board_C">
							<div><i class="fa-solid fa-q" style="background-color: #FFA500; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							<div class="questiondata">교환 안내</div>
						</div>
						
						<div class="board_C">
							<div><i class="fa-solid fa-a" style="background-color: #FF8339; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							
							<div style="">
								<div class="questiondata">VitaBucket 교환</div>
								<div class="questionContents" style="margin-top: 10px;">
									<p>
										<strong>교환 및 반품이 불가능한 경우</strong>
										<br>- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외 <br>
										- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br>
										- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을 제공한 경우에 한 합니다.<br>
										- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
										- 복제가 가능한 상품등의 포장을 훼손한 경우<br>
									</p>
									<p style="margin-top:5px; color:red;">	
										※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다 
									</p>
								</div>
							</div>
						</div>
						<%-- <div>${q.comment.comm_date}</div> --%>
					</td>
				</tr>
				<tr class="inq_content">
					<td class="b_title">반품</td>
					<td>vitabucket</td>
					<td>2024-02-15</td>
					<td>답변완료</td>
				</tr>
				<tr class="board_content">
					<td colspan="4">
						<div class="board_C">
							<div><i class="fa-solid fa-q" style="background-color: #FFA500; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							<div class="questiondata">반품 안내</div>
						</div>
						
						<div class="board_C">
							<div><i class="fa-solid fa-a" style="background-color: #FF8339; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							
							<div style="">
								<div class="questiondata">VitaBucket 반품</div>
								<div class="questionContents" style="margin-top: 10px;">
									<p>
										<strong>교환 및 반품이 가능한 경우</strong>
										<br>- 상품을 공급 받으신 날로부터 7일이내 단, 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다. <br>
										- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과
  												다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내
									</p>
								</div>
							</div>
						</div>
						<%-- <div>${q.comment.comm_date}</div> --%>
					</td>
				</tr>
				<tr class="inq_content">
					<td class="b_title">취소/변경</td>
					<td>vitabucket</td>
					<td>2024-02-15</td>
					<td>답변완료</td>
				</tr>
				<tr class="board_content">
					<td colspan="4">
						<div class="board_C">
							<div><i class="fa-solid fa-q" style="background-color: #FFA500; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							<div class="questiondata">취소/변경 안내</div>
						</div>
						
						<div class="board_C">
							<div><i class="fa-solid fa-a" style="background-color: #FF8339; color: white; padding: 8px; border-radius: 50%; margin-right: 15px"></i></div>
							
							<div style="">
								<div class="questiondata">VitaBucket 취소/변경</div>
								<div class="questionContents" style="margin-top: 10px;">
									<p>
										- 주문하신 상품의 취소를 원할경우 주문조회에서 취소신청이 가능합니다.<br>
										-  상품이 출고가 진행된 상태에서는 취소신청이 불가능하며 반품접수를 해주셔야 합니다.<br>
										*이 경우에는 배송비가 부과되며 배송비는 고객부담입니다.<br>
										- 완료된 주문 건의 상품 및 수량 변경은 불가하며 주문 취소 후 재주문 해야 합니다.
									</p>
									<p style="margin-top:15px">
										<strong>주문취소방법</strong><br>
										<span style="color:red">pc</span><br>
										- 사이트 상단 주문내역 조회 - 주문한 상품 우측 취소버튼 클릭<br>
										<span style="color:red">모바일</span><br>
										- 상단 마이페이지 - 주문조회 - 취소버튼 클릭
									</p>
								</div>
							</div>
						</div>
						<%-- <div>${q.comment.comm_date}</div> --%>
					</td>
				</tr>
			</table>
			</div>
		</main>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
<script src="https://kit.fontawesome.com/c96408e797.js" crossorigin="anonymous"></script>
</html>