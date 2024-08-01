// 주문 처리 함수
function processOrder(orderNos, action) {
    $.ajax({
        url: `/sqlrecord/admin/${action}`,
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(orderNos),
        success: function(response) {
            alert(response.message);
            loadOrderTable('all');
        },
        error: function(xhr, status, error) {
            console.error(`${action} 처리 중 오류 발생: `, error);
        }
    });
}

// 주문 상세 처리 함수
function processOrderDetail(detailIds, action) {
    $.ajax({
        url: `/sqlrecord/admin/${action}`,
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(detailIds),
        success: function(response) {
            alert(response.message);
            loadOrderTable('default');
        },
        error: function(xhr, status, error) {
            console.error(`${action} 처리 중 오류 발생: `, error);
        }
    });
}

// 선택된 주문 상세 처리 함수
function processSelectedOrders(action) {
    const selectedDetailIds = [];
    $('.detailCheck:checked').each(function() {
        selectedDetailIds.push(parseInt($(this).val()));
    });

    if (selectedDetailIds.length > 0) {
        processOrder(selectedDetailIds, action);
    } else {
        alert('선택된 주문이 없습니다.');
    }
}

// 선택 주문 수락 및 거절 버튼 이벤트 추가
$(document).on('click', '#acceptSelectedOrders', function() {
    processSelectedOrders('orderAccepted');
});

$(document).on('click', '#denySelectedOrders', function() {
    processSelectedOrders('orderDenied');
});

// 주문 테이블 생성 시 각 버튼에 대한 이벤트 추가
function loadOrderTable(contentType, page = 1) {
    $.ajax({
        url: '/sqlrecord/admin/ajaxOrdersManagement',
        type: 'GET',
        data: { page: page, type: contentType },
        success: function(response) {
            if (response.data && response.data.length > 0) {
                let table = `
                    <table class="accordion-table">
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAllOrders"></th>
                                <th>No.</th>
                                <th>주문 내역</th>
                                <th>작업</th>
                            </tr>
                        </thead>
                        <tbody>
                `;

                response.data.forEach(function(order) {
                    const orderDetailsCount = order.detailsCount;
                    const orderDescription = orderDetailsCount > 1 ?
                        `[${order.productCate}] - ${order.productNo}. ${order.productName} 외 ${orderDetailsCount - 1}건` :
                        `[${order.productCate}] - ${order.productNo}. ${order.productName}`;

                    table += `
                        <tr class="accordion-header">
                            <td><input type="checkbox" class="orderCheck" value="${order.memberOrdersNo}"></td>
                            <td>${order.memberOrdersNo}</td>
                            <td>
                                <h4>${orderDescription}</h4><br/>
                                <p><b>· 주문자 : ${order.memberId}</b></p>
                                <p><b>· 주문일자 : </b>${order.orderDate}</p>
                                <p><b>· 배송주소 : ${order.addr1} ${order.addr2} (${order.postcode})</b></p>
                                <p><b>· 결제금액 : ${order.totalPrice}원</b></p>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-secondary toggle-details">상세보기</button>
                                <button class="btn btn-sm btn-secondary accept-all-order" data-order-no="${order.memberOrdersNo}">주문수락</button>
                                <button class="btn btn-sm btn-secondary deny-all-order" data-order-no="${order.memberOrdersNo}">주문거절</button>
                            </td>
                        </tr>
                        <tr class="accordion-content" style="display: none;">
                            <td colspan="4">
                                <div class="order-details" id="order-details-${order.memberOrdersNo}">
                                    <div class="details-content">
                                        <h3>주문 상세 정보</h3><br/>
                                        <div class="order-items" id="order-items-${order.memberOrdersNo}"></div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    `;
                });

                table += `
                        </tbody>
                    </table>
                    <div class="pagination-custom"></div>
                    <div class="table-footer">
                        <button id="acceptSelectedOrders">선택주문수락</button>
                        <button id="denySelectedOrders">선택주문거절</button>
                    </div>
                `;

                $('#content-area').html(table);
                
                // 검색 박스 추가
                $('#content-area').prepend(`
                    <div class="search-box">
                        <div id="section_search_item1_inputBox">
                            <div id="section_search_item1_inputBox_item">
                                <div class="search-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 512 512"><!-- !Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. --><path fill="#aeaab1" d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                                </div>
                                <input id="section_search_item1_input" type="text" placeholder="주문자 검색">
                            </div>
                        </div>
                    </div>
                `);
                
                // 전체 선택 체크박스 기능 추가
                $('#checkAllOrders').click(function() {
                    $('input.orderCheck, .order-detail-item input[type="checkbox"]').prop('checked', this.checked);
                });
                
                // 개별 체크박스 선택 시 전체 선택 체크박스 상태 업데이트
                $('input.orderCheck').click(function() {
                    if ($('input.orderCheck').length === $('input.orderCheck:checked').length) {
                        $('#checkAllOrders').prop('checked', true);
                    } else {
                        $('#checkAllOrders').prop('checked', false);
                    }
                });
                
                // slideToggle 기능 추가
                $('.toggle-details').click(function() {
                    const orderNo = $(this).closest('tr').find('input.orderCheck').val();
                    $(this).closest('tr').next('.accordion-content').slideToggle();
                    
                    // MemberOrdersDetail 정보 함수 호출
                    loadOrderDetails(orderNo);        
                });

                // 주문수락 및 주문거절 버튼 이벤트 추가
                $('.accept-all-order').click(function() {
                    const orderNo = $(this).data('order-no');
                    processOrder([orderNo], 'orderAccepted');
                });

                $('.deny-all-order').click(function() {
                    const orderNo = $(this).data('order-no');
                    processOrder([orderNo], 'orderDenied');
                });

                // 페이지네이션 생성
                const pageInfo = response.pageInfo;
                const pagingHtml = createPagination(pageInfo, 'order');
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
            if (response && response.length > 0) {
                let details = '';
                response.forEach(function(detail) {
                    details += `
                        <div class="order-detail-item">
                            <input type="checkbox" class="detailCheck" value="${detail.memberOrdersDetailNo}" data-order-no="${memberOrdersNo}">
                            <img src="${detail.product.productPhotosList[0].productPhotosPath}" alt="${detail.product.productPhotosList[0].productPhotosName}">
                            <div class="order-detail-info">
                                <p><b>상품명: <a href="">${detail.product.productNo}. ${detail.product.productName}↗</a></b></p>
                                <p>가격: ${detail.memberOrdersDetailPrice}</p>
                                <p>수량: ${detail.memberOrdersDetailAmount}</p>
                                <p><b>주문상태: ${detail.memberOrdersDetailStatus}</b></p>
                            </div>
                            <div class="order-detail-buttons">
                                <button class="btn btn-sm btn-secondary accept-order" data-detail-id="${detail.memberOrdersDetailNo}">주문수락</button>
                                <button class="btn btn-sm btn-secondary reject-order" data-detail-id="${detail.memberOrdersDetailNo}">주문거절</button>
                            </div>
                        </div>
                    `;
                });
                $('#order-items-' + memberOrdersNo).html(details);

                // 주문 상세 정보 체크박스 기능 추가
                $(`.detailCheck[data-order-no="${memberOrdersNo}"]`).click(function() {
                    const orderNo = $(this).data('order-no');
                    const allChecked = $(`input.detailCheck[data-order-no="${orderNo}"]`).length === $(`input.detailCheck[data-order-no="${orderNo}"]:checked`).length;
                    $(`input.orderCheck[value="${orderNo}"]`).prop('checked', allChecked);

                    // 전체 선택 체크박스 상태 업데이트
                    if ($('input.orderCheck').length === $('input.orderCheck:checked').length) {
                        $('#checkAllOrders').prop('checked', true);
                    } else {
                        $('#checkAllOrders').prop('checked', false);
                    }
                });

                // 주문 체크박스 클릭 시 하위 체크박스 연동
                $(`input.orderCheck[value="${memberOrdersNo}"]`).click(function() {
                    const isChecked = $(this).prop('checked');
                    $(`input.detailCheck[data-order-no="${memberOrdersNo}"]`).prop('checked', isChecked);
                });

                // 토글 내 개별 수락/거절 버튼 이벤트 추가
                $('.accept-order').click(function() {
                    const detailId = $(this).data('detail-id');
                    processOrderDetail([detailId], 'orderAccepted');
                });

                $('.reject-order').click(function() {
                    const detailId = $(this).data('detail-id');
                    processOrderDetail([detailId], 'orderDenied');
                });

            } else {
                $('#order-items-' + memberOrdersNo).html('<div class="no-data">상세 정보가 없습니다</div>');
            }
        },
        error: function(xhr, status, error) {
            console.error("주문 상세 정보 호출 중 오류 발생: ", error);
            $('#order-items-' + memberOrdersNo).html('<div class="error">상세 정보를 불러오는 중 오류가 발생했습니다.</div>');
        }
    });
}

// 페이지네이션 생성
function createPagination(pageInfo, contentType) {
    let html = `<div class="pagination-custom" data-content-type="${contentType}">`;
    if (pageInfo.startPage > 1) {
        html += `<a href="#" data-page="${pageInfo.startPage - 1}">이전</a>`;
    }
    for (let i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
        const activeClass = (i === pageInfo.currentPage) ? 'active' : '';
        html += `<a class="${activeClass}" href="#" data-page="${i}">${i}</a>`;
    }
    if (pageInfo.endPage < pageInfo.maxPage) {
        html += `<a href="#" data-page="${pageInfo.endPage + 1}">다음</a>`;
    }
    html += `</div>`;
    return html;
}
