//검색
function search(){
	var cat = $('select[name=search]').val();
	var key = $('input[name=search_key]').val();
	
	if(key==""){
		alert('필수로 입력해야 합니다.');					
	}else{			
		if(cat=='선택하세요') return;
		$('#searchForm').submit();
	}	
}



$(function(){
    $("#scrollbtn #top").css('visibility', 'hidden');
    
    if ($(document).height() < 1200) {
        $("#scrollbtn").hide();
    }

    // 스크롤 최하단시 탑아이콘 출력 및 bottom 버튼 처리
    $(window).scroll(function() {
        $("#scrollbtn #top").css('visibility', 'visible');
        if ($(window).height() < $(document).height()) {
            if ($(window).scrollTop() >= 1) {
                $("#scrollbtn #top").css('visibility', 'visible');
            } else {                
                $("#scrollbtn #top").css('visibility', 'hidden');
            }
        }
        
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            //$("#scrollbtn #bottom").css('visibility', 'hidden');
            $("#scrollbtn #top").css('visibility', 'visible');
        } else {
            $("#scrollbtn #bottom").css('visibility', 'visible');
        }
    });

    // 탑버튼 클릭
    $(document).on("click", "#top", function() {
        $('html, body').animate({scrollTop: 0}, 'fast');
    });

    // bottom 버튼 클릭 (현재 스크롤 위치에서 300px 아래로 스크롤)
	$(document).on("click", "#bottom", function(e) {
		e.preventDefault();
	    $('html, body').animate({scrollTop: $(window).scrollTop()+1000},'fast');
	});
	



    /*모바일 width:639px 미만 _ 메뉴*/
    var menuVisible = false;
    $("#menu_img").on({
        "click" : function() {
            if (menuVisible) {
                $("#mobile .menu ul").hide();
                menuVisible = false;
            } else {
                $("#mobile .menu ul").show();
                menuVisible = true;
            }
         }, 
         "mouseout" : function() {
            if (!menuVisible) {
                $(".menu ul").hide();
            }
         }
         
    });
    
    // 전체 문서에 클릭 이벤트 핸들러 추가
    $(document).on("click", function(event) {
        // 클릭한 요소가 메뉴나 이미지 내부에 있는지 확인
        if (!$(event.target).closest('#mobile .menu').length && !$(event.target).is('#menu_img')) {
            // 메뉴 영역 외의 클릭이면 메뉴 숨김
            $("#mobile .menu ul").hide();
            menuVisible = false;
        }
    });
});
