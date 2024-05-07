<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객지원관리</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/support.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/support.js"></script>

<!-- 에디터 js,css들어가는부분 -->
<link rel="stylesheet" href="/se2/css/smart_editor2.css">
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('.inquiry_edit').hide();
 // 스마트 에디터 초기화
    var oEditors1 = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors1,
        elPlaceHolder: "comments_basic",
        sSkinURI: "/se2/SmartEditor2Skin.html",
        htParams: {
            bUseToolbar: true,
            bUseVerticalResizer: true,
            bUseModeChanger: true,
        },
        fOnAppLoad: function() {      
        	oEditors1.getById["comments_basic"].exec("PASTE_HTML", [""]); 
        	 $("iframe").css("width", "100%").css("height", "255px");
        },
        fCreator: "createSEditor2",
    });
    
        // 상품 추가 버튼 클릭 시 스마트 에디터 내용 업데이트
    $("#in_add").click(function() {
        oEditors1.getById["comments_basic"].exec("UPDATE_CONTENTS_FIELD", []);
        // 추가로 필요한 로직 처리
        submitContents(this);
     });   
});
</script>
</head>
<body>
	<div class="inquiry"> 
		<table>
			<tr>
				<th>내용</th><td>${in.board_content}</td>
			</tr>
			<tr>
				<th>답변</th>
				<td>
					<c:choose>
						<c:when test="${empty com.comments}">
							<form id="in_comment" enctype="multipart/form-data" method="post">
								<div class="inquiry_comment c_add">								
									<input type="hidden" value="${in.board_key}" name="board_key">
									<sec:authorize access="isAuthenticated()">
									<sec:authentication property="principal.user.unum" var="unum"/>
										<input type="hidden" value="${unum}" name="unum">
									</sec:authorize>
									
									<input type="hidden" value="1" name="comm_key">
									<textarea style="width:100%;"  name="comments" id="comments_basic"></textarea>
									
									<div class="btn">
										<button type="button" onclick="location.href='/vitabucket/admin/suppo'">취소</button>
										<button type="button" id="in_add">저장</button>
									</div>							
								</div>
							</form>
						</c:when>
						<c:otherwise>
								<div class="inquiry_view">
									<p><label>답변날짜 : </label><span>${com.comm_date}</span></p>
									<div>
										<p><label>답변내용</label></p>
										<div>
											<p class="com_commet">${com.comments}</p>
										</div>
									</div>	
									<div>
										<button type="button" onclick="inquiry_edit(${com.comm_key})">수정</button>
										<button type="button" onclick="inquiry_del(${com.comm_key})">삭제</button>
									</div>
								</div>
								
								<div class="inquiry_edit">
									<form id="in_comment_edit" enctype="multipart/form-data" method="post"> 					
										<p><label>답변날짜 : </label><span>${com.comm_date}</span></p>			
											<input type="hidden" value="${com.comm_key}" name="comm_key">
											<input type="hidden" value="${com.board_key}" name="board_key">								
											<textarea style="width:100%;" name="comments" id="comments">${com.comments}</textarea>									
										<div class="btn">
											<button type="button" onclick="inquiry_datail_re()">취소</button>
											<button type="button" id="in_editSave">저장</button>
										</div>	
									</form>			
								</div>
															
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<button type="button" class="close_btn">닫기</button>
	</div>
</body>
</html>