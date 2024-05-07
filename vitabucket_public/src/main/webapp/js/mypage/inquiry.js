// 모달 함수
$(function() {
	var modalNum = 0;
	var textA = "";
	var textCounts = $('.textCount');
	
	/* 버튼 클릭하면 모달 창 뜨도록 onclick 설정 */
	$('.mdBtn').on("click", function() {
		modalNum = $(this).data("btn");
		$('.modal_'+modalNum).css("display","block");
	})
 
    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
    $('.close').on("click", function() {
		$('.modal_'+modalNum).css("display","none");
	});
	
	// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
	window.onclick = function(event) {
	  if (event.target.className.includes("modal")) {
	      $('.modal_'+modalNum).css("display","none");
	  }
	};
});

function deleteInquiry(board_key) {
	
	if(confirm("삭제 하시겠습니까?")) {	
		$.ajax({
			url : '/mypage/deleteInquiry',
			type : 'delete',
			cache : false,
			data : {'board_key':board_key},
			dataType : 'json',
			success : function(res) {
				alert(res.ok?"삭제 성공":"삭제 실패");
				if(res.ok) location.href="/mypage/inquiry";
			},
			error : function(xhr, status, err) {
				alert(status + ", " + err);
			}
		});
	}
}