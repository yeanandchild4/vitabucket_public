<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/orderDetail.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script defer src="/js/mypage/orderDetail.js"></script>
</head>
<body>

	<%@ include file="/include/header.jsp"%>

	<div class="mypage_container">
		<div class="mypage_menu">
			<jsp:include page="/include/mypage_menu.jsp">
				<jsp:param value="order" name="page"/>
			</jsp:include>
		</div>
		<div class="mypage_contents">
			<div class="title_container">
				<div class="title">주문상세</div>
			</div>

			<div class="mypage_list">
				<div class="orderDetail_list od_1">
					<dl class="list_1_2">
						<dt>주문번호</dt>
						<dd>${to.to_key}</dd>
					</dl>
					<dl class="list_1_2">
						<dt>주문날짜</dt>
						<fmt:formatDate var="to_date" value="${to.to_date}" pattern="yyyy-MM-dd H시 mm분"/>
						<dd>${to_date}</dd>
					</dl>
				</div>

				<div class="orderDetail_list">
					<h3>상품 목록</h3>
					<ul>
						<c:forEach var="d" items="${od}" varStatus="i">
							<li class="list_li">
								<div class="list_1">
									<img src="/images/product/${d.main_img}" alt="#">
									<div class="list_1_1">
										<dl class="list_1_2">
											<p>${d.pro_name}</p>
										</dl>
										<dl class="list_1_2">
											<dt>
												주문수량
											</dt>
											<dd>
												${d.pro_cnt}개
											</dd>
										</dl>
										<dl class="list_1_2">
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${d.pro_total}" var="pro_total"/>
											<p>${pro_total}원</p>
										</dl>
									</div>
								</div>
								<div class="list_2" id="od_ReviewBtn">
									<c:choose>
										<c:when test="${d.reviewd==true}">
											<button class="bigBtn inactiveBtn" type="button">후기완료</button>
										</c:when>
										<c:otherwise>
											<button class="mdBtn bigBtn" data-btn="${i.index}" type="button">후기작성</button>
										</c:otherwise>
									</c:choose>
								</div>

								<div class="modal modal_${i.index}">
									<div class="modal_content">
										<div class="modal_title">
											<h2>후기작성</h2>
											<span class="close">&times;</span>
										</div>
										<form id="form">
											<div class="modal_pro_img">
												<img src=/images/product/${d.main_img}
												onerror="this.onerror=null; this.src='/images/noimage.png';">
												<span>${d.pro_name}</span>
											</div>
		
											<input type="hidden" name="od_key" value="${d.od_key}">
											<input type="hidden" name="pro_key" value="${d.pro_key}">
		
											<div class="modal_body">
												<div class="modal_text">
													<div>
														<label>내용</label>
													</div>
													<textarea class="textA textA_${i.index}" id="textBox" name="board_content" 
													placeholder="내용을 입력해주세요."
													cols="20" maxlength="500"></textarea>
												</div>
												<div class="textLengthWrap">
													<div><p class="textCount textCount_${i.index}">0자</p></div>
													<div><p class="textTotal">/500자</p></div>
												</div>
												<div class="modal_file">
													<div>
														<label>사진</label>
													</div>
													<input type="file" name="files" multiple="multiple" accept="image/*">
												</div>
											</div>
											<div class="modal_btn">
												<button class="bigBtn" type="button" onclick="addReview()">저장</button>
											</div>
										</form>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				
				<div class="orderDetail_list">
					<h3>결제정보</h3>
					<ul>
						<li>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${to.to_total}" var="to_total"/>
							<span>결제금액</span>
							<span>${to_total}원</span>
						</li>
						<li>
							<span>결제수단</span>
							<span>${to.to_payment}</span>
						</li>
					</ul>
				</div>

				<div class="orderDetail_list">
					<h3>주문정보</h3>
					<ul>
						<li>
							<span>주문번호</span>
							<span>${to.to_key}</span>
						</li>
						<li>
							<span>결제일시</span>
							<span>${to_date}</span>
						</li>
					</ul>					
				</div>

				<div class="orderDetail_list">
					<h3>배송정보</h3>
					<ul>
						<li>
							<span>받는분</span>
							<span>${to.to_name}</span>
						</li>
						<li>
							<span>핸드폰</span>
							<span>${to.to_tel}</span>
						</li>
						<li>
							<span>주소</span>
							<span>(${to.to_zipcode})${to.to_addr} ${to.to_addr_detail}</span>
						</li>
						<li>
							<span>요청사항</span>
							<span>${to.to_req}</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/include/footer.jsp"%>
</body>
</html>