<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    body,html{
	    margin:0; height: 100%;
    }
    a{
        text-decoration-line: none;
    }
    main{
        margin-left:3rem;
        margin-right: 3rem;
        margin-top: 4rem;

        
    }
	.regist{
		max-width: 550px;
		margin: 0 auto;
		padding-bottom: 130px;
	}
	
	.addline{
		border-bottom: 2px solid #FFA500;;
	}
	
    #addForm{
        margin-top: 50px;
    }
    
    
    .box{
        position: relative;
       	margin-bottom: 5em; 
	    justify-content: space-between;
	    flex-wrap: nowrap;
	    flex-direction: row;
	    padding: 10px 20px;
		display: flex;
    }
    
    .box_addr{
    	 position: relative;
       	margin-bottom: 5em;
        display: flex;
	    align-items: baseline;
	    justify-content: space-evenly;
	    flex-wrap: nowrap; 
	    flex-direction: column;
	    padding: 10px 20px;
    }
    
    .naming{
    	 font-size: 15px;
    	text-align: left;
		padding-left: 0.2em;
    }
    
	.naming span{
		font-size: small;
		color: crimson;
		margin-right: 3px;
	}
	
	.checkBtn{
		margin: auto 0;
		width: 100px;
		height: 56px;
		background-color: white;
		border-radius: 4px;
		border: 1px solid gray;
		margin-bottom: 0;
		margin-top: 0;
	}
	
	.addr-item{
	
		display: flex;
    	flex-direction: row;
    	flex-wrap: nowrap;
    	
	}
	
	.zipcodebtn{
		margin: auto 0;
		width: 100px;
		height: 56px;
		background-color: white;
		border-radius: 4px;
		border: 1px solid gray;
		margin-left: 1px;
   		margin-top: 0;
   		margin-left: 5px;
		
	}
	
	
	.che{
		font-size: small;
		color:red;
		margin-top: 3px;
	}
    .contents{
	  width: 405px;
	  height: 55px;
	  box-sizing: border-box;
	  padding: 5px 0 5px 10px;
	  border-radius: 4px;
	  border: 1px solid #d9d6d6;
	  color: #383838;
	  background-color: #ffffff;
	  font-size: 16px;
    }
	
	.contents:focus{
		outline: none !important;
		border-color:#FFA500;
	}
	
	.addbtn{
		margin: 0 auto;
   		width: 100%;
   		display: flex;
    	align-content: center;
    	align-items: center;
    	justify-content: center;
   		border-top: 2px solid rgb(247, 247, 247);
   		padding: 40px 0;
	}
	
	#dobtn{
		width:270px;
		height: 55px;
		text-align: center;
		background-color: #FFA500;
		color:white;
    	border-radius: 4px;
    	border:none;
    	font-weight: 600;
    	font-size: 16px;
	}
	
	.checkBtnWrap{
		margin-top: 22px;
	}
	
	.mdiv{
		margin: auto 0;
		width: 100px;
    	height: 56px;
	}
	/* 
	#dobtn:hover{
		border-color: #FFA500;
	}
	 */
</style>
<script 
	src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="/js/registpage/addForm.js"></script>
</head>
<body>
<%@ include file="/include/header.jsp"%>
    <main>
       <section class="regist">
           <div id="title"><h2 style="text-align: center; margin-bottom: 35px;">회원가입</h2></div>
           <div class="addline"></div>
           <form id="addForm" method="post" action="/member/signup" onsubmit="return signup()">
               <div class="box">
               		<div>
                  	 <p class="naming"><span>*</span>이름</p>
                  	 <input type="text" class="contents" name="name" id="name">
                	</div>
                   <div class="mdiv"></div>
               </div>
                <div class="box info__id">
                	<div class="inputdiv">
	                   <p class="naming"><span>*</span>아이디</p>
	                   <input type="text" class="contents" name="user_id" id="user_id" oninput="textId()" >
	                   <p id="idcheck" class="che"></p>
                   	</div>
                   	<div class="checkBtnWrap">
	                <button type="button" class="checkBtn" onclick="idChecked()">중복확인</button>
	                </div>
               </div>
               
               <div class="box">
               		<div>
                   		<p class="naming"><span>*</span>비밀번호</p>
                   		<input type="password" class="contents" name="user_pwd" id="user_pwd" oninput="textPwd()" >
                   		<p id="pwdcheck" class="che"></p>
                   </div>
                   		<div class="mdiv"></div>	
               </div>
                <div class="box">
                	<div>
	                   <p class="naming"><span>*</span>비밀번호 확인</p>
	                   <input type="password" class="contents" id="pwd2">
                   </div>
                   <div class="checkBtnWrap">
                   		<button type="button" class="checkBtn" onclick="pwdCheck()" >확인</button>
                   </div>
               </div>
               <div class="box">
               		<div>
	                   	<p class="naming"><span>*</span>E-mail</p>
	                   	<input type="text" class="contents" name="user_email" id="user_email" 
	                   	placeholder="예 : abc@vitabucket.com">
	                   	<p id="emailcheck" class="che"></p>
                    </div>
                    <div class="checkBtnWrap">
                     <button type="button" class="checkBtn" onclick="emailCheck()" >중복확인</button>
                    </div>
               </div>
               <div class="box_addr">
               		<div>
	                    <p class="naming"><span>*</span>주소</p>
	                    <div class="addr-item">
		                    <input class="contents" type="text" id="addr_zipcode" name="addr_zipcode" placeholder="우편번호" style="width: 8.6em; margin-bottom:5px;">
						    <input class="contents" type="text" id="addr" name="addr" placeholder="주소" style="margin-left: 4px; width: 262px; margin-bottom: 5px;">
						    <input class="zipcodebtn" type="button" onclick="DaumPostcode()" value="우편번호 찾기">
				   		</div>
				   </div>
				   <div>
					    <input class="contents" type="text" id="addr_detail" name="addr_detail" placeholder="상세주소" style="width: 262px;">
					    <input class="contents" type="text" id="addr_reference" name="addr_reference" placeholder="참고항목" style="width: 8.6em">
               	   </div>
               </div>
                <div class="box">
                	<div>
						<p class="naming"><span>*</span>생년월일</p>
						<select class="contents" name="year" id="year" style="width:133.2px"></select>
						<select class="contents" name="month" id="month" style="width:133.2px"></select>
						<select class="contents" name="day" id="day" style="width:133.2px"></select>
					</div>
					<div class="mdiv"></div>
               </div>
               <div class="box">
               		<div>
                   		<p class="naming"><span>*</span>전화번호</p>
                   		<input type="text" class="contents" name="user_phone" id="user_phone" onkeyup="cell()" maxlength="13">
                 	</div>
                    <div class="mdiv"></div>
               </div>
             <div class="addbtn">
               	<button id="dobtn" type="submit">가입하기</button>
           </div>
           </form>
       </section>
    </main>
<%@ include file="/include/footer.jsp"%>
</body>

</html>