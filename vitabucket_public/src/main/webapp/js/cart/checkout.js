/* 사전검증 */
function payment_prepare(to_key, to_total, cart_keys) {
	var data = {};
	data.to_key = to_key;
	data.to_total = to_total;
	data.cart_keys = cart_keys;
	
    $.ajax({
		url : '/cart/payment_prepare',
		type : 'post',
		cache : false,
		data : data,
		dataType : 'json',
		success : function(res) {
			if(!res.ok) {
				alert("주문 중 오류가 발생했습니다. 다시 주문해주세요");
				$.ajax({
                url: "/cart/deleteTotalOrder/"+to_key,
                method: "POST",
                dataType : 'json'});
				location.href="/cart";
			}
		},
		error : function(xhr, status, err) {
			alert("주문 중 오류가 발생했습니다. 다시 주문해주세요");
			$.ajax({
                url: "/cart/deleteTotalOrder/"+to_key,
                method: "POST",
                dataType : 'json'});
			location.href="/cart";
		}
	});
}

/* 구매 */
function buy(to_key,pname,cart_keys) {
	var IMP = window.IMP;
    IMP.init('imp18336182'); // 가맹점 식별코드 입력 
    
    IMP.request_pay({
        pg: "html5_inicis",           // 등록된 pg사 (적용된 pg사는 KG이니시스)
        pay_method: $('#to_payment').val(),           // 결제방식: card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(소액결제)
        merchant_uid: to_key,   // 주문번호
        name: pname,                  // 상품명
        amount: $('#total').val(),           // 금액
        buyer_name: $('#name').text(),         // 주문자
        buyer_tel: $('#user_phone').text(),             // 전화번호 (필수입력)
        buyer_addr: $('#whole_addr').text(),    		  // 주소
        buyer_postcode: $('#addr_zipcode').text()          // 우편번호
    }, function (rsp) {
		console.log(rsp);
        if (rsp.success) {
        	var data = {};
        	data.imp_uid = rsp.imp_uid;
        	data.to_key = to_key;
       
        	$.ajax({
                url: "/cart/payment_validate",
                method: "POST",
                dataType : 'json',
                data: data,
            }).done(function (data) {
            	var mesg = '결제가 완료되었습니다.';
            	
            	var save = {};
            	save.imp_uid = rsp.imp_uid;
            	save.to_key = rsp.merchant_uid;
            	save.to_addr_key = $('#addr_key').val();
            	save.to_req = $('#addr_req').val();
            	save.cart_keys = cart_keys;
            	
                $.ajax({
                    url: "/cart/save_order",
                    method: "POST",
                    dataType : 'json',
                    data: save,
                }).done(function(res) {
                	alert(mesg);
            		location.href="/mypage/order/"+res.merchantUid;
                })
            })
        } else {
			
			$.ajax({
                url: "/cart/deleteTotalOrder/"+to_key,
                method: "POST",
                dataType : 'json',
            }).done(function(res) {
				if(res.ok) {
					var mesg = '결제를 실패하였습니다.';
            		alert(mesg);
            		location.href="/cart";
				}
			})
        }
    }
    );
}

window.onpopstate = function(event) {  
	if(event){
		if(confirm('구매가 완료되지 않았습니다. 이 화면에서 벗어나시겠습니까?')) {
			
		}
	}
};