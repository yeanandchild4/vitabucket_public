<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<style>   
 	
body,html{
	margin:0; height: 100%;
}
a{
     text-decoration-line: none;
    }
    
main{
	height:350px;
	padding-bottom: 200px;
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
    width: 100%;
    text-align: center
    }

   .inputbox{
	  	margin-top: 130px; 
   }
    
 
  .title{
      text-align: center;
      margin-bottom: 50px;
   }
 
   .wrap {
    margin: 0 auto;
   
   max-width: 437px;
   text-align: center;
    }


	.subtitle{
   	    width: 120px;
    	margin: 0 auto;
   }
   
    .findslash{
   		border-bottom: 2px solid #FFA500;
   		margin-bottom:14px;
   }
  
    .findform{
	   
	   width:100%;
	   height:100%;
       margin-bottom: 1em;
       border-radius:3px;
    	border: 1px solid rgb(221, 221, 221);
   }
  
  
    .findform:focus{
   	outline: none !important;
	border: 1px solid #FFA500;
   }
  
  .input_btn{
  
  	display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    align-items: center;
    justify-content: center;
  }
  
    .inputwrap{
   	 	width: 311px;
       height: 45px;
       margin-bottom: 15px;
   }
   
    .pwdsub{
	   	background-color: #FFA500;
	    color: white;
	    border: none;
	    font-weight: 600;
	    font-size: 16px;
	    border-radius: 10px;
	    padding: 0;
	    width: 311px;
    	height: 45px;
	    margin-top: 13px;
   }
  
   
   #findBtn a{display: inline-block;}
    
   .contents:focus{
      outline:none;
   }
   
   .btnwrap{
      margin-top:20px;
   }
   #login{
   		
      font-size: 15px;
      color: dimgray;
      
   }
   
    #login:hover{
   	color:#FFA500;
   	text-decoration:underline;
   }
   
    .nameform{
   	    display: flex;
    	flex-direction: column;
    	align-items: flex-start;
   }
   
   .lab{
   		padding: 8px 0 11px;
    	font-size: small;
    	font-weight: 600;
    	color: rgb(51, 51, 51);
   }
   
  
   
</style>
<script 
	src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script> 
<script>
function find(){

	var user_id = $('#user_id').val();
	var email=$('#user_email').val();
	
	if(user_id==""||user_id==null){
		alert('아이디를 입력해주세요');
		$('#user_id').focus();
		return false;
	} else if(email==""||email==null)
	{
		alert('이메일을 입력해주세요');
		$('#user_email').focus();
		return false;
	}
}

</script>

<body>
<%@ include file="/include/header.jsp"%>
    <main>
       <section class="inputbox">
          <div class="wrap">
                <h2 style="margin-bottom: 50px; font-size: 30px;">비밀번호 찾기</h2>
                <div class="subtitle">
                        <h4 style="margin-bottom: 6px;">이메일 인증</h4>
                        <div class="findslash"></div>
                    </div>
                <form id="pwdFindForm" method="post" action="/member/pwdSuccess" onsubmit="return find()">
                    
                    <div class="input_btn">
                    	<div class="nameform">
                        	<label class="lab">아이디</label>
                            <div class="inputwrap"><input type="text" class="findform" id="user_id" name="user_id" placeholder="아이디를 입력해 주세요"></div>
						</div>
						<div class="nameform">
							<label class="lab">이메일</label>
                            <div class="inputwrap"><input type="text" class="findform" id="user_email" name="user_email" placeholder="가입 시 등록한 이메일"></div>
                        </div>
                        <div id="findBtn">
                           <button class="pwdsub" type="submit">확인</button>
                        </div>
                    </div>
                    <div class="noBtn" style="margin-top: 3px;">
                        <a id="login" href="/member/login">로그인</a>
                    </div>
                </form>             
          </div>
       </section>
    </main>
<%@ include file="/include/footer.jsp"%>
</body>
</html>