<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<body>
    <header id="show"><!--계속 jsp에 구현 -->
       <h1><a href="/vitabucket/admin/main"><img src="/images/admin/admin_logo.png" alt="관리자페이지 로고"></a></h1>
     	<div class="topM">
	           	<sec:authorize access="isAuthenticated()">
	         		<sec:authentication property="principal.username" var="userName" />
	         		<a href="/mypage">${userName}님</a>	    		
				<c:choose>
					<c:when test="${empty userName}">
						<a href="/member/login">로그인</a>
						<a href="/member/signup">회원가입</a>
					</c:when>
					<c:otherwise>					
						<a href="/logout">로그아웃</a>
						<a href="/vitabucket/main">홈으로</a>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						    <!-- 'ROLE_ADMIN' 역할을 가진 사용자에게만 표시됩니다 -->
						   <a href="/vitabucket/admin/main">관리자페이지</a>
						</sec:authorize>
					</c:otherwise>
				</c:choose>	
				</sec:authorize>
		</div>
       <div class="menu">
	        <ul>
               <li onclick="location.href='/vitabucket/admin/memb'">회원관리</li>               
               <li onclick="location.href='/vitabucket/admin/cate'">카테고리관리</li>
               <li onclick="location.href='/vitabucket/admin/prod'">상품관리</li>
               <li onclick="location.href='/vitabucket/admin/order'">주문관리</li>
               <li onclick="location.href='/vitabucket/admin/suppo'">고객지원관리</li>
               <li onclick="location.href='/vitabucket/admin/sett'">환경설정관리</li>
           </ul>
       </div>
    </header>
    <header id="mobile">
    	<h1><a href="/vitabucket/admin/main"><img src="/images/admin/admin_logo.png" alt="관리자페이지 로고"></a></h1>
       <div class="menu">
       		<img alt="메뉴" src="/images/admin/menu.png" id="menu_img">
	        <ul>
               <li onclick="location.href='/vitabucket/admin/memb'">회원관리</li>               
               <li onclick="location.href='/vitabucket/admin/cate'">카테고리관리</li>
               <li onclick="location.href='/vitabucket/admin/prod'">상품관리</li>
               <li onclick="location.href='/vitabucket/admin/order'">주문관리</li>
               <li onclick="location.href='/vitabucket/admin/suppo'">고객지원관리</li>
               <li onclick="location.href='/vitabucket/admin/sett'">환경설정관리</li>
	           	<sec:authorize access="isAuthenticated()">
	         		<sec:authentication property="principal.username" var="userName" />
	         		<li class="mo_login" onclick="location.href='/mypage'">${userName}님<br>&lt;마이페이지&gt;</li>	    		
				<c:choose>
					<c:when test="${empty userName}">
						<li class="topM" onclick="location.href='/member/login'">로그인</li>
						<li class="topM" onclick="location.href='/member/signup'">회원가입</li>
					</c:when>
					<c:otherwise>					
						<li onclick="location.href='/logout'">로그아웃</li>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						    <!-- 'ROLE_ADMIN' 역할을 가진 사용자에게만 표시됩니다 -->
						   <li onclick="location.href='/vitabucket/admin/main'">관리자페이지</li>
						</sec:authorize>
					</c:otherwise>
				</c:choose>	
				</sec:authorize>
           </ul>
       </div>
    </header>
</body>
</html>