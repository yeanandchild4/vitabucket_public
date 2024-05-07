<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Pages</title>
<style>
  
body,html{
	margin:0; height: 100%;
}
a{
     text-decoration-line: none;
    }
    
main{
	padding-bottom: 90px;
	position: relative;
    margin-left: 4em;
    margin-right: 4em;
}


section{
        margin-top: 2em;
    }    

.wrap {
    margin: 0 auto;
    max-width: 311px;
    width: 100%
    }
.title{
    text-align: center;
    position: relative;
    
    
}

#logForm{
    text-align: center;
    margin: 0 auto;
}
.inputform{
    position: relative;
    width:100%;
    height:100%;
    border-radius:3px;
    border: 1px solid rgb(221, 221, 221);
    padding-left: 3px;
    }

.inputform:focus{
	outline: none !important;
	border: 1px solid #FFA500;
}

.inUser{
	width: 311px;
    height: 45px;
}


#inPwd{
    margin-top: 10px;
    }

.search{
    position: relative;
    font-size: small;
    text-align: right;
    margin-top: 6px;
    }
    
    .search a:hover{
    	color:#FFA500;
    }

    .btnwrap{
        margin-top: 2rem;
    }
    #dologin{
    box-sizing: border-box;
    display: block;
    width: 100%;
    height: 40px;
    border-radius: 10px;
    background-color: #FFA500;
    color: white;
    border: none;
    font-weight: 600;
    font-size: 16px;
    }
    .nobtn{
        margin-top: 5px
    }
    
    .plus{
    	display: flex;
    	flex-direction: row;
    	align-content: center;
    	justify-content: center;
   		 align-items: center;
    }
    .google{
            width: 45px;
    		margin-right: 27px;
    }
    .naver{
    	width: 55px;
    	margin-right: 25px;
    	margin-bottom: 4px;
    }
    .kakao{
    	width: 50px;
    }

    .plus{
        margin-top: 25px;
    }
    
    .search a,#regist{
    	font-size: small;
        color: dimgray;
        
    }
	.search a,#regist:hover{
		text-decoration:underline;
	}
</style>   
<script 
	src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script> 
<script type="text/javascript">


$(document).ready(function(){
	
	  $("#dologin").on("click",function(){
	    	var loginF ='[[${param.error}]]';
	    	var user_id = $('#user_id').val();
			var pwd=$('#user_pwd').val();
	    	
			if(user_id==""||user_id==null){
				alert('아이디를 입력해주세요');
				$('#user_id').focus();
			} else if(pwd==""||pwd==null)
			{
				alert('비밀번호를 입력해주세요');
				$('#user_pwd').focus();
				return false;
			}
			
	    	if(loginF == 'T'){
	    		alert('로그인 실패');
	    	} 
	    }); 

});


</script>  
</head>
<body>
<%@ include file="/include/header.jsp"%>
<main>
    <section class="inputbox">
        <div class="wrap">
            <div class="title"><h2 style="padding: 30px 0;">로그인</h2></div>
	        <form id="logForm" method="post" action="/doLogin" >
		            <div class="inUser"><input class="inputform" type="text" name="user_id" id="user_id" placeholder="아이디"></div>
		            <div id="inPwd" class="inUser"><input class="inputform" type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호"></div>
                <div class="search">
                    <a href="/member/idFind">아이디 찾기</a> / <a href="/member/pwdFind">비밀번호 찾기</a>
                </div>
		        <div class="btnwrap">
                    <button id="dologin" type="submit">로그인</button>
                </div>
		          <div class="nobtn">
			            <a href="/member/signup" id="regist">회원가입</a>
		            <div class="plus">
			           <a href="/oauth2/authorization/google"><img class="google" src="/images/logo/google.png"></a>
			           <a href="/oauth2/authorization/naver"><img class="naver" src="/images/logo/naver.png"></a>
			           <a href="/oauth2/authorization/kakao"><img class="kakao" src="/images/logo/kakao.png"></a> 
			      	</div>
			      </div>
	        </form>
        </div>
    </section>
</main>
<%@ include file="/include/footer.jsp"%>
</body>
</html>