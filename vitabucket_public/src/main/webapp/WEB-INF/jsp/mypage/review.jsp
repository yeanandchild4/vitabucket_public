<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/review.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
</script>
<script defer src="/js/mypage/review.js"></script>

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
				<c:forEach items="${list}" var="r" varStatus="i">
					<li class="list_li">
						<div class="list_1">
							<img src="/images/product/${r.main_img}" alt="">
							<div class="list_1_1">
								<dl class="list_1_2">
									<dt>게시날짜</dt>
									<dd>${r.board_posted}</dd>
								</dl>
								<dl class="list_1_2">
									<dt>상품명</dt>
									<dd>${r.pro_name}</dd>
								</dl>
								<dl class="list_1_2">
									<p>${r.board_content}</p>
								</dl>
							</div>
						</div>
						<div class="list_2" id="review_list_2">
							<p class="mdBtn" data-btn="${i.index}">전체후기 ></p>
						</div>
					</li>

					<div class="modal modal_${i.index}">
						<div class="modal_content">
							<div class="modal_title">
								<h2>후기</h2>
								<span class="close">&times;</span>
							</div>
							<div class="modal_date">
								<p>${r.board_posted}</p>
							</div>
							<form id="form">
								<div class="modal_pro_img review_pro_img">
									<img src="/images/product/${r.main_img}"
									onerror="this.onerror=null; this.src='/images/noimage.png';">
									<span>${r.pro_name}</span>
								</div>

								<input type="hidden" name="board_key" value="${r.board_key}">

								<div class="modal_body">
									<div class="modal_text">
										<div>
											<label>내용</label>
										</div>
										<textarea class="textA_${i.index}" id="textBox" name="board_content"
										cols="20" maxlength="500" disabled="disabled" onkeyup="keyUpEvent()">${r.board_content}</textarea>
									</div>
									<div class="textLengthWrap textLengthWrap_${i.index}">
										<div><p class="textCount textCount_${i.index}">0자</p></div>
										<div><p class="textTotal">/500자</p></div>
									</div>
									<div class="modal_file">
										<div>
											<label>사진</label>
										</div>
										<div class="img_container"> 
											<div class="reviewImg">
												<c:forEach var="a" items="${r.attachs}">
													<div id="reviewImg_${a.b_attach_key}">
														<img src="/product/img/src/${a.savedfname}" alt=""><span class="imgDelBtn imgDelBtn_${i.index}" 
														onclick="deleteImg(${a.b_attach_key})">&times;</span>
													</div>
												</c:forEach>
											</div>
											<input class="editInput editInput_${i.index}" type="file" name="files" multiple="multiple" accept="image/*">
										</div>
									</div>
								</div>
								<div class="modal_btn detailBtn detailBtn_${i.index}">
									<button class="bigBtn detailEdit" id="test" type="button">수정</button>
									<button class="bigBtn detailDelete" type="button" onclick="deleteReview(${r.board_key})">삭제</button>
								</div>
								<div class="modal_btn editBtn editBtn_${i.index}">
									<button class="bigBtn editReviewBtn" type="button" onclick="editReview(${r.board_key})">수정</button>
									<button class="bigBtn editCancle" type="button">취소</button>
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