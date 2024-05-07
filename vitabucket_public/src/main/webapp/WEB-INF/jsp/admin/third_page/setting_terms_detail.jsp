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
	<table>
		<tr>
			<th>약관 자세히 보기&nbsp;
				<button type="button" class="close_btn">닫기</button>
			</th>
		</tr>
		<tr>
			<td><textarea rows="20" cols="80">${t.terms_content}</textarea></td>
		</tr>
	</table>	
</body>
</html>