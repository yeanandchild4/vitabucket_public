<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VitaBucket</title>
<style>

	html,body{
		height: 100%;

	}
	.resultwrap{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		margin-top: 7rem;
    margin-bottom: 7rem;
	}
	
	
	.welcometitle{
		font-size: 30px;
		padding: 30px 0;
	}
	
	
	.logBtnWrap{
		margin: 20px auto;
		width: 270px;
	}
	
	.dologin{
		box-sizing: border-box;
		display: block;
		width: 100%;
		height: 40px;
		border-radius: 10px;
		border-color: #FFA500;
		background-color:transparent;
		font-weight: 600;
		font-size: 16px;

	}

</style>
</head>
<body>
<%@ include file="/include/header.jsp"%>
<main>
<section class="resultwrap">
	<h3 class="welcometitle">환영합니다!</h3>
	<p style="padding: 10px 0;">${name }님의 회원가입이 완료되었습니다</p>
	
	<div class="logBtnWrap">
		<button type="button" class="dologin"><a href="/member/login">로그인</a></button>
	</div>
	</section>
</main>

<%@ include file="/include/footer.jsp"%>
</body>
</html>