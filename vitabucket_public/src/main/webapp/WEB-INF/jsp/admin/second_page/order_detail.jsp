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
	    		<li onclick="location.href='/vitabucket/admin/order/sending'">배송중</li>
	    		<li onclick="location.href='/vitabucket/admin/order/delivered'">배송완료</li>
	    		<li onclick="location.href='/vitabucket/admin/order/etc'" class="li_etc">취소/교환/반품/환불(x)</li>
	    	</ul>    	
	    </div>
	    <div class="cont right">
		   	<h4>HOME > 주문관리 > 주문상세보기</h4>
		    <section>
				<h2>주문상세보기</h2>		     
			 	<form id="order_edit">   
			        <div class="order_detail">
			           	<h3>주문상세내역</h3>
			           	<div class="basic_info">	
			           		<table>
			           			<tr>
			           				<th>주문번호</th><td>${to.to_key}</td>
			           				<th>주문일자</th><td><fmt:formatDate pattern="yyyy-MM-dd[E] a hh:mm:ss" value="${to.to_date}"/></td>
			           			</tr>
			           			<tr>	
			           				<th>결제방식</th><td>${to.to_payment}</td>
			           				<th>주문자</th><td>${to.name}</td>
			           			</tr>
			           		</table>			           			
		           			<table class="status">
			           			<tr>
									<th colspan="3" style="background-color: rgba(255,129,59,0.5);">주문현황</th>
				           			<td>
										<select name="to_status" onchange="addoption()">
										    <c:choose>
										        <c:when test="${to.to_status == 'paid' or '입금완료'}">
										            <option value="입금완료" selected>입금완료</option>
										        </c:when>
										        <c:otherwise>
										            <option value="${to.to_status}" selected>${to.to_status}</option>
										        </c:otherwise>
										    </c:choose>
										        <c:choose>
											        <c:when test="${to.to_status == 'paid' or '입금완료'}">
											        	<option value="입금대기">입금대기</option>
											        </c:when>
											        <c:otherwise>
											        	<option value="입금완료">입금완료</option>
											        </c:otherwise>
										        </c:choose>
										    <option value="배송중">배송중</option>
										    <option value="배송완료">배송완료</option>
										    <option disabled>==그 외==</option>									    											
											<option value="취소중">취소중</option>												
											<option value="교환중">교환중</option>												
											<option value="환불중">환불중</option>												
											<option value="반품중">반품중</option>												
											<option value="취소완료">취소완료</option>												
											<option value="교환완료">교환완료</option>												
											<option value="환불완료">환불완료</option>												
											<option value="반품완료">반품완료</option>	
										</select> 												
									</td>
			           			</tr>
			           		</table>
			            </div>	
			            <div class="pro_info">	           
				           	<table>
				           		<tr>
				           			<th>상품사진</th><th>주문상품명</th>
				           			<th>상품별개수</th><th>상품별가격</th><th>리뷰여부</th>
				           		</tr>
				           		
				           		<c:forEach var="o" items="${olist}">
				            		<tr>			            			
				            			<td onclick="location.href='/vitabucket/admin/prod/detail/${o.pro_key}'"><img alt="${o.main_img}" src="/images/product/${o.main_img}"></td>
				            			<td>${o.pro_name}</td>
				            			<td>${o.pro_cnt}개</td>
				            			
				            			<fmt:formatNumber type="number" maxFractionDigits="3" var="price" value="${o.pro_total}" />
				            			<td>${price}원</td>
				            			
				            			<td>${o.reviewd}</td>
				            		</tr>
				           		</c:forEach>				           		
			            		<tr class="total">
			            			<td rowspan="2" colspan="3"></td>
			            			<th>상품 총 개수</th>
			            			<td>${to.to_pro_cnt}개</td>
			            		</tr>
			            		<tr class="total">
			            			<th>상품 총 가격</th>
			            			<fmt:formatNumber type="number" maxFractionDigits="3" var="price" value="${to.to_total}" />
			            			<td>${price}원</td>
			            		</tr>
				           	</table>
			           	</div>
			           	<div class="addr_refun">
			           		<div>
					           	<p>◆ 배송정보</p>
					           	<table class="addr">
					           		<tr>
					           			<th>받는분</th><td>${to.to_name}</td>
					           		</tr>
					           		<tr>
					           			<th>연락처</th><td>${to.to_tel}</td>
					           		</tr>
					           		<tr>
					           			<th>배송주소</th>
					           			<td>
					           				[${to.to_zipcode}]&nbsp;
					           				${to.to_addr}&nbsp;${to.to_addr_detail}
					           			</td>			  
					           		</tr>
					           		<tr>         			
					           			<th>요청사항</th><td>${to.to_req}</td>		           			
					           		</tr>
					           	</table>
				           	</div>
				           	<div class="delivery_info">
								<p>◆ 택배정보</p>
								<table>
									<tr>
										<th>택배사</th>
										<td>
											<select>
												<option selected>
													<c:choose>
														<c:when test="">택배사선택</c:when>
														<c:otherwise>택배사선택</c:otherwise>
													</c:choose>
												</option>
												<option value="cj대한통운">cj대한통운</option>
												<option value="우체국">우체국택배</option>
												<option value="롯데">롯데글로벌로지스</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>송장번호</th><td><input type="text" value="21345645" placeholder="송장번호입력"></td>
									</tr>				
								</table>
								<button>택배조회</button>
							</div>
							<c:if test="${not empty to.to_refund_reason}">
								<div>
								    <p style="color: red"> 
								        <label>◆ 취소/환불사유 : </label>      		
								    </p> 
								    <p class="refund">${to.to_refund_reason}</p> 
								</div>	
							</c:if>
						</div>
					</div>
				</form>
				<div class="btn">
					<button type="button" onclick="location.href='/vitabucket/admin/order'">주문전체목록</button>
					<button type="button" onclick="edit_save(${to.to_key})">변경저장</button>
				</div>
		    </section>	
		</div>
	</section>
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>