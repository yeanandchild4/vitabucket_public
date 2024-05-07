<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/setting.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

<script src="/js/admin/common.js" ></script>
<script src="/js/admin/setting.js" ></script>
</head>
<body>
    <form id="termsEdit_form">
    	<input type="hidden" value="${t.terms_key}" name="terms_key">	        	
	    <table>
	    	<tr>
	    		<th>필수여부</th>
	    		<td>
	    			<input type="radio" value="O" name="terms_required">필수
	    			<input type="radio" value="X" name="terms_required">선택
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>약관명</th><td><input type="text" name="terms_name" value="${t.terms_name}"></td>
	    	</tr>
	    	<tr>
	    		<th>약관내용</th>
	    		<td>
	    			<textarea rows="20" cols="80" name="terms_content">${t.terms_content}</textarea>	
	    		</td>
	    	</tr>			    
	    </table>      
        <button type="button" onclick="terms_Esave(${t.terms_key})">저장</button>
        <button type="button" class="close_btn">닫기</button>
   	</form>  
</body>
</html>