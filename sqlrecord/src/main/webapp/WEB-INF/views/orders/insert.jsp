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

<h1>교환 환불 신청</h1>
    <br><br>
    

    <form action="${ hpath }/orders/insertMemberOE" method="POST">
    	<input text="text" name="memberOrdersDetail.memberOrdersDetailNo" value="${ memberOrdersDetail.memberOrdersDetailNo }" hidden="hidden"/>
        <div class="row mb-3">
          <label for="inputEmail3" class="col-sm-2 col-form-label">상품명</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" value="${ memberOrdersDetail.product.productName }" readonly="readonly">
          </div>
        </div>
        <div class="row mb-3">
          <label for="inputPassword3" class="col-sm-2 col-form-label">주문수량</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" value="${ memberOrdersDetail.memberOrdersDetailAmount }" readonly="readonly">
          </div>
        </div>
        <fieldset class="row mb-3">
          <legend class="col-form-label col-sm-2 pt-0">교환 / 환불</legend>
          <div class="col-sm-10">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="memberOrdersExType" id="gridRadios1" onclick="checkgridRadios(this)" value="환불" checked>
              <label class="form-check-label" for="gridRadios1">
                환불
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="memberOrdersExType" id="gridRadios2" onclick="checkgridRadios(this)" value="교환" >
              <label class="form-check-label" for="gridRadios2">
                교환
              </label>
            </div>
          </div>
        </fieldset>
        
        
        
        <!-- OD의 갯수 가 맥스 -->
        <!-- 보내야 할값 -->
        <div style="height: 100px;">
          <div class="col-auto">
            <label class="visually-hidden" for="memberOrdersExAmount">수량</label>
            <select class="form-select" id="memberOrdersExAmount" name="memberOrdersExAmount">
              <option selected>Choose...</option>
              <c:forEach var="item" begin="1" end="${ memberOrdersDetail.memberOrdersDetailAmount }">
              	<option value="${ item }">${ item }</option>
              </c:forEach>
            </select>
          </div>
          
          <div class="col-auto" id="chooseEx">
            <label class="visually-hidden" for="productName">교환 상품 선택</label>
            <select class="form-select" id="productName" name="product.productNo">
              <option value="0" selected>Choose...</option>
              <c:forEach var="productItem" items="${ productList }" >
              	<option value="${ productItem.productNo }">${ productItem.productName }</option>
              </c:forEach>
            </select>
          </div>
          </div>
          
          <input type="text" name="memberOrdersExAddress" value="${ loginUser.addr1 }" hidden="hidden" />
          <input type="text" name="memberOrdersExAddress2" value="${ loginUser.addr2 }" hidden="hidden" />
          <input type="text" name="memberOrdersExPostcode" value="${ loginUser.postcode }" hidden="hidden" />
          
          
          <!-- 보내야 할값 -->
          <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label">사유</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="memberOrdersExReason" name="memberOrdersExReason">
            </div>
          </div>
          
        <button type="submit" class="btn btn-primary" id="exchange">교환 신청 하기</button>
        <button type="submit" class="btn btn-primary" id="refund">환불 신청 하기</button>
      </form>
      
</div>


<script>
	const gridRadios1 = document.querySelector("#gridRadios1");
	const gridRadios2 = document.querySelector("#gridRadios2");
	const chooseEx = document.querySelector("#chooseEx");
	
	const exchange = document.querySelector("#exchange");
	const refund = document.querySelector("#refund");
	
	if(gridRadios1.checked == true) {
		exchange.style.display = 'none';
		chooseEx.style.display = 'none';
		refund.style.display = 'block';
	}
	
	function checkgridRadios(e) {
		console.log(e.id);
		if(e.id == 'gridRadios1') {
			exchange.style.display = 'none';
			chooseEx.style.display = 'none';
			refund.style.display = 'block';
		} else if(e.id == 'gridRadios2') {
			exchange.style.display = 'block';
			chooseEx.style.display = 'block';
			refund.style.display = 'none';
		}
		
		
	}
	
	

</script>


<script src="${ hpath}/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 
