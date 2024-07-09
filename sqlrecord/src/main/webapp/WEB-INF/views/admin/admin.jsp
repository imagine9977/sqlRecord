<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="hpath" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/bootstrap.jsp" %>
<%@ include file="/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>관리자 페이지</title>
<style>
.tab-bar {
    width: 100%;
    height: 60px;
    justify-content: center;
    align-items: center;
    display: flex;
    background-color: white;
    border-bottom: 1px solid #2f4f4f;
}
.tab-btnBox {
    width: 80%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.tab-btnItem {
    width: 10%;
    height: 100%;
    min-width: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    cursor: pointer;
    border-right: 1px solid #929292;
    border-left: 1px solid #929292;
}
.tab-btnItem:not(:last-child) { border-right: none; }
.tab-btnItem:first-child { border-left: 1px solid #929292; }
.tab-btnItem:last-child { border-right: 1px solid #929292; }

.tab-btnItem a {
    color: black;
    text-decoration: none;
}
.mainBox {
    width: 1500px;
    min-width: 1200px;
    height: auto;
    border: 1px solid black;
    margin: 0 auto;
    padding: 10px;
    margin-top: 50px;
    margin-bottom: 50px;
    display: flex;
    justify-content: space-between;
}
.manageBox {
    width: 48%;
    height: auto;
    border: 1px solid black;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px;
}
.manageBox canvas {
    width: 100% !important;
    height: auto !important;
}
.active {
    background-color: #2f4f4f;
}
.tab-btnItem.active a {
    color: white;
}
.tab-content {
    display: none;
    width: 100%;
}
.sidebar {
    display: block;
    width : 13%;
    height: auto;
    border: 1px solid black;
    padding: 10px;
    text-align:left;
}
.sidebar-element p {
    font-size: 17px;
    padding: 0.5rem 0px;
}
.sidebar a {
    color: inherit;
    text-decoration: none;
}

.sidebar a:hover, .sidebar a:active, .sidebar a:focus {
    color: inherit;
    text-decoration: none;
    font-weight:bold;
}
.sidebar h2 {
    padding-bottom: 0.5rem;
}
.tab-content {
    margin : auto;
    text-align : center;
}
#content-area {
    width: 85%;
    float: right;
    padding: 20px;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

<!-- 상단 탭 -->
<div class="tab-bar">
    <ul class="tab-btnBox">
        <li class="tab-btnItem" data-tab="product"><a href="#">상품</a></li>
        <li class="tab-btnItem" data-tab="order"><a href="#">주문</a></li>
        <li class="tab-btnItem" data-tab="member"><a href="#">회원</a></li>
        <li class="tab-btnItem" data-tab="review"><a href="#">리뷰</a></li>
        <li class="tab-btnItem" data-tab="analytics"><a href="#">통계·분석</a></li>
        <li class="tab-btnItem" data-tab="notice"><a href="#">공지사항</a></li>
        <li class="tab-btnItem" data-tab="qna"><a href="#">고객지원</a></li>
    </ul>
</div>

<div id="tabContent" class="mainBox">
    <!-- 사이드바 -->
    <div class="sidebar" id="sidebar"></div>

    <!-- 컨텐츠 영역 -->
    <div id="content-area"></div>
</div>

<%@ include file="/footer.jsp" %>

<script>
$(document).ready(function() {
    function loadTab(tabName) {
        $('.tab-btnItem').removeClass('active');
        $('.tab-btnItem[data-tab="' + tabName + '"]').addClass('active');

        $.ajax({
            url: '${hpath}/admin/sidebar',
            data: { tab: tabName },
            success: function(response) {
                $('#sidebar').html(response);
                addSidebarListeners();
            }
        });

        loadContent(tabName, 'default');
    }

    function loadContent(tabName, contentType) {
        $.ajax({
            url: '${hpath}/admin/content',
            data: { tab: tabName, type: contentType },
            success: function(response) {
                $('#content-area').html(response);
            }
        });
    }

    function addSidebarListeners() {
        $('#sidebar a').click(function(e) {
            e.preventDefault();
            var contentType = $(this).data('content');
            var currentTab = $('.tab-btnItem.active').data('tab');
            loadContent(currentTab, contentType);
        });
    }

    $('.tab-btnItem').click(function(e) {
        e.preventDefault();
        var tabName = $(this).data('tab');
        loadTab(tabName);
    });

    loadTab('product');
});
</script>
</body>
</html>