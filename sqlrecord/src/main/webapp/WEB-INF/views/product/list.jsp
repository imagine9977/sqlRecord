<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="hpath" value="${pageContext.request.contextPath}" />
<html>
<head>
<%@ include file="/WEB-INF/views/head.jsp" %>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="${hpath}/resources/css/slick/slick.min.css?after1"/>
<link rel="stylesheet" href="${hpath}/resources/css/slick/slick-theme.min.css?after1"/>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
   
</style>
<script>
$(document).ready(function() {
    $('#scispace-extension-root').remove();
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="main-content">
<%@ include file="/WEB-INF/views/searchHeader.jsp" %>
<div style="width: 100%; height: 100%">
    <div class="container text-center">
	  <div class="row row-cols-3">
	  
	  
	  <c:choose>
	  	<c:when test="${ not empty productList  }">
		  <c:forEach var="item" items="${ productList }">
		    <div class="col">
		    	<img src="${ item.productPhotosList.get(0).productPhotosPath }"/>
		    	<p><a href="${ hpath }/productFor/detail/${ item.productNo}">${ item.productName}</a></p>
		    	<p>${ item.productPrice }</p>
		    </div>
		  </c:forEach>  
		 </c:when>
		 <c:otherwise>
		 	<h2>상품이 없습니다.</h2>
		 
		 
		 </c:otherwise>
	  </c:choose>  
	    
	  </div>
	</div>
	</div>
</div>
<script>
$(document).ready(function() {
    $('input[type="checkbox"]').change(function() {
        var selectedPrices = $('input[type="checkbox"]:checked').map(function() {
            return $(this).val();
        }).get();

        if (selectedPrices.length === 0) {
            $('.product-item').show(); // 아무 체크박스도 선택되지 않은 경우 모든 상품 보이기
        } else {
            $('.product-item').hide(); // 모든 상품 숨기기
            selectedPrices.forEach(function(selectedPrice) {
                $('.product-item').each(function() {
                    var productPrice = parseInt($(this).find('h3:last').text().replace('₩', '').trim());
                    var priceRange = selectedPrice.split('-');
                    var minPrice = parseInt(priceRange[0].replace('₩', '').trim());
                    var maxPrice = parseInt(priceRange[1].replace('₩', '').trim());
                    if (productPrice >= minPrice && productPrice <= maxPrice) {
                        $(this).show(); // 선택된 범위 내에 있는 상품 보이기
                    }
                });
            });
        }
    });
});
</script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>