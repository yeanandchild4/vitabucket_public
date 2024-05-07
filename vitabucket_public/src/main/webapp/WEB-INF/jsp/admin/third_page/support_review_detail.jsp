<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객지원관리</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/support.css">
<script src="https://code.jquery.re/jquery-3.7.1.mre.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/support.js"></script>
</head>
<body>
<div class="review_detail"> 
<table>
    <c:forEach var="re" items="${re}">
    	<tr>
    		<th>상품번호</th><td style="width:5em">${re.pro_key}</td>
    		<th>상품명</th><td onclick="location.href='/product/detail/${re.pro_key}'">${re.pro_name}</td>
    	</tr>
        <tr>
            <th>리뷰사진</th>
            <td class="re_main_img" colspan="3">
                <div class="slideshow-container">
                    <c:if test="${not empty re.attachs}">
                        <c:forEach var="attach" items="${re.attachs}" varStatus="status">
                            <div class="mySlides fade">
                                <img id="review_img" src="/product/img/src/${attach.savedfname}" alt="${attach.fname}">
                                <div class="numbertext slid">${status.index + 1} / ${re.attachs.size()}</div>
                            </div>
                        </c:forEach>
                        <div class="preNext slid">
		                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                    	</div>
                    </c:if> 
                    <c:if test="${empty re.attachs}">
                     <p style="padding-top: 10em">사진없음</p>
                    </c:if>
                </div>
            </td>
        </tr>
        <tr>
            <th>리뷰내용</th>
            <td colspan="3" style="overflow-y:scroll;">${re.board_content}</td>
        </tr>
    </c:forEach>
</table>
<button type="button" class="close_btn">닫기</button>
</div>

</body>
</html>