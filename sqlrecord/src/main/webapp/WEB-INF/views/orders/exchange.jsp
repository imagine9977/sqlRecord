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
	            <c:choose>
		            	<c:when test="${ item.memberOrdersExStatus eq '상품준비중'  }">
		            		<td>
		            			<button data-toggle="modal" data-target="#exampleModal" class="btn btn-secondary" id="checkTracking" onclick="onClick('${ item.trackingNum}')">
		            				배송 현황
		            			</button>
		            		</td>
		            	</c:when>
		            	<c:when test="${ item.memberOrdersExStatus eq '배송중'  }">
		            		<td>
		            			<button data-toggle="modal" data-target="#exampleModal" class="btn btn-secondary" id="checkTracking" onclick="onClick('${ item.trackingNum}')">
		            				배송 현황
		            			</button>
		            		</td>
		            	</c:when>
		            	<c:when test="${item.memberOrdersExStatus eq '배송완료' }">
		            		<td>
		            			<button data-toggle="modal" data-target="#exampleModal" class="btn btn-secondary" id="checkTracking" onclick="onClick('${ item.trackingNum}')">
		            				배송 현황
		            			</button>
		            		</td>
		            	</c:when>
		            	<c:otherwise></c:otherwise>
		            </c:choose>
	          </tr>
	        </tbody>
      	</table>
      </c:forEach>
      
      
      <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">운송장 번호 : </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <table class="table">
		  <thead>
		    <tr>
		      <th scope="col"></th>
		      <th scope="col">위치</th>
		      <th scope="col">날짜</th>
		      <th scope="col">운송장 번호</th>
		    </tr>
		  </thead>
		  <tbody id="tbody">
		  </tbody>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
      
      
<script>
function onClick(e) {
	
	const tbody = document.querySelector("#tbody");
	const modal_title = document.querySelector(".modal-title");
	
	
	
	console.log(e);
	$.ajax({
		url: '${ hpath}/trackingRest/' + e,
		type: 'get',
		success: function(result) {
			let str = "";
			result.forEach((item , index) => {
				str += "<tr>" 
					+  "<th scope='row'>" + (index+1) + "</th>"
					+  "<td>" + item.trackingInfoWhere + "</td>"
					+  "<td>" + item.trackingInfoDate + "</td>"
					+  "<td>" + item.trackingNum + "</td>" 
					+  "</tr>";
			})
			tbody.innerHTML = str;
			modal_title.innerHTML = '운송장 번호 : \t' + e;
		}
	})
}
</script>
</div>
<script src="${ hpath}/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 
