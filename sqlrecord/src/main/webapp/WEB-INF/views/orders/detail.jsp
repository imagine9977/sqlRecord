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
<h1>주문 조회</h1>

    <h2>2024/06/24</h2>
    <br><br><br>
    <c:forEach begin="0" end="${ newOdList.size() - 1 }" var="i">
    	<h2>${ newOdList[i].member.orders_date }</h2>
    	<br>
    	<table class="table">
    		<thead>
		          <tr>
		            <th scope="col"></th>
		            <th scope="col">사진</th>
		            <th scope="col">이름</th>
		            <th scope="col">수량</th>
		            <th scope="col">상태</th>
		            <th scope="col">교환/환불/취소</th>
		            <th scope="col">배송 현황</th>
		          </tr>
		        </thead>
		        <tbody>
    	<c:forEach items="${ newOdList[i] }"  var="item" varStatus="status2">
    				
    			  <tr>
		            <th scope="row">${ status2.count }</th>
		            <td>${item.product.product_photo1}</td>
		            <td>${item.product.product_name }</td>
		            <td>${item.orders_detail_amount }</td>
		            <td>${item.orders_detail_status }</td>
		            <td><button class="btn btn-secondary">교환</button></td>
		            <td><button class="btn btn-secondary">배송 현황 확인</button></td>
		          </tr>
    				
    			  
		        
		          
		 </c:forEach>
    			</tbody>
      		</table>
    </c:forEach>
    

    
      
      
      
      
      
      
      
</div>
<script src="${ hpath}/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 
