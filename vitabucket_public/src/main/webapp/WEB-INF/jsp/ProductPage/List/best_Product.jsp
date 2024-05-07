<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트 상품</title>
<link rel="stylesheet" type="text/css" href="/css/productList.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
<%@ include file="/include/header.jsp" %>
<div class="container">
	<%-- 서브 카테고리 --%>
	<div><aside class="allCategory">
		<div id="ulTitle">카테고리</div>
		<ul class="main">
			<c:forEach var="m" items="${mainCat}" >
			<li><a href="maincate${m.main_cat_key}">${m.main_cat_name}</a></li>
				<ul class="sub">
					<c:forEach var="s" items="${m.sub}">
						<li><a href="subcate${s.sub_cat_key}">${s.sub_cat_name}</a></li>
					</c:forEach>
				</ul>
			</c:forEach>
		</ul>
	</aside></div>
	<div class="section"><section>
		<h3>베스트 상품</h3>
		<!-- 정렬 -->
		<ul class="select">
			<c:choose>
				<c:when test="${sort eq 'best'}"><li style="font-weight: bold;">인기순</li></c:when>
				<c:otherwise><li><a href="javascript:sortPage('best', 'best', 1)">인기순</a></li></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${sort eq 'lowest'}"><li style="font-weight: bold;">낮은 가격순</li></c:when>
				<c:otherwise><li><a href="javascript:sortPage('best', 'lowest', 1)">낮은 가격순</a></li></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${sort eq 'highest'}"><li style="font-weight: bold;">높은 가격순</li></c:when>
				<c:otherwise><li><a href="javascript:sortPage('best', 'highest', 1)">높은 가격순</a></li></c:otherwise>
			</c:choose>
		</ul>
		<%-- 상품리스트 --%>
		<main>
			<table>
				<%-- 상품은 한 행에 3개씩 총 9개만 보여진다 --%>
				<tr class="productList">
					<c:forEach var="pd" items="${pd_list.list}">
						<td><a href="detail/${pd.pro_key}"><div><img src="/images/product/${pd.imgs.main_img}"></div></a>
						<div>
							<form id="cartForm_${pd.pro_key}">
								<input type="hidden" name="pro_key" value="${pd.pro_key}">
								<input type="hidden" name="pro_cnt" value="1">
								<button class="cartBtn" type="button" onclick="addCart('${pd.pro_key}');"><i class="fa-solid fa-cart-plus"></i> 상품 담기</button>
							</form>
						</div>
						<a href="detail/${pd.pro_key}"><div>${pd.pro_name}</div>
						<div style="font-weight: 500;"><fmt:formatNumber value="${pd.pro_price}" maxFractionDigits="3"/>원</div>
						<div><i class="fa-regular fa-eye" style="color: #e0e0e0;"></i> ${pd.pro_hit}</div></a></td>
					</c:forEach>
				</tr>	
			</table>
			<div id="pagination">
				<c:choose>
					<c:when test="${path eq '/product/best'}"><div><a href="javascript:page(${pd_list.navigateFirstPage}, 'best')">《</a></div></c:when>
					<c:otherwise><div><a href="javascript:sortPage('best', '${sort}', ${pd_list.navigateFirstPage})">《</a></div></c:otherwise>
				</c:choose>
				<c:forEach var="i" items="${pd_list.navigatepageNums}">
					<c:choose>
					<c:when test="${i==pd_list.pageNum}"><div class="selectpage">${i}</div></c:when>
					<c:when test="${path eq '/product/best'}"><div><a href="javascript:page(${i}, 'best')">${i}</a></div></c:when>
					<c:otherwise><div><a href="javascript:sortPage('best', '${sort}', ${i})">${i}</a></div></c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${path eq '/product/best'}"><div><a href="javascript:page(${pd_list.navigateLastPage}, 'best')">》</a></div></c:when>
					<c:otherwise><div><a href="javascript:sortPage('best', '${sort}', ${pd_list.navigateLastPage})">》</a></div></c:otherwise>
				</c:choose>
			</div>
		</main>
	</section></div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/addCart.js"></script>
<script type="text/javascript" src="/js/pd_list.js"></script>
<script src="https://kit.fontawesome.com/c96408e797.js" crossorigin="anonymous"></script>
</html>