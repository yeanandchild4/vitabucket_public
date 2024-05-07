<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_주문관리페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/order.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

<script src="/js/admin/common.js" ></script>
<script src="/js/admin/order.js" ></script>
</head>
<body>
	<%@include file="/WEB-INF/jsp/admin/AdminHeader.jsp" %> 
    <section class ="contents">
	    <div class="cont left">
	    	<h3><span>주문관리</span><br><img src="/images/admin/order.png"></h3>
	    	<ul>
	    		<li onclick="location.href='/vitabucket/admin/order'">주문리스트(전체)</li>
	    		<li onclick="location.href='/vitabucket/admin/order/pay_wating'">입금대기</li>
	    		<li onclick="location.href='/vitabucket/admin/order/pay_ok'">입금완료</li>
	    		<li onclick="location.href='/vitabucket/admin/order/sending'" class="li_color">배송중</li>
	    		<li onclick="location.href='/vitabucket/admin/order/delivered'">배송완료</li>
	    		<li onclick="location.href='/vitabucket/admin/order/etc'"  class="li_etc">취소/교환/반품/환불</li>
	    	</ul>    	
	    </div>
	    <div class="cont right">
	    	<h4>HOME > 주문관리 > 배송중</h4>
		    <section>
		        <h2>배송중 목록</h2>		        
		        <div  class="t2">
	               	<c:set var="totalAmount" value="0"/>
	               	<c:forEach var="to" items="${tolist}">
	               		<c:set var="totalAmount" value="${totalAmount + to.to_total}"/>
	               	</c:forEach>
	               	<fmt:formatNumber type="number" maxFractionDigits="3" var="t_price" value="${totalAmount}" />
	               	<h3>주문상품목록<span>총 주문건수: ${tolist.size()}</span><span class="total_price">총 금액 : ${t_price}원</span></h3>	 
                	<table>
                		<tr>
                			<th>주문번호</th><th>상품사진</th><th class="t_long">주문일자</th>
                			<th>주문자명</th><th class="t_proname">주문상품명</th><th>상품개수</th><th>상품가격</th>                			
                			<th>결제수단</th><th>배송상태</th><th>상세보기</th>                			
                		</tr>
                		<c:forEach var="to" items="${tolist}">
	                		<tr onclick="location.href='/vitabucket/admin/order/detail/${to.to_key}'">
	                			<td>${to.to_key}</td>
	                			<td><img alt="${to.to_pro_img}" src="/images/product/${to.to_pro_img}"></td>
	                			<td class="t_long">	                		
	                				<fmt:formatDate pattern="yyyy-MM-dd[E] a hh:mm:ss" value="${to.to_date}"/>
	                			</td>
	                			<td>${to.name}</td>
	                			<td class="t_proname">${to.to_pro_name}</td>
	                			<td>${to.to_pro_cnt}개</td>
	                			
	                			<fmt:formatNumber type="number" maxFractionDigits="3" var="price" value="${to.to_total}" />
	                			<td>${price}원</td>
	                			
	                			<td>${to.to_payment}</td>
								<td>
									<c:choose>
										<c:when test="${to.to_status == 'paid'}">입금완료</c:when>
										<c:otherwise>${to.to_status}</c:otherwise>
									</c:choose>								    
								</td>
	                			<td onclick="location.href='/vitabucket/admin/order/detail/${to.to_key}'">상세보기</td>
	                		</tr>
                		</c:forEach>
                	</table>
                </div>          
            </section>	    
	    </div>
    </section>
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>