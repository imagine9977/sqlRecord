// 주문건 테이블 생성
function loadOrderTable(contentType, page = 1) {
    $.ajax({
        url: '${hpath}/admin/ajaxMemberManagement',
        type: 'GET',
        data: { page: page, type: contentType },
        success: function(response) {
            if (response.data && response.data.length > 0) {
                var table = '<table class="accordion-table">' +
                    '<thead>' +
                    '<tr>' +
                    '<th><input type="checkbox" class="checkAllOrders"></th>' +
                    '<th>No.</th>' +
                    '<th>주문 내역</th>' +
                    '<th>작업</th>' +
                    '</tr>' +
                    '</thead>' +
                    '<tbody>';

                response.data.forEach(function(order) {
                    table += '<tr class="accordion-header">' +
                        '<td><input type="checkbox" name="orderCheck" value="' + order.memberOrdersNo + '"></td>' +
                        '<td>' + order.memberOrdersNo + '</td>' +
                        '<td>' + 
                        	'<p><b>주문번호 : </b>' + order.memberOrdersNo + '</p>' +
                        	'<p><b>' + order.productNo + '. ' + order.productName + '외 ' + order.productCount + '건</b></p>'+
                        	'<p><b>주문자 : ' + order.memberId + '</b></p>' +
                        	'<p><b>주문일자 : </b>' + order.memberOrdersDate + '</p>' +
                        	'<p><b>결제금액 : ' + order.price + '원</b></p>' +
                        '</td>' +
                        '<td><button class="btn btn-sm btn-secondary toggle-details">상세보기</button>' +
                        '<button class="btn btn-sm btn-secondary toggle-details">삭제</button></td>' +
                    '</tr>' +
                    
                    '<tr class="accordion-content">' +
                        '<td colspan="4">' +
                            '<div class="order-details" id="order-details' + order.memberOrdersNo + '">' +
                                '<div class="details-content">' +
                                    '<h3>주문 상세 정보</h3><br/>' +
                                    '<p>주문번호: ' + order.memberOrdersNo + '</p>' +
                                    '<div class="order-items" id="order-items-' + order.memberOrdersNo + '"></div>' +
                                '</div>' +
                            '</div>' +
                        '</td>' +
                    '</tr>';
                });

                table += '</tbody>' +
                    '</table>' +
                    '<div class="pagination-custom"></div>' +
                    '<div class="table-footer">' +
                    '<button>선택승인</button>' +
                    '<button>선택삭제</button>' +
                    '</div>';

                $('#content-area').html(table);
                
                // 전체 선택 체크박스 기능 추가
                $('#checkAllOrders').click(function() {
                    $('input[name="orderCheck"]').prop('checked', this.checked);
                });
                
                // 개별 체크박스 선택 시 전체 선택 체크박스 상태 업데이트
                $('input[name="orderCheck"]').click(function() {
                    if ($('input[name="orderCheck"]').length === $('input[name="orderCheck"]:checked').length) {
                        $('#checkAllOrders').prop('checked', true);
                    } else {
                        $('#checkAllOrders').prop('checked', false);
                    }
                });
                
                // slideToggle 기능 추가
                $('.toggle-details').click(function() {
                    var orderNo = $(this).closest('tr').find('input[name="orderCheck"]').val();
                    $(this).closest('tr').next('.accordion-content').slideToggle();
                    
                    // MemberOrdersDetail 정보 함수 호출
                    loadOrderDetails(orderNo);		
                });

                // 페이지네이션 생성
                var pageInfo = response.pageInfo;
                var pagingHtml = createPagination(pageInfo, 'order');
                $('#content-area').append(pagingHtml);
            } else {
                $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
            }
        },
        error: function(xhr, status, error) {
            console.error("주문 데이터 호출 중 오류 발생: ", error);
          	$('#content-area').html('<div class="error">데이터를 불러오는 중 오류가 발생했습니다.</div>');
        }
    });
}

// 주문 상세 정보 로드
function loadOrderDetails(memberOrdersNo) {
    $.ajax({
        url: '/sqlrecord/admin/ajaxOrderDetails',
        type: 'GET',
        data: { memberOrdersNo: memberOrdersNo },
        success: function(response) {
            if (response.data && response.data.length > 0) {
                var details = '';
                response.data.forEach(function(detail) {
                    details += '<img src="" alt="" style="width:100px; height:100px;">' +
                               '<p>상품명: ' + detail.productNo + '. ' + detail.productName + '</p>' +
                               '<p>가격: ' + detail.memberOrdersDetailPrice + '</p>' +
                               '<p>수량: ' + detail.memberOrdersDetailAmount + '</p>' +
                });
                $('#order-items-' + orderNo).html(details);
            } else {
                $('#order-items-' + orderNo).html('<div class="no-data">상세 정보가 없습니다</div>');
            }
        },
        error: function(xhr, status, error) {
            console.error("주문 상세 정보 호출 중 오류 발생: ", error);
            $('#order-items-' + orderNo).html('<div class="error">상세 정보를 불러오는 중 오류가 발생했습니다.</div>');
        }
    });
}
    
// 페이지네이션 생성
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

