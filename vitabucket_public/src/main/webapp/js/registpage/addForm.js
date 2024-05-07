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
	
	function textId(){
		
		var uid=document.getElementById("user_id").value;
		document.getElementById("idcheck").innerHTML="6자 이상 16자 이하의 영문 혹은 영문+숫자 조합";
		
	}
	
	function textPwd(){
		
		var pwd=document.getElementById("user_pwd").value;
		document.getElementById("pwdcheck").innerHTML="영문,숫자,특수문자 모두 포함해야 허용하며 2개 이상 조합";
	}
	
	
	
	var idck=0;
	function idChecked(){
		
		var uid=$('#user_id').val();
		
		var obj={};
		obj.userid=uid;
		
		if(expId()){
			
			$.ajax({
				url:'/member/idcheck',
				type:'post',
				cache:false,
				data: obj,
				dataType:'json',
				success:function(res){
					if(res.result){
						alert('이미 가입된 아이디 입니다.');
						uid.value="";
						$('#user_id').focus();
					} else {
						alert('사용가능한 아이디 입니다.');
						$('#user_id').focus();
						idck=1;
					}				
				},
				error:function(xhr, status, err){
					alert(err);
				}
			});
		
		}
		
	}
	
	
	var emailck=0;
	function emailCheck(){
		
		var obj={};
		obj.useremail=$('#user_email').val();
		
		
		if(expEmail()){
		
			$.ajax({
				url:'/member/emailcheck',
				type:'post',
				cache:false,
				data: obj,
				dataType:'json',
				success:function(res){
					if(res.result){
						alert('이미 가입된 이메일 입니다.');
						$('#user_email').focus();
					} else {
						alert('사용가능한 이메일 입니다.');
						$('#user_email').focus();
						emailck=1;
					}				
				},
				error:function(xhr, status, err){
					alert(err);
				}
			});
		
		}
		
	}

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

	function cell(){
	
		var cellPhone = document.getElementById('user_phone');
		cellPhone.onkeyup = function(event){
		        event = event || window.event;
		        var _val = this.value.trim();
		        this.value = autoHypenPhone(_val);
		};
	}

	$(document).ready(function(){            
	    var now = new Date();
	    var year = now.getFullYear();
	    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
	    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
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
	    $("#year  > option[value="+year+"]").attr("selected", "true");        
	    $("#month  > option[value="+mon+"]").attr("selected", "true");    
	    $("#day  > option[value="+day+"]").attr("selected", "true");       
	  
	})
	
	function expId(){
		
		var pwd=$('#user_id').val();
		var ptest= /^[a-zA-Z0-9]{6,16}$/;
		
			if(ptest.test(pwd)==false){
				document.getElementById("idcheck").innerHTML="올바른 아이디 형식이 아닙니다";
				$('#user_id').focus();
				return false;
			} else return true;
	}
	
	function expPwd(){
		
		var pwd=$('#user_pwd').val();
		var ptest= /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{7,}$/;
		
			if(ptest.test(pwd)==false){
				document.getElementById("pwdcheck").innerHTML="올바른 비밀번호 형식이 아닙니다";
				$('#user_pwd').focus();
				return false;
			} else return true;
	}
	
	function expEmail(){
		
		var email=$('#user_email').val();
		var etest= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
			if(etest.test(email)==false){
				document.getElementById("emailcheck").innerHTML="올바른 이메일 형식이 아닙니다";
				email.focus();
				return false;
			} else return true;
	}
	
	var result=0;
	function signup(){
		
		var name = $('#name').val();
		var user_id = $('#user_id').val();
		var pwd=$('#user_pwd').val();
		var email=$('#user_email').val();
	
		if(name==""||name==null){
			alert('이름을 입력해주세요');
			$('#name').focus();
			return false;
		}
		

		if(user_id==""||user_id==null){
			alert('아이디를 입력해주세요');
			$('#user_id').focus();
			return false;
		}


		//아이디 유효성 검사
		if(idck==0) {
			result=1;
			return false; 
		}
		
		
		
		if(pwd==""||pwd==null){
			alert('비밀번호를 입력해주세요');
			$('#user_pwd').focus();
			return false;
		}
		
		//비밀번호 유효성 검사
		if(pwdck==0) {
			result=1;
			return false;
		}
		
		
		if(email==""||email==null){
			alert('이메일을 입력해주세요');
			$('#user_email').focus();
			return false;
		}
		
		//이메일 유효성 검사
		if(emailck==0) {
			result=1;
			return false;
		}
		
		
	}

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