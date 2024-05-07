<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="today" value="<%=new java.util.Date()%>"></c:set>
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal.username" var="userName"/></sec:authorize>
<c:if test="${empty userName}">
	<c:set var="userName" value="${null}"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pd.pro_name}</title>
<link rel="stylesheet" type="text/css" href="/css/productDetail.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
<%@ include file="/include/header.jsp" %>
<input type="hidden" id="userName" value="${userName}">
<div class="container">
	<main class="product_detail">
		<div style="text-align: left;"><span style="color: #DEDEDE">카테고리 </span>
			<a href="../maincate${pd_mainCat.main_cat_key}">${pd_mainCat.main_cat_name}</a>
			 > 
			<a href="../subcate${pd_subCat.sub_cat_key}">${pd_subCat.sub_cat_name}</a>
		</div>
		<div class="s_detail">
		<div class="kind_wrap">
			<div class="kind_slider">
				<ul class="slider">
					<c:if test="${empty pd.imgs}"><li><img src="/images/noimage.png"></li></c:if>
 					<c:if test="${not empty pd.imgs.main_img}"><li><img src="/images/product/${pd.imgs.main_img}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
					<c:if test="${not empty pd.imgs.img1}"><li><img src="/images/product/${pd.imgs.img1}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
					<c:if test="${not empty pd.imgs.img2}"><li><img src="/images/product/${pd.imgs.img2}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
					<c:if test="${not empty pd.imgs.img3}"><li><img src="/images/product/${pd.imgs.img3}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
					<c:if test="${not empty pd.imgs.img4}"><li><img src="/images/product/${pd.imgs.img4}" onerror="this.onerror=null; this.src='/images/noimage.png';"></li></c:if>
				</ul>
			</div>
			<div class="arrow">
				<a href="" class="prev"><i class="fa-solid fa-angle-left"></i></a>
				<a href="" class="next"><i class="fa-solid fa-angle-right"></i></a>
			</div>
		</div>
			<div style="width: 500px; height: 350px;">
			<table class="simpleDetail">
				<tr>
				<th>상품명</th><td>${pd.pro_name}</td></tr>
				<tr><th>제조사</th><td>${pd.pro_manufacturer}</td></tr>
				<tr>
				<c:choose>
					<c:when test="${pd.pro_stock==0}">
						<th colspan="2" style="color: #FF8339;">재고없음</th>	
					</c:when>
					<c:otherwise>
						<th colspan="2" style="color: #FFA500;">재고있음</th>
					</c:otherwise>
				</c:choose>
				</tr>
				<tr><th>소비기한</th><td>
				<fmt:formatDate var="best_by" value="${pd.pro_best_by}" pattern="yyyy년 MM월 dd일까지"/>
				${best_by}
				</td></tr>
			</table>
			<div class="price_div">
				<div id="price"><fmt:formatNumber value="${pd.pro_price}" maxFractionDigits="3"/>원</div>
				<div style="margin-left: 10px; color: #DEDEDE; font-size: small;"><fmt:formatNumber value="${pd.pro_price/30}" type="number" maxFractionDigits="0"/>원/제공량</div>
			</div>
			<div class="btn">
				<form id="cartForm">
					<c:choose>
						<c:when test="${user_wish}">
							<div id="wish"><button id="wishBtn" type="button" onclick="delWish(${pd.pro_key})"><i class="fa-solid fa-heart" style="color: #ff8339;"></i></button></div>
						</c:when>
						<c:otherwise>
							<div id="wish"><button id="wishBtn" type="button" onclick="addWish(${pd.pro_key})"><i class="fa-regular fa-heart" style="color: #ff8339;"></i></button></div>
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="pro_key" value="${pd.pro_key}">
					<div id="pro_cnt"><input type="number" name="pro_cnt" value="1" max="${pd.pro_stock}" min="1"></div>
					<div><button class="cartBtn" type="button" onclick="addCart();">장바구니 담기</button></div>
				</form>
			</div>
			</div>
		</div>
		<div class="dri_nav">
			<div><a href="#detailTag">상품 상세 정보</a></div>
			<div><a href="#deliveryTag">배송 정보</a></div>
			<div><a href="#reviewTag">상품 리뷰</a></div>
			<div><a href="#inquiryTag">상품 문의</a></div>
		</div>
		<div class="detail">
			<div id="detailTag"><h2></h2></div>
			<div>
			<div id="description">
				<h3>상품 설명</h3>
				<div id="description_">
				${pd.pro_comment}
				</div>			
			</div>		
			<div id="other_ingredients">
				<h3>포함된 다른 성분들</h3>
				<div id="main_ing"><div style="font-weight: bold; margin-top: 5px;">주요 성분</div>
				${pd.pro_main_ing}</div>
				<div id="other_ing"><div style="font-weight: bold; margin-top: 5px;">포함된 다른 성분들</div>
				${pd.pro_other_ing}</div>
				<div id="allergy"><div style="font-weight: bold; margin-top: 5px;">알레르기사항</div>
				${pd.pro_allergy}</div>
				</div>			
			<div id="warnings">
				<h3>주의사항</h3>
				<div id="warnings_">
				${pd.pro_warnings}
				</div>					
			</div>
			<div id="disclaimer">
				<h3>면책사항</h3>
				<div id="disclaimer_">
				VitaBucket은 정확한 사진과 정보를 사이트에 반영하기 위해 노력하고 있습니다. 
				하지만 제조사가 포장이나 성분을 업데이트하는 경우 사이트에 반영되기까지 시간이 소요될 수 있습니다. 
				상품의 패키지는 다를 수 있지만 신선도는 보장해드립니다. 
				적절한 사용을 위해 VitaBucket 사이트상 정보가 아닌 상품에 기재된 내용을 기준으로 사용하시길 권장해드립니다. 
				일부 상품의 정보는 고객님의 편의를 위해 기계 번역되었습니다. 이는 검증된 번역으로 이른 시일 내에 수정될 예정입니다.
				</div>
			</div>
			<div id="supplementFacts">
				<h3>영양성분정보</h3>
				<div id="serving_size"><span style="font-weight: bold;">1회 제공량: </span>
				${pd.pro_serving_size}</div>
				<div id="servings_percont"><span style="font-weight: bold;">용기당 제공 횟수: </span>
				${pd.pro_servings_percont}</div>
			</div>
			</div>
		</div>
		<div class="delivery">
			<div id="deliveryTag"><h2>배송정보</h2></div>
			<div>
			<ul>
				<li>
					<ul>
					<li>신속하고 정확한 배송을 위해 배송지를 도로명 주소로 입력해 주십시오. 5자리 우편번호는 <a id="zipCodeHref" href="https://www.epost.go.kr/search.RetrieveNewAddressNewZipCdList.comm">여기</a>를 클릭하거나 한국 우체국 공식 웹사이트에서 확인해 주십시오.</li>
					<li>잘못된 배송 정보로 인하여 주문이 배송되지 않는 경우, 30일 후 폐기됩니다.</li>
					<li>VitaBucket에서 제공하는 예상 배송일은 대부분의 일반 배송 결과를 반영합니다. 하지만 일부 주문은 예측이 불가능하고 복잡한 VitaBucket 외부 사정으로 지연될 수 있습니다.</li>
					</ul>
				</li>
				<li>
					<table id="deliveryTable">
						<tr><th>배송업체</th><th>주문 제한 사항</th><th>세금 & 부가세</th><th>추적</th><th>연락처</th></tr>
						<tr>
						<td class="bold">CJ 대한통운</td>
						<td>최대 무게: 9.0 kg <br>최대 금액: 200,000원</td>
						<td>미포함 - 배송 시 청구될 수 있습니다</td>
						<td>전체 추적 제공</td>
						<td><ul><div class="bold">문의</div>
						<li>전화번호: ###-###-####</li>
						<li>이메일: email@eamil.com</li>
						</ul></td></tr>
						<tr>
						<td class="bold">한국 우체국 택배 (ACI Express)</td>
						<td>최대 무게: 9.0 kg <br>최대 금액: 200,000원</td>
						<td>미포함 - 배송 시 청구될 수 있습니다</td>
						<td>전체 추적 제공</td>
						<td><ul><div class="bold">문의</div>
						<li>전화번호: ###-###-####</li>
						<li>이메일: email@eamil.com</li>
						</ul></td></tr>
						<tr>
						<td class="bold">한국 우체국 택배 (롯데글로벌로지스)</td>
						<td>최대 무게: 9.0 kg <br>최대 금액: 200,000원</td>
						<td>미포함 - 배송 시 청구될 수 있습니다</td>
						<td>전체 추적 제공</td>
						<td><ul><div class="bold">문의</div>
						<li>전화번호: ###-###-####</li>
						<li>이메일: email@eamil.com</li>
						</ul></td></tr>						
					</table>
				</li>
				<li><ul><div class="bold red">환불 안내</div>
					<li>배송 상품 수령 시 파손된 상품이 있을 경우, 배달원에게 전달하여 배송업체로 반송해 주십시오. 배송업체가 파손 상품을 검수한 후 직접 VitaBucket에 파손건을 접수합니다.</li>
					<li>배송 상품 수령 이후 파손된 상품을 확인하거나 상품이 분실된 경우에는 여기를 클릭해 VitaBucket 고객 센터로 문의해 주십시오.</li>
				</ul></li>
				<li><ul><div class="bold red">기타 문의 사항</div>
					<li>VitaBucket 고객센터(##-###-####)로 문의해 주십시오.</li>
				</ul></li>
			</ul>
			</div>
		</div>
		<div>
			<div id="reviewTag"><h2>상품 후기</h2></div>
			<c:if test="${empty review}"><div class="rev_empty">
				<div><svg xmlns="http://www.w3.org/2000/svg" height="48" width="48" viewBox="0 0 512 512"><path fill="#ffbb3f" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24V264c0 13.3-10.7 24-24 24s-24-10.7-24-24V152c0-13.3 10.7-24 24-24zM224 352a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/></svg></div>
				<div>첫 후기를 남겨주세요!</div>
				<div><a href="/mypage/unReviewd"><button id="reviewBtn" type="button">후기 작성 하기</button></a></div>
			</div></c:if>
			<div class="review">
			<c:forEach var="r" items="${review}">
				<div style="display: flex; text-align: left;">
					<label>${fn:substring(r.name,0,1)}
					<c:forEach begin="2" end="${fn:length(r.name)}" step="1">
						*
					</c:forEach></label>
					<div class="re_content">
					<div id="re_title">${r.board_title}</div>
					<div><c:if test="${not empty r.attachs}"><c:forEach var="attach" items="${r.attachs}">
					<span><img style="width: 100px; height: 100px;" src="/product/img/src/${attach.savedfname}"></span>
					</c:forEach></c:if></div>
					<div>${r.board_content}</div>
					<div>${r.board_posted}</div>
					</div>
				</div>
			</c:forEach>
			</div>	
		</div>
		<div>
			<div id="inquiryTag"><h2>상품 문의</h2><div id="inqBtn_div"><button id="inquiryBtn" type="button">문의하기</button></div></div>
			<div id="inq_notice">
				<ul>
					<li>상품에 대한 문의를 남기는 공간입니다.</li>
					<li>배송관련,주문(취소/교환/환불)관련 문의 및 요청사항은 고객센터(##-###-###)로 문의해주세요.</li>
				</ul>
			</div>
			<div id="modalContainer" class="hidden">
				<div id="modalContent">
					<div style="display: flex; justify-content: space-between;">
					<div><span style="font-size: xx-large;">상품 문의하기</span></div>
					<div><button id="modalCloseButton" type="button">✕</button></div>
					</div>
					<form id="inquiryForm">
						<div id="inqu_img_name">
							<div><img id="inquiryImg" src="/images/product/${pd.imgs.main_img}" onerror="this.onerror=null; this.src='/images/noimage.png';"></div>
							<div id="name" >${pd.pro_name}</div>
						</div>
						<input type="hidden" name="pro_key" value="${pd.pro_key}">
						<input type="hidden" name="board_type" value="inquiry">
						<div id="inqu_titleBox">
							<div><label>제목</label></div>
							<div style="width: 100%"><input type="text" name="board_title"></div>
						</div>
						<div class="form-group col-12">
							<div><label>내용</label></div>
							<div style="height: 400px; width: 100%">
								<textarea id="textBox" name="board_content" placeholder="내용을 입력해주세요." cols="20" maxlength="500"></textarea>
								<div class="textLengthWrap">
									<div><p class="textCount">0자</p></div>
									<div><p class="textTotal">/500자</p></div>
								</div>
							</div>
						</div>
						<div style="text-align: center;">
						<button id="saveBtn" type="button" onclick="addInquiry();">저장</button>
						</div>
					</form>
				</div>
			</div>
			<table class="inquiry">
				<thead><tr><th class="title">제목</th><th class="author">작성자</th><th class="posted">작성일</th><th class="status">답변상태</th></tr></thead>
				<c:choose>
				<c:when test="${not empty inquiry}"><c:forEach var="q" items="${inquiry}">
				<tr class="inq_content">
					<td class="b_title">${q.board_title}</td>
					<td>${fn:substring(q.name,0,1)}
					<c:forEach begin="2" end="${fn:length(q.name)}" step="1">
						*
					</c:forEach></td>
					<td>${q.board_posted}</td>
					<td><c:if test="${q.answer_complete}">답변완료	</c:if></td>
				</tr>
				<tr class="board_content">
					<td colspan="4">
						<div class="board_C">
							<div><i class="fa-solid fa-q" style="background-color: #FFA500; color: white; padding: 8px; border-radius: 50%; margin-right: 10px"></i></div>
							<div>${q.board_content}</div>
						</div>
						<c:if test="${q.answer_complete}">
						<div class="board_C">
							<div><i class="fa-solid fa-a" style="background-color: #FF8339; color: white; padding: 8px; border-radius: 50%; margin-right: 10px"></i></div>
							<div>${q.comment.comments}</div>
						</div>
						<div>${q.comment.comm_date}</div></c:if>
					</td>
				</tr>
				</c:forEach></c:when>
				<c:otherwise>
					<tr class="inq_content_empty">
						<td colspan="4">등록된 문의가 없습니다.</td>
					</tr>
				</c:otherwise>
				</c:choose>
			</table>
		</div>
	</main>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/pd_detail.js" ></script>
<script type="text/javascript" src="/js/addCart.js"></script>
<script src="https://kit.fontawesome.com/c96408e797.js" crossorigin="anonymous"></script>
</html>