$('#user_pwd').on('keydown', function(e){
	if (e.code == 'Enter'){
		$('#confirmBtn').click()
	}
})

function modifyPwd() {
	var data = $('#form').serialize();
	
	$.ajax({
			url : '/mypage/info',
			type : 'post',
			cache : false,
			data : data,
			dataType : 'json',
			success : function(res) {
				if(res.ok) {
					location.href="/mypage/info/modify";
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},
			error : function(xhr, status, err) {
				alert(status + ", " + err);
			}
		});
}