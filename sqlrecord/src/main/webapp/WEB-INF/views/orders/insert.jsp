<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/head.jsp" %>
<title>Home</title>
<style>
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div id="main_content">
<%@ include file="/searchHeader.jsp" %>

<h1>교환 환불 신청</h1>
    <br><br>
    

    <form>
        <div class="row mb-3">
          <label for="inputEmail3" class="col-sm-2 col-form-label">상품명</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail3">
          </div>
        </div>
        <div class="row mb-3">
          <label for="inputPassword3" class="col-sm-2 col-form-label">교환 환불</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword3">
          </div>
        </div>
        <fieldset class="row mb-3">
          <legend class="col-form-label col-sm-2 pt-0">교환 / 환불</legend>
          <div class="col-sm-10">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
              <label class="form-check-label" for="gridRadios1">
                환불
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3" >
              <label class="form-check-label" for="gridRadios3">
                교환
              </label>
            </div>
          </div>
        </fieldset>
        <div class="col-auto">
            <label class="visually-hidden" for="autoSizingSelect">색상</label>
            <select class="form-select" id="autoSizingSelect">
              <option selected>Choose...</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div>
          <div class="col-auto">
            <label class="visually-hidden" for="autoSizingSelect">수량</label>
            <select class="form-select" id="autoSizingSelect">
              <option selected>Choose...</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div>
          <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label">사유</label>
            <div class="col-sm-10">
              <input type="email" class="form-control" id="inputEmail3">
            </div>
          </div>
        <button type="submit" class="btn btn-primary">교환 신청 하기</button>
        <button type="submit" class="btn btn-primary">환불 신청 하기</button>
      </form>
</div>
<script src="hpath/resources/js/forHeader.js?after1"></script>
<%@ include file="/footer.jsp" %>
</body>
</html> 
