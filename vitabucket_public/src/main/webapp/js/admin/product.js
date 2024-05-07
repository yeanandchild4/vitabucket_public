
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
}

/*카테고리 선택 */
function onCatChanged() {
	var obj;
		if ($('#searchForm').length) {
		    obj = $('#searchForm').serialize();
		} else if ($('#prod_form').length) {
		    obj = $('#prod_form').serialize();
		}  else if ($('#prod_editform').length) {
		    obj = $('#prod_editform').serialize();
		} 
    obj.cat = $('select[name=main_cat_key]').val();
    $.ajax({
        url: '/vitabucket/admin/prod/catelist',
        type: 'post',
        cache: false,
        data: obj,
        dataType: 'json',
        success: function(res) {
            var $key = $('[name=sub_cat_key]');    
            $key.empty();
            
            var option = '<option selected disabled>=하위카테고리선택=</option>';
            $key.append(option);
            
            for (var i = 0; i < res.cslist.length; i++) {
				var cs = (parseInt(res.cslist[i].main_cat_key) * 1000)+i+1;
                let opt = "<option value='" + cs + "'>"+cs+"&nbsp;"+res.cslist[i].sub_cat_name + "</option>";
                $key.append(opt);
            }
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

//상품검색
function pro_search() {
    var cat = $('select[name=search]').val();
    var key = $('input[name=search_key]').val();
    var mainCat = $('select[name=main_cat_key]').val();
    var subCat = $('select[name=sub_cat_key]').val();

    if (key == "" && cat == "선택하세요" && mainCat == null && subCat == null) {
        alert('검색어나 카테고리를 선택하세요.');
    } else {
        $('#searchForm').submit();
    }
}


//상품정보 저장 --에디터에서 넘어온 정보로 저장
function submitContents(elClickedObj) {
    // 기존 로직 추가
    var formData = new FormData($('#prod_form')[0]);
    if($('input').val() === ''||$('textarea').val() === ''){
        alert('필수 입력 필드를 모두 입력해주세요.');
        return;
    }
    if ($('[name="main_cat_key"]').val() === '' ||$('[name="sub_cat_key"]').val() === '' ) {
        alert('등록할 카테고리를 선택해 주세요');
        return;
    }        
    if($('[name="main_img"]').val() === '' || $('[name="img1"]').val() === '' || $('[name="img2"]').val() === ''){
		 alert('필수 이미지 등록해 주세요');
        return;
	}
    
    if (confirm('등록하시겠습니까?')) {
        $.ajax({
            url: "/vitabucket/admin/prod/add",
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            data: formData,
            timeout: 600000,
            dataType: "json",
            success: function(res) {
                alert(res.proAdded ? '등록성공' : '등록실패');
                location.href = "/vitabucket/admin/prod";
            },
            error: function(request, status, error) {
                alert('fail');
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
}
    
    
//상품 수정 카테고리 --상품수정 페이지 넘어갈때, 카테고리 기존 DB정보 불러오기 
function onCat() {
    var obj;
    if ($('#prod_editform').length) {
        obj = $('#prod_editform').serialize();
    } 
    obj.cat = $('select[name=main_cat_key] option:selected').val();
    
    $.ajax({
        url: '/vitabucket/admin/prod/catelist',
        type: 'post',
        cache: false,
        data: obj,
        dataType: 'json',
        success: function(res) {
            var $key = $('[name=sub_cat_key]');    
            $key.empty();
            
            if ($key.is(':empty')) {
                $key.append('<option disabled selected>=하위카테고리선택=</option>');
            } else {
                var option2 = $key.val(); // 이 부분은 서버에서 받은 값을 사용해야 합니다.
                $key.append('<option disabled>=하위카테고리선택=</option>');
                $key.append('<option selected value="' + option2 + '">' + option2 + '</option>');
            }
            
            var sele_cs = $('select[name=sub_cat_key]').val();
            for (var i = 0; i < res.cslist.length; i++) {
			    var cs = (parseInt(res.cslist[i].main_cat_key) * 1000) + i + 1;
			    if (sele_cs != cs) { // 이미 선택된 값과 새로운 옵션의 값이 다른 경우에만 추가
			        let opt = "<option value='" + cs + "'>" + cs + "&nbsp;" + res.cslist[i].sub_cat_name + "</option>";
			        $key.append(opt);
			    }
			}
        },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}



    
//상품정보 수정저장 --에디터에서 넘어온 정보로 수정 저장
function updated(elClickedObj) {
    var formData = new FormData($('#prod_editform')[0]);
    var pro_key = $('input[name=pro_key]').val();
    var pro_img_key = $('input[name=pro_img_key]').val();
    if (confirm('수정하시겠습니까?')) {
        $.ajax({
            url: "/vitabucket/admin/prod/edit/"+pro_key,
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            data: formData,
            timeout: 600000,
            dataType: "json",
            success: function(res) {
                alert(res.proUpdated ? '수정성공' : '수정실패');
                location.href = "/vitabucket/admin/prod/detail/"+pro_key;
            },
            error: function(request, status, error) {
                alert('fail');
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
}

//첨부파일 이미지 보이기  -- 첨부파일에서 이미지파일의 이미지가 보이게 해줌
function previewImage(event, previewClass) {
    var input = event.target;
    var previews = $('.' + previewClass);
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            previews.each(function(index, element) {
                $(element).css('display', 'block');
                $(element).attr('src', e.target.result);
                $(element).siblings('input').css('padding', '1em 0'); // 부모 요소의 padding을 0으로 설정
                $(element).siblings('span').css('display', 'none');
            });
        }
        reader.readAsDataURL(input.files[0]);
    } else {
        previews.css('display', 'none');
    }
}

//상품목록 삭제 --하나의 삭제 버튼시 삭제
function pro_del(pro_key){
	var del={};
	del.pro_key = pro_key;

	if(confirm('삭제하시겠습니까?')){
		$.ajax({
		   url: "/vitabucket/admin/prod/dele/"+pro_key,
	       method: "post",           
	       data: del,
	       dataType: 'json',    
	       cache: false,
	       success: function (res) {
	    	   if(res.proDel) {
	              alert('삭제성공');
	              location.href="/vitabucket/admin/prod";
	           }else alert('삭제실패');
	       },
        error: function(request, status, error) {
            alert('fail');
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
		});
	}
}

//상품 전체선택 -- 상품목록에서 목록의 전체를 선택함
function selectAll() {
    var checked = $('#allCk').is(':checked');
    if (checked) $('input:checkbox').prop('checked', true);
    else $('input:checkbox').prop('checked', false);
    
    updateButton(); // 선택된 체크박스 갯수 업데이트
}

//상품목록 --상품목록 페이지 띄워질때, 대기하는 부분, 체크박스 선택시 선택갯수 변경
var numSelected = 0; // 전역 변수로 선언

$(document).ready(function() { 
    updateButton(); // 페이지 로드 시 호출
    $('input[name="check_key"]').change(function() { // 체크박스 변경 시 호출
        updateButton();
    });
});


//선택한 체크박스 갯수 변경하기
function updateButton() {
    var checkedBox = $('input[name="check_key"]:checked'); // 선택된 체크박스 가져오기
    numSelected = checkedBox.length;
    // 버튼 텍스트 업데이트
    $('#selecDelBtn').text('선택삭제(' + numSelected + ')');
}

//선택한 상품목록삭제  -- 위에서 선택한 체크박스의 갯수를 가져와 삭제가 진행됨
function selec_Del() {       
    if (numSelected > 0) { // 선택된 체크박스가 있는 경우에만 삭제 진행
        if (confirm(numSelected+'개의 선택한 상품을 삭제하시겠습니까?')) {
            var pro_keys = []; // 선택된 상품들의 pro_key 목록을 담을 배열
            checkedBox.each(function() {
                pro_keys.push(parseInt($(this).val())); // 선택된 체크박스의 값(pro_key)을 배열에 추가
            });

            // 선택된 상품들의 pro_key 목록을 서버에 전달하여 삭제 요청
            $.ajax({
                url: "/vitabucket/admin/prod/dele_sele",
                method: "post",
                data:checkedBox,
                dataType: 'json',
                cache: false,
                success: function(res) {
                    if (res.pro_selec_del) {
                        alert('선택한 상품들이 삭제되었습니다.');
                        location.href="/vitabucket/admin/prod";
                    } else {
                        alert('삭제 실패');
                    }
                },
                error: function(request, status, error) {
                    alert('fail');
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }
    }else alert('삭제할 상품 선택하세요');  
}
