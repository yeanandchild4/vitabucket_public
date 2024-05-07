
/* 비밀번호 null 체크 */
var pwdck=0;

function pwdCheck(){
	var pwd = $('#user_pwd').val();
	var re = $('#pwd2').val();
	
	if(pwd==re){
		if( pwd=="" && re=="") {
			alert('비밀번호를 입력해주세요.');
		} else {
			alert('비밀번호가 확인되었습니다');
			pwdck=1;
		}
	} else {
		alert('비밀번호가 일치하지 않습니다');
	}
}


/* 비밀번호 조건 체크 */
function textPwd(){
	
	var pwd=document.getElementById("user_pwd").value;
	document.getElementById("pwdcheck").innerHTML="영문,숫자,특수문자 모두 포함해야 허용하며 2개 이상 조합";
}


/* 전화번호 형식 */
function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

/* 전화번호 형식으로 만들어 넣기 */
function cell(){

	var cellPhone = document.getElementById('user_phone');
	cellPhone.onkeyup = function(event){
	        event = event || window.event;
	        var _val = this.value.trim();
	        this.value = autoHypenPhone(_val);
	};
}

/* 생년월일에 기본값 넣기 */
function calender(user_birth) {          
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());
	
    var user_birth = new Date(user_birth);
    var user_year = user_birth.getFullYear();
    var user_month = user_birth.getMonth()+1 > 9 ? user_birth.getMonth()+1 : '0'+(user_birth.getMonth()+1);
    var user_date = user_birth.getDate() > 9 ? user_birth.getDate() : '0'+user_birth.getDate();
    
    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
    	 $('#year').append('<option value="' + i + '">' + i + '</option>');  
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#month').append('<option value="' + mm + '">' + mm + '</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#day').append('<option value="' + dd + '">' + dd+ '</option>');    
    }
    
    $("#year  > option[value="+user_year+"]").attr("selected", "true");        
    $("#month  > option[value="+user_month+"]").attr("selected", "true");
    $("#day  > option[value="+user_date+"]").attr("selected", "true");       
}

/* 비밀번호 유효성 체크 */
function expPwd(){
	
	var pwd=$('#user_pwd').val();
	var ptest= /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{7,}$/;
	
		if(ptest.test(pwd)==false){
			document.getElementById("pwdcheck").innerHTML="올바른 비밀번호 형식이 아닙니다";
			$('#user_pwd').focus();
			return false;
		} else return true;
}


/* 정보수정 저장 */
function editInfo() {
	var phone = $('#user_phone').val();
	
	if(phone==""||phone==null){
			alert('전화번호를 입력해주세요');
			$('#user_phone').focus();
			return false;
	}
	
	var data = $('#addForm').serialize();
	
	if(confirm("저장 하시겠습니까?")) {	
		$.ajax({
			url : '/mypage/editInfo',
			type : 'post',
			cache : false,
			data : data,
			dataType : 'json',
			success : function(res) {
				alert(res.ok?"개인정보 수정 성공":"개인정보 수정 실패");
				if(res.ok) location.href="/mypage/order";
			},
			error : function(xhr, status, err) {
				alert(status + ", " + err);
			}
		});
	}
}

/* 주소 api */
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("addr_reference").value = extraAddr;
            
            } else {
                document.getElementById("addr_reference").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('addr_zipcode').value = data.zonecode;
            document.getElementById("addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr_detail").focus();
        }
    }).open();
}