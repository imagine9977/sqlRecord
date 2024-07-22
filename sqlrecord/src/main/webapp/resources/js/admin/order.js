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