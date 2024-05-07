<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
   
   .subtitle{
   	    width: 120px;
    	margin: 0 auto;
   }
   
   .findslash{
   		border-bottom: 2px solid #FFA500;
   		margin-bottom:14px;
   }
   
/*    .input{
   	    margin-top: 30px;
   } */
  
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
   
   
   .inputwrap{
   	 	width: 311px;
       height: 45px;
       margin-bottom: 15px;
   }
   
   .idsub{
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
   
   .che{
   	font-size: small;
		color:red;
		margin-top: 3px;
   }

</style>
<script 
	src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script>
<script>
function textname(){
	
	var uid=document.getElementById("name").value;
	document.getElementById("namecheck").innerHTML="가입 시 등록한 이름을 입력해주세요.";
	
}

	function find(){

		    	var name = $('#name').val();
				var email=$('#user_email').val();
		    	
				if(name==""||name==null){
					alert('이름을 입력해주세요');
					$('#name').focus();
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
                <h2 style="margin-bottom: 50px; font-size: 30px;">아이디 찾기</h2>
                <div class="subtitle">
                     <h4 style="margin-bottom: 6px;">이메일 인증</h4>
                     <div class="findslash"></div>
                </div>
                <form id="idFindForm" method="post" action="/member/idSuccess" onsubmit="return find()">

                    <div class="input_btn">
                        <div class="nameform">
                        	<label class="lab">이름</label>
                           <div class="inputwrap"><input type="text" class="findform" id="name" name="name" placeholder="이름을 입력해 주세요"></div>
						</div>
						<div class="nameform">
							<label class="lab">이메일</label>
                           <div class="inputwrap"><input type="text" class="findform" id="user_email" name="user_email" placeholder="가입 시 등록한 이메일"></div>
                        </div>
                        <div id="findBtn">
                            <button class="idsub" type="submit">확인</button>
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