/* 장바구니 담기 */
function addCart(pro_key){
	var cartData = $('#cartForm_'+pro_key).serialize();
	
    $.ajax({
	    url: '/cart/insertCart',
	    type: 'post',
	    cache: false,
	    data: cartData,
	    dataType: 'json',
	    success: function(res) {
			if(res.login) alert(res.ok ? '장바구니 담기 성공' : '장바구니 담기 실패');
			else {
				alert('로그인이 필요합니다');
				location.href='/member/login';
			}
	    },
	    error: function(request, status, error) {
	        alert('fail');
	        console.log("code:" + request.status + "\n" + "error:" + error);
	    }
    });
};