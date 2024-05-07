<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vita Bucket</title>
<style>



/* <!-이미지 슬라이드 사용 시--> */

.playwrap {
    width: 100%;                                 
    overflow: hidden;
    position: relative;
}
.play {
    float: left;
    width: 100%;
    position: relative;
}
/* .play>a>img {
    width: 100%;
    height: auto;                                                        
} */



a:link {text-decoration: none;}
a:visited{
	color:rgb(51, 51, 51);
}
a{
	color: rgb(51, 51, 51);
}

	
.playwrap{
	margin-bottom: 70px;
}
.play{
	margin: 0 auto;
	width: 100%;
	height: 20rem;
	} 
	
main{
	text-align: center;
	}

.contents{
	display: flex;
	flex-direction: column;
	height: 100%;
	padding: 5px;
}
.product {
	flex: 1;
	margin: 0.5em;
	width: 1100px;
    margin: 0 auto;
    padding: 40px 0;
    overflow: hidden;
}
.product>span{
	display: flex;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: center;
    align-items: center;
    margin: 20px auto;
}

.product>span>a{
	font-weight: 500;
    font-size: 28px;
    line-height: 1.15;
}

.proinfo{
	padding-top:10px;
}

.proinfo>h4{
	line-height: 23px;
	font-weight: 400;
	overflow: hidden;
	text-align: left;
	margin-bottom:6px;
}

.procart{
	width: 100%;
	height: 35px;
	border: 1px solid rgb(221, 221, 221);
    background-color: transparent;
    border-radius: 4px;
}

.procart:hover{
	border-color:#FFA500;
}

.procart_item{
	display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    justify-content: center;
    align-items: center;
}

.proprice{
	font-size: 16px;
    font-weight: 800;
    line-height: 1.5;
    float: left;
}

/* 이미지슬라이드 시작 */
.swiper{
	display: flex;
	/* border : 1px solid gainsboro; */
	}
	
.swiper-wrapper{
	display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: center;
    align-items: center;
    

}
.swiper-slide{
   /*  border: 1px solid; */
    height: 500px;
	width: 300px;	
	}
/* 블로그애서 끌어온거 */
* {
  margin:0; 
  padding:0;
}
li {
  list-style: none;
}
.kind_wrap {
 /*  border:2px solid black;  */
  width:100%; 
  max-width:960px; 
  margin:40px auto; 
  position: relative;
  max-height: 400px;
}
.kind_wrap > .kind_slider {
  overflow: hidden;
}
.kind_wrap > .kind_slider .slider { 
  position: relative; 
  transition: 0.5s;
}
.kind_wrap > .kind_slider .slider li {
  float:left;
}
.kind_wrap > .kind_slider img {
  vertical-align: top;
}
.kind_wrap .arrow > a.prev {
  position: absolute; 
  left:-60px; 
  top:150px;
}

.kind_wrap .arrow > a.next {
  position: absolute; 
  right:-30px; 
  top:150px;
  

 
}

/* 이미지슬라이드 끝 */
	
.mainproimg{

	height: 288px;
}

.boardimg{

width: 288px;

}

.nowfood{

	width: 1100px;
	height: 400px;
	margin: 80px auto;
	background-color: #f5f5f5;
	display: flex;
}
.nowtext{
	margin-left: 40px;
	margin-top: 30px;
}

.nowtitle{
	box-sizing: border-box;
}

.nowtitle>p{
	width: 305px;
	padding: 10px 0px 20px 0px;
}

.nowtitle>h1{
	width: 175px;
	color: #f68703;
	font-size: 28px;
	
}

.nowlist{
	list-style: none;
}
.nowlistitem{
	display: flex;
    flex-wrap: nowrap;
    justify-content: flex-start;
    align-items: center;
  	margin: 10px;
}

.nowlistitem>span{
	font-size: 14px;
}
.checkicon{
	width: 40px;
	margin-right: 10px;
}

.nowImg>img{
	margin: 12px auto;
	padding-left:90px;
}
.news{
	width: 1100px;
    margin: 0 auto;
    padding: 40px 0;
	
}

.news h2{
	font-weight: 500;
    font-size: 28px;
    line-height: 1.15;
}

.boardwrap{
	height: 450px;
	background-color: #FDF4F9;
	border-radius: 8px;
}

.board{
	display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-items: center;
    justify-content: space-around;
    position: relative;
    height: 400px;
    top: 25px;
	
}
.boardproduct{
	border: 2px solid #EEAAD0;
    border-radius: 8px;
    padding: 10px;
    background-color: white;
}

.boardtitle{
	margin-bottom: 40px;
}
.boardtitle p{
	text-align: center;
    color: rgb(153, 153, 153);
    line-height: 1.45;
    margin-top: 3px;
}

.boardimg{
	position: relative;
    top: 3px;
}


</style>
<script 
	src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script>
<style>
</style>
<script>
$(document).ready(function() {
	const sliderGroups = document.querySelectorAll('.product');
	
	
	sliderGroups.forEach(function(sliderGroup) {
	
	  const kindWrap =  sliderGroup.querySelector('.kind_wrap');
	  const slider = kindWrap.querySelector('.slider');
	  const slideLis = slider.querySelectorAll('li')
	  const moveButton = kindWrap.querySelector('.arrow');
	  
	  
	  
	  /* ul 넓이 계산해 주기 */
	  const liWidth = slideLis[0].clientWidth * 3;
	  const sliderWidth = liWidth * (slideLis.length/3);
	  slider.style.width = sliderWidth+'px' ;
	
	  /* 리스너 설치하기 */
	  let currentIdx = 0; // 슬라이드 현재 번호
	  let translate = 0; // 슬라이드 위치 값
	  moveButton.addEventListener('click', moveSlide);
	
	  function moveSlide(event) {
	    event.preventDefault();
	    if (event.target.className === 'next') {
	      if (currentIdx <= slideLis.length -3) {
		        translate -= liWidth;
		        slider.style.transform = 'translateX('+translate+'px)';
		        currentIdx += 3;
	      }
	    } else if (event.target.className === 'prev') {
	        if (currentIdx !== 0) {
		          translate += liWidth;
		          slider.style.transform = 'translateX('+translate+'px)';
		          currentIdx -= 3;
	        }
	      }
	  }
	});
});

function getCookie(name) {
    var cookie = document.cookie;
    
    if (document.cookie != "") {
        var cookie_array = cookie.split("; ");
        for ( var index in cookie_array) {
            var cookie_name = cookie_array[index].split("=");
            
            if (cookie_name[0] == "vitapop") {
                return cookie_name[1];
            }
        }
    }
    return ;
}


function pop(){
	 var cookieCheck = getCookie("vitapop");
	 if (cookieCheck != "N"){
		 window.open("/vitabucket/popup", "pop", "width=400,height=430,history=no,resizable=no,status=no,scrollbars=yes,menubar=no")
	 }
	
	
}

</script>
</head>
<body onLoad="javascript:pop()">
<%@ include file="/include/header.jsp"%>
	<main>
		<div class="playwrap">
			<div class="play">
				<a href="/vitabucket/main"><img src="/images/main/play1.png" ></a>
				<a href="/vitabucket/main"><img src="/images/main/play2.jpg" ></a>
			</div>
			<div class="play">
				<a href="/vitabucket/main"><img src="/images/main/play2.jpg" ></a>
			</div>
		</div>
		<section class="wrapMain" style="padding-bottom: 100px;">
			<div class="contents">
				<div class="product">
					<span><a href="/product/best">Best Seller🏆</a>
						<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzJ2MzJIMHoiLz4KICAgICAgICA8cGF0aCBkPSJtMTAuOTUyIDIzLjM4NCAyLjA5NiAyLjE0NiAxMC4wNTUtOS44MjUtO
						S43MDEtMTAuMjc4LTIuMTgyIDIuMDYgNy42NzcgOC4xMzN6IiBmaWxsPSIjMzMzIiBmaWxsLXJ1bGU9Im5vbnplcm8iLz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="더보기 아이콘">
					</span>
					<div class="kind_wrap">
					  <div class="kind_slider">
					    <ul class="slider">
					  
					        <c:forEach var="pd" items="${pd_list}">
								<li><div class="swiper-slide" style="margin:auto 10px;">
									<a href="${path}detail/${pd.pro_key}">
										<img class="mainproimg" src="/images/product/${pd.imgs.main_img}">
									</a>
									<div class="cartbtn">
									  <form id="cartForm_${pd.pro_key}">
									<input type="hidden" name="pro_key" value="${pd.pro_key}">
									<input type="hidden" name="pro_cnt" value="1">
										<div class="procart_item" >
										<button class="procart" type="button" onclick="addCart('${pd.pro_key}')">
											
												<img src="/images/main/cart.png" style="width: 19px; margin-right: 6px">
												<span style="font-size: 16px">담기</span>
											
										</button>
										</div>
									</form>
									</div>
									<div class="proinfo">
										<h4>${pd.pro_name}</h4>
										<span class="proprice"><fmt:formatNumber value="${pd.pro_price}" maxFractionDigits="3"/>원</span>
									</div>
								</div></li>
							</c:forEach>
							
					    </ul>
					  </div>
					  <div class="arrow">
					      <a href="" class="prev"><img src="/images/main/prev.png" class="prev" style="width:35px;"></a>
					      <a href="" class="next"><img src="/images/main/next.png" class="next" style="width:35px;"></a>
					  </div>
					</div>
				</div>
				<div class="product">
					<span><a href="/product/all">New🌟</a>
					<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzJ2MzJIMHoiLz4KICAgICAgICA8cGF0aCBkPSJtMTAuOTUyIDIzLjM4NCAyLjA5NiAyLjE0NiAxMC4wNTUtOS44MjUtO
						S43MDEtMTAuMjc4LTIuMTgyIDIuMDYgNy42NzcgOC4xMzN6IiBmaWxsPSIjMzMzIiBmaWxsLXJ1bGU9Im5vbnplcm8iLz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="더보기 아이콘">
					</span>
					<div class="kind_wrap">
					  <div class="kind_slider">
					    <ul class="slider">
					        <c:forEach var="pd" items="${pd_list}">
								<li><div class="swiper-slide" style="margin:auto 10px;">
									<a href="${path}detail/${pd.pro_key}">
										<img class="mainproimg" src="/images/product/${pd.imgs.main_img}">
									</a>
									<div class="cartbtn">
									<form id="cartForm_${pd.pro_key}">
									<input type="hidden" name="pro_key" value="${pd.pro_key}">
									<input type="hidden" name="pro_cnt" value="1">
										<div class="procart_item" >
										<button class="procart" type="button" onclick="addCart('${pd.pro_key}')">
											
												<img src="/images/main/cart.png" style="width: 19px; margin-right: 6px">
												<span style="font-size: 16px">담기</span>
											
										</button>
										</div>
									</form>
									</div>
									<div class="proinfo">
										<h4>${pd.pro_name}</h4>
										<span class="proprice"><fmt:formatNumber value="${pd.pro_price}" maxFractionDigits="3"/>원</span>
									</div>
								</div></li>
							</c:forEach>
					    </ul>
					  </div>
					  <div class="arrow">
					      <a href="" class="prev"><img src="/images/main/prev.png" class="prev" style="width:35px;"></a>
					      <a href="" class="next"><img src="/images/main/next.png" class="next" style="width:35px;"></a>
					  </div>
					</div>
				</div>
				<div class="nowfood">
					<div class="nowtext">
						<div class="nowtitle">
							<h1>Now Foods</h1>
							<p>Live Happy. Live Healthy. Live NOW®.</p>
						</div>
						<div class="nowtitle2">
							<ul class="nowlist">
								<li class="nowlistitem">
									<img class="checkicon" src="https://s3.images-iherb.com/cms/images/iherb-exclusives-check-desktop.png">
									<span>
										모두가 건강한 삶을 살 수 있도록 가치 있는 상품 및 서비스를 제공합니다.
									</span>
								</li>
								<li class="nowlistitem">
									<img class="checkicon" src="https://s3.images-iherb.com/cms/images/iherb-exclusives-check-desktop.png">
									<span>
										깨끗한 성분으로 만들고 종합적인 검사와 우수 제조 과정을 거친 고품질의 천연 상품입니다.
									</span>
								</li>
								<li class="nowlistitem">
									<img class="checkicon" src="https://s3.images-iherb.com/cms/images/iherb-exclusives-check-desktop.png">
									<span>
										비타민, 미네랄, 허브, 고유 포뮬라가 함유된 고품질의 보충제로 가격이 합리적이고 효과적입니다.
									</span>
								</li>
								<li class="nowlistitem">
									<img class="checkicon" src="https://s3.images-iherb.com/cms/images/iherb-exclusives-check-desktop.png"
										>
									<span>
										천연 라이프스타일을 완성해 줄 유기농 뷰티 상품과 순도 검사 완료 품질 보증된 에센셜 오일입니다.
									</span>
								</li>
								<li class="nowlistitem">
									<img class="checkicon" src="https://s3.images-iherb.com/cms/images/iherb-exclusives-check-desktop.png"
										>
									<span>
										삶을 건강하고 편리하게 만들어줄 건강한 천연 식품, 유기농 스낵, 팬트리 필수품입니다.
									</span>
								</li>
							</ul>
						</div>
						</div>
						<div class="nowImg">
							<img src="/images/main/mainnowfood.jpg" style="width: 300px">
						</div>
					
				
				</div>
				
				<div class="news">
					<div class="boardtitle">
						<h2>MD 봄맞이 추천</h2>
						<p>기운내봄🌸 건강해봄🌸</p>
					</div>
					<div class="boardwrap">
						<div class="board">
							<div class="boardproduct">
								<a href="/product/detail/99"><img class="boardimg" src="/images/product/biotin_main.jpg"></a>
								<div class="cartbtn">
									<form id="cartForm">
										<input type="hidden" name="pro_key" value="99">
										<input type="hidden" name="pro_cnt" value="1">
										<div class="procart_item" >
										<button class="procart" type="button" onclick="addCart()">
											
												<img  class="boardimg" src="/images/main/cart.png" style="width: 19px; margin-right: 6px">
												<span style="font-size: 16px">담기</span>
											
										</button>
										</div>
									</form>
								</div>
								<div class="proinfo">
										<h4>비오틴, 5,000mcg, 베지 캡슐 120정</h4>
										<span class="proprice"><fmt:formatNumber value="12451" maxFractionDigits="3"/>원</span>
								</div>
							</div>
							<div class="boardproduct">
								<a href="/product/detail/11"><img class="boardimg" src="/images/product/vitaC_main.jpg"></a>
								<div class="cartbtn">
									<form id="cartForm">
										<input type="hidden" name="pro_key" value="11">
										<input type="hidden" name="pro_cnt" value="1">
										<div class="procart_item" >
										<button class="procart" type="button" onclick="addCart()">
											
												<img class="boardimg" src="/images/main/cart.png" style="width: 19px; margin-right: 6px">
												<span style="font-size: 16px">담기</span>
											
										</button>
										</div>
									</form>
								</div>
								<div class="proinfo">
										<h4>비타민C 크리스털, 454g(1lbs)</h4>
										<span class="proprice"><fmt:formatNumber value="20364" maxFractionDigits="3"/>원</span>
								</div>
							</div>
							<div class="boardproduct">
								<a href="/product/detail/68"><img class="boardimg" src="/images/product/calcium_main.jpg"></a>
								<div class="cartbtn">
									<form id="cartForm">
										<input type="hidden" name="pro_key" value="68">
										<input type="hidden" name="pro_cnt" value="1">
										<div class="procart_item" >
										<button class="procart" type="button" onclick="addCart()">
											
												<img class="boardimg" src="/images/main/cart.png" style="width: 19px; margin-right: 6px">
												<span style="font-size: 16px">담기</span>
											
										</button>
										</div>
									</form>
								</div>
								<div class="proinfo">
										<h4>칼슘 & 마그네슘, 100정</h4>
										<span class="proprice"><fmt:formatNumber value="10493" maxFractionDigits="3"/>원</span>
								</div>
							</div>
						
						</div>	
					</div>
				</div>
			</div>
		</section>
	</main>
<%@ include file="/include/footer.jsp"%>
</body>
<script type="text/javascript" src="/js/addCart.js"></script>

 <script>

        let currentSlide = 0;
        const slides = document.querySelectorAll('.play');
        const slideCount = slides.length;
 
        function showSlide(n) {
            slides.forEach(slide => slide.style.display = 'none');
            slides[n].style.display = 'block';
        }
 
        function nextSlide() {
            currentSlide = (currentSlide + 1) % slideCount;
            showSlide(currentSlide);
        }
 
        function prevSlide() {
            currentSlide = (currentSlide - 1 + slideCount) % slideCount;
            showSlide(currentSlide);
        }
 
        document.addEventListener('DOMContentLoaded', () => {
            showSlide(currentSlide);
            setInterval(nextSlide, 4000); // 3초마다 자동 슬라이드
        }); 
      
</script>

</html>