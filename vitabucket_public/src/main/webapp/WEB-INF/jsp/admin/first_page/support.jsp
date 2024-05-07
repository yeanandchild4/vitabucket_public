<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_고객지원페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/support.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/support.js"></script>
</head>
<body>
<%@include file="/WEB-INF/jsp/admin/AdminHeader.jsp" %> 
    <section class ="contents">
	    <div class="cont left">
	    	<h3><span>고객지원관리</span><br><img src="/images/admin/support.png"></h3>
	    	<ul>
   				<li onclick="location.href='/vitabucket/admin/suppo'" class="li_color">고객문의</li>
   				<li onclick="location.href='/vitabucket/admin/suppo/review'">고객리뷰</li>
	    	</ul>    	
	    </div>
	    <div class="cont right"> 	
	    	<div>
			    <h4>HOME > 고객지원관리 > 고객문의</h4>
			    <section>
			        <h2>고객문의</h2>
		            <div class="t1 t">
       					<table>
       						<tr>
       							<th>게시글번호</th>
       							<th>상품명</th>
       							<th>제목</th>	       							
       							<th>회원명&lpar;번호&rpar;</th>
       							<th>등록일</th>
       							<th>답변여부</th>
       						</tr>
       						<c:forEach var="in" items="${inquiry_list}">
        						<tr onclick="javascript:inquiry_datail(${in.board_key});">
        							<td>${in.board_key}</td>
        							<td>
	        							<div class="pro_name">${in.pro_name}</div>
        							</td>
        							<td>${in.board_title}</td>
        							<td>${in.name}&lpar;${in.unum}&rpar;</td>
        							<td>${in.board_posted}</td>
        							<td>
        							 <c:choose>
        							 	<c:when test="${empty in.comment}">X</c:when>
        							 	<c:otherwise>O</c:otherwise>
        							 </c:choose>
        							</td>
        						</tr>	  	        						    						
       						</c:forEach>
       					</table>   
		            </div>
			    </section>
		    </div>
    		<div class="t1_detail"></div> 		   	    
	    </div>
    </section>    
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>