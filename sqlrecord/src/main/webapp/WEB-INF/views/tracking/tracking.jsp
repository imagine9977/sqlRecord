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

<h2>민식 택배 - <strong id="what">배송중</strong></h2>
	<button type="button" class="btn btn-secondary" id="trackingReq" onclick="onClick('배송요청')">배송 요청된 운송장</button>
    <button type="button" class="btn btn-secondary" id="trackingReq" onclick="onClick('배송중')">배송중 운송장</button>
    <button type="button" class="btn btn-secondary" id="trackingReq" onclick="onClick('배송완료')">배송 완료 운송장</button>
    <br><br>

    <label for="inputPassword5" class="form-label">운송장 관리</label>
    <input type="password" id="inputPassword5" class="form-control" aria-describedby="passwordHelpBlock" placeholder="운송장 번호를 입력하세요">
    <button type="button" class="btn btn-primary">운송장 검색</button>



	<table class="table">
        <thead>
          <tr>
            <th class="table-secondary" scope="col">운송장 번호</th>
          </tr>
        </thead>
        <tbody id="trackTable">
        <c:forEach var="item" items="${ trackingMap }">
          <tr>
            <td><a href="${ hpath }/tracking/${ item.value}"><c:out value="${item.value}"></c:out></a></td>
          </tr>        
        </c:forEach>
        </tbody>
      </table>






<script>
	const trackTable = document.querySelector("#trackTable");
	const what = document.querySelector("#what");
	function onClick(param) {
		what.innerText = param;
		let str = "";
		$.ajax({
			url: "${hpath}/trackingRest/divide",
			type: "get",
			data: {param } ,
			success: (result) => {
				str += "<tr>";
				result.forEach((item) => str += "<td><a href='${hpath}/tracking/"+ item.trackingNum +"'>"+item.trackingNum+"</a></td>");
				str += "</tr>";
				trackTable.innerHTML = str;
				console.log(result);
				console.log(trackTable.innerHTML);
			}
		})
	}
		

</script>

</div>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html> 
