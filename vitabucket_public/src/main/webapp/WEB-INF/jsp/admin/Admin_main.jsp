<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_메인페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/main.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

<script src="/js/admin/common.js" ></script>
</head>
<body>
<%@include file="/WEB-INF/jsp/admin/AdminHeader.jsp" %> 
    <section class ="contents">
    	<h2>전체 주문통계</h2>
		<div>
			<h3>전체 주문 현황</h3>
	        <table class="top_1">	            
	            <tr class="b_color">
	                <th>총 주문건수</th>
	                <th>총 주문금액</th>                
	            </tr>
	            <tr>
	                <td>${tolist.size()}건</td>
	                <c:set var="totalAmount" value="0"/>
                	<c:forEach var="to" items="${tolist}">
                		<c:set var="totalAmount" value="${totalAmount + to.to_total}"/>
                	</c:forEach>
                	<fmt:formatNumber type="number" maxFractionDigits="3" var="t_price" value="${totalAmount}" />
                	<td>${t_price}원</td>                
	            </tr>
	        </table>
        </div>
		<div class="cons top">
	        <div>
		        <h3>주문 상태 현황<span onclick="location.href='/vitabucket/admin/order'">+ 전체주문상태 이동</span></h3>
		        <table>		            
		            <tr>
		                <th>입금대기</th><th>입금완료</th><th>배송중</th><th>배송완료</th>
		            </tr>
		            <tr>
		                <td>${pay_wat.size()}건</td>
		                <td>${order_pay.size()}건</td>
		                <td>${order_send.size()}건</td>
		                <td>${order_delive.size()}건</td>
		            </tr>
		        </table>
	        </div>
	        <div>
	        	<h3>클래임 현황<span onclick="location.href='/vitabucket/admin/order/etc'">+ 주문클래임 이동</span></h3>
	        	
		        <table class="etc">		           
		            <tr>
		                <th>취소·환불·반품·교환건수</th><td>${order_etc.size()}</td>
		            </tr>
		             <tr>
		              	<th rowspan="${order_etc.size()}">클레임사유</th>		           
		            	<c:forEach var="etc" items="${order_etc}">
		            	 	<c:if test="${not empty etc.to_refund_reason}">	              	         
	              			<td>
	              				<div>
	              					${etc.to_refund_reason}
	              				</div>
	              			</td>		
	              			</c:if>   
          				</c:forEach>           			                
		            </tr>
		            
		        </table>
			</div>
		</div>
    </section>
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>