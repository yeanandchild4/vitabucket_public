$(document).ready(function() {
	$('#mainCates').hide();
    
    var isHovered = false;
    
    $('menu ul li:contains("카테고리")').hover(function(){
        isHovered = true;
        $('#mainCates').show();
    } /*function() {
        isHovered = false;
        $('#mainCates').hide();
    }*/);
    
     $("#mainCates>li>a").on("mouseover focus",function(){
        $(".mainmenu ul:visible").slideUp("fast");
        $(this).next().stop().slideDown("fast");
     });
    
    $(".mainmenu").on("mouseleave focus",function(){
        $(".mainmenu ul:visible").slideUp("fast");
        
    })
    
  

    $('#mainCates').hover(function() {
        isHovered = true;
    }, function() {
        isHovered = false;
        $('#mainCates').hide();
    });
    
    $('body').mouseup(function() {
        if (!isHovered) {
            $('#mainCates').hide();
        }
    });
    
    
});