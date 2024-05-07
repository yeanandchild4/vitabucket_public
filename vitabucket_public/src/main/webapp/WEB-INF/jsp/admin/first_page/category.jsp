<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_카테고리관리 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/category.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

<script src="/js/admin/common.js"></script>
<script src="/js/admin/category.js" ></script>
</head>
<body>
<%@include file="/WEB-INF/jsp/admin/AdminHeader.jsp" %> 
    <section class ="contents">
	    <div class="cont left">
	    	<h3><span>카테고리관리</span><br><img src="/images/admin/category.png" alt="카테고리관리"></h3>
	    	<ul>
	    		<li onclick="location.href='/vitabucket/admin/cate'">카테고리 관리</li>
	    	</ul>    	
	    </div>
	    <div class="cont right">
		   <h4>HOME > 카테고리관리 > 카테고리 관리</h4>
		    <section>
		        <h2>카테고리 관리</h2>
		        <div>
		            <div class="t1">
		                <h3>카테고리 등록</h3>		    
	                      <form id="cate_form">  	        
			                <table>
		                      <tr>
		                          <th>하위카테고리 추가</th>			                          
		                          <td colspan="1">
		                              <select name="main_cat_key" >
		                                  <option value="0">=상위카테고리선택=</option>
		                                  <c:forEach var="c" items="${clist}">                                
		                                  	 <option value="${c.main_cat_key}" >00${c.main_cat_key} ${c.main_cat_name}</option>                                
	                                  	  </c:forEach>                               
		                              </select>
									<input type="hidden" name="sub_cat_key" value="0">
									<input type="text" required name="sub_cat_name">
							  	 </td>
							  	 <td>
							  	 	<button type="button" onclick="cate_save()">저장</button>
			                  		 <button type="reset">초기화</button>
							  	 </td>
		                      </tr>                   		                
			                </table>
			             </form>  
		            </div>
		            <div class="t2">
		            	<div class="admin">
			            	<div class="cate list">
								<ul>
								    <c:forEach var="c" items="${clist}">
								        <li>
								       		<span class="toggle">▶</span>					            
								            <div>   					            	
								                <button type="button" onclick="cate_edit(${c.main_cat_key})">수정</button>
								                <a class="main_cate">
								                	00${c.main_cat_key} ${c.main_cat_name}
								                	<span>[${fn:length(c.sub)}]</span>
								                </a><br>
								            </div>
								            <dl class="sublist">
								                <c:forEach var="s" items="${c.sub}">
								                    <dt>
								                        <button onclick="del(${s.sub_cat_key})">삭제</button>    
								                        <button onclick="cate_edit_s(${s.sub_cat_key})">수정</button>    
								                        ${s.sub_cat_key} ${s.sub_cat_name}
								                    </dt>
								                </c:forEach>
								            </dl>                                                    
								        </li>
								    </c:forEach>
								</ul>
			            	</div>
			            	<div id="cate_edit"></div>
		            	</div>
		            </div>
		        </div>
		    </section>
	    </div>
    </section>    
    
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>