<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="/css/cart/cart.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
</script>
<script defer src="/js/cart/cart.js"></script>
</head>
<body>

<%@ include file="/include/header.jsp"%>

<div class="cart_container">
	<div class="cart_list">
		<div class="checkbox">
			<input type="checkbox" id="allCk" onclick="selectAll()"><label>　전체선택</label>
			<button type="button" onclick="deleteCart()">선택삭제</button>
		</div>
		<div class="line"></div>
		<div>
			<form id="form" action="/cart/checkout" method="post">
				<ul>
					<c:forEach var="c" items="${list}">
						<li class="cart_Plist">
							<div class="pro_info">
								<input type="checkbox" name="checked" id="checked_${c.cart_key}" value="${c.cart_key}" onchange="calculTotal()">
								<img src="/images/product/${c.main_img}" alt="#">
								<div>${c.pro_name}</div>
							</div>
							<div class="qtyControl">
								<div class="qtyBtn">
									<button type="button" onclick="modifyCnt(${c.cart_key},-1,${c.pro_stock})">-</button>
									<div>
										<span id="pro_cnt_${c.cart_key}">${c.pro_cnt}</span>
									</div>
									<button type="button" onclick="modifyCnt(${c.cart_key},1,${c.pro_stock})">+</button>
								</div>
								<div class="pro_total">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${c.pro_total}" var="pro_total"/>
									<span id="pro_total_${c.cart_key}">${pro_total}원</span>
								</div>
								<div class="deleteP" onclick="deleteP(${c.cart_key})">
									<span>&times;</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</form>
		</div>
	</div>
	<div class="order_part">
		<div class="address">
			<c:choose>
				<c:when test="${not empty cartAddr}">
					<span id="addr">${cartAddr.whole_addr}</span>
				</c:when>
				<c:otherwise>	
					<span id="addr">저장된 배송지가 없습니다.</span>
				</c:otherwise>
			</c:choose>	
			<div class="addrChange">
				<a href="/mypage/info"><button class="bigBtn addrChangeBtn">배송지변경</button></a>
			</div>
		</div>
		<div class="order_Btn">
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" var="cart_total"/>
			<span>총 <strong id="total">${cart_total}</strong>원</span>
			<button class="bigBtn" type="button" onclick="checkout('${list}','${cartAddr}')">구매하기</button>
		</div>
	</div>
</div>
<%@ include file="/include/footer.jsp"%>
</body>
</html>