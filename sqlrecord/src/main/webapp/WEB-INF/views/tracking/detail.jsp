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
<h1 style="text-align: center;">운송장 상세</h1>
    <a href="#">메인으로가기</a>

    <div style="display: flex; justify-content: center;">
        <h1>운송장 번호</h1>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h1>215214124</h1>
    </div>
    <div class="row mb-3">
        <label for="inputEmail3" class="col-sm-2 col-form-label">위치</label>
        <div class="col-sm-10">
          <input type="email" class="form-control" id="inputEmail3" placeholder="위치">
        </div>
    </div>
    <!-- 배송 완료를 선택하고 입력을 누르면 배송 완료 체크박스가 사라진다.-->
    <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">
          배송완료
        </label>
    </div>
    <button type="button" class="btn btn-primary">입력</button>

    <br><br><br><br>

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
<%@ include file="/footer.jsp" %>
</body>
</html> 
