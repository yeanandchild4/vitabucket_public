<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	var page = '<c:out value="${param.page}"/>';
	$('#'+page).css('background-color','#FfA500');
	$('#'+page+' > a').css('color','white');
});
</script>

</head>
<body>
	<div class="title_container">
		<div class="title">마이페이지</div>
	</div>
	<nav id="menu_list"> 
		<ul>
			<li id="order"><a href="/mypage/order">주문내역</a></li>
			<li id="wishList"><a href="/mypage/wishList">찜목록</a></li>
			<li id="review"><a href="/mypage/review">상품후기</a></li>
			<li id="inquiry"><a href="/mypage/inquiry">개인문의</a></li>
			<li id="info"><a href="/mypage/info">개인정보수정</a></li>
		</ul>
	</nav>
</body>
</html>