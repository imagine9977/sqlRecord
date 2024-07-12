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
    

    <form>
    	<input text="text" name="memberOrdersDetailNo" hidden="hidden"/>
        <div class="row mb-3">
          <label for="inputEmail3" class="col-sm-2 col-form-label">상품명</label>
          <div class="col-sm-10">
            <input type="productNo" class="form-control">
          </div>
        </div>
        <div class="row mb-3">
          <label for="inputPassword3" class="col-sm-2 col-form-label">주문수량</label>
          <div class="col-sm-10">
            <input type="password" class="form-control">
          </div>
        </div>
        <fieldset class="row mb-3">
          <legend class="col-form-label col-sm-2 pt-0">교환 / 환불</legend>
          <div class="col-sm-10">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="memberOrdersExType" id="gridRadios1" value="option1" checked>
              <label class="form-check-label" for="gridRadios1">
                환불
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="memberOrdersExType" id="gridRadios3" value="option3" >
              <label class="form-check-label" for="gridRadios3">
                교환
              </label>
            </div>
          </div>
        </fieldset>
        
        
        
        <!-- OD의 갯수 가 맥스 -->
        <!-- 보내야 할값 -->
          <div class="col-auto">
            <label class="visually-hidden" for="autoSizingSelect">수량</label>
            <select class="form-select" id="autoSizingSelect" name="memberOrdersExAmount">
              <option selected>Choose...</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </div>
          
          
          <!-- 보내야 할값 -->
          <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label">사유</label>
            <div class="col-sm-10">
              <input type="email" class="form-control" id="memberOrdersExReason" name="memberOrdersExReason">
            </div>
          </div>
          
        <button type="submit" class="btn btn-primary" id="exchange">교환 신청 하기</button>
        <button type="submit" class="btn btn-primary" id="refund">환불 신청 하기</button>
      </form>
      
</div>


<script>
	
	

</script>


<script src="${ hpath}/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 
