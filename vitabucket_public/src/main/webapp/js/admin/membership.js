// 체크박스 선택시 선택갯수 변경
//var numSelected = 0; // 전역 변수로 선언
    /*
$(document).ready(function() {


    updateButton(); // 페이지 로드 시 호출
    $('input[name="check_key"]').change(function() { // 체크박스 변경 시 호출
        updateButton();
    });
});
/*
// 전체선택 -- 상품목록에서 목록의 전체를 선택함
function selectAll() {
    var checked = $('#allCk').is(':checked');
    if (checked) $('input:checkbox').prop('checked', true);
    else $('input:checkbox').prop('checked', false);
    
    updateButton(); // 선택된 체크박스 갯수 업데이트
}

//선택한 체크박스 갯수 변경하기
function updateButton() {
    var checkedBox = $('input[name="check_key"]:checked'); // 선택된 체크박스 가져오기
    numSelected = checkedBox.length;
    // 텍스트 업데이트
    $('#selec').text('선택인원(' + numSelected + ')');
}*/

function memberJoin() {	
	$('.right').empty();
	var object = '<object data="/member/signup" type="text/html" width="800" height="800"></object>';
	$('.right').append(object);
}

//회원 삭제 --하나의 삭제 버튼시 삭제
function mem_del(unum,name){
	var del={};
	del.unum = unum;
	del.name = name;
	
	if(confirm(name+'님을 삭제하시겠습니까?')){
		$.ajax({
		   url: "/vitabucket/admin/memb/dele/"+unum,
	       method: "post",           
	       data: del,
	       dataType: 'json',    
	       cache: false,
	       success: function (res) {
	    	   if(res.memDel) {
	              alert(name+'님 삭제성공');
	              location.href="/vitabucket/admin/memb";
	           }else alert(name+'님 삭제실패');
	       },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
		});
	}
}

//회원정보 상세내용 보이기
function mem_detail(unum){	
	$.ajax({
        method: "GET",
        url: "/vitabucket/admin/memb/detail/"+unum,
        dataType: "html",
        success: function(data) {
			$('#m_detail').empty();
			$('#m_detail').append(data).toggle();
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}