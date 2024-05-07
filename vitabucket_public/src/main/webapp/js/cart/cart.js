	// 전체 선택
	function selectAll() {
		var checked= $('#allCk').is(':checked');
		if(checked) $('input:checkbox').prop('checked',true);
		else $('input:checkbox').prop('checked',false);
		calculTotal();
	}
    
	// 구매하기 클릭
    function checkout() {
		var addr = $('#addr').text();
		if(addr.startsWith('저장된')) {
			alert('저장된 배송지가 없어 구매가 불가능합니다.');
		} else {
			var num = $("input:checkbox[name='checked']:checked").length;
			if(num>0) {
				if(confirm("구매하시겠습니까?")) {
					$('#form').submit();
				}
			} else {
				alert("선택된 상품이 없습니다.");
			}
		}
	}

	// 총 금액 계산
    function calculTotal() {
    	var checked = [];
    	$("input[name=checked]:checked").each(function() {
    		var chkReceiver = $(this).val();
    		checked.push(chkReceiver);
    	})
    	
    	$.ajax({
			url : '/cart/calculTotal',
			type : 'post',
			cache : false,
			data : {'checked': checked},
			dataType : 'json',
			success : function(res) {
				$('#total').text(Number(res.pro_total).toLocaleString('ko-KR'));
			},
			error : function(xhr, status, err) {
				alert(status + ", " + err);
			}
		});
	}
    
	// 수량조절
    function modifyCnt(cart_key,cnt,stock) {
    	
    	var changeCnt = parseInt($('#pro_cnt_'+cart_key).text())+parseInt(cnt);
    	if(changeCnt>0 && changeCnt<=parseInt(stock)) {
    		$.ajax({
    			url : '/cart/modifyCnt',
    			type : 'put',
    			cache : false,
    			data : {
    				'pro_cnt':cnt,
    				'cart_key':cart_key
    			},
    			dataType : 'json',
    			success : function(res) {
    				if(res.ok) {
    					$('#pro_cnt_'+cart_key).text(changeCnt);
    					carculPtotal(cart_key);
    					if($('#checked_'+cart_key).is(':checked')) calculTotal();
    				}
    			},
    			error : function(xhr, status, err) {
    				alert(status + ", " + err);
    			}
    		});
    	}
    }
    
	// 한 개 상품의 총 금액 계산
    function carculPtotal(cart_key) {
    	$.ajax({
			url : '/cart/calculPtotal',
			type : 'post',
			cache : false,
			data : {'cart_key':cart_key},
			dataType : 'json',
			success : function(res) {
				$('#pro_total_'+cart_key).text(Number(res.ptotal).toLocaleString('ko-KR')+'원');
			},
			error : function(xhr, status, err) {
				alert(status + ", " + err);
			}
		});
	}
    
	// 선택삭제
    function deleteCart() {
    	var data = $('#form').serialize();
    	if(confirm("삭제 하시겠습니까?")) {	
    		$.ajax({
    			url : '/cart/deleteCart',
    			type : 'delete',
    			cache : false,
    			data : data,
    			dataType : 'json',
    			success : function(res) {
    				alert(res.ok?"삭제 성공":"삭제 실패");
    				if(res.ok) location.href="/cart";
    			},
    			error : function(xhr, status, err) {
    				alert(status + ", " + err);
    			}
    		});
    	}
	}
	
	//상품한개 삭제
	function deleteP(cart_key) {
		if(confirm("이 상품을 장바구니에서 삭제 하시겠습니까?")) {
    		$.ajax({
    			url : '/cart/deleteP',
    			type : 'delete',
    			cache : false,
    			data : {'cart_key':cart_key},
    			dataType : 'json',
    			success : function(res) {
    				alert(res.ok?"삭제 성공":"삭제 실패");
    				if(res.ok) location.href="/cart";
    			},
    			error : function(xhr, status, err) {
    				alert(status + ", " + err);
    			}
    		});
    	}
	}