<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잘못된 접근</title>
<style>

	html,body{
	    margin:0; height: 100%;
	}
	
	a{
        text-decoration-line: none;
    }
	
	section{
		margin-top: 200px;
	}
	
	.wrap{
		
		display: flex;
		flex-direction: column;
		flex-wrap: nowrap;
		justify-content: center;
		align-items: center;
	}
	
	.msg{
		font-size: 35px;
    	font-weight: 700;
	}
	
	.goMain{
		margin-top: 10px;
		color:#FFA43F;
	}

	.goMain:hover{
		
		text-decoration:underline;
	}

</style>
</head>
<body>
	<main>
		<section>
			<div class="wrap">
				<div class="msg">잘못된 접근입니다.</div>
				<a class="goMain" href="">메인으로 돌아가기</a>
			</div>
		</section>
	</main>
</body>
</html>