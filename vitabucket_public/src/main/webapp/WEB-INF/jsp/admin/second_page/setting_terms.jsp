<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_약관설정페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/setting.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

<script src="/js/admin/common.js" ></script>
<script src="/js/admin/setting.js" ></script>
</head>
<body>
	<%@include file="/WEB-INF/jsp/admin/AdminHeader.jsp" %> 
    <section class ="contents">
	    <div class="cont left">
	    	<h3><span>환경설정관리</span><br><img src="/images/admin/setting.png"></h3>
	    	<ul>
	    		<li onclick="location.href='/vitabucket/admin/sett'">기본환경설정</li>
	    		<li onclick="location.href='/vitabucket/admin/sett/terms'"class="li_color">약관설정관리</li>
	    	</ul>    	
	    </div>
	    <div class="cont right">
			<h4>HOME > 환경설정 > 약관설정관리</h4>
			<section>
			    <h2>약관설정관리</h2>
				<div class="terms_list">
					<h3>약관목록</h3>
					<table>
						<tr>
							<th>약관명</th><th>약관내용</th><th>필수여부</th><th>수정</th><th>삭제</th>
						</tr>
						<c:forEach var="t" items="${terms_list}">
							<tr>
								<td>${t.terms_name}</td>	
								<td><button type="button" onclick="terms_detail(${t.terms_key})">약관내용</button></td>					
								<td>${t.terms_required}</td>
								<td><button type="button" onclick="terms_edit(${t.terms_key})">수정</button></td>
								<td><button type="button" onclick="terms_del(${t.terms_key})">삭제</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<button type="button" onclick="terms_add()">약관추가</button>
		      	<div class="terms t_add">	
				    <form id="terms_form">
				    	<input type="hidden" value="1" name="terms_key">	        	
					    <table>
					    	<tr>
					    		<th>필수여부</th>
					    		<td>
					    			<input type="radio" value="O" name="terms_required">필수
					    			<input type="radio" value="X" name="terms_required">선택
					    		</td>
					    	</tr>
					    	<tr>
					    		<th>약관명</th><td><input type="text" name="terms_name"></td>
					    	</tr>
					    	<tr>
					    		<th>약관내용</th>
					    		<td>
					    			<textarea rows="20" cols="80" name="terms_content"></textarea>	
					    		</td>
					    	</tr>			    
					    </table>      
		    	        <button type="button" onclick="terms_save()">저장</button>
		    	        <button type="button" class="close_btn">닫기</button>
				   	</form> 
				</div>
				<div class="terms t_detail"></div>
				<div class="terms t_edit"></div>
			</section>
		</div>
	</section>
</body>
</html>