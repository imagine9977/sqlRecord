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

    <br><br><br>
    <c:forEach begin="0" end="${ newOdList.size() - 1 }" var="i">
    	<h2>${ newOdList[i][0].memberOrders.memberOrdersDate }</h2>
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
		            <td style="width: 35%;">
		            
	        			<img src="${item.product.productPhotos.photoPath }" style="width: 30%;  padding: 10px; object-fit: cover;">
	      			
	      			</td>
		            <td>${item.product.productName }</td>
		            <td>${item.memberOrdersDetailAmount }</td>
		            <td>${item.memberOrdersDetailStatus }</td>
		            
		            <c:choose>
		            	<c:when test="${item.memberOrdersDetailStatus eq '승인대기' }">
		            		<td><button class="btn btn-danger">주문취소</button></td>
		            	</c:when>
		            	<c:when test="${item.memberOrdersDetailStatus eq '배송완료' }">
		            		<td><button class="btn btn-warning">교환</button></td>
		            	</c:when>
		            	<c:otherwise></c:otherwise>
		            
		            
		            </c:choose>
		            
		            <c:choose>
		            	<c:when test="${ item.memberOrdersDetailStatus eq '배송중'  }">
		            		<td><button class="btn btn-secondary">배송 현황 확인</button></td>
		            	</c:when>
		            	<c:otherwise>
		            	
		            	</c:otherwise>
		            </c:choose>
		            
		          </tr>
    				
    			  
		        
		          
		 </c:forEach>
    			</tbody>
      		</table>
    </c:forEach>
    <br><br><br>

    
      
      
      
      
      
      
      
</div>
<script src="${ hpath}/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 
