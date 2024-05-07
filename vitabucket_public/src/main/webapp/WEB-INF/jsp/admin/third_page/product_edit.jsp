<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_상품관리페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="/css/admin/product.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/product.js"></script>

<!-- 에디터 js,css들어가는부분 -->
<link rel="stylesheet" href="/se2/css/smart_editor2.css">
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function() {
	var oEditors3 = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors3,
	    elPlaceHolder: "pro_comment_e",
	    sSkinURI: "/se2/SmartEditor2Skin.html",
	    htParams: {
	        bUseToolbar: true,
	        bUseVerticalResizer: true,
	        bUseModeChanger: true,
	    },
	    fOnAppLoad: function() {
	       oEditors3.getById["pro_comment_e"].exec("PASTE_HTML", [""]);
	    },
	    fCreator: "createSEditor2"
	});
	var oEditors4 = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors4,
	    elPlaceHolder: "pro_warnings_e",
	    sSkinURI: "/se2/SmartEditor2Skin.html",
	    htParams: {
	        bUseToolbar: true,
	        bUseVerticalResizer: true,
	        bUseModeChanger: true,
	        fOnBeforeUnload: function() {}
	    },
	    fOnAppLoad: function() {
	       oEditors4.getById["pro_warnings_e"].exec("PASTE_HTML", [""]);
	    },
	    fCreator: "createSEditor2"
	});
    // 상품 추가 버튼 클릭 시 스마트 에디터 내용 업데이트
    $("#pro_updated").click(function() {
        oEditors3.getById["pro_comment_e"].exec("UPDATE_CONTENTS_FIELD", []);
        oEditors4.getById["pro_warnings_e"].exec("UPDATE_CONTENTS_FIELD", []);
        // 추가로 필요한 로직 처리
        updated(this);
    });  
    
    $('img[src$="/images/product/"]').each(function() {
        $(this).siblings('input').after('<span style="display:block;font-weight:bold;font-size:20px">기존이미지없음</span>');
        $(this).css('display','none');
    });

	
});
</script>


</head>
<body>
<%@include file="/WEB-INF/jsp/admin/AdminHeader.jsp" %> 
    <section class ="contents">
	    <div class="cont left">
	    	<h3><span>재고관리</span><br><img src="/images/admin/product.png"></h3>
	    	<p>전체상품관리</p>
	    	<ul>
	    		<li onclick="location.href='/vitabucket/admin/prod'">상품목록</li>
   				<li onclick="location.href='/vitabucket/admin/prod/add'">상품등록</li>	 
	    		<li onclick="location.href='/vitabucket/admin/prod/excel/download'">상품목록 엑셀저장</li>
	    	</ul>    	
	    </div>
	    <div class="cont right"> 
		   	<h4>HOME > 상품관리 > 전체상품관리</h4>
		        <h2>상품수정</h2>			
			    <form id="prod_editform" enctype="multipart/form-data" method="post">
			    	<input type="hidden" value="${p.pro_key}" name="pro_key">			    		    
			    	<input type="hidden" value="${p.imgs.pro_img_key}" name="pro_img_key">			    		    
			    	<input type="hidden" value="${p.pro_hit}" name="pro_hit">			    		    
				    	<table>
		                   <tr>
		                       <th>카테고리 소속</th>
		                       <td class="cate_td">	
		                           <select name="main_cat_key" onchange="onCat()">
		                               <option disabled>=상위카테고리선택=</option>
		                               <option value="${p.main_cat_key}" selected>00${p.main_cat_key} ${p.main_cat_name}</option>  
		                               <c:forEach var="c" items="${clist}">
											<c:if test="${p.main_cat_key != c.main_cat_key}">
		                                		<option value="${c.main_cat_key}" >00${c.main_cat_key} ${c.main_cat_name}</option>  
		                              		</c:if>
		                               </c:forEach>                               
		                           </select>
		                           <select name="sub_cat_key">
		                           	<option disabled>=하위카테고리선택=</option>
		                           	<option selected value="${p.sub_cat_key}" >${p.sub_cat_key} ${p.sub_cat_name}</option>  
									<c:forEach var="c" items="${clist}">
									    <c:forEach var="s" items="${c.sub}">
						                    <c:if test="${p.sub_cat_key != s.sub_cat_key && p.main_cat_key == c.main_cat_key}">
								                <option value="${s.sub_cat_key}" >${s.sub_cat_key} ${s.sub_cat_name}</option>  
								            </c:if>
									    </c:forEach>
									</c:forEach>
		                           </select>
		                       </td>
		                       <td colspan="2"><button type="reset">초기화</button></td>
		                   </tr>
				    	</table>
					    <div class="pro_edit">
					    	<table class="pro_info">
					    		<tr>
					    			<th>상품명</th>
					    			<td><input type="text" name="pro_name" value="${p.pro_name}"></td>
					    		</tr>
					    		<tr>
					    			<th>제조사</th>
					    			<td><input type="text" name="pro_manufacturer" value="${p.pro_manufacturer}"></td>
					    		</tr>
					    		<tr>
					    			<th>가격</th>
					    			<td><input type="number" name="pro_price" value="${p.pro_price}"></td>
					    		</tr>
					    		<tr>
					    			<th>재고</th>
					    			<td>
					    				<input type="number" name="pro_stock" value="${p.pro_stock}">
					    			</td>
					    		</tr>
					    		<tr>
					    			<th>상품설명</th>
					    			<td>
			    						<textarea style="width:100%;"  name="pro_comment" id="pro_comment_e">${p.pro_comment}</textarea>
					    			</td>
					    		</tr>
					    		<tr>
					    			<th>소비기한</th>
					    			<td><input type="date" name="pro_best_by" value="${p.pro_best_by}"></td>
					    		</tr>
					    		<tr>
					    			<th>1회 제공량</th>
					    			<td><input type="text" name="pro_serving_size" value="${p.pro_serving_size}"></td>
					    		</tr>
					    		<tr>
					    			<th>용기당 제공 횟수</th>
					    			<td><input type="text" name="pro_servings_percont" value="${p.pro_servings_percont}"></td>
					    		</tr>
					    		<tr>
					    			<th>주요성분</th>
					    			<td><textarea name="pro_main_ing"  spellcheck="false">${p.pro_main_ing}</textarea></td>
					    		</tr>
					    		<tr>
					    			<th>기타성분</th>
					    			<td><textarea name="pro_other_ing"  spellcheck="false">${p.pro_other_ing}</textarea></td>
					    		</tr>
					    		<tr>
					    			<th>주의사항</th>
					    			<td>
					    				<textarea style="width:100%;" name="pro_warnings" id="pro_warnings_e">${p.pro_warnings}</textarea>
					    			</td>
					    		</tr>
					    		<tr>
					    			<th>알레르기</th>
					    			<td><textarea name="pro_allergy" spellcheck="false">${p.pro_allergy}</textarea></td>
					    		</tr>			    		
					    	</table>
							<table class="pro_img">
							    <tr>
							        <th rowspan="3">상품이미지추가</th>   
							        <td>
							            <p>메인이미지<span class="essential">(필수)</span></p>
							            <input type="file" name="main_img" accept="image/*" onchange="previewImage(event, 'main_img_preview')">
							            <img class="main_img_preview" src="/images/product/${p.imgs.main_img}" alt="Main Image Preview">							        	
							        </td>   
							        <td>
							            <p>이미지1<span class="essential">(필수)</span></p>
							            <input type="file" name="img1" accept="image/*" onchange="previewImage(event, 'img1_preview')">
							            <img class="img1_preview" src="/images/product/${p.imgs.img1}" alt="Image 1 Preview">
							        </td>
							    </tr>
							    <tr>
							        <td>
							            <p>이미지2<span class="essential">(필수)</span></p>
							            <input type="file" name="img2" accept="image/*" onchange="previewImage(event, 'img2_preview')">
							            <img class="img2_preview" src="/images/product/${p.imgs.img2}" alt="Image 2 Preview">
							        </td>   
							        <td>
							            <p>이미지3<span>(선택)</span></p>
							            <input type="file" name="img3" accept="image/*" onchange="previewImage(event, 'img3_preview')">
							            <img class="img3_preview" src="/images/product/${p.imgs.img3}" alt="Image 3 Preview">
							        </td>   
							    </tr>       
							    <tr>                                
							        <td>
							            <p>이미지4<span>(선택)</span></p>
							            <input type="file" name="img4" accept="image/*" onchange="previewImage(event, 'img4_preview')">
							            <img class="img4_preview" src="/images/product/${p.imgs.img4}" alt="Image 4 Preview">
							        </td>
							    </tr>   
							</table>
				    	</div>
		    		<dl>
				    	<dd class="table_btn">
				    		<button type="button"  id="pro_updated">등록</button>
				    		<button type="button" onclick="location.href='/vitabucket/admin/prod/detail/${p.pro_key}'">취소</button>
				    	</dd>		    		
		    		</dl>			    	
			    </form> 
		</div>
    </section>	
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>