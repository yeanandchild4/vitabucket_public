function deleteWish(wish_key) {
		
		if(confirm("삭제하시겠습니까?")) {
			$.ajax({
				url:'/mypage/deleteWish/'+wish_key,
				type:'delete',
				cache:false,
				success:function(res){
					if(res.ok) {
						alert('삭제 성공');
						location.href="/mypage/wishList";
					} else {
						alert('삭제 실패');
					}
				},
				error:function(xhr,status,err) {
					alert(status+", "+err);
				}
			}); 
		}

	}
	
	function addCart(pro_key) {
		if(confirm("장바구니에 담겠습니까?")) {
			$.ajax({
				url:'/cart/addCartWish',
				type:'post',
				data: {'pro_key':pro_key},
				cache:false,
				success:function(res){
					if(res.ok) {
						if(confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?")) {
							location.href="/cart";
						} else {
							location.href="/mypage/wishList";
						}
					} else {
						alert('담기 실패');
					}
				},
				error:function(xhr,status,err) {
					alert(status+", "+err);
				}
			}); 
		}
	}