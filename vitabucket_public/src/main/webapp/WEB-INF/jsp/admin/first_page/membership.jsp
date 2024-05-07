<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_회원관리페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/membership.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

<script src="/js/admin/common.js" ></script>
<script src="/js/admin/membership.js" ></script>
</head>
<body>
	<%@include file="/WEB-INF/jsp/admin/AdminHeader.jsp" %> 
    <section class ="contents">
	    <div class="cont left">
	    	<h3><span>회원관리</span><br><img src="/images/admin/membership.png"></h3>
	    	<ul>
	    		<li onclick="location.href='/vitabucket/admin/memb'" class="li_color">회원정보관리</li>
	    		<li onclick="location.href='/vitabucket/admin/memb/excel/download'">회원정보 엑셀저장</li>    	
	    	</ul>    	
	    </div>
	    <div class="cont right">
		    <h4>HOME > 회원관리 > 회원 정보관리</h4>
		    <section>
		    	<div>
			        <h2>회원 정보관리</h2>
			        <div>
			            <div class="t1">
			                <h3>회원검색</h3>
			                <form action="/vitabucket/admin/memb" method="post" id="searchForm" >
			                   <table>
			                       <tr>
			                           <th>검색</th>
			                           <td class="nopadding" colspan="2">
			                               <select name="search">
			                               		<option selected disabled>선택하세요</option>
			                                   <option value="user_id">아이디/이메일</option>                                
			                                   <option value="name">회원명</option>                                
			                                   <option value="provider">소셜매체</option>                                
			                                   <option value="user_phone">연락처</option>                                
			                               </select>
			                               <input type="search" required name="search_key">
			                               <button type="submit" onclick="search()">검색</button>
			                           </td>
			                       </tr>
			                   </table>
			                </form>                
			            </div>		            
			            <div class="t2">
			            	<span class="member_add"><button type="button" onclick="memberJoin()">+회원추가</button></span>
			                <h3>회원 목록<span>총 회원수 : ${mlist.size()}명</span></h3>
			                <table>
			                    <tr>
			                        <th>회원번호</th><th>소셜매체</th><th class="wid_t">회원명</th>
			                        <th>아이디</th><th>이메일</th><th>탈퇴여부</th><th>회원정보삭제</th>                   
			                    </tr>
			                    <c:forEach var="m" items="${mlist}">
				                    <tr onclick="mem_detail(${m.unum})">
				                        <td>${m.unum}</td>
				                        <td>${m.provider}</td>
				                        <td>${m.name}</td>
										    <c:choose>
										        <c:when test="${empty m.provider}">
										            <td>${m.user_id}</td>
										        </c:when>
										        <c:otherwise>
										            <td colspan="2">${m.user_email}</td>
										        </c:otherwise>
										    </c:choose>
										    <c:choose>
										        <c:when test="${empty m.provider}">
										            <td>${m.user_email}</td>
										        </c:when>
										    </c:choose>			
			                        	<c:choose>
									        <c:when test="${m.withdraw == 'false'}">
									            <td>X</td>
									        </c:when>
									        <c:otherwise>
									            <td>O</td>
									        </c:otherwise>
									    </c:choose>
									    <td><button onclick="mem_del(${m.unum},'${m.name}')">삭제</button></td>
				                    </tr>
			                    </c:forEach>
			                </table>   		                
			            </div>		            
			        </div>
		        </div>	
		        <div id="m_detail"></div>	        
		    </section>
	    </div>
    </section>
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>