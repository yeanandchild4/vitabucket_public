<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user" var="user" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재확인</title>
<link rel="stylesheet" type="text/css"
	href="/css/mypage/info.css">

</head>
<body>
<%@ include file="/include/header.jsp"%>
<div class="mypage_container">
	<div class="mypage_menu">
		<jsp:include page="/include/mypage_menu.jsp">
			<jsp:param value="info" name="page"/>
		</jsp:include>
	</div>
	<div class="infomodify_container">
		<main>
			<section class="modify">
				<div id="title">
					<h2>정보수정</h2>
				</div>
				<div class="line"></div>
				<form id="form">
					<div class="box">
						<div><label>아이디</label></div>
						<input type="text" id="user_id" name="user_id" value="${user.user_id}" readonly>
					</div>
					<div class="box">
						<div><label>비밀번호</label></div>
						<input type="password" id="user_pwd" name="user_pwd">
					</div>
			        <button class="bigBtn" id="confirmBtn" type="button" onclick="modifyPwd()">확인</button>
				</form>
			</section>
		</main>
	</div>
</div>

<%@ include file="/include/footer.jsp"%>
<script defer src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous">
</script>
<script defer src="/js/mypage/info.js"></script>
</body>
</html>