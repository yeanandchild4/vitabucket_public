//카테고리 추가저장
function cate_save(){
    var add = $('#cate_form').serialize();	
    add.main_cat_key = $('select[name=main_cat_key]').val();

    var subCatInput = $('input[name=sub_cat_name]').val();

    if (add.main_cat_key === "0" || subCatInput === "") { // 수정된 부분: main_cat_key와 sub_cat_key를 검사
        alert("추가할 상위카테고리를 선택하세요.");
        return;
    }
    $.ajax({
       url: "/vitabucket/admin/cate/c_admin/add",
       method: "post",           
       data: add,
       dataType: 'json',    
       cache: false,
       success: function (res) {
           if (res.cateAdd) {
              alert('성공');
              location.href="/vitabucket/admin/cate";
           } else {
              alert('실패');
           }
       },
       error: function (xhr, status, err) {
           alert(status + "," + err);
       }
    });
}


/*카테고리_토글*/
$(function(){
    $(".main_cate").on("click", function() {
        var $parent = $(this).parent().parent();
        var $dl = $parent.find("dl");
        var $toggle = $parent.find(".toggle");

            $(".t2 dl").not($dl).slideUp();
            $(".t2 .toggle").not($toggle).text("▶");
            $dl.slideDown();
            $toggle.text("▼");
     });
    
});
//하위카테고리 삭제
function del(sub_cat_key){
	var del={};
	del.sub_cat_key = sub_cat_key;

	if(confirm(sub_cat_key+'번 삭제하시겠습니까?')){
		$.ajax({
		   url: "/vitabucket/admin/cate/c_admin/deleted",
	       method: "post",           
	       data: del,
	       dataType: 'json',    
	       cache: false,
	       success: function (res) {
	    	   if(res.cateDel) {
	              alert('삭제성공');
	              location.href="/vitabucket/admin/cate";
	           }else alert('삭제실패');
	       },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
		});
	}
}

function close_btn(){
    $('#cate_edit').empty().hide(); // 숨기기 전에 요소를 비우도록 순서 변경
}

function cate_edit(main_cat_key) {
    var edit = {};
    edit.main_cat_key = main_cat_key;
    $.ajax({
        method: "GET",
        data: edit,
        url: "/vitabucket/admin/cate/c_admin/edit",
        dataType: "html",
        success: function(data) {
            $('#cate_edit').empty().append(data).show(); // close_btn()와 반대로 순서 변경
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function cate_edit_s(sub_cat_key) {
    var edit = {};
    edit.sub_cat_key = sub_cat_key;
    $.ajax({
        method: "GET",
        data: edit,
        url: "/vitabucket/admin/cate/c_admin/edit_s",
        dataType: "html",
        success: function(data) {
            $('#cate_edit').empty().append(data).show(); // close_btn()와 반대로 순서 변경
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

/*위 카테고리 수정 보이기 합쳐놓은거
function editCategory(type, cat_key) {
    var edit = {};
    if (type === 'main') {
        edit.main_cat_key = cat_key;
        url = "/vitabucket/admin/cate/c_admin/edit";
    } else if (type === 'sub') {
        edit.sub_cat_key = cat_key;
        url = "/vitabucket/admin/cate/c_admin/edit_s";
    }
    
    $.ajax({
        method: "GET",
        data: edit,
        url: url,
        dataType: "html",
        success: function(data) {      
            $('#cate_edit').append(data).toggle();     
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}
 */


//하위카테고리 수정저장
function editSave(main_cat_key){
	var update = $('#edit_form').serialize();
	if(confirm('수정하시겠습니까?')){
		$.ajax({
		   url :'/vitabucket/admin/cate/c_admin/edit?main_cat_key='+main_cat_key,
		   type : 'post',
	       cache: false,
		   data : update,
		   dataType : "json",
		   success: function (res) {
				alert(res.okedit ? '성공':'실패');
				location.href="/vitabucket/admin/cate";
			},
	        error: function(request, status, error) {
	            alert('fail');
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }			
		});		
	}	
}

function editSave(sub_cat_key){
	var update = $('#edit_form').serialize();
	if(confirm('수정하시겠습니까?')){
		$.ajax({
		   url :'/vitabucket/admin/cate/c_admin/edit_s?sub_cat_key='+sub_cat_key,
		   type : 'post',
	       cache: false,
		   data : update,
		   dataType : "json",
		   success: function (res) {
				alert(res.okedit ? '성공':'실패');
				location.href="/vitabucket/admin/cate";
			},
	        error: function(request, status, error) {
	            alert('fail');
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }			
		});			
	}
}
/*위; 수정저장합친거
function editSave(cat_key, type) {
    var url;
    var edit = {};
    
    if (type === 'main') {
        edit.main_cat_key = cat_key;
        url = "/vitabucket/admin/cate/c_admin/edit";
    } else if (type === 'sub') {
        edit.sub_cat_key = cat_key;
        url = "/vitabucket/admin/cate/c_admin/edit_s";
    } else {
        // 예외 처리: type이 주어지지 않았거나 유효하지 않은 경우
        console.error("유효하지 않은 카테고리 유형입니다.");
        return;
    }
    
    var update = $('#edit_form').serialize();
    if (confirm('수정하시겠습니까?')) {
        $.ajax({
           url: url,
           type: 'post',
           cache: false,
           data: update,
           dataType: "json",
           success: function (res) {
                alert(res.okedit ? '성공':'실패');
                location.href = "/vitabucket/admin/cate";
            },
            error: function(request, status, error) {
                alert('fail');
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }           
        });     
    }   
}

 */

