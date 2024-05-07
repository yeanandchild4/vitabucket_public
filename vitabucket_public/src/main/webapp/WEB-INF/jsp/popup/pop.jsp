<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body{
	    margin: 0;
	    padding: 0;
	}

	.btn{
		display:flex;
		flex-direction: row;
		justify-content: space-evenly;
    	align-items: stretch;
	}
	.doclose{
		background-color: #FFA500;
    border: none;
    width: 60px;
    height: 20px;
    color: white;
    border-radius: 4px;
    font-size: 13px;
	}
	
</style>
<script>
function setCookie(name, value, expiredays) {
    var date = new Date();
    date.setDate(date.getDate() + expiredays);
    document.cookie = escape(name) + "=" + escape(value) + "; expires=" + date.toUTCString();
}


function closePopup() {
    if (document.getElementById("check").value) {
        setCookie("vitapop", "N", 1);
        window.close();
    } 
}  

</script>
</head>
<body>
<main>
<div id="test">
	<img src="/images/main/popimg.jpg" style="width:400px">
</div>
<div class="btn">
	<div>
		<input type="checkbox" id="check">
	    <label for="chkbox">오늘 하루동안 보지 않기</label>
	</div>
	<div id="close">
		<button class="doclose" type="button" onclick="closePopup()">닫기</button>
	</div>
</div>
</main>
</body>
</html>