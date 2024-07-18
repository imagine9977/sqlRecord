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
        <li class="tab-btnItem" data-tab="qna"><a href="#qna">고객지원</a></li>
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

	// 상품 탭 사이드바 호출
    function loadProductSidebar() {
        var sidebarContent = `
            <div class="sidebar">
                <h2>상품 카테고리</h2>
                <div class="sidebar-element"><p><a href="#" data-content="all">상품 전체</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="turntables">TURNTABLES</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="speakers">SPEAKERS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="radios">RADIOS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="cdPlayers">CD PLAYERS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="cassettePlayers">CASSETTE PLAYERS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="mediaStands">MEDIA STANDS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="vynyls">VINYLS</a></p></div>
                <hr/>
            </div>`;
        $('#sidebar').html(sidebarContent);
        addSidebarListeners();
    }

	// 주문 탭 사이드바 호출
    function loadOrderSidebar() {
        var sidebarContent = `
            <div class="sidebar">
                <h2>주문 관리</h2>
                <div class="sidebar-element"><p><a href="#" data-content="all">주문 내역</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="exchange">교환 요청</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="refund">환불 요청</a></p></div>
                <hr/>
            </div>`;
        $('#sidebar').html(sidebarContent);
        addSidebarListeners();
    }

 	// 회원 탭 사이드바 호출	
    function loadMemberSidebar() {
        var sidebarContent = `
            <div class="sidebar">
                <h2>회원 관리</h2>
                <div class="sidebar-element"><p><a href="#" data-content="all">전체 회원</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="unsubscribed">탈퇴 회원</a></p></div>
                <hr/>
            </div>`;
        $('#sidebar').html(sidebarContent);
        addSidebarListeners();
    }

 	// 사이드바 요소 클릭 이벤트(content호출용)
    function addSidebarListeners() {
        $('#sidebar a').click(function(e) {
            e.preventDefault();
            var contentType = $(this).data('content');
            var currentTab = $('.tab-btnItem.active').data('tab');
            loadContent(currentTab, contentType);
        });
    }

 	// 내용(표) 호출 (사이드바 값 받아옴)
    function loadContent(tabName, contentType = 'default') {
        $('#content-area').empty(); // 기존 콘텐츠 제거

        if (tabName === 'product') {
            loadProductTable(contentType);
        } else if (tabName === 'order') {
            loadOrderTable(contentType);
        } else if (tabName === 'member') {
            loadMemberTable(contentType);
        } else if (tabName === 'notice') {
            loadNoticeTable(contentType);
        } else {
            $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
        }
    }
 	
	// 상품 테이블 생성
    function loadProductTable(contentType, page = 1) {
        $.ajax({
            url: '${hpath}/admin/productData',
            type: 'GET',
            data: { page: page, type: contentType },
            success: function(response) {
                if (response.data && response.data.length > 0) {
                    var table = '<table class="accordion-table">' +
                        '<thead>' +
                        '<tr>' +
                        '<th><input type="checkbox"></th>' +
                        '<th>No.</th>' +
                        '<th>상품 카테고리</th>' +
                        '<th>상품명</th>' +
                        '<th>등록일</th>' +
                        '<th>작업</th>' +
                        '</tr>' +
                        '</thead>' +
                        '<tbody>';

                    var productList = response.data;
                    productList.forEach(function(product) {
                        table += '<tr class="data-row">' +
                            '<td><input type="checkbox" name="productCheck" value="' + product.productNo + '"></td>' +
                            '<td>' + product.productNo + '</td>' +
                            '<td>' + product.productCategory + '</td>' +
                            '<td><a href="${hpath}/product/detail/' + product.productNo + '">' + product.productTitle + '</a></td>' +
                            '<td>' + product.resdate + '</td>' +
                            '<td class="record-actions">' +
                                '<button class="btn btn-sm btn-secondary" onclick="editProduct(' + product.productNo + ')" type="button">수정</button>' +
                                '<button class="btn btn-sm btn-secondary" onclick="deleteProduct(' + product.productNo + ')" type="button">삭제</button>' +
                            '</td>' +
                            '</tr>';
                    });

                    table += '</tbody>' +
                        '</table>' +
                        '<div class="pagination-custom"></div>' +
                        '<div class="table-footer">' +
                        '<button>추가</button>' +
                        '<button>삭제</button>' +
                        '</div>';

                    $('#content-area').html(table);

                    // 페이지네이션 갱신
                    var pageInfo = response.pageInfo;
                    var pagingArea = $(".pagination-custom");
                    pagingArea.empty();

                    if (pageInfo.startPage > 1) {
                        pagingArea.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (pageInfo.currentPage - 1) + '">이전</a></li>');
                    }

                    for (var i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
                        var activeClass = (i === pageInfo.currentPage) ? 'active' : '';
                        pagingArea.append('<li class="page-item ' + activeClass + '"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>');
                    }

                    if (pageInfo.endPage < pageInfo.maxPage) {
                        pagingArea.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (pageInfo.currentPage + 1) + '">다음</a></li>');
                    }
                } else {
                    $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
                }
            },
            error: function(xhr, status, error) {
                console.error("상품 데이터 호출 중 오류 발생: ", error);
            }
        });
    }

	// 주문건 테이블 생성
    function loadOrderTable(contentType, page = 1) {
        $.ajax({
            url: '${hpath}/admin/orderData',
            type: 'GET',
            data: { page: page, type: contentType },
            success: function(response) {
                if (response.data && response.data.length > 0) {
                    var table = '<table class="accordion-table">' +
                        '<thead>' +
                        '<tr>' +
                        '<th><input type="checkbox"></th>' +
                        '<th>No.</th>' +
                        '<th>주문 카테고리</th>' +
                        '<th>주문명</th>' +
                        '<th>등록일</th>' +
                        '<th>작업</th>' +
                        '</tr>' +
                        '</thead>' +
                        '<tbody>';

                    var orderList = response.data;
                    orderList.forEach(function(order) {
                        table += '<tr class="data-row">' +
                            '<td><input type="checkbox" name="orderCheck" value="' + order.orderNo + '"></td>' +
                            '<td>' + order.orderNo + '</td>' +
                            '<td>' + order.orderCategory + '</td>' +
                            '<td><a href="${hpath}/order/detail/' + order.orderNo + '">' + order.orderTitle + '</a></td>' +
                            '<td>' + order.resdate + '</td>' +
                            '<td class="record-actions">' +
                                '<button class="btn btn-sm btn-secondary" onclick="editOrder(' + order.orderNo + ')" type="button">수정</button>' +
                                '<button class="btn btn-sm btn-secondary" onclick="deleteOrder(' + order.orderNo + ')" type="button">삭제</button>' +
                            '</td>' +
                            '</tr>';
                    });

                    table += '</tbody>' +
                        '</table>' +
                        '<div class="pagination-custom"></div>' +
                        '<div class="table-footer">' +
                        '<button>추가</button>' +
                        '<button>삭제</button>' +
                        '</div>';

                    $('#content-area').html(table);

                    // 페이지네이션 갱신
                    var pageInfo = response.pageInfo;
                    var pagingArea = $(".pagination-custom");
                    pagingArea.empty();

                    if (pageInfo.startPage > 1) {
                        pagingArea.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (pageInfo.currentPage - 1) + '">이전</a></li>');
                    }

                    for (var i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
                        var activeClass = (i === pageInfo.currentPage) ? 'active' : '';
                        pagingArea.append('<li class="page-item ' + activeClass + '"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>');
                    }

                    if (pageInfo.endPage < pageInfo.maxPage) {
                        pagingArea.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (pageInfo.currentPage + 1) + '">다음</a></li>');
                    }
                } else {
                    $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
                }
            },
            error: function(xhr, status, error) {
                console.error("주문 데이터 호출 중 오류 발생: ", error);
            }
        });
    }

    // 회원 테이블 생성
    function loadMemberTable(contentType, page = 1) {
	    $.ajax({
	        url: '${hpath}/admin/ajaxMemberManagement',
	        type: 'GET',
	        data: { page: page, type: contentType },
	        success: function(response) {
	            if (response.data && response.data.length > 0) {
	                var table = '<table class="accordion-table">' +
	                    '<thead>' +
	                    '<tr>' +
	                    '<th><input type="checkbox"></th>' +
	                    '<th>No.</th>' +
	                    '<th>아이디</th>' +
	                    '<th>이름</th>' +
	                    '<th>가입일</th>' +
	                    '<th>보유포인트</th>' +
	                    '<th>작업</th>' +
	                    '</tr>' +
	                    '</thead>' +
	                    '<tbody>';
	
	                response.data.forEach(function(member) {
	                    table += '<tr class="accordion-header">' +
	                        '<td><input type="checkbox" name="memberCheck" value="' + member.memberNo + '"></td>' +
	                        '<td>' + member.memberNo + '</td>' +
	                        '<td>' + member.memberId + '</td>' +
	                        '<td>' + member.name + '</td>' +
	                        '<td>' + member.resdate + '</td>' +
	                        '<td>' + member.pointAmount + '</td>' +
	                        '<td><button class="btn btn-sm btn-secondary toggle-details">상세보기</button></td>' +
	                    '</tr>' +
	                    '<tr class="accordion-content">' +
		                    '<td colspan="7">' +
		                        '<div class="member-details">' +
		                            '<div class="details-content">' +
		                                '<h3>회원 상세 정보</h3><br/>' +
		                                '<p><b>아이디:</b> ' + member.memberId + '</p>' +
		                                '<p><b>이름:</b> ' + member.name + '</p>' +
		                                '<p><b>생년월일:</b> ' + member.birth + '</p>' +
		                                '<p><b>이메일:</b> ' + member.email + '</p>' +
		                                '<p><b>연락처:</b> ' + member.tell + '</p>' +
		                                '<p><b>주소:</b> ' + member.addr1 + member.addr2  + '(' + member.postcode + ')' + '</p>' +
		                                '<p><b>가입일:</b> ' + member.resdate + '</p>' +
		                                '<p><b>회원상태:</b> ' + member.status + '</p>' +
		                                '<p><b>보유 포인트:</b> ' + member.pointAmount + '</p>' +
		                            '</div>' +
		                            '<div class="record-actions">' +
		                                '<button class="btn btn-sm btn-secondary" onclick="editMember(' + member.memberNo + ')" type="button">수정</button>' +
		                                '<button class="btn btn-sm btn-secondary" onclick="deleteMember(' + member.memberNo + ')" type="button">삭제</button>' +
		                            '</div>' +
		                        '</div>' +
		                    '</td>' +
		                '</tr>';
	                });
	
	                table += '</tbody></table>';
	
	                $('#content-area').html(table);
	
	                // 페이지네이션 생성
	                var pageInfo = response.pageInfo;
	                var pagingHtml = createPagination(pageInfo, 'member');
	                $('#content-area').append(pagingHtml);
	                
	                setupPaginationHandlers();
	
	                // slideToggle 기능 추가
	                $('.toggle-details').click(function() {
	                    $(this).closest('tr').next('.accordion-content').slideToggle();
	                });
	            } else {
	                $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("회원 데이터 호출 중 오류 발생: ", error);
	            $('#content-area').html('<div class="error">데이터를 불러오는 중 오류가 발생했습니다.</div>');
	        }
	    });
	}

    // 공지 테이블 생성
    function loadNoticeTable(contentType, page = 1) {
        $.ajax({
            url: '${hpath}/admin/ajaxNoticeManagement',
            type: 'GET',
            data: { page: page, type: contentType },
            success: function(response) {
                if (response.data && response.data.length > 0) {
                    var table = '<table class="accordion-table" style="margin: 0 auto; width: 80%;">' +
                        '<thead>' +
                        '<tr>' +
                        '<th><input type="checkbox"></th>' +
                        '<th>No.</th>' +
                        '<th>공지 카테고리</th>' +
                        '<th>제목</th>' +
                        '<th>등록일</th>' +
                        '<th>작업</th>' +
                        '</tr>' +
                        '</thead>' +
                        '<tbody>';

                    response.data.forEach(function(notice) {
                        table += '<tr class="data-row">' +
                            '<td><input type="checkbox" name="noticeCheck" value="' + notice.noticeNo + '"></td>' +
                            '<td>' + notice.noticeNo + '</td>' +
                            '<td>' + notice.noticeCategory + '</td>' +
                            '<td><a href="${hpath}/notice/detail/' + notice.noticeNo + '">' + notice.noticeTitle + '</a></td>' +
                            '<td>' + notice.resdate + '</td>' +
                            '<td class="record-actions">' +
                                '<button class="btn btn-sm btn-secondary" onclick="editNotice(' + notice.noticeNo + ')" type="button">수정</button>' +
                                '<button class="btn btn-sm btn-secondary" onclick="deleteNotice(' + notice.noticeNo + ')" type="button">삭제</button>' +
                            '</td>' +
                            '</tr>';
                    });

                    table += '</tbody>' +
                        '</table>';

                    $('#content-area').html(table);

                    // 페이지네이션 생성
                    var pageInfo = response.pageInfo;
                    var pagingHtml = createPagination(pageInfo, 'notice');
                    $('#content-area').append(pagingHtml);
                    
                    setupPaginationHandlers();
                    
                } else {
                    $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
                }
            },
            error: function(xhr, status, error) {
                console.error("공지 데이터 호출 중 오류 발생: ", error);
                $('#content-area').html('<div class="error">데이터를 불러오는 중 오류가 발생했습니다.</div>');
            }
        });
    }
    
    //페이지네이션 생성
    function createPagination(pageInfo, contentType) {
	    var html = '<div class="pagination-custom" data-content-type="' + contentType + '">';
	    if (pageInfo.startPage > 1) {
	        html += '<a href="#" data-page="' + (pageInfo.startPage - 1) + '">이전</a>';
	    }
	    for (var i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
	        var activeClass = (i === pageInfo.currentPage) ? 'active' : '';
	        html += '<a class="' + activeClass + '" href="#" data-page="' + i + '">' + i + '</a>';
	    }
	    if (pageInfo.endPage < pageInfo.maxPage) {
	        html += '<a href="#" data-page="' + (pageInfo.endPage + 1) + '">다음</a>';
	    }
	    html += '</div>';
	    return html;
	}
    
    //탭 전환 시 페이지네이션 핸들러 재설정
    function loadContent(tabName, contentType = 'default') {
	    $('#content-area').empty(); // 기존 콘텐츠 제거
	
	    if (tabName === 'product') {
	        loadProductTable(contentType);
	    } else if (tabName === 'order') {
	        loadOrderTable(contentType);
	    } else if (tabName === 'member') {
	        loadMemberTable(contentType);
	    } else if (tabName === 'reply') {
	        loadMemberTable(contentType);
	    } else if (tabName === 'notice') {
	        loadNoticeTable(contentType);
	    } else if (tabName === 'qna') {
	        loadNoticeTable(contentType);
	    } else {
	        $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
	    }
	
	    setupPaginationHandlers();
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
    
	// 문서 준비 시 페이지네이션 핸들러 호출
	setupPaginationHandlers();
});
</script>
</body>
</html>
