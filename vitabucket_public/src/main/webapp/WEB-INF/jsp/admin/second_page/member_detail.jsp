<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/membership.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

<script src="/js/admin/common.js" ></script>
<script src="/js/admin/membership.js" ></script>
</head>
<body>
	<div id="memb_detail">
		<table>
			<tr>
	           <th>회원번호</th><td>${m.unum}</td>
	        <c:if test="${not empty m.provider}">
				<tr>
		           <th>소셜매체</th><td>${m.provider}</td>
				</tr>
			</c:if>
			<tr>
				<th class="wid_t">회원명</th><td>${m.name}</td>
			</tr>
			<tr>
				<c:choose>
				    <c:when test="${empty m.provider}">
				        <th>아이디</th><td>${m.user_id}</td>
				    </c:when>
				    <c:otherwise>
				       <th>이메일</th><td colspan="2">${m.user_email}</td>
				    </c:otherwise>
				</c:choose>
			</tr>
			<tr>				
			    <c:if test="${empty m.provider}">
			        <th>이메일</th><td>${m.user_email}</td>
			    </c:if>
			</tr>
			<c:if test="${not empty m.user_phone}">
				<tr>
					<th class="wid_t">핸드폰번호</th>
					<td>${m.user_phone}</td>
				</tr>	
			</c:if>
			<c:if test="${not empty m.user_birth}">
				<tr>
					<th class="wid_t">생년월일</th>
					<td>${m.user_birth}</td>
				</tr>
			</c:if>
			<tr>
				<th>탈퇴여부</th>
				<c:choose>			
					<c:when test="${m.withdraw == 'false'}"> <td>X</td></c:when>
					<c:otherwise><td>O</td></c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>회원정보삭제</th>
				<td onclick="mem_del(${m.unum},'${m.name}')">회원정보삭제&nbsp;<span>(※복구불가)</span></<td>                   	
			</tr>
		</table>	   
    </div>
</body>
</html>