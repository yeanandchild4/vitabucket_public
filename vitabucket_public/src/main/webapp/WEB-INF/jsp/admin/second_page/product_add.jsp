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
    // 스마트 에디터 초기화
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "pro_comment",
        sSkinURI: "/se2/SmartEditor2Skin.html",
        htParams: {
            bUseToolbar: true,
            bUseVerticalResizer: true,
            bUseModeChanger: true,
        },
        fOnAppLoad: function() {
            oEditors.getById["pro_comment"].exec("PASTE_HTML", [""]);
        },
        fCreator: "createSEditor2"
    });
    
    var oEditors2 = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors2,
        elPlaceHolder: "pro_warnings",
        sSkinURI: "/se2/SmartEditor2Skin.html",
        htParams: {
            bUseToolbar: true,
            bUseVerticalResizer: true,
            bUseModeChanger: true,
            fOnBeforeUnload: function() {}
        },
        fOnAppLoad: function() {
            oEditors2.getById["pro_warnings"].exec("PASTE_HTML", [""]);
        },
        fCreator: "createSEditor2"
    });    
    
 // 상품 추가 버튼 클릭 시 스마트 에디터 내용 업데이트
    $("#pro_added").click(function() {
        
        oEditors.getById["pro_comment"].exec("UPDATE_CONTENTS_FIELD", []);
        oEditors2.getById["pro_warnings"].exec("UPDATE_CONTENTS_FIELD", []);
        // 추가로 필요한 로직 처리
        submitContents(this);
    }); 
});
 
</script>

</head>
<body>
<%@include file="/WEB-INF/jsp/admin/AdminHeader.jsp" %> 
    <section class ="contents">
	    <div class="cont left">
	    	<h3><span>상품관리</span><br><img src="/images/admin/product.png"></h3>
	    	<ul>
	    		<li onclick="location.href='/vitabucket/admin/prod'">상품목록</li>
   				<li onclick="location.href='/vitabucket/admin/prod/add'" class="li_color">상품등록</li>	 
	    		<li onclick="location.href='/vitabucket/admin/prod/excel/download'">상품목록 엑셀저장</li>
	    	</ul>    	
	    </div>
	    <div class="cont right"> 
		   	<h4>HOME > 상품관리 > 상품추가</h4>
		        <h2>상품추가</h2>			
			    <form id="prod_form" enctype="multipart/form-data" method="post">
			    	<input type="hidden" value="1" name="pro_key">			    		    
			    	<input type="hidden" value="1" name="pro_img_key">			    		    
				    	<table>
		                   <tr>
		                       <th>카테고리 소속</th>
		                       <td class="cate_td">	
		                           <select name="main_cat_key" onchange="onCatChanged()">
		                               <option selected disabled>=상위카테고리선택=</option>
		                               <c:forEach var="c" items="${clist}">                                
		                                <option value="${c.main_cat_key}" >00${c.main_cat_key} ${c.main_cat_name}</option>                                
		                               </c:forEach>                               
		                           </select>
		                           <select name="sub_cat_key">
		                           	<option selected disabled>=하위카테고리선택=</option>
		                           </select>
		                       </td>
		                       <td colspan="2"><button type="reset">초기화</button></td>
		                   </tr>
				    	</table>
					    <div class="pro_add">
					    	<table class="pro_info">
					    		<tr>
					    			<th>상품명</th>
					    			<td><input type="text" name="pro_name" placeholder="상품명"></td>
					    		</tr>
					    		<tr>
					    			<th>제조사</th>
					    			<td><input type="text" name="pro_manufacturer" placeholder="제조사"></td>
					    		</tr>
					    		<tr>
					    			<th>가격</th>
					    			<td><input type="number" name="pro_price" placeholder="0"></td>
					    		</tr>
					    		<tr>
					    			<th>재고</th>
					    			<td>
					    				<input type="number" name="pro_stock" placeholder="0">
					    			</td>
					    		</tr>
					    		<tr>
					    			<th>상품설명</th>
					    			<td>
			    						<textarea style="width:100%;"  name="pro_comment" id="pro_comment" ></textarea>
					    			</td>
					    		</tr>
					    		<tr>
					    			<th>소비기한</th>
					    			<td><input type="date" name="pro_best_by" placeholder="2000-01-01"></td>
					    		</tr>
					    		<tr>
					    			<th>1회 제공량</th>
					    			<td><input type="text" name="pro_serving_size" placeholder="1일 1정"></td>
					    		</tr>
					    		<tr>
					    			<th>용기당 제공 횟수</th>
					    			<td><input type="text" name="pro_servings_percont" placeholder="60회"></td>
					    		</tr>
					    		<tr>
					    			<th>주요성분</th>
					    			<td><textarea name="pro_main_ing" placeholder="주요성분"></textarea></td>
					    		</tr>
					    		<tr>
					    			<th>기타성분</th>
					    			<td><textarea name="pro_other_ing" placeholder="기타성분"></textarea></td>
					    		</tr>
					    		<tr>
					    			<th>주의사항</th>
					    			<td>
					    				<textarea style="width:100%;"  name="pro_warnings" id="pro_warnings" placeholder="주의사항"></textarea>
					    			</td>
					    		</tr>
					    		<tr>
					    			<th>알레르기</th>
					    			<td><textarea name="pro_allergy" spellcheck="false" placeholder="알레르기"></textarea></td>
					    		</tr>			    		
					    	</table>
							<table class="pro_img">
							    <tr>
							        <th rowspan="3">상품이미지추가</th>   
							        <td>
							            <p>메인이미지<span class="essential">(필수)</span></p>
							            <input type="file" name="main_img" accept="image/*" onchange="previewImage(event, 'main_img_preview')">
							            <img class="main_img_preview" src="#" alt="Main Image Preview">
							        	
							        </td>   
							        <td>
							            <p>이미지1<span class="essential">(필수)</span></p>
							            <input type="file" name="img1" accept="image/*" onchange="previewImage(event, 'img1_preview')">
							            <img class="img1_preview" src="#" alt="Image 1 Preview">
							        </td>
							    </tr>
							    <tr>
							        <td>
							            <p>이미지2<span class="essential">(필수)</span></p>
							            <input type="file" name="img2" accept="image/*" onchange="previewImage(event, 'img2_preview')">
							            <img class="img2_preview" src="#" alt="Image 2 Preview">
							        </td>   
							        <td>
							            <p>이미지3<span>(선택)</span></p>
							            <input type="file" name="img3" accept="image/*" onchange="previewImage(event, 'img3_preview')">
							            <img class="img3_preview" src="#" alt="Image 3 Preview">
							        </td>   
							    </tr>       
							    <tr>                                
							        <td>
							            <p>이미지4<span>(선택)</span></p>
							            <input type="file" name="img4" accept="image/*" onchange="previewImage(event, 'img4_preview')">
							            <img class="img4_preview" src="#" alt="Image 4 Preview">
							        </td>
							    </tr>   
							</table>
				    	</div>
		    		<dl>
				    	<dd class="table_btn">
				    		<button type="button"  id="pro_added">등록</button>
				    		<button type="button" onclick="location.href='/vitabucket/admin/prod'">취소</button>
				    	</dd>		    		
		    		</dl>			    	
			    </form> 
		</div>
    </section>	
<%@include file="/WEB-INF/jsp/admin/scroll_btn.jsp" %> 
<%@include file="/include/footer.jsp"%> 
</body>
</html>