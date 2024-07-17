<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hpath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<script src="${hpath }/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${hpath }/resources/css/common.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/header.css?after1"/>
<link rel="stylesheet" href="${hpath }/resources/css/breadCrumb.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/searchHeader.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/mypage.css">


<meta charset="UTF-8">
<title></title>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/searchHeader.jsp" %>
	<div class="container">
        <header>
            <h1>마이 페이지</h1>
        </header>
        <section class="profile">
            <div class="profile-info">
                <img src="data:image/png;base64,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" alt="회원 이미지" class="profile-image">
                <div class="profile-details">
                    <p>000 회원님</p>
                    <button class="btn change-info"> <a href="${hpath}/member/infoEdit">정보 변경</a></button>
                </div>
            </div>
            <div class="profile-stats">
                <p>누적 포인트: <span>0원</span></p>
                <p>보유 포인트: <span>0원</span></p>
                <p>작성한 리뷰: <span>0개</span></p>
            </div>
        </section>
        <section class="order-status">
            <h2>주문 처리 현황</h2>
            <div class="status-grid">
                <div class="status-item">
                    <p>입금전</p>
                    <span>0</span>
                </div>
                <div class="status-item">
                    <p>배송 준비중</p>
                    <span>0</span>
                </div>
                <div class="status-item">
                    <p>배송중</p>
                    <span>0</span>
                </div>
                <div class="status-item">
                    <p>배송완료</p>
                    <span>0</span>
                </div>
            </div>
        </section>
        <section class="purchase-history">
            <h2>구매 현황</h2>
            <table>
                <thead>
                    <tr>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>상태</th>
                        <th>교환/환불/취소</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>상품명 1</td>
                        <td>1</td>
                        <td>취소</td>
                        <td><button class="btn cancel">취소</button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>상품명 2</td>
                        <td>1</td>
                        <td>배송조회</td>
                        <td><button class="btn tracking">배송조회</button></td>
                    </tr>
                </tbody>
            </table>
        </section>
    </div>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>