<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_상품관리페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/product.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/product.js"></script>
</head>
<body>
<%@include file="/WEB-INF/jsp/admin/AdminHeader.jsp" %> 
    <section class ="contents">
	    <div class="cont left">
	    	<h3><span>상품관리</span><br><img src="/images/admin/product.png"></h3>
	    	<ul>
	    		<li onclick="location.href='/vitabucket/admin/prod'" class="li_color">상품목록</li>
   				<li onclick="location.href='/vitabucket/admin/prod/add'">상품등록</li>	 
   				<li onclick="location.href='/vitabucket/admin/prod/excel/download'">상품목록 엑셀저장</li>	 
	    	</ul>    	
	    </div>
	    <div class="cont right pro_list"> 
	    	<h4>HOME > 상품관리 > 전체상품관리</h4>
		    <section>
		        <h2>전체상품관리</h2>	
		        <form action="/vitabucket/admin/prod" method="post" id="searchForm">		                
		            <div class="t1">
		               <h3>상품검색</h3>	
						<table>
							<tr>
								<th>검색어</th>
								<td>
									<select name="search">
		                            	<option selected disabled>선택하세요</option>
										<option value="pro_name">상품명</option>
										<option value="pro_key">상품번호</option>
									</select>
									<input type="search" name="search_key">
								</td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td class="cate_td">					                       
		                           <select name="main_cat_key" onchange="onCatChanged()">
		                               <option selected disabled>=상위카테고리선택=</option>
		                               <c:forEach var="c" items="${clist}">                                
		                                <option value="${c.main_cat_key}" >00${c.main_cat_key} ${c.main_cat_name}</option>                                
		                               </c:forEach>                               
		                           </select>
		                           <select name="sub_cat_key">
		                           	<option selected disabled>=하위카테고리선택=</option>
		                           </select>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="table_btn">
									<button type="reset">초기화</button>
									<button type="submit" onclick="pro_search()">검색</button>
								</td>
							</tr>
						</table>					
	                </div>	  
	                <div  class="t2 pro_admin">
	                	<h3>상품목록 <span>전체: ${plist.size()}건 조회</span></h3>
                		
						<div id="pro_btn">
	                		<button type="button" onclick="selec_Del()" id="selecDelBtn">선택삭제(0)</button><br>
	                		<button type="button" onclick="location.href='/vitabucket/admin/prod/add'">상품등록</button>	
	                	</div>               	
	                	<table>
	                		<tr>
	                			<th><input type="checkbox" id="allCk" onclick="selectAll()"></th>
	                			<th>상품번호</th><th>상품사진</th><th>상품명</th>
	                			<th>카테고리</th><th>제조사</th><th>상품재고</th><th>상품가격</th>                			
	                			<th colspan="3">관리</th>           
	                		</tr>
	                		<c:forEach var="p" items="${plist}">
		                		<tr>
		                			<td><input type="checkbox" name="check_key" value="${p.pro_key}"></td>
		                			<td>${p.pro_key}</td>
		                			<td><img src="/images/product/${p.imgs.main_img}" alt="${p.imgs.main_img}"></td>
		                			<td>${p.pro_name}</td>
		                			<td>${p.main_cat_name}<br>${p.sub_cat_name}</td>
		                			<td>${p.pro_manufacturer}</td>
		                			<fmt:formatNumber type="number" maxFractionDigits="3" var="stock" value="${p.pro_stock}" />
		                			<td>${stock}개</td>
		                			<fmt:formatNumber type="number" maxFractionDigits="3" var="price" value="${p.pro_price}" />
		                				<td>${price}원</td>
		                			<td><button type="button" onclick="location.href='/vitabucket/admin/prod/detail/${p.pro_key}'">상세정보</button></td>
		                			<td><button type="button" onclick="pro_del(${p.pro_key})">삭제</button></td>
		                		</tr>
	                		</c:forEach>
	                	</table>
	                </div>  
       			</form> 
            </section>            
	    </div>
	    <div class="t3 pro_detail"></div>
    </section>    
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>