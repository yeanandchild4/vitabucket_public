<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_상품상세페이지</title>
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
	    	<h3><span>재고관리</span><br><img src="/images/admin/product.png"></h3>
	    	<p>전체상품관리</p>
	    	<ul>
	    		<li onclick="location.href='/vitabucket/admin/prod'">상품목록</li>
   				<li onclick="location.href='/vitabucket/admin/prod/add'">상품등록</li>	 
	    		<li onclick="location.href='/vitabucket/admin/prod/excel/download'">상품목록 엑셀저장</li>
	    	</ul>    	
	    </div>
	    <div class="cont right"> 
	    	<div class="pro_detail">
	    		<h4>HOME > 상품관리 > 전체상품관리</h4>
				<h3>상품 상세</h3>	
				<div class="column">
					<div class="kind_wrap">
						<div class="kind_slider">
							<ul class="slider">
								<c:if test="${empty p.imgs}"><li><img src="/images/noimage.png"></li></c:if>
									<c:if test="${not empty p.imgs.main_img}"><li><img src="/images/product/${p.imgs.main_img}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
								<c:if test="${not empty p.imgs.img1}"><li><img src="/images/product/${p.imgs.img1}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
								<c:if test="${not empty p.imgs.img2}"><li><img src="/images/product/${p.imgs.img2}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
								<c:if test="${not empty p.imgs.img3}"><li><img src="/images/product/${p.imgs.img3}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
								<c:if test="${not empty p.imgs.img4}"><li><img src="/images/product/${p.imgs.img4}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
							</ul>
							<div class="arrow">
								<a class="prev">&lang;</a>
								<a class="next">&rang;</a>
							</div>
						</div>
					</div>
					<table>
						<tr>
							<th colspan="2">영양성분정보</th>
						</tr>
						<tr>
							<th>1회 제공량: </th>
							<td>${p.pro_serving_size}</td>
						</tr>
						<tr>
							<th>용기당 제공 횟수:</th>
							<td>${p.pro_servings_percont}</td>
						</tr>
					</table>
				</div>
				<div class="table_div">
					<table>
						<tr>
						<th>상품명</th><td>${p.pro_name}</td></tr>
						<tr><th>제조사</th><td>${p.pro_manufacturer}</td></tr>
						<tr>
							<th>재고량</th>
							<fmt:formatNumber type="number" maxFractionDigits="3" var="stock" value="${p.pro_stock}" />
			       			<td>${stock}개</td>
						</tr>
						<tr>
							<th>소비기한</th>
							<td>
								<fmt:formatDate var="best_by" value="${p.pro_best_by}" pattern="yyyy년 MM월 dd일까지"/>
								${best_by}
							</td>
						</tr>
						<tr>
							<th>상품 설명</th>
							<td>${p.pro_comment}</td>
						</tr>
					</table>
					<table>
						<tr>
							<th colspan="2">성분</th>
						</tr>
						<tr>
							<th>주요 성분</th>
							<td>${p.pro_main_ing}</td>
						</tr>
						<tr>
							<th>포함된 다른 성분들</th>
							<td>${p.pro_other_ing}</td>
						</tr>
						<tr>
							<th>알레르기사항</th>
							<td>${p.pro_allergy}</td>
						</tr>
					</table>
					<table>
						<tr>
							<th colspan="2">주의</th>
						</tr>
						<tr>
							<th>주의사항</th>
							<td>${p.pro_warnings}</td>
						</tr>
						<tr>
							<th>면책사항</th>
							<td>
								VitaBucket은 정확한 사진과 정보를 사이트에 반영하기 위해 노력하고 있습니다. 
								하지만 제조사가 포장이나 성분을 업데이트하는 경우 사이트에 반영되기까지 시간이 소요될 수 있습니다. 
								상품의 패키지는 다를 수 있지만 신선도는 보장해드립니다. 
								적절한 사용을 위해 VitaBucket 사이트상 정보가 아닌 상품에 기재된 내용을 기준으로 사용하시길 권장해드립니다. 
								일부 상품의 정보는 고객님의 편의를 위해 기계 번역되었습니다. 이는 검증된 번역으로 이른 시일 내에 수정될 예정입니다.
							</td>
						</tr>
					</table>
				</div>
				<div class="btn">
					<button type="button" onclick="location.href='/vitabucket/admin/prod'">목록</button>
					<button type="button" onclick="location.href='/vitabucket/admin/prod/edit/${p.pro_key}'">수정</button>
					<button type="button" onclick="pro_del(${p.pro_key})">삭제</button>
				</div>
			</div>
		</div>
	</section>
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>