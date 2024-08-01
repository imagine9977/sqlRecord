// 상품 테이블 생성
function loadProductTable(contentType, page = 1) {
    $.ajax({
        url: `/sqlrdcord/admin/ajaxProductManagement`,
        type: 'GET',
        data: { page: page, type: contentType },
        success: function(response) {
            if (response.data && response.data.length > 0) {
                var table = `
                    <table class="accordion-table">
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAllProducts"></th>
                                <th>No.</th>
                                <th>상품 카테고리</th>
                                <th>상품명</th>
                                <th>등록일</th>
                                <th>작업</th>
                            </tr>
                        </thead>
                        <tbody>
                `;

                var productList = response.data;
                productList.forEach(function(product) {
                    table += `
                        <tr class="data-row">
                            <td><input type="checkbox" name="productCheck" value="${product.productNo}"></td>
                            <td>${product.productNo}</td>
                            <td>${product.productCate}</td>
                            <td><a href="${hpath}/product/detail/${product.productNo}">${product.productName}</a></td>
                            <td>${product.productDate}</td>
                            <td class="record-actions">
                                <button class="btn btn-sm btn-secondary" onclick="editProduct(${product.productNo})" type="button">수정</button>
                                <button class="btn btn-sm btn-secondary" onclick="deleteProduct(${product.productNo})" type="button">삭제</button>
                            </td>
                        </tr>
                    `;
                });

                table += `
                        </tbody>
                    </table>
                    <div class="pagination-custom"></div>
                    <div class="table-footer">
                        <button>추가</button>
                        <button>삭제</button>
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
                $('#checkAllProducts').click(function() {
                    $('input.productCheck, .product-detail-item input[type="checkbox"]').prop('checked', this.checked);
                });
                
                // 개별 체크박스 선택 시 전체 선택 체크박스 상태 업데이트
                $('input.productCheck').click(function() {
                    if ($('input.productCheck').length === $('input.productCheck:checked').length) {
                        $('#checkAllProducts').prop('checked', true);
                    } else {
                        $('#checkAllProducts').prop('checked', false);
                    }
                });
                
                // slideToggle 기능 추가
                $('.toggle-details').click(function() {
                    const productNo = $(this).closest('tr').find('input.productCheck').val();
                    $(this).closest('tr').next('.accordion-content').slideToggle();
                    
                    // MemberProductsDetail 정보 함수 호출
                    loadProductDetails(productNo);        
                });

                // 주문수락 및 주문거절 버튼 이벤트 추가
                $('.accept-all-product').click(function() {
                    const productNo = $(this).data('product-no');
                    processProduct([productNo], 'productAccepted');
                });

                $('.deny-all-product').click(function() {
                    const productNo = $(this).data('product-no');
                    processProduct([productNo], 'productDenied');
                });

                // 페이지네이션 생성
                const pageInfo = response.pageInfo;
                const pagingHtml = createPagination(pageInfo, 'product');
                $('#content-area').append(pagingHtml);
            } else {
                $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
            }
        },
        error: function(xhr, status, error) {
            console.error("상품 데이터 호출 중 오류 발생: ", error);
            $('#content-area').html('<div class="error">데이터를 불러오는 중 오류가 발생했습니다.</div>');
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
