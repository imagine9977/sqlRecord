<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="hpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="${hpath }/resources/css/admin.css">
<script type="text/javascript" src="${hpath }/resources/js/admin/sidebar.js"></script>
<script type="text/javascript" src="${hpath }/resources/js/admin/product.js"></script>
<script type="text/javascript" src="${hpath }/resources/js/admin/order.js"></script>
<script type="text/javascript" src="${hpath }/resources/js/admin/member.js"></script>
<script type="text/javascript" src="${hpath }/resources/js/admin/reply.js"></script>
<script type="text/javascript" src="${hpath }/resources/js/admin/notice.js"></script>
</head>
<body>
<!-- 헤더 -->
<%@ include file="../header.jsp" %>

<!-- 상단 탭 -->
<div class="tab-bar">
    <ul class="tab-btnBox">
        <li class="tab-btnItem" data-tab="product"><a href="#product">상품</a></li>
        <li class="tab-btnItem" data-tab="order"><a href="#order">주문</a></li>
        <li class="tab-btnItem" data-tab="member"><a href="#member">회원</a></li>
        <li class="tab-btnItem" data-tab="review"><a href="#review">리뷰</a></li>
        <li class="tab-btnItem" data-tab="analytics"><a href="#analytics">통계·분석</a></li>
        <li class="tab-btnItem" data-tab="notice"><a href="#notice">공지사항</a></li>
        <li class="tab-btnItem" data-tab="qna"><a href="${hath }/qna/qnas">고객지원↗</a></li>
    </ul>
</div>

<div id="tabContent" class="mainBox">
    <!-- 사이드바 -->
    <div class="sidebar_area" id="sidebar"></div>

    <!-- 컨텐츠 영역 -->
    <div class="content-area" id="content-area"></div>
</div>

<!-- 푸터 -->
<%@ include file="../footer.jsp" %>

<script>
$(document).ready(function() {
	
	// 페이지네이션 핸들러 호출
	setupPaginationHandlers();
	
	// 페이지네이션 핸들러(클릭이벤트)
	function setupPaginationHandlers() {
	    $(document).off('click', '.pagination-custom a').on('click', '.pagination-custom a', function(e) {
	        e.preventDefault();
	        var page = $(this).data('page');
	        var contentType = $(this).closest('.pagination-custom').data('content-type');
	        var currentTab = $('.tab-btnItem.active').data('tab');
	
	        console.log('Clicked page:', page);
	        console.log('Content type:', contentType);
	        console.log('Current tab:', currentTab);
	
	        if (currentTab === 'member') {
	            loadMemberTable('all', page);
	        } else if (currentTab === 'notice') {
	            loadNoticeTable('default', page);
	        }
	    });
	}
	
	// 탭 호출
    function loadTab(tabName) {
        $('.tab-btnItem').removeClass('active');
        $('.tab-btnItem[data-tab="' + tabName + '"]').addClass('active');

        if (tabName === 'product' || tabName === 'order' || tabName === 'member') {
            loadSidebar(tabName);
            $('#sidebar').show();
        } else {
            $('#sidebar').hide();
        }

        loadContent(tabName);
    }

	// 사이드바 호출(탭 값 받기)
    function loadSidebar(tabName) {
        if (tabName === 'product') {
            loadProductSidebar();
        } else if (tabName === 'order') {
            loadOrderSidebar();
        } else if (tabName === 'member') {
            loadMemberSidebar();
        }
    }

 	
    // 해시 기반으로 탭 로드
    function loadInitialTab() {
        var hash = window.location.hash.substring(1);
        if (hash) {
            loadTab(hash);
        } else {
            loadTab('product');
        }
    }

    $(window).on('hashchange', function() {
        loadInitialTab();
    });

    // 페이지 로드 시 초기 탭 로드
    loadInitialTab();
    
});
</script>
</body>
</html>
