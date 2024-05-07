<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VitaBucket</title>
</head>
<style>
	
	html,body{
		margin:0;padding:0; height: 100%;
	}
	a{
        text-decoration-line: none;
    }
    main{
    	display: flex; 
		align-items: center;
		flex-direction: column;
		margin: 150px auto;
	}
	.wrap {
	height: 100%;
    margin: 0 auto;
    max-width: 437px;
    text-align: center;
    }

	.subtitle h4{
		font-size: 20px;
	}
	
	.msg{
		 margin-top: 30px;
	}
	.btnwrap{
		    margin-top: 100px;
	}
	
	.btn{
		margin-top: 40px;
	}
	.do{
		width: 300px;
		height: 45px;
	    border: none;
	    border-radius: 10px;
	    color: white;
	    font-size: 16px;
	    font-weight: 600;
	    background-color: #FFA43F;
	}

</style>
<body>
<%@ include file="/include/header.jsp"%>
    <main>
       <section class="inputbox" style="height: 160px;">
          <div class="wrap">
          		<c:choose>
          			<c:when test="${not empty user_email}">
	                    <div class="subtitle">
	                        <h4><span style="color: #FFA43F;">${user_email}</span>로 임시비밀번호 메일이 발송되었습니다.</h4>
				  		</div>
				  		<p class="msg"> 확인 후 로그인 부탁드립니다.
							<div class="btn">
								<a href="/member/login"><button type="button" class="do">로그인</button></a>
	                  		</div>
	                    </div>          
          			</c:when>
          			<c:otherwise>
          				<div class="nosearch">가입된 회원정보가 없습니다.</div>
          				<div class="btn">
          					<a href="/member/signup"><button type="button" class="do">회원가입</button></a>
          				</div>
          			</c:otherwise>
          		
          		</c:choose>
                
          </div>
       </section>
    </main>
<%@ include file="/include/footer.jsp"%>
</body>
</html>