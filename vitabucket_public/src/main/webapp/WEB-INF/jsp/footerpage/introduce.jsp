<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vitabucket 소개</title>
</head>
<style>
html,body {	
	margin:0; 
	height: 100%; 
	min-width: 1016px; 
}

main{
	margin-bottom: 100px;
}

.menu,ul,li{
	list-style: none;
	}
	
	.intro-mainImg{
		min-width: 1000px;
    	margin : 0 auto;
	}
	.about-us{
		padding-top: 40px;
		display: flex;
		flex-direction: column;
		align-items: center;
		
	}
	.about-us-container{
		display: flex;
		align-items: center;
		justify-content: space-between;
		margin-top: 40px;
	}
	.about-us-items{
		width: 45%;
		display: flex;
		flex-direction: column;
		align-items: center;
		max-width: 300px;
		margin : 0 20px 20px;
		box-sizing: border-box;
		
	}
	
	.about-us-items>img{
		background: #ff9f43;
	    border-radius: 100px;
	    height: 64px;
	    width: 64px;
	    padding: 6px;
	    margin-bottom: 12px;
	    border: none;
	}
	
	.about-us-items-title{
		font-size: 20px;
	    font-style: normal;
	    font-weight: 700;
	    text-align: center;
	}
	.about-us-items-text{
		font-size: 16px;
	    font-style: normal;
	    font-weight: 400;
	 	margin-top: 10px;
		
	}

	.about-list{
		display: flex;
	    width: 100%;
	    flex-direction: column;
	    align-content: space-around;
	    justify-content: space-around;
	    align-items: flex-start;
	    flex-wrap: wrap;	
	}
	
	.about-us-top5{
		margin-top: 100px;
		display: flex;
		flex-direction: row;
		align-items: center;
	}
	
	.about-us-top5-contents{
		    margin: 30px 70px;
		text-align: left;
			display: flex;
		justify-content: flex-start;
		
	}

	.number{
	font-size: 44px;
    font-style: italic;
    color: #2e7d32;
    position: relative;
    bottom: 10px;
    text-align: end;
    width: 52px;
    font-weight: bold;
    margin-right: 24px;
	}
	.toptitle{
	font-size: 24px;
    font-style: normal;
    font-weight: 700;
		margin-top: 0;
	}
	
	.introduce-vita{
		display: flex;
	    flex-direction: column;
	    flex-wrap: nowrap;
	    justify-content: center;
	    align-items: center;
	}
	
	h1{
		margin: 40px auto;
		text-align: center;
		font-size: 30px;
		font-weight: 800;
	}
	.contact{
		display: flex;
    flex-direction: row;
    align-items: center;
    align-content: center;
    justify-content: space-around;
		
	}
	.map{
		margin-left: 50px;
	}
	.contact-text{
		display: flex;
    	flex-direction: column;
   	 	justify-content: center;
   	 	align-items: flex-start;
    	flex-wrap: nowrap;
        width: 400px;
        margin-left: 30px;
	}
	.co_addr{
		font-weight: 300;
    	font-size: 16px;
	}
	
	.co_tel{
		font-size: 23px;
    	line-height: 1.2;
    	font-weight: 300;
	}
	.co_tel2{
		font-weight: 900 !important;
    	line-height: 1 !important;
    	letter-spacing: -1px !important;
    	font-size: 20px;
	}
	
	.mail{
		display: flex;
		align-items: center;
		margin-top: 5px;
	}
	
	.co_email{
		font-weight: 300;
    	font-size: 18px;
	}
</style>

<body>
<%@ include file="/include/header.jsp"%>
<main>
	<div class="about-us">
		<div class="intro-mainImg">
			<img src="/images/introduce/it.jpg" style="margin: 0 auto;
    width: 1100px;">
		
		</div>
	</div>
	<section class="about-us">
		<h2 class="about-us-first">한눈에 보는 VitaBucket</h2>
		<div class="about-us-container">
			<div class="about-us-items">
				<img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images//static/i/about-us/lined-trial@3x.png">
				<p class="about-us-items-title">2만5천개 이상의 NOW정품</p>
				<p class="about-us-items-text">외부 판매자가 아닌 VitaBucket의
				직접판매 및 직접배송</p>
			</div>
			<div class="about-us-items">
				<img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images//static/i/about-us/lined-star@3x.png">
				<p class="about-us-items-title">고객의 솔직한 구매후기</p>
				<p class="about-us-items-text">실제 상품을 구매한 고객의 
				객관적이고 솔직한 구매후기</p>
			</div>
			<div class="about-us-items">
				<img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images//static/i/about-us/centers.svg">
				<p class="about-us-items-title">물류센터</p>
				<p class="about-us-items-text">안전과 신선도를 위해 냉난방 완비 및 GMP 또는 ISO 준수</p>
			</div>
		</div>
	</section>
	<section class="about-us-top5">
		<ul class="about-list">
		<li class="about-us-top5-contents">
			<span class="number">1.</span>
			<div>
			<h3 class="toptitle">NO 멤버쉽 요금, NO 연회비</h3>
			VitaBucket에서 판매 중인 제품 가격에는 숨겨진 멤버십 요금이나 연회비가 없습니다.<br>
			가장 합리적인 가격을 제공하므로 안심하고 쇼핑하십시오.
			</div>
		</li>
		<li class="about-us-top5-contents">
			<span class="number">2.</span>
			<div>
			<h3 class="toptitle">실제 구매 고객이 작성한 믿을 수 있는 구매후기</h3>
			VitaBucket에서 특정 제품을 실제로 주문한 고객만 해당 제품의 구매후기를 작성할 수 있습니다.<br>
			이를 통해 정직하고 투명한 구매후기를 보장하여 보다 현명한 구매를 도와드립니다.
			</div>
		</li>
		<li class="about-us-top5-contents">
			<span class="number">3.</span>
			<div>
			<h3 class="toptitle">신선도 유지 및 품질 보장</h3>
			 VitaBucket는 가장 신선한 상품을 소비자 여러분께 공급합니다.<br>
			 실제 매장에 진열된 제품처럼 대부분의 상품에서 유통기한 또는 소비기한을 확인하실 수 있습니다.
			</div>
		</li>
		<li class="about-us-top5-contents">
			<span class="number">4.</span>
			<div>
			<h3 class="toptitle">냉난방 시설을 완비한 청결 물류센터</h3>
			VitaBucket에서 판매되는 모든 상품은 iVitaBucket가 독점적으로 보관하고 직접 배송합니다.
			</div>
		</li>
		<li class="about-us-top5-contents">
			<span class="number">5.</span>
			<div>
			<h3 class="toptitle">연중무휴 제공되는 고객 서비스</h3>
			VitaBucket는 연중무휴 고객의 질문에 답하고 주문 관련 문제를 해결해 드립니다.
			</div>
		</li>
		</ul>
	</section>
	<section class="introduce-vita">
		<h1>Contact</h1>
		<div class="contact">
				
				<div class="map">
			
					<div id="daumRoughmapContainer1710475454569" class="root_daum_roughmap root_daum_roughmap_landing"></div>
					<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
					
					<script charset="UTF-8">
						new daum.roughmap.Lander({
							"timestamp" : "1710475454569",
							"key" : "2iiwg",
							"mapWidth" : "430",
							"mapHeight" : "300"
						}).render();
					</script>
								
				</div>
				<div class="contact-text">
					<h2 style="margin: 20px 0; font-size: 40px;">VitaBucket</h2>
						<p class="co_addr">${v.co_addr }</p>
						<div style="margin-top:20px">
							<div class="co_tel">
							Tel. <span class="co_tel2">${v.co_tel}</span>
							</div>
							<div class="co_tel">
							Fax. <span class="co_tel2">${v.co_fax}</span>
							</div>
						</div>
						<div class="mail">
							<img src="/images/introduce/mail.png" style="width: 20px; margin-right:5px;">
							<span class="co_email">${v.co_email}</span>
						</div>
				
				</div>
		</div>
	</section>
</main>
<%@ include file="/include/footer.jsp"%>
</body>

</html>