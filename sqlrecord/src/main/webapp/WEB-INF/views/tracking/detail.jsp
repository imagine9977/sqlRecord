<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/views/head.jsp" %>

<title>Tracking</title>
<style>
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div id="main_content">
<%@ include file="/WEB-INF/views/searchHeader.jsp" %>
<h1 style="text-align: center;">운송장 상세</h1>
    <a href="${ hpath }/tracking/">메인으로가기</a>
	
    <div style="display: flex; justify-content: center;">
        <h1>운송장 번호</h1>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h1>${ trackingNum }</h1>
    </div>
    <div class="row mb-3">
        <label for="inputEmail3" class="col-sm-2 col-form-label">위치</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="trackingInfoWhere" placeholder="위치">
        </div>
    </div>
    <!-- 배송 완료를 선택하고 입력을 누르면 배송 완료 체크박스가 사라진다.-->
    <c:if test="${ status  ne '배송완료'}">
	    <div class="form-check">
	        <input class="form-check-input" type="checkbox" value="배송완료" id="trackingStatus">
	        <label class="form-check-label" for="flexCheckDefault">
	          배송완료
	        </label>
	    </div>
    <button type="button" class="btn btn-primary" id="insertTrackingInfo" onclick="insertTracking()">입력</button>
	 </c:if>
    <br><br><br><br>
	
	<c:if test="${ status eq '배송완료' }">
		<h2 style="text-align: center; ">${ status }</h2>
	</c:if>
    <table class="table">
        <thead>
          <tr>
            <th class="table-secondary" scope="col">운송장 번호</th>
            <th class="table-secondary" scope="col">위치</th>
            <th class="table-secondary" scope="col">시간</th>
          </tr>
        </thead>
        <tbody id="tbody">
        <c:forEach var="item" items="${ trackingList }" varStatus="status">
	        <tr>
	           <td>${ item.trackingNum }</td>
	           <td>${ item.trackingInfoWhere }</td>
	           <td>${ item.trackingInfoDate }</td>
	         </tr>
        </c:forEach>
        </tbody>
      </table>
</div>
<script>
	
	function insertTracking() {
		let str = "";
		let tbody = document.querySelector("#tbody");
		let trackingInfoWhere = document.querySelector("#trackingInfoWhere").value;
		let trackingStatus = document.querySelector("#trackingStatus").checked;
		console.log(trackingInfoWhere);
		console.log(trackingStatus);
		$.ajax({
			url: "${hpath}/trackingRest/insert",
			type: "get",
			data: { 
				trackingNum : "${trackingNum}",
				trackingInfoWhere : trackingInfoWhere,
				trackingStatus : trackingStatus
			} ,
			success: (result) => {
				
				str += "<tr><td>" + result.trackingNum 
								  + "</td><td>" + result.trackingInfoWhere 
								  + "</td><td>" + result.trackingInfoDate 
								  + 
					   "</td></tr>";
				
				
				
				
				if(trackingStatus) {
					let form_check = document.querySelector(".form-check");
					let insertTrackingInfo = document.querySelector("#insertTrackingInfo");
					form_check.style.display = 'none';
					insertTrackingInfo.style.display = 'none';
				}
				
				tbody.innerHTML += str;
				console.log(result);
				
				
				
			}
		})
	}
	

</script>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 
