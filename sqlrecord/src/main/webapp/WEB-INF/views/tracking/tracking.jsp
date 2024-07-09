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
