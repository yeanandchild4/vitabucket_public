<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

<script src="/js/common.js" ></script>
<script src="/js/category.js" ></script>
</head>
<body>
	<form id="edit_form">
		<input type="hidden" value="${mc.main_cat_key}" name="main_cat_key">	
		<table>
			<tr>
				<th>카테고리 소속</th><td>${mc.main_cat_name}</td>
			</tr>
			<tr>
				<th>카테고리 번호</th>
				<td>${mc.main_cat_key}</td>
			</tr>
			<tr>
				<th>현재 카테고리명</th>
				<td>
					<input type="text" value="${mc.main_cat_name}" name="main_cat_name">
				</td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="editSave(${mc.main_cat_key})">확인</button>
			<button type="button" onclick="close_btn()">닫기</button>
		</div>
	</form>
</body>
</html>