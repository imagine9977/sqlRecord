<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .expandable-row {
        cursor: pointer;
    }
    .details-row {
        display: none;
        background-color: #f9f9f9;
    }
    .details-cell {
        padding: 10px;
    }
    .action-button {
        padding: 5px 10px;
        margin: 2px;
        cursor: pointer;
    }
</style>

<c:choose>
    <c:when test="${tab eq 'product' and type eq 'all'}">
        <h2>전체 상품 목록</h2>
        <table class="dataTable" id="selectAllProduct">
            <tr>
                <th><input type="checkbox" id="selectAllProducts"></th>
                <th>No.</th>
                <th>상품 정보</th>
                <th>작업</th>
            </tr>
            <c:forEach var="product" items="${productList}">
                <tr class="data-row">
                    <td><input type="checkbox" name="productCheck" value="${product.productNo}"></td>
                    <td>${product.productNo}</td>
                    <td class="data-details-row">
                        <img src="${hpath}/resources/${product.productPhoto1}" alt="${product.productName}" />
                        <p>${product.productCate} - No.${product.productNo}</p>
                        <p><b>${product.productName}</b></p>
                        <p><b>가격 : ${product.productPrice}원</b></p>
                        <p>상품 등록일 : ${product.productDate}</p>
                    </td>
                    <td>
                        <button class="action-button" onclick="editProduct(${product.productNo})">수정</button>
                        <button class="action-button" onclick="deleteProduct(${product.productNo})">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <button class="action-button" onclick="insertProduct()">상품추가</button>
        <button class="action-button" onclick="deleteProduct(${product.productNo})">선택상품삭제</button>
    </c:when>

    <c:when test="${tab eq 'order'}">
        <div id="order-all" class="content-section">
            <h2>전체 주문 내역</h2>
            <table id="accordionTable">
                <tr>
                    <th><input type="checkbox" id="selectAllOrders"></th>
                    <th>No.</th>
                    <th>주문자</th>
                    <th>주문 상품</th>
                    <th>주문 일자</th>
                    <th>결제 가격</th>
                    <th>작업</th>
                </tr>
                <c:forEach var="orders" items="${memberOrdersList}">
                    <tr class="expandable-row">
                        <td><input type="checkbox" name="orderCheck" value="${orders.ordersNo}"></td>
                        <td>${orders.ordersNo}</td>
                        <td>${orders.member.memberId}</td>
                        <td>
                            <c:choose>
                                <c:when test="${orders.orderDetails.size() > 1}">
                                    ${orders.orderDetails[0].product.productName} 외 ${orders.orderDetails.size() - 1}개
                                </c:when>
                                <c:otherwise>
                                    ${orders.orderDetails[0].product.productName}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${orders.ordersDate}</td>
                        <td>${orders_detail.ordersDetailPrice.totalPrice()}</td>
                        <td>
                            <button class="action-button" onclick="viewOrderDetails(${orders.ordersNo})">상세보기</button>
                        </td>
                    </tr>
                    <c:forEach var="ordersDetail" items="${orders.orderDetails}">
                        <tr class="details-row">
                            <td colspan="7" class="details-cell">
                                <img src="${hpath}/resources/${ordersDetail.product.productPhoto1}" alt="${ordersDetail.product.productName}" />
                                <p>주문상세번호 : ${ordersDetail.ordersDetailNo}</p>
                                <p>${ordersDetail.product.productCate} - No.${ordersDetail.product.productNo}</p>
                                <p><b>${ordersDetail.product.productName}</b></p>
                                <p>주문 수량 : ${ordersDetail.ordersDetailAmount}개</p>
                            </td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </table>
        </div>

        <div id="order-exchange" class="content-section" style="display: none;">
            <h2>교환 요청 정보</h2>
            <table class="dataTable" id="selectAllExchanges">
                <tr>
                    <th><input type="checkbox" id="selectAllExchanges"></th>
                    <th>No.</th>
                    <th>교환 요청 정보</th>
                    <th>작업</th>
                </tr>
                <c:forEach var="exchange" items="${ordersExchangeList}">
                    <tr class="data-row">
                        <td><input type="checkbox" name="exchangeCheck" value="${exchange.orderExchangeNo}"></td>
                        <td>${exchange.orderExchangeNo}</td>
                        <td class="data-details-row">
                            <img src="${hpath}/resources/${exchange.ordersDetail.product.productPhoto1}" alt="${exchange.ordersDetail.product.productName}" />
                            <p>${exchange.ordersDetail.product.productCate} - No.${exchange.ordersDetail.product.productNo}</p>
                            <p><b>${exchange.ordersDetail.product.productName}</b></p>
                            <p><b>색상 : ${exchange.ordersDetail.product.color}</b></p>
                            <p><b>주문자 : ${exchange.ordersDetail.memberOrders.member.memberId}</b></p>
                            <p>주문 일자 : ${exchange.ordersDetail.memberOrders.ordersDate}</p>
                            <p>주문 수량 : ${exchange.ordersDetail.ordersDetailAmount}</p>
                            <p>결제 가격 : ${exchange.ordersDetail.ordersDetailPrice}</p>
                            <p>배송 상태 : ${exchange.trackingNum}</p>
                        </td>
                        <td>
                            <button class="action-button" onclick="processExchange(${exchange.orderExchangeNo})">처리</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div id="order-refund" class="content-section" style="display: none;">
            <h2>환불 요청 정보</h2>
            <table class="dataTable" id="selectAllRefunds">
                <tr>
                    <th><input type="checkbox" id="selectAllRefunds"></th>
                    <th>No.</th>
                    <th>환불 요청 정보</th>
                    <th>작업</th>
                </tr>
                <c:forEach var="refund" items="${ordersRefundList}">
                    <tr class="data-row">
                        <td><input type="checkbox" name="refundCheck" value="${refund.orderRefundNo}"></td>
                        <td>${refund.orderRefundNo}</td>
                        <td class="data-details-row">
                            <img src="${hpath}/resources/${refund.ordersDetail.product.productPhoto1}" alt="${refund.ordersDetail.product.productName}" />
                            <p>${refund.ordersDetail.product.productCate} - No.${refund.ordersDetail.product.productNo}</p>
                            <p><b>${refund.ordersDetail.product.productName}</b></p>
                            <p><b>주문자 : ${refund.ordersDetail.memberOrders.member.memberId}</b></p>
                            <p>주문 일자 : ${refund.ordersDetail.memberOrders.ordersDate}</p>
                            <p>주문 수량 : ${refund.ordersDetail.ordersDetailAmount}</p>
                            <p>결제 가격 : ${refund.ordersDetail.ordersDetailPrice}</p>
                            <p>환불 사유 : ${refund.refundReason}</p>
                        </td>
                        <td>
                            <button class="action-button" onclick="processRefund(${refund.orderRefundNo})">처리</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </c:when>

    <c:when test="${tab eq 'member' and type eq 'all'}">
        <h2>회원 목록</h2>
        <table id="accordionTable">
            <tr>
                <th><input type="checkbox" id="selectAllMembers"></th>
                <th>아이디</th>
                <th>성명</th>
                <th>가입일</th>
                <th>보유 포인트</th>
                <th>작업</th>
            </tr>
            <c:forEach var="member" items="${memberList}">
                <tr class="expandable-row">
                    <td><input type="checkbox" name="memberCheck" value="${member.memberId}"></td>
                    <td>${member.memberId}</td>
                    <td>${member.name}</td>
                    <td>${member.resdate}</td>
                    <td>${member.point}</td>
                    <td>
                        <button class="action-button" onclick="editMember('${member.memberId}')">수정</button>
                        <button class="action-button" onclick="deleteMember('${member.memberId}')">삭제</button>
                    </td>
                </tr>
                <tr class="details-row">
                    <td colspan="6" class="details-cell">
                        <p>이메일 : ${member.email}</p>
                        <p>연락처 : ${member.tel}</p>
                        <p>주소 : ${member.addr1} ${member.addr2} (${member.postcode})</p>
                        <br/>
                        <c:forEach var="reply" items="${member.replyList}">
                            <p>${reply.content}</p>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>

    <c:when test="${tab eq 'review' and type eq 'all'}">
        <h2>리뷰 목록</h2>
        <table id="accordionTable">
            <tr>
                <th><input type="checkbox" id="selectAllReviews"></th>
                <th>아이디</th>
                <th>상품번호</th>
                <th>상품명</th>
                <th>내용</th>
                <th>작성일</th>
                <th>작업</th>
            </tr>
            <c:forEach var="reply" items="${replyList}">
                <tr class="expandable-row">
                    <td><input type="checkbox" name="reviewCheck" value="${reply.replyNo}"></td>
                    <td>${reply.member.memberId}</td>
                    <td>${reply.product.productNo}</td>
                    <td>${reply.product.productName}</td>
                    <td>${reply.content}</td>
                    <td>${reply.writDate}</td>
                    <td>
                        <button class="action-button" onclick="deleteReview(${reply.replyNo})">삭제</button>
                    </td>
                </tr>
                <tr class="details-row">
                    <td colspan="7" class="details-cell">
                        <p>No.${reply.product.productNo} - ${reply.product.productCate}</p>
                        <p>상품명 : ${reply.product.productName}</p>
                        <p>작성일 : ${reply.writDate}</p>
                        <p>내용 : 
                            <div class="reply-content">${reply.content}</div>
                        </p>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>

    <c:when test="${tab eq 'notice' and type eq 'all'}">
        <h2>공지사항 목록</h2>
        <table class="dataTable" id="selectAllNotices">
            <tr>
                <th><input type="checkbox" id="selectAllNotices"></th>
                <th>No.</th>
                <th>분류</th>
                <th>제목</th>
                <th>작성일</th>
                <th>작업</th>
            </tr>
            <c:forEach var="notice" items="${noticeList}">
                <tr class="data-row">
                    <td><input type="checkbox" name="noticeCheck" value="${notice.noticeNo}"></td>
                    <td>${notice.noticeNo}</td>
                    <td>${notice.noticeCate}</td>
                    <td><a href="${hpath}/notice/noticeList.jsp">${notice.noticeTitle}</a></td>
                    <td>${notice.resdate}</td>
                    <td>
                        <button class="action-button" onclick="editNotice(${notice.noticeNo})">수정</button>
                        <button class="action-button" onclick="deleteNotice(${notice.noticeNo})">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>

    <c:when test="${tab eq 'qna' and type eq 'all'}">
        <h2>Q&A 목록</h2>
        <table class="dataTable" id="selectAllQna">
            <tr>
                <th><input type="checkbox" id="selectAllQna"></th>
                <th>No.</th>
                <th>분류</th>
                <th>제목</th>
                <th>비밀글 여부</th>
                <th>등록일</th>
                <th>조회수</th>
                <th>해결상태</th>
                <th>작업</th>
            </tr>
            <c:forEach var="qna" items="${qnaList}">
                <tr class="data-row">
                    <td><input type="checkbox" name="qnaCheck" value="${qna.qnaNo}"></td>
                    <td>${qna.qnaNo}</td>
                    <td>${qna.category}</td>
                    <td><a href="${hpath}/qna/qnaList.jsp">${qna.qnaTitle}</a></td>
                    <td>${qna.secret}</td>
                    <td>${qna.createDate}</td>
                    <td>${qna.count}</td>
                    <td>${qna.solved}</td>
                    <td>
                        <button class="action-button" onclick="answerQna(${qna.qnaNo})">답변</button>
                        <button class="action-button" onclick="deleteQna(${qna.qnaNo})">삭제
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
</c:choose>

<script>
// 전체 선택 체크박스 기능
function setupSelectAll(selectAllId, checkboxName) {
    document.getElementById(selectAllId).addEventListener('change', function() {
        var checkboxes = document.getElementsByName(checkboxName);
        for(var checkbox of checkboxes) {
            checkbox.checked = this.checked;
        }
    });
}

setupSelectAll('selectAllProducts', 'productCheck');
setupSelectAll('selectAllOrders', 'orderCheck');
setupSelectAll('selectAllExchanges', 'exchangeCheck');
setupSelectAll('selectAllRefunds', 'refundCheck');
setupSelectAll('selectAllMembers', 'memberCheck');
setupSelectAll('selectAllReviews', 'reviewCheck');
setupSelectAll('selectAllNotices', 'noticeCheck');
setupSelectAll('selectAllQna', 'qnaCheck');

// 상품 관련 함수
function editProduct(productNo) {
    console.log("상품 번호 " + productNo + " 수정");
    // 구현 필요
}

function deleteProduct(productNo) {
    console.log("상품 번호 " + productNo + " 삭제");
    // 구현 필요
}

// 주문 관련 함수
function viewOrderDetails(ordersNo) {
    console.log("주문 번호 " + ordersNo + "의 상세 정보 보기");
    // 구현 필요
}

function processExchange(exchangeNo) {
    console.log("교환 요청 번호 " + exchangeNo + " 처리");
    // 구현 필요
}

function processRefund(refundNo) {
    console.log("환불 요청 번호 " + refundNo + " 처리");
    // 구현 필요
}

// 회원 관련 함수
function editMember(memberId) {
    console.log("회원 ID " + memberId + " 정보 수정");
    // 구현 필요
}

function deleteMember(memberId) {
    console.log("회원 ID " + memberId + " 삭제");
    // 구현 필요
}

// 리뷰 관련 함수
function deleteReview(replyNo) {
    console.log("리뷰 번호 " + replyNo + " 삭제");
    // 구현 필요
}

// 공지사항 관련 함수
function editNotice(noticeNo) {
    console.log("공지사항 번호 " + noticeNo + " 수정");
    // 구현 필요
}

function deleteNotice(noticeNo) {
    console.log("공지사항 번호 " + noticeNo + " 삭제");
    // 구현 필요
}

// Q&A 관련 함수
function answerQna(qnaNo) {
    console.log("Q&A 번호 " + qnaNo + "에 답변");
    // 구현 필요
}

function deleteQna(qnaNo) {
    console.log("Q&A 번호 " + qnaNo + " 삭제");
    // 구현 필요
}

// 아코디언 테이블 기능
document.getElementById('accordionTable').addEventListener('click', function(e) {
    if (e.target.closest('tr').classList.contains('expandable-row')) {
        var detailsRow = e.target.closest('tr').nextElementSibling;
        if (detailsRow.style.display === 'none' || detailsRow.style.display === '') {
            detailsRow.style.display = 'table-row';
        } else {
            detailsRow.style.display = 'none';
        }
    }
});
</script>