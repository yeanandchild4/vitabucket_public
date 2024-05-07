
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
* {
	margin:0;
	padding:0;
}

html,body {	
	height: 100%; 
	min-width: 1200px; 
	 font-family: "Noto Sans KR", sans-serif;
}
a{
	color:rgb(51, 51, 51);
}

a:link {text-decoration: none; }
a:visited{
	color:rgb(51, 51, 51);
}
a:active{
	color:#FFA500;
}




.topM {    
display: flex;
    flex-direction: row;
    align-content: center;
    justify-content: center;
    align-items: center;
	text-align: right;
	float: right;	
}
.topM>a {
	flex: none;
	padding:0.3em;
	margin:0.2em;
	margin-left: 2px;
	font-size: 13px;
	
}

.cartbtn>a{
	padding: 0.3em;
    margin: 0.2em 0.2em;
    margin-left: 2px;
    font-size: 13px;
    color:#FFA500;
}


.logo img {
	width: 4em;
}

.notMenuWrap{
	margin: 0 auto;
    width: 1050px;
    position: relative;
}
	
.notMenu {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  height: 130px;
  margin: 0 auto;	
 
}

.slash{
	width: 1px;
    height: 13px;
    margin: 0px 12px;
    background-color: rgb(217, 217, 217);
}

.searchWrap{
	display: flex;
    flex-direction: row;
    width: 400px;
    height: 45px;
    border-radius: 6px;
    border: 1px solid #FFA43F;
    flex-wrap: nowrap;
    justify-content: space-between;
    align-items: center;
}

#search{
	display: flex;
	align-items: center;
    justify-content: space-between;
    width: 300px;    
	border: none;
    outline: none;
    margin-left: 10px;
	}
	
#searchLink{
		border: none;
		background-color: transparent;
		display: flex;
		justify-content: center;
		align-items: center;
		float: right;
		height: 100%;
  		width: 50px;
  		
}
.username{
	margin-rigth:4px;
}

menu{
	box-shadow: rgba(0, 0, 0, 0.07) 0px 3px 4px 0px;
}



	
menu>ul {
	display: flex;
    justify-content: space-between;
    align-items: baseline;
    font-size: large;
    font-weight: bolder;
    padding: 0;
}

menu>ul>li {
	position: relative;
	width: 150px;
	text-align: center;
	height: 45px;
} 

menu>ul>li>a:hover{
	color: #FFA500;
}

.categorysection{
	    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    flex-wrap: nowrap;
}

#mainCates {
	height: 490px;
	position: absolute;
	top: 120%;
	left: 0;
	display: none;
	z-index: 999;
	width: 250px;
	background-color: white;
	border: 1px solid rgb(217, 217, 217);
	border-radius: 4px;
	list-style: none;
	padding: 10px;
   	font-size: 16px;
    font-weight: normal;
    text-align: left;
}

#mainCates li{
	margin:20px;
	
}

#mainCates li a{
	letter-spacing: 0.3px;
}


#mainCates li>a:link{
	text-decoration: none !important;
	color:rgb(51, 51, 51);
}


#mainCates li>a:hover{
	color:#FFA500;
	font-weight:600;
	
	
}

	
.mainmenu{
	list-style: none;
	padding:0;
	width: 1100px;
    margin: 0 auto;
	}

	
</style>
<script 
	src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script>
<script type="text/javascript" src="/js/categorySlide.js"></script>
<script>
 	function reqsearch(){
		var searchKey = $('#search').val();
		
		if(searchKey=="" | searchKey==null){
			alert('검색어를 입력해주세요')
		}
		else{
			var f = document.createElement('form');
		    f.setAttribute('method', 'get');
		    f.setAttribute('action', '/product/search/'+searchKey);
		    document.body.appendChild(f);
		    f.submit();
		}
	} 
	
	$(document).ready(function(){
		
	$.ajax({
			url:"/vitabucket/cate",
			type : 'post',
			cache : false,
			dataType : 'json', 
			success : function(res) { 
				console.log(res.list);
				for(var i=0; i<res.list.length; i++) {
					var a = res.list[i];
					$('#mainCates').append('<li><a href="/product/maincate'+a.main_cat_key+'">'+a.main_cat_name+'</a></li>')
				} 
				
			
			},
			error : function(xhr, status, err) {
				alert(status + "," + err);
			}
		});
	
	});
</script>
</head>
<body>
<header>
	<div class="notMenuWrap">
		<div class="notMenu">
			<div class="logo">
				<a href="/vitabucket/main"><img src="/images/logo/logo.png" alt="logo"></a>
				VitaBucket
			</div>
			<div class="searchWrap">
				<input type="text" id="search" name="search" placeholder="검색어를 입력해주세요">
				<button type="button" id="searchLink" onclick="reqsearch()"><img src="/images/header/searchIcon.png" style="width:24px"></button>
			</div>
    	<div class="topM">
             <sec:authorize access="isAuthenticated()">
         		<sec:authentication property="principal.username" var="userName" />
         		<a class="username"href="/mypage/order">${userName}님</a>
         	</sec:authorize>
	      <c:choose>
	         <c:when test="${empty userName}">
	            <a href="/member/login" style="color:#FFA500">로그인</a>
	            <div class="slash"></div>
	            <a href="/member/signup">회원가입</a>
	         </c:when>
	         <c:otherwise>
	         	<div class="slash"></div>
	         	<div class="cartbtn"><a href="/cart">장바구니</a></div>
	         	<div class="slash"></div>
	            <a href="/logout">로그아웃</a>
	            <sec:authorize access="hasRole('ROLE_ADMIN')">
	             <!-- 'ROLE_ADMIN' 역할을 가진 사용자에게만 표시됩니다 -->
	             <div class="slash"></div>
	            <a href="/vitabucket/admin/main">관리자페이지</a>
	         </sec:authorize>
	         </c:otherwise>
	      </c:choose>      
      </div>
	</div>
	</div>
      <menu>
         <ul class="mainmenu">
            <li class="categorysection">
            	<div>
	            	<span class="cateindex">
	            		<img src="/images/header/listicon.png" style="width:22px; position: relative; top: 4px;">
	            	</span>
	            	<span>카테고리</span>
            	</div>
               <ul id="mainCates">
               <%-- <c:forEach var="m" items="${mainCat}">
                  <li><a href="../maincate${m.main_cat_key}">${m.main_cat_name}</a></li>
               </c:forEach> --%>
               </ul>
            </li>
            <li><a href="/product/all">전체 상품</a></li>
            <li><a href="/product/best">베스트 상품</a></li>
            <li><a href="">이벤트</a></li>
            <li><a href="/vitabucket/faq">FAQ</a></li>
         </ul>
      </menu>
	</header>
</body>
</html>