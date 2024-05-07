var userName = document.getElementById("userName");
userN = userName.value;

window.onload = function() {
	/* 이미지 슬라이드*/
	const kindWrap =  document.querySelector('.kind_wrap');
	const slider = kindWrap.querySelector('.slider');
	const slideLis = slider.querySelectorAll('li');
	const moveButton = kindWrap.querySelector('.arrow');
	
	/* ul 넓이 계산해 주기 */
	const liWidth = slideLis[0].clientWidth;
	const sliderWidth = liWidth * slideLis.length;
	slider.style.width = `${sliderWidth}px` ;
	
	/* 리스너 설치하기 */
	let currentIdx = 0; // 슬라이드 현재 번호
	let translate = 0; // 슬라이드 위치 값
	moveButton.addEventListener('click', moveSlide);
	
	function moveSlide(event) {
		event.preventDefault();
		if (event.target.className === 'next') {
			if (currentIdx !== slideLis.length -1) {
				translate -= liWidth;
				slider.style.transform = `translateX(${translate}px)`;
				currentIdx += 1;
			}
		} else if (event.target.className === 'prev') {
			if (currentIdx !== 0) {
				translate += liWidth;
				slider.style.transform = `translateX(${translate}px)`;
				currentIdx -= 1;
			}
		}
	}
  
  	/* 문의하기 버튼 클릭시 모달창 열기 */
	const inquiryButton = document.getElementById('inquiryBtn');
	// 모달 컨테이너 요소 가져오기
	const modalContainer = document.getElementById('modalContainer');
	// 모달 닫기 버튼 요소 가져오기
	const modalCloseButton = document.getElementById('modalCloseButton');
	
	// 유저 정보 검사
//	console.log(userName);
	
	// 문의하기 버튼 클릭 시 모달 열기
	inquiryButton.addEventListener('click', () => {
		if(userN=="") {
			alert("로그인이 필요합니다.");
			location.href="/member/login";
		}
		modalContainer.classList.remove('hidden');
	});
	// 모달 닫기 버튼 클릭 시 모달 닫기
	modalCloseButton.addEventListener('click', () => {
	  modalContainer.classList.add('hidden');
	});

	$('#textBox').keyup(function (e) {
		let content = $(this).val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0자');
	    } else {
	    	$('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length >= 500) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 500));
	        // 200자 넘으면 알림창 뜨도록
	        $('.textCount').css("color", "#CE6B6B");
	    };
	});

}


/* 찜하기 */
function addWish(pro_key){
	var obj = {};
	obj.pro_key = pro_key;
	
    $.ajax({
	    url: '/product/addwish',
	    type: 'post',
	    cache: false,
	    data: obj,
	    dataType: 'json',
	    success: function(res) {
			if(res.login) {
				if(res.ok){
					$('#wish').empty();
					$('#wish').append('<button id="wishBtn" type="button" onclick="delWish('+pro_key+')"><i class="fa-solid fa-heart" style="color: #ff8339;"></i></button>');
					//location.reload(true);
				}
			}else {
				alert('로그인이 필요합니다');
				location.href='../../member/login';
			}
	    },
	    error: function(request, status, error) {
	        alert('fail');
	        console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    }
    });
}

function delWish(pro_key){
	var obj = {};
	obj.pro_key = pro_key;
	
    $.ajax({
	    url: '/product/delwish',
	    type: 'post',
	    cache: false,
	    data: obj,
	    dataType: 'json',
	    success: function(res) {
			if(res.ok) {
				$('#wish').empty();
				$('#wish').append('<button id="wishBtn" type="button" onclick="addWish('+pro_key+')"><i class="fa-regular fa-heart" style="color: #ff8339;"></i></button>');
			}
	    },
	    error: function(request, status, error) {
	        alert('fail');
	        console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    }
    });
}


/* 상품문의 */
function addInquiry(){
	var plainText = document.getElementById('textBox').value;
	var htmlText = escapeHTML(plainText);
	
	$('#textBox').val(htmlText);
	
	var inquiryData = $('#inquiryForm').serialize();
	
    $.ajax({
	    url: '/product/addinquiry',
	    type: 'post',
	    cache: false,
	    data: inquiryData,
	    dataType: 'json',
	    success: function(res) {
			if(res.ok){
				location.reload(true);
			}else alert('문의 내용을 작성해주세요.');
			
	    },
	    error: function(request, status, error) {
	        alert('fail');
	        console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    }
    });
}
/* textarea안의 평문을 html로 변환 -> br만 가능 */
function escapeHTML(text) {
    var div = document.createElement('div');
    div.innerText = text;
    return div.innerHTML;
}




/* 상품문의 내용+답글 토글 */
$(document).ready(function(){
    $('.board_content').hide();
    $('.board_comment').hide();

    // 제목을 클릭하면 해당 행의 숨겨진 내용이 토글됩니다.
    $('.inq_content').click(function(){
        // 해당 행의 .board_content 요소를 찾습니다.
        $(this).closest('tr').next('.board_content').toggle();
        
        // 해당 행의 .board_comment 요소를 찾습니다.
        $(this).closest('tr').next('.board_comment').toggle();

    });
});