<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
    body {
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
        height: auto;
    }
    .banner {
        position: relative;
        text-align: center;
        color: white;
    }
    .banner img {
        width: 100%;
        height: 710px;
    }
    .banner-text {
        position: absolute;
        top: 85%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 36px;
        font-weight: bold;
    }
    .product-list {
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .product-item {
        background-color: #fff;
        margin-bottom: 20px;
        box-sizing: border-box;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .product-item img {
        width: 100%;
        height: auto;
        background-color: #ccc;
    }
    .product-item h3 {
        font-size: 18px;
        margin: 10px 0;
    }
    .product-item p {
        color: #888;
    }
    .pagination {
        text-align: center;
        margin: 20px 0;
    }
    .pagination a {
        margin: 0 5px;
        text-decoration: none;
        color: #333;
    }
    .pagination a.active {
        font-weight: bold;
    }

    .sideNlist {
        width: 1500px;
        min-width: 1200px;
        height: auto;
        margin: 0 auto;
        margin-top: 50px;
        margin-bottom: 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .underBanner {
        width: 1500px;
        height: 130px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin: 0 auto;
    }
    .priceSidebar {
        width: 20%;
        position: -webkit-sticky;
        position: sticky;
        top: -2px;
    }
    .container {
        width: 80%;
        min-width: 700px;
        height: auto;
    }
    .product-list {
        width: 1100px;
        min-width: 800px;
        height: auto;
        display: flex;
    }
    .product-item {
        width: 300px;
        min-width: 300px;
        height: 434px;
        min-height: 434px;
    }
    .product-img {
        width: 300px;
        height: 300px;
        min-width: 300px;
        min-height: 300px;
        border: 1px solid #000;
    }
    .priceSidebar form div {
        display: flex;
        flex-direction: column;
    }
    .priceSidebar form div label {
        display: flex;
        align-items: center;
        font-size: 12px;
        color: #929292;
    }
    .priceSidebar form div input[type="checkbox"] {
        width: 20px;
        height: 20px;
        margin-right: 5px;
        border: 1px solid #000;
        border-radius: 0;
    }
    .dropdown select {
        width: 70px;
        height: 30px;
        border: 1px solid #000;
        font-size: 15px;
        text-align: center;
        padding-left: 0;
        padding-right: 0;
    }
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

    <!-- 이미지 배너 -->
    <div class="banner">
        <img src="path/to/your/banner/image.jpg" alt="Banner Image">
        <div class="banner-text">
            ${tag}
            <div>${productCount} Products</div>
        </div>
    </div>
    
    <div class="underBanner">
        <!-- 브레드크럼 -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb" style="display: flex;">
                <li class="breadcrumb-item"><a href="${hpath}" style="color: black; font-weight: bold;">HOME</a></li>
                <span style="color: #929292;">&nbsp;>&nbsp;</span>
                <li class="breadcrumb-item active" aria-current="page"><a href="#" style="color: #929292;">${tag}'태그'</a></li>
            </ol>
        </nav>
        <!-- 드롭다운(페이징) -->
        <div class="dropdown">
            <label for="itemsPerPage">한 번에 보기&nbsp;:&nbsp;</label>
            <select id="itemsPerPage" name="itemsPerPage">
                <option value="12">12</option>
                <option value="18">18</option>
                <option value="24">24</option>
            </select>
        </div>
    </div>
    <hr>
    
    <div class="sideNlist">
        <!-- 사이드바(가격체크박스) -->
        <div class="priceSidebar">
            <h4>PRICE</h4><br>
            <hr><br>
            <form action="/list" method="get">
                <div>
                    <label><input type="checkbox" name="tags" id="tag1" value="price1">&nbsp;0 ₩ - 100,000 ₩</label><br>
                    <label><input type="checkbox" name="tags" id="tag2" value="price2">&nbsp;100,000 ₩ - 200,000 ₩</label><br>
                    <label><input type="checkbox" name="tags" id="tag3" value="price3">&nbsp;200,000 ₩ - 300,000 ₩</label><br>
                    <label><input type="checkbox" name="tags" id="tag4" value="price4">&nbsp;300,000 ₩ - 400,000 ₩</label><br>
                    <label><input type="checkbox" name="tags" id="tag5" value="price5">&nbsp;400,000 ₩ - 500,000 ₩</label><br>
                    <label><input type="checkbox" name="tags" id="tag6" value="price6">&nbsp;500,000 ₩ - 600,000 ₩</label><br>
                    <label><input type="checkbox" name="tags" id="tag7" value="price7">&nbsp;600,000 ₩ - </label>
                </div>
            </form>
        </div>
        <div class="container">
            <!-- 상품 리스트 -->   
            <div id="product-list">
                <c:forEach var="product" items="${productList}">
                    <!-- Sample Product Item -->
                    <div class="product-item">
                        <img class="product-img" src="${hpath}/resources/images/${product.img1}" alt="${product.name}">
                        <div>
                            <a href="${hpath}/getProduct.do?pno=${product.pno}">
                                <h3>${product.name}<h3>
                                <h3>${product.price}₩</h3>
                            </a>
                        </div>
                    </div>
                </c:forEach>
                
                <!-- 더미 데이터 추가 -->
                <div class="product-item">
                    <img class="product-img" src="${hpath}/resources/images/dummy1.jpg" alt="Dummy Product 1">
                    <div>
                        <a href="${hpath}/getProduct.do?pno=101">
                            <h3>Vintage Turntable<h3>
                            <h3>299,000₩</h3>
                        </a>
                    </div>
                </div>
                <div class="product-item">
                    <img class="product-img" src="${hpath}/resources/images/dummy2.jpg" alt="Dummy Product 2">
                    <div>
                        <a href="${hpath}/getProduct.do?pno=102">
                            <h3>Classic Radio<h3>
                            <h3>150,000₩</h3>
                        </a>
                    </div>
                </div>
                <div class="product-item">
                    <img class="product-img" src="${hpath}/resources/images/dummy3.jpg" alt="Dummy Product 3">
                    <div>
                        <a href="${hpath}/getProduct.do?pno=103">
                            <h3>Retro Speaker<h3>
                            <h3>200,000₩</h3>
                        </a>
                    </div>
                </div>
                <div class="product-item">
                    <img class="product-img" src="${hpath}/resources/images/dummy4.jpg" alt="Dummy Product 4">
                    <div>
                        <a href="${hpath}/getProduct.do?pno=104">
                            <h3>Vinyl Record Player<h3>
                            <h3>350,000₩</h3>
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- 페이지네이션 -->
            <div class="pagination">
                <c:if test="${totalPages > 1}">
                    <hr>
                    <c:if test="${currentPage > 1}">
                        <a href="?page=${currentPage - 1}">&laquo; PREV</a>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="?page=${currentPage + 1}">NEXT &raquo;</a>
                    </c:if>
                    <hr>
                </c:if>
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