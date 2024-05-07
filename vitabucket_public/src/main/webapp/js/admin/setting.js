
//기본설정_회사정보 저장
function setting_save(){
	var obj = $('#basicsetting_form').serialize();
	if(confirm('저장하시겠습니까?')){
		$.ajax({
		   url :'/vitabucket/admin/sett',
		   type : 'post',
	       cache: false,
		   data : obj,
		   dataType : "json",
		   success: function (res) {
				alert(res.settSave ? '저장성공':'저장실패');
				location.href="/vitabucket/admin/sett";
			},
	        error: function(request, status, error) {
	            alert('fail');
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }			
		});		
	}	
}


//약관추가 보이기
function terms_add(){
	$('.t_add').toggle();
}

//닫기버튼
$(function() {	
	$('.close_btn').click(function(){
		var terms=$(this).closest('.terms');
		terms.css('display', 'none'); 
	});
});
	

//약관 추가저장
function terms_save(){
	var obj = $('#terms_form').serialize();
	if(confirm('저장하시겠습니까?')){
		$.ajax({
		   url : '/vitabucket/admin/sett/terms',
		   type : 'post',
	       cache: false,
		   data : obj,
		   dataType : "json",
		   success: function (res) {
				alert(res.termsSave ? '저장성공':'저장실패');
				location.href="/vitabucket/admin/sett/terms";
			},
	        error: function(request, status, error) {
	            alert('fail');
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }			
		});		
	}
}

//약관 상세내용 보이기
function terms_detail(terms_key){
	$.ajax({
        method: "GET",
        url: "/vitabucket/admin/sett/terms/detail/"+terms_key,
        dataType: "html",
        success: function(data) {
			$('.t_detail').empty();
			$('.t_detail').append(data).toggle();
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

//약관 수정 보이기
function terms_edit(terms_key){
	$.ajax({
        method: "GET",
        url: "/vitabucket/admin/sett/terms/edit/"+terms_key,
        dataType: "html",
        success: function(data) {
			$('.t_edit').empty();
			$('.t_edit').append(data).toggle();
			
            var terms_required = data.terms_required;
            if (terms_required === 'O') {
                $('#termsEdit_form input[name="terms_required"][value="O"]').prop('checked', true);
            } else {
                $('#termsEdit_form input[name="terms_required"][value="X"]').prop('checked', true);
            }
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

//약관 수정저장
function terms_Esave(terms_key){
	var obj = $('#termsEdit_form').serialize();
	if(confirm('수정하시겠습니까?')){
		$.ajax({
		   url: "/vitabucket/admin/sett/terms/edit/"+terms_key,
		   type : 'post',
	       cache: false,
		   data : obj,
		   dataType : "json",
		   success: function (res) {
				alert(res.termEditSave ? '수정성공':'수정실패');
				location.href="/vitabucket/admin/sett/terms";
			},
	        error: function(request, status, error) {
	            alert('fail');
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }			
		});		
	}
}

//약관 삭제
function terms_del(terms_key){
	var del={};
	del.terms_key = terms_key;

	if(confirm('삭제하시겠습니까?')){
		$.ajax({
		   url: "/vitabucket/admin/sett/terms/dele/"+terms_key,
	       method: "post",           
	       data: del,
	       dataType: 'json',    
	       cache: false,
	       success: function (res) {
	    	   if(res.termsDel) {
	              alert('삭제성공');
	              location.href="/vitabucket/admin/sett/terms";
	           }else alert('삭제실패');
	       },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
		});
	}
}



