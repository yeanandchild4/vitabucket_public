<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link rel="stylesheet" type="text/css"
	href="/css/mypage/info_modify.css">

</head>
<body>
	<%@ include file="/include/header.jsp"%>
	<div class="mypage_container">
		<div class="mypage_menu">
			<jsp:include page="/include/mypage_menu.jsp">
				<jsp:param value="info" name="page" />
			</jsp:include>
		</div>
		<div class="info_container">
			<main>
				<section class="regist">
					<div id="title">
						<h2>정보수정</h2>
					</div>
					<div class="addline"></div>
					<form id="addForm" method="post" action="/member/signup"
						onsubmit="return signup()">
						<input type="hidden" name="unum" value="${info.unum}">
						<div class="box">
							<div>
								<p class="naming">
									<span></span>이름
								</p>
								<input type="hidden" id="name" name="name" value="${info.name}">
								<input type="text" class="contents" name="name" id="name"
									placeholder="${info.name}" disabled="disabled">
							</div>
							<div class="mdiv"></div>
						</div>
						<div class="box info__id">
							<div class="inputdiv">
								<p class="naming">
									<span></span>아이디
								</p>
								<input type="text" class="contents" name="user_id" id="user_id"
									oninput="textId()" placeholder="${info.user_id}"
									disabled="disabled">
								<p id="idcheck" class="che"></p>
							</div>
							<div class="checkBtnWrap"></div>
						</div>

						<div class="box">
							<div>
								<p class="naming">
									<span>*</span>비밀번호
								</p>
								<input type="password" class="contents" name="user_pwd"
									id="user_pwd" oninput="textPwd()">
								<p id="pwdcheck" class="che"></p>
							</div>
							<div class="mdiv"></div>
						</div>
						<div class="box">
							<div>
								<p class="naming">
									<span>*</span>비밀번호 확인
								</p>
								<input type="password" class="contents" id="pwd2">
							</div>
							<div class="checkBtnWrap">
								<button type="button" class="checkBtn" onclick="pwdCheck()">확인</button>
							</div>
						</div>
						<div class="box">
							<div>
								<p class="naming">
									<span></span>E-mail
								</p>
								<input type="text" class="contents" name="user_email"
									id="user_email" placeholder="${info.user_email}"
									disabled="disabled">
								<p id="emailcheck" class="che"></p>
							</div>
							<div class="checkBtnWrap"></div>
						</div>
						<div class="box_addr">
							<div>
								<p class="naming">
									<span>*</span>주소
								</p>
								<c:if test="${not empty info.user_addr}">
									<input type="hidden" id="addr_key" name="addr_key"
										value="${info.user_addr.addr_key}">
								</c:if>
								<div class="addr-item">
									<input class="contents" type="text" id="addr_zipcode"
										name="addr_zipcode" value="${info.user_addr.addr_zipcode}"
										style="width: 8.6em; margin-bottom: 5px;"> <input
										class="contents" type="text" id="addr" name="addr"
										value="${info.user_addr.addr}"
										style="margin-left: 4px; width: 262px; margin-bottom: 5px;">
									<input class="zipcodebtn" type="button"
										onclick="DaumPostcode()" value="우편번호 찾기">
								</div>
							</div>
							<div>
								<input class="contents" type="text" id="addr_detail"
									name="addr_detail" value="${info.user_addr.addr_detail}"
									style="width: 262px;"> <input class="contents"
									type="text" id="addr_reference" name="addr_reference"
									value="${info.user_addr.addr_reference}" style="width: 8.6em">
							</div>
						</div>
						<div class="box">
							<div>
								<p class="naming">
									<span></span>생년월일
								</p>
								<select class="contents" name="year" id="year"
									style="width: 133.2px" disabled="disabled"></select> <select
									class="contents" name="month" id="month" style="width: 133.2px"
									disabled="disabled"></select> <select class="contents"
									name="day" id="day" style="width: 133.2px" disabled="disabled"></select>
							</div>
							<div class="mdiv"></div>
						</div>
						<div class="box">
							<div>
								<p class="naming">
									<span>*</span>전화번호
								</p>
								<input type="text" class="contents" name="user_phone"
									id="user_phone" onkeyup="cell()" maxlength="13"
									value="${info.user_phone}">
							</div>
							<div class="mdiv"></div>
						</div>
						<div class="addbtn">
							<button id="dobtn" type="button" onclick="editInfo()">수정하기</button>
						</div>
					</form>
				</section>
			</main>
		</div>
	</div>

	<%@ include file="/include/footer.jsp"%>

<script defer src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous">
</script>
<script defer
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="/js/mypage/info_modify.js"></script>
<script type="text/javascript">
	$(function() {
		calender('${info.user_birth}');
	});
</script>
</body>

</html>