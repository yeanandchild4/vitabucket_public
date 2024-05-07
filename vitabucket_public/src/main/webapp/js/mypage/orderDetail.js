// 모달 함수
$(function() {
	var modalNum = 0;
	
	/* 버튼 클릭하면 모달 창 뜨도록 onclick 설정 */
	$('.mdBtn').on("click", function() {
		modalNum = $(this).data("btn");
		$('.modal_'+modalNum).css("display","block");
	})
 
    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
    $('.close').on("click", function() {
		$('.modal_'+modalNum).css("display","none");
		$('.textA_'+modalNum).val('');
		$('.textCount_'+modalNum).text('0자');
	});
	
	// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
	window.onclick = function(event) {
	  if (event.target.className.includes("modal")) {
	      $('.modal_'+modalNum).css("display","none");
	      $('.textA_'+modalNum).val('');
	      $('.textCount_'+modalNum).text('0자');
	  }
	};

	/*리뷰*/	
	$('.textA').keyup(function (e) {
		let content = $(this).val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount_'+modalNum).text('0자');
	    } else {
	    	$('.textCount_'+modalNum).text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length >= 500) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 500));
	        // 200자 넘으면 알림창 뜨도록
	        $('.textCount_'+modalNum).css("color", "#CE6B6B");
	    };
	});
});

function addReview() {
	var form = $('#form')[0];
    var data = new FormData(form);
	
	if(confirm("저장하시겠습니까?")) {	
		$.ajax({
			url : '/mypage/addReview',
			type : 'post',
			enctype: 'multipart/form-data',
			cache : false,
			processData: false,   
            contentType: false, 
			data : data,
			dataType : 'json',
			success : function(res) {
				alert(res.ok?"저장 성공":"저장 실패");
				if(res.ok) location.href="/mypage/review";
			},
			error : function(xhr, status, err) {
				alert(status + ", " + err);
			}
		});
	}
}