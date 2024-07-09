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
<h1>주문 조회</h1>

    <h2>2024/06/24</h2>
    <br>
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
<script src="hpath/resources/js/forHeader.js?after1"></script>
<%@ include file="/footer.jsp" %>
</body>
</html> 
