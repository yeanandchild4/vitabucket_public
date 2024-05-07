function edit_save(to_key){
	var obj ={};
	obj.to_status = $("select[name='to_status']").val();
	obj.to_key = to_key;
	
	if(confirm('저장하시겠습니까?')){
		$.ajax({
		   url :'/vitabucket/admin/order/edit/'+to_key,
		   type : 'post',
	       cache: false,
		   data : obj,
		   dataType : "json",
		   success: function (res) {
				alert(res.order_edit ? '저장성공':'저장실패');
				location.href="/vitabucket/admin/order/detail/"+to_key;
			},
	        error: function(request, status, error) {
	            alert('fail');
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }			
		});		
	}	
}
