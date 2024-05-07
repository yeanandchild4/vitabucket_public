<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
	<link rel="stylesheet" type="text/css" href="/css/mypage/order.css">
</head>
<body>

<%@ include file="/include/header.jsp"%>

<div class="mypage_container">
    <div class="mypage_menu">
        <jsp:include page="/include/mypage_menu.jsp">
        	<jsp:param value="order" name="page"/>
        </jsp:include>
    </div>
    <div class="mypage_contents">
        <div class="title_container">
            <div class="title">주문내역</div>
        </div>
        <div class="mypage_list">
            <ul>
                <c:forEach items="${list}" var="o">
                <li class="list_li">
                    <div class="list_1">
                        <img src="/images/product/${o.to_pro_img}" alt="#">
                        <div class="list_1_1">
                            <dl class="list_1_2">
                                <dt>주문날짜</dt>
                                <fmt:formatDate var="to_date" value="${o.to_date}" pattern="yyyy-MM-dd H시 mm분"/>
                                <dd>${to_date}</dd>
                            </dl>
                            <dl class="list_1_2">
                                <dt>상품명</dt>
                                <c:choose>
                                    <c:when test="${to_pro_cnt != 1}">
                                        <dd>${o.to_pro_name} 외 ${o.to_pro_cnt-1}개</dd>
                                        <span>총 ${o.to_pro_cnt}건 </span>
                                    </c:when>
                                    <c:otherwise>
                                        <dd>${o.to_pro_name}</dd>
                                    </c:otherwise>
                                </c:choose>
                            </dl>
                            <dl class="list_1_2">
                            	<fmt:formatNumber type="number" maxFractionDigits="3" value="${o.to_total}" var="to_total"/>
                                <dt>총 결제금액</dt>
                                <dd>${to_total} 원</dd>
                            </dl>
                        </div>
                    </div>   
                    <div class="list_2">
                        <span>
                            <c:choose>
                                <c:when test="${o.to_status eq 'paid'}">
                                    결제완료
                                </c:when>
                                <c:otherwise>
                                    ${o.to_status}
                                </c:otherwise>
                            </c:choose>
                        </span>
                        <p><a href="order/${o.to_key}">주문상세 ></a></p>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<%@ include file="/include/footer.jsp"%>
</body>
</html>