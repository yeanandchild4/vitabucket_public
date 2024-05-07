<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성가능</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/unreview.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script defer src="/js/mypage/unreview.js"></script>

</head>
<body>
<%@ include file="/include/header.jsp"%>

	<div class="mypage_container">
		<div class="mypage_menu">
			<jsp:include page="/include/mypage_menu.jsp">
				<jsp:param value="review" name="page"/>
			</jsp:include>
		</div>
		
		<div class="mypage_contents">
			<div class="title_container">
				<div class="title">상품 후기</div>
			</div>
			<div class="title_container reviewBtn">
				<a href="/mypage/unReviewd">작성가능한 리뷰</a>
				<a href="/mypage/review">작성한 리뷰</a>
			</div>

			<div class="mypage_list">
				<ul>
					<c:forEach var="r" items="${list}" varStatus="i">
						<li class="list_li">
							<div class="list_1">
								<img src="/images/product/${r.main_img}" alt=""> 
								<div class="list_1_1">
									<dl class="list_1_2">
										<dt>주문날짜</dt>
										<fmt:formatDate var="to_date" value="${r.to_date}" pattern="yyyy-MM-dd H시 mm분"/>
										<dd>${to_date}</dd>
									</dl>
									<dl class="list_1_2">
										<a href="#">${r.pro_name}</a>
									</dl>
								</div>
							</div>
							<div class="list_2" id="review_list_2">
								<button class="bigBtn mdBtn" data-btn="${i.index}">후기작성</button>
							</div>
						</li>

						<div class="modal modal_${i.index}">
							<div class="modal_content">
								<div class="modal_title">
									<h2>후기작성</h2>
									<span class="close">&times;</span>
								</div>
								<form id="form">
									<div class="modal_pro_img">
										<img src="/images/product/${r.main_img}"
										onerror="this.onerror=null; this.src='/images/noimage.png';">
										<span>${r.pro_name}</span>
									</div>

									<input type="hidden" name="od_key" value="${r.od_key}">
									<input type="hidden" name="pro_key" value="${r.pro_key}">

									<div class="modal_body">
										<div class="modal_text">
											<div>
												<label>내용</label>
											</div>
											<textarea class="textA textA_${i.index}" id="textBox" name="board_content" 
											placeholder="내용을 입력해주세요."
											cols="20" maxlength="500"></textarea>
										</div>
										<div class="textLengthWrap">
											<div><p class="textCount textCount_${i.index}">0자</p></div>
											<div><p class="textTotal">/500자</p></div>
										</div>
										<div class="modal_file">
											<div>
												<label>사진</label>
											</div>
											<input type="file" name="files" multiple="multiple" accept="image/*">
										</div>
									</div>
									<div class="modal_btn">
										<button class="bigBtn" type="button" onclick="addReview()">저장</button>
									</div>
								</form>
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