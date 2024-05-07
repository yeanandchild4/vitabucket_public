// 모달 함수
$(function() {
	var modalNum = 0;
	var textA = "";
	var textCounts = $('.textCount');
	
	/* 버튼 클릭하면 모달 창 뜨도록 onclick 설정 */
	$('.mdBtn').on("click", function() {
		modalNum = $(this).data("btn");
		$('.modal_'+modalNum).css("display","block");
		/*리뷰*/
		textA = $('.textA_'+modalNum).val();
	})
 
    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
    $('.close').on("click", function() {
		$('.modal_'+modalNum).css("display","none");
		/*리뷰*/
		cancleEdit();
	});
	
	// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
	window.onclick = function(event) {
	  if (event.target.className.includes("modal")) {
	      $('.modal_'+modalNum).css("display","none");
	      /*리뷰*/
	      cancleEdit();
	  }
	};
	
	/*리뷰*/
	/* 취소 버튼 클릭 시 수정에 필요한 버튼들이 사라짐 */
	$('.editCancle').on("click", function() {
		cancleEdit();
	});
	
	/*리뷰*/
	/* 상세에서 수정 버튼 클릭 시 수정에 필요한 버튼들 나타남 */
	$('.detailEdit').on("click", function() {
		$('.detailBtn_'+modalNum).css('display','none');
		$('.editBtn_'+modalNum).css('display','block');
		$('.editInput_'+modalNum).css('display','block');
		$('.imgDelBtn_'+modalNum).css('display','inline');
		$('.textLengthWrap_'+modalNum).css('visibility','visible');
		$('.textA_'+modalNum).attr('disabled',false);
	});
	
	
	/*리뷰*/
	/* 취소, x, 모달 바깥 창 클릭시 수정에 필요한 버튼들 사라짐 */
	function cancleEdit() {
		$('.detailBtn_'+modalNum).css('display','block');
		$('.editBtn_'+modalNum).css('display','none');
		$('.editInput_'+modalNum).css('display','none');
		$('.imgDelBtn_'+modalNum).css('display','none');
		$('.textLengthWrap_'+modalNum).css('visibility','hidden');
		$('.textCount_'+modalNum).text('0자');
		$('.textA_'+modalNum).attr('disabled',true);
		$('.textA_'+modalNum).val(textA);
	}

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

//수정 함수

function editReview() {
	var form = $('#form')[0];
    var data = new FormData(form);
	
	if(confirm("수정 하시겠습니까?")) {	
		$.ajax({
			url : '/mypage/editReview',
			type : 'post',
			enctype: 'multipart/form-data',
			cache : false,
			processData: false,   
            contentType: false, 
			data : data,
			dataType : 'json',
			success : function(res) {
				alert(res.ok?"수정 성공":"수정 실패");
				if(res.ok) location.href="/mypage/review";
			},
			error : function(xhr, status, err) {
				alert(status + ", " + err);
			}
		});
	}
}

//삭제함수

function deleteReview(board_key) {
	
	if(confirm("삭제 하시겠습니까?")) {	
		$.ajax({
			url : '/mypage/deleteReview',
			type : 'delete',
			cache : false,
			data : {'board_key':board_key},
			dataType : 'json',
			success : function(res) {
				alert(res.ok?"삭제 성공":"삭제 실패");
				if(res.ok) location.href="/mypage/review";
			},
			error : function(xhr, status, err) {
				alert(status + ", " + err);
			}
		});
	}
}

// 이미지 삭제 
function deleteImg(b_attach_key) {
	if(confirm("삭제 하시겠습니까?\n이 과정은 취소할 수 없습니다.")) {	
		$.ajax({
			url : '/mypage/deleteRevieImg',
			type : 'delete',
			cache : false,
			data : {'b_attach_key':b_attach_key},
			dataType : 'json',
			success : function(res) {
				alert(res.ok?"사진 삭제 성공":"사진 삭제 실패");
				if(res.ok) $('#reviewImg_'+b_attach_key).remove();
			},
			error : function(xhr, status, err) {
				alert(status + ", " + err);
			}
		});
	}
}
