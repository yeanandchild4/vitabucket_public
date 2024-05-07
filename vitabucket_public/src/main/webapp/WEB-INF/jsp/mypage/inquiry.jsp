<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/inquiry.css">
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
</script>
<script defer src="/js/mypage/inquiry.js"></script>
</head>
<body>
<%@ include file="/include/header.jsp"%>

<div class="mypage_container">
    <div class="mypage_menu">
        <jsp:include page="/include/mypage_menu.jsp">
        	<jsp:param value="inquiry" name="page"/>
        </jsp:include>
    </div>
    <div class="mypage_contents">
        <div class="title_container">
            <div class="title">문의내역</div>
        </div>
		<div class="mypage_list">
			<ul>
				<c:forEach items="${list}" var="b" varStatus="i"> 
					<li class="list_li">
						<div class="list_1">
							<img src="/images/product/${b.main_img}" alt="#">
							<div class="list_1_1">
								<dl class="list_1_2">
									<dt>문의 날짜</dt>
									<dd>${b.board_posted}</dd>
								</dl>
								<dl class="list_1_2">
									<dt>제목</dt>
									<dd>${b.board_title}</dd>
								</dl>
								<dl class="list_1_2">                        
									<p>${b.board_content}</p>
								</dl>
							</div>
						</div>
						<div class="list_2">
							<dl>
								<c:choose>
                                    <c:when test="${not empty b.comment}">
                                        <span>답변완료</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span>확인중</span>
                                    </c:otherwise>
                                </c:choose>
							</dl> 
							<p class="mdBtn" data-btn="${i.index}">문의상세 ></p>
						</div>
					</li>

					<div class="modal modal_${i.index}">
						<div class="modal_content">
							<div class="modal_title">
								<h2>문의상세</h2>
								<span class="close">&times;</span>
							</div>
							<div class="modal_date">
								<p>${b.board_posted}</p>
							</div>
							<div class="modal_pro_img inquiry_pro_img">
								<img src="/images/product/${b.main_img}"
								onerror="this.onerror=null; this.src='/images/noimage.png';">
								<span>${b.pro_name}</span>
							</div>
							<input type="hidden" name="board_key" value="${b.board_key}">
							<div class="modal_body">
								<div class="modal_text_title">
									<div>
										<label>제목</label>
									</div>
										<p>${b.board_title}</p>
								</div>
								<div class="modal_text">
									<div>
										<label>내용</label>
									</div>
									<textarea id="textBox" name="board_content"
									cols="20" maxlength="500" disabled="disabled">${b.board_content}</textarea>
								</div>
								<c:if test="${not empty b.comment}">
									<div class="modal_comment">
										<div>
											<label>답변</label>
										</div>
										<div class="modal_comment_content">
											<textarea cols="20" maxlength="500" disabled="disabled">${b.comment.comments}</textarea>
											<p>${b.comment.comm_date}</p>
										</div>
									</div>
								</c:if>
							</div>
							<div class="modal_btn">
								<button class="bigBtn deleteInBtn" type="button" onclick="deleteInquiry(${b.board_key})">문의 삭제</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<%@ include file="/include/footer.jsp"%>
</body>
</html>