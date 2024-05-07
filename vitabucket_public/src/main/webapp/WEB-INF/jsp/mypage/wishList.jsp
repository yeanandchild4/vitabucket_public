<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한상품</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/wish.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
crossorigin="anonymous"></script>
<script defer src="/js/mypage/wishList.js"></script>
</head>
<body>

<%@ include file="/include/header.jsp"%>

<div class="mypage_container">
    <div class="mypage_menu">
        <jsp:include page="/include/mypage_menu.jsp">
        	<jsp:param value="wishList" name="page"/>
        </jsp:include>
    </div>

	<div class="mypage_contents">
		<div class="title_container">
            <div class="title">찜목록</div>
        </div>
		<div class="mypage_list">
			<ul>
				<c:forEach var="w" items="${list}">
					<li class="list_li">
						<div  class="list_1">
							<img src="/images/product/${w.main_img}" alt="#">
							<div class="list_1_1">
								<dl class="list_1_2">
									<a href="#">${w.pro_name}</a>
								</dl>
								<dl class="list_1_2">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${w.pro_price}" var="pro_price"/>
									<span>${pro_price}원</span>
								</dl>
							</div>
						</div>
						<div  class="list_2">
							<button class="bigBtn inactiveBtn" type="button" onclick="deleteWish(${w.wish_key})">삭제</button>
							<button class="bigBtn activeBtn" type="button" onclick="addCart(${w.pro_key})">담기</button>
						</div>
					</li>
				</c:forEach>		
			</ul>
		</div>
	</div>
</div>
<%@ include file="/include/footer.jsp"%>
</body>
</html>