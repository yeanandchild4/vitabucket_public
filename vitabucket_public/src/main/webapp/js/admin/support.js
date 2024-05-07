
//문의 답변 수정 띄우기
function inquiry_edit(comm_key){
	$('.inquiry_view').hide();
	$('.inquiry_edit').show();
	
    
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "comments",
        sSkinURI: "/se2/SmartEditor2Skin.html",
        htParams: {
            bUseToolbar: true,
            bUseVerticalResizer: true,
            bUseModeChanger: true,
        },
        fOnAppLoad: function() {      
        	oEditors.getById["comments"].exec("PASTE_HTML", [""]); 
        	 $("iframe").css("width", "100%").css("height", "255px");
        },
        fCreator: "createSEditor2",
    });       
    
    $("#in_editSave").click(function() {
        oEditors.getById["comments"].exec("UPDATE_CONTENTS_FIELD", []);
        // 추가로 필요한 로직 처리
        editSave(this);
     });
	
	
}

function inquiry_datail_re(){
	$('.inquiry_view').show();
	$('.inquiry_edit').hide();
}

//답변저장
function submitContents(elClickedObj) {
	var formData = new FormData($('#in_comment')[0]);
	var board_key = $('input[name=board_key]').val();
	if(confirm('저장하시겠습니까?')){
		$.ajax({
		   url :'/vitabucket/admin/suppo/inquiry/'+board_key,
		   type : 'post',
	       cache: false,
	       processData: false, 
	       contentType: false,
		   data : formData,
		   dataType : "json",
		   success: function (res) {
				alert(res.in_addSave ? '답변저장성공':'답변저장실패');
				location.href="/vitabucket/admin/suppo";
			},
	        error: function(request, status, error) {
	            alert('fail');
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }			
		});		
	}	
}

//문의답변 상세보기 띄우기
function inquiry_datail(board_key) { 
    $.ajax({
        method: "GET",
        url: "/vitabucket/admin/suppo/inquiry/"+board_key,
        dataType: "html",
        success: function(data) {      
			$('.t1_detail').empty();
			$('.t1_detail').append(data).toggle();			
			     
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}






//문의 답변 수정 저장
function editSave(elClickedObj){
	var formData = new FormData($('#in_comment_edit')[0]);
	var comm_key = $('input[name=comm_key]').val();
	if(confirm('수정하시겠습니까?')){
		$.ajax({
		   url :'/vitabucket/admin/suppo/inquiry/update/'+comm_key,
		   type: 'post',
	       enctype: 'multipart/form-data',
	       processData: false,
	       contentType: false,
	       cache: false,
	       data: formData,
		   dataType : "json",
		   success: function (res) {
				alert(res.in_updated ? '답변수정성공':'답변수정실패');
				location.href="/vitabucket/admin/suppo";
			},
	        error: function(request, status, error) {
	            alert('fail');
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }			
		});		
	}	
}

//문의 답변 삭제
function inquiry_del(comm_key){
	var del={};
	del.comm_key = comm_key;

	if(confirm('삭제하시겠습니까?')){
		$.ajax({
		   url: "/vitabucket/admin/suppo/inquiry/deleted/"+comm_key,
	       method: "post",           
	       data: del,
	       dataType: 'json',    
	       cache: false,
	       success: function (res) {
	    	   if(res.in_Del) {
	              alert('답변삭제성공');
	              location.href="/vitabucket/admin/suppo";
	           }else alert('답변삭제실패');
	       },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
		});
	}
}







//리뷰 상세보기 띄우기
function review_detail(board_key) {   
    $.ajax({
        method: "GET",
        url: "/vitabucket/admin/suppo/review/"+board_key,
        dataType: "html",
        success: function(data) {      
			$('.t1_detail').empty();
			$('.t1_detail').append(data).toggle();
			     
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

//닫기버튼
$(function() {	
	$('.close_btn').click(function(){
		var closebtn=$(this).closest('.t1_detail');
		closebtn.css('display', 'none'); 
	});
});




	//리뷰 사진 슬라이드 효과
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	    showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	    showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	    var i;
	    var slides = $(".mySlides");
	    if (n > slides.length) {slideIndex = 1}
	    if (n < 1) {slideIndex = slides.length}
	    for (i = 0; i < slides.length; i++) {
	        slides[i].style.display = "none";
	    }
	    
	    slides[slideIndex-1].style.display = "block";
	}
