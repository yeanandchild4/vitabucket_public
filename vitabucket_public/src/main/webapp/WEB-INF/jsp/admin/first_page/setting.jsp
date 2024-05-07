<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_환경설정페이지</title>
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
	    		<li onclick="location.href='/vitabucket/admin/sett'" class="li_color">기본환경설정</li>
	    		<li onclick="location.href='/vitabucket/admin/sett/terms'">약관설정관리</li>
	    	</ul>    	
	    </div>
	    <div class="cont right">
    	    <h4>HOME > 환경설정 > 기본환경설정</h4>
		    <section>
		        <h2>기본환경설정</h2>
		        <form id="basicsetting_form">
		            <div class="t1">
		               <h3>사업자정보</h3>		                
	                   <table>
	                       <tr>
	                           <th>법인명</th>
	                           <td>
	                               <input type="text"  name="co_name" value="${c.co_name}">
	                           </td>
	                       </tr>
	                       <tr>
	                           <th>대표자명</th>
	                           <td>
	                               <input type="text"  name="ceo_name" value="${c.ceo_name}">
	                           </td>
	                       </tr>
	                       <tr>
	                           <th>본사주소</th>
	                           <td>
	                               <input type="text"  name="co_addr" value="${c.co_addr}">
	                           </td>
	                       </tr>
	                       <tr>
	                           <th>대표번호</th>
	                           <td>
	                               <input type="tel"  name="co_tel" value="${c.co_tel}">
	                           </td>
	                       </tr>
	                       <tr>
	                           <th>회사이메일</th>
	                           <td>
	                               <input type="email"  name="co_email" value="${c.co_email}">
	                           </td>
	                       </tr>
	                       <tr>
	                           <th>팩스번호</th>
	                           <td>
	                               <input type="text"  name="co_fax" value="${c.co_fax}">
	                           </td>
	                       </tr>
	                       <tr>
	                           <th>사업자등록번호<br><span>예) 000-00-00000</span></th>
	                           <td>
	                              <input type="text"  name="bin_no" value="${c.bin_no}">	                               
	                           </td>
	                       </tr>
	                       <tr>
	                           <th>회사창립일<br><span>예) 2000-01-01</span></th>
	                           <td>
	                               <input type="text" name="co_anniversary" value="${c.co_anniversary}">
	                           </td>
	                       </tr>
	                       
	                   </table>       
                       <button type="button" onclick="setting_save()">변경저장</button>      
		            </div>
	        	</form>  
		    </section>
	    </div>
    </section>
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>