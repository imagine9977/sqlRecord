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
    <br>
    
    
    <c:forEach begin="0" end="${ newOdList.size() - 1 }" var="i">
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
		            <td>${item.}</td>
		            <td>${item. }</td>
		            <td>배송완료</td>
		            <td><button class="btn btn-secondary">교환</button></td>
		            <td><button class="btn btn-secondary">배송 현황 확인</button></td>
		          </tr>
    				
    			  
		        
		          <tr>
		            <th scope="row">$</th>
		            <td>Mark</td>
		            <td>Otto</td>
		            <td>배송완료</td>
		            <td><button class="btn btn-secondary">교환</button></td>
		          </tr>
		          <tr>
		            <th scope="row">2</th>
		            <td>Jacob</td>
		            <td>Thornton</td>
		            <td>배송완료</td>
		            <td><button class="btn btn-secondary">환불</button></td>
		          </tr>
		          <tr>
		            <th scope="row">3</th>
		            <td colspan="2">Larry the Bird</td>
		            <td>배송완료</td>
		            <td><button class="btn btn-secondary">구매확정</button></td>
		          </tr>
		 </c:forEach>
    			</tbody>
      		</table>
    </c:forEach>
    

    <table class="table">
        <thead>
          <tr>
            <th scope="col"></th>
            <th scope="col">사진</th>
            <th scope="col">수량</th>
            <th scope="col">상태</th>
            <th scope="col">교환/환불/취소</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>배송완료</td>
            <td><button class="btn btn-secondary">교환</button></td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>배송완료</td>
            <td><button class="btn btn-secondary">환불</button></td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td colspan="2">Larry the Bird</td>
            <td>배송완료</td>
            <td><button class="btn btn-secondary">구매확정</button></td>
          </tr>
        </tbody>
      </table>
      
      
      
      
      
      
      
</div>
<script src="${ hpath}/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 
