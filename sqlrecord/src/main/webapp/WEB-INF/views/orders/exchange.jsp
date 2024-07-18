<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/views/head.jsp" %>
<title>Home</title>
<style>
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div id="main_content">
<%@ include file="/WEB-INF/views/searchHeader.jsp" %>

<h1>교환 환불 조회</h1>

    
    
    <c:forEach var="item" items="${ memberOrdersExList}">
    	<h2>${ item.memberOrdersExDate }</h2>
    	<br>
    	<table class="table">
	        <thead>
	          <tr>
	            <th scope="col"></th>
	            <c:if test="${ item.memberOrdersExType eq '교환' }">
	            	<th scope="col">교환될 상품</th>
	            </c:if>
	            <c:if test="${ item.memberOrdersExType eq '환불' }">
	            	<th scope="col">환불될 상품</th>
	            </c:if>
	            <th scope="col">수량</th>
	            <th scope="col">분류</th>
	            <th scope="col">상태</th>
	            <th scope="col">배송조회</th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <th scope="row">1</th>
	            <td style="width: 35%;">
	        			<img src="${ item.product.productPhotosList.get(0).productPhotosPath }" style="width: 30%;  padding: 10px; object-fit: cover;">
	      		</td>
	            <td>${ item.memberOrdersExAmount }</td>
	            <td>${ item.memberOrdersExType }</td>
	            <td>${ item.memberOrdersExStatus }</td>
	            <td><button class="btn btn-secondary">배송 조회</button></td>
	          </tr>
	        </tbody>
      	</table>
      </c:forEach>
      
</div>
<script src="${ hpath}/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 
