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

<h2>민식 택배 - 배송중</h2>
<button type="button" class="btn btn-secondary" id="trackingReq">배송 요청된 운송장</button>
    <button type="button" class="btn btn-secondary" id="trackingReq">배송중 운송장</button>
    <button type="button" class="btn btn-secondary" id="trackingReq">배송 완료 운송장</button>
    <br><br>

    <label for="inputPassword5" class="form-label">운송장 관리</label>
    <input type="password" id="inputPassword5" class="form-control" aria-describedby="passwordHelpBlock" placeholder="운송장 번호를 입력하세요">
    <button type="button" class="btn btn-primary">운송장 검색</button>



<table class="table">
        <thead>
          <tr>
            <th class="table-secondary" scope="col">운송장 번호</th>
            <th class="table-secondary" scope="col">위치</th>
            <th class="table-secondary" scope="col">배송 상태</th>
            <th class="table-secondary" scope="col">시간</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
          </tr>
          <tr>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
          </tr>
          <tr>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
          </tr>
        </tbody>
      </table>







</div>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html> 
