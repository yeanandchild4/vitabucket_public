<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VitaBucket</title>
</head>
<style>
	
	html,body{
		margin:0;padding: 0; height: 100%;
	}
	a{
        text-decoration-line: none;
    }
    main{
    	margin: 100px auto;
    	display: flex; 
		align-items: center;
		flex-direction: column;
	}
    
    .mainLogo{        
        border: 1px solid;
        margin-bottom: 5em;
    }
	.wrap {
	height: 340px;
    margin: 0 auto;
    max-width: 437px;
    text-align: center;
    }
    
    .wrap h1{
    	margin: 40px auto;
    }
    
    .subtitle{
    	margin-bottom: 20px;
    }
	
	.idWrap{
		margin: 10px auto;
	}
	
	.idResult{
		
	}

	.btnwrap{
		    margin-top: 100px;
	}
	
	.btn{
		margin-top: 20px;
	}
	.do{
		width: 100%;
		height: 45px;
		background-color: #FFA500;
	    color: white;
	    border: none;
	    font-weight: 500;
	    font-size: 16px;
	    border-radius: 6px;
	}

   .idFindBtns{
   		margin-top: 50px;
   }
      
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
			integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
			crossorigin="anonymous"></script>
</script>   
<script>
	$(function(){   
		
		//Modal을 가져옵니다.
		var modals = document.getElementsByClassName("modal");
		// Modal을 띄우는 클래스 이름을 가져옵니다.
		var btns = $(".do");
		// Modal을 닫는 close 클래스를 가져옵니다.
		var spanes = document.getElementsByClassName("close");
		var funcs = [];
		 
		// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
		function Modal(num) {
		  return function() {
		    // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
		    btns[num].onclick =  function() {
		        modals[num].style.display = "block";
		        console.log(num);
		    };
		 
		    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
		    spanes[num].onclick = function() {
		        modals[num].style.display = "none";
		    };
		  };
		}
		 
		// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
		for(var i = 0; i < btns.length; i++) {
		  funcs[i] = Modal(i);
		}
		 
		// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
		for(var j = 0; j < btns.length; j++) {
		  funcs[j]();
		}
		 
		// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
		window.onclick = function(event) {
		  if (event.target.className == "modal") {
		      event.target.style.display = "none";
		  }
		};
		
	});
	
	
	
</script>

<style>

	.modal-wrap{
		 overflow-y: auto;
		 align-items: center;
		 display: flex;
		 position: fixed;
		 justify-content: center;
		overflow-x: hidden;
		transition: background-color .1s;
	}


		.modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        
        .modal_content {
            background-color: #fefefe;
            margin: 40% auto; /* 15% from the top and centered */
            padding: 0;
            border: 1px solid #888;
            width: 40%; /* Could be more or less, depending on screen size */
            height: 20vh;
            border-radius: 10px;
    		overflow: auto;
    		max-width:350px;
        }
        .fullid{
        	text-align: center;
        	font-size: 16px;
        	 padding: 40px 30px;
        }   
        .closeBtn{
        	height: 45px;
        	border-top: 1px solid #f7f7f7;
        	
        }
        .close{
        	border: 0;
 			 background-color: transparent;
        	font-size: 16px;
        	font-weight: 700;
        	color:#FFA500;
        	padding: 0px;
        	width:100%;
        	height: 100%;    
        }
        .close:hover,
		.close:focus {
  			color: black;
    		text-decoration: none;
    		cursor: pointer;
}

 </style>
	
<body>
<%@ include file="/include/header.jsp"%>
    <main>
       <section class="inputbox">
          <div class="wrap">
          		<c:choose>
          			<c:when test="${not empty uid}">
          				<h1>고객님의 계정을 찾았습니다.</h1>
	                    <div class="subtitle">
	                        <h4>아이디 확인 후 로그인 부탁드립니다.</h4>
				  		</div>
	                    <div class="idWrap">
	                    	<p class="idResult">아이디 ${uid}</p>	
	                    </div>
	                    
	                    <div class="idFindBtns">
		                    <button type="button" class="do" id="modal">아이디 전체확인</button>
		                    <!-- The Modal -->
		                    <div class="modal-wrap"> 
			                    <div class="modal">
									<div class="modal_content">
		 				    			<div class="fullid">${fulluid}</div>	
		    							<div class="closeBtn">
		 				    			    <button type="button" class="close">확인</button>
		 				    			</div>	
									</div>
			                    </div> 
		                    </div>
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