<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html,body{
	height: 100%;
}

.footer_top>a:link {text-decoration: none;}
.footer_top>a:visited{
	color:rgb(51, 51, 51);
}
.footer_top>a{
	color: rgb(51, 51, 51);
}

footer{
    height: 90px;
	border-top: 1px solid #f7f7f7;
	text-align : center;
	padding-bottom: 50px;
	padding-top: 20px;          
}
.footerWrap{
	position: relative;
	margin-left: 70px;
	margin-right: 70px;
	}
.footer_top {
	display: flex;
	justify-content: space-between;
	align-items: center;
	
	text-align: center;
	height: 3rem;
}
.footerText{
	margin-top: 45px;
}
</style>
</head>
<body>
	<footer>
		<div class="footerWrap">
			<div class="footer_top">
				<a class="footCate" href="/vitabucket/introduce">회사정보</a><a class="footCate" href="/vitabucket/userterm">이용약관</a><a class="footCate" href="/vitabucket/privacy-policy">개인정보 처리방침</a><a class="footCate" href="#">고객센터</a> 
			</div>
			<div class="footerText">
				<p>Copyright © 2024 VitaBucket.co.,Ltd. All rights reserved.</p>
				<address>Contact webmaster for more information. 012-3456-7890</address>
			</div>
		</div>
	</footer>
</body>
</html>