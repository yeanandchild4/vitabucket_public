<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" var="totalP"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매페이지</title>
<link rel="stylesheet" type="text/css" href="/css/cart/checkout.css">

</head>
<body>
<%@ include file="/include/header.jsp"%>
	<div class="checkout_container">
		<div class="title_container">
            <div class="title">주문서</div>
        </div>

		<div class="checkout_content">
			<h3>구매 상품 목록</h3>
			<ul>
				<c:forEach var="c" items="${cart_list}">
					<li class="cart_Plist">
						<div class="pro_info">
							<img src="/images/product/${c.main_img}" alt="#">
							<div>
								<dl>
									<p>${c.pro_name}</p>
								</dl>
								<dl class="pro_cty">
									<dt>주문수량</dt>
									<dd>
										${c.pro_cnt}개
									</dd>
								</dl>
							</div>
						</div>
						<div class="pro_price">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${c.pro_total}" var="pro_total"/>
							<p>${pro_total}원</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>

		<div class="checkout_content">
			<h3>주문자 정보</h3>
			<ul class="info_list">
				<li><label>보내는 분</label><span id="name">${info.name}</span></li>
				<li><label>휴대폰</label><span id="user_phone">${info.user_phone}</span></li>
				<li><label>이메일</label><span id="user_email">${info.user_email}</span></li>
			</ul>
		</div>

		<div class="checkout_content">
			<h3>배송정보</h3>
			<ul class="info_list">
				<li><label>받는 분</label><span>${info.user_addr.addr_name}</span></li>
				<li><label>번호</label><span>${info.user_addr.addr_tel}</span></li>
				<li><label>주소</label><span id="whole_addr">${info.user_addr.whole_addr}</span></li>
				<li>
					<label>배송시 요청사항</label>
					<input type="text" name="addr_req" id="addr_req" value="${info.user_addr.addr_req}">
				</li>
				<input type="hidden" id="addr_key" value="${info.user_addr.addr_key}">
			</ul>
		</div>

		<div class="checkout_content">
			<h3>결제 수단</h3>
			<div class="payment_part">
				<select id="to_payment">
					<option value="card">신용카드</option>
					<option value="trans">계좌이체 </option>
				</select>
				
			</div>
		</div>

		<div class="payBtn">
			<input type="hidden" id="total" value="${total}">
			<button class="bigBtn" type="button" onclick="buy(to_key,pname,cart_keys)">총 ${totalP}원 결제하기</button>
		</div>
	</div>
<%@ include file="/include/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
</script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script defer src="/js/cart/checkout.js"></script>
<script type="text/javascript">
/* 결제정보 */
var unum = '${info.unum}';
var to_key = new Date().getTime().toString();
var to_total = '${total}';
var pname = '${cart_list[0].pro_name}';
var totalCnt = '${cart_list.size()}';
var cart_keys = new Array();
<c:forEach var="key" items="${cart_keys}" >
	cart_keys.push("${key}");
</c:forEach>

if(parseInt(totalCnt)>1) {	
	pname = pname + " 외 " + (totalCnt-1) + "건";
}

$(document).ready(function() {
	payment_prepare(to_key, to_total, cart_keys);
})
</script>
</body>
</html>