<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<c:choose>
	<c:when test="${tab eq 'product' && type eq ''}">
	    <h2>전체 상품 목록</h2>
	    <div class="table-responsive">
	        <table class="table table-bordered" id="product-table">
	            <thead>
	                <tr>
	                    <th><input type="checkbox" class="selectAll"></th>
	                    <th>No.</th>
	                    <th></th>
	                    <th>상품정보</th>
	                    <th>작업</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="product" items="${productList}">
	                    <tr class="data-row">
	                        <td><input type="checkbox" name="productCheck" value="${product.productNo}"></td>
	                        <td>${product.productNo}</td>
	                        <td><img src="${hpath}/resources/${product.productPhoto1}" alt="${product.productName}" style="width:100px; height:100px;" /></td>
	                        <td class="data-details-row">
	                            <p>${product.productCate} - No.${product.productNo}</p>
	                            <p><b>${product.productName}</b></p>
	                            <p><b>가격 : ${product.productPrice}원</b></p>
	                            <p>상품 등록일 : ${product.productDate}</p>
	                            <p>상품 상태 : ${product.productStatus}</p>	<!-- Y:판매가능/N:판매종료상품 -->
	                        </td>
	                        <td>
	                            <button class="btn btn-sm btn-secondary" id="product-edit-btn" onclick="editProduct(${product.productNo})" type="button">수정</button>
	                            <button class="btn btn-sm btn-secondary" id="product-delete-btn" onclick="deleteProduct(${product.productNo})" type="button">삭제</button>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <button class="action-button" onclick="insertProduct()">상품추가</button>
	        <button class="action-button" onclick="deleteProduct(${product.productNo})">선택상품삭제</button>
	    </div>
	</c:when>
	
	
	
	
	
	
	
	<c:when test="${tab eq 'order' && type eq 'all'}">
	    <h2>전체 주문 내역</h2>
	    <div class="table-responsive" id="ordersAll">
	        <table class="table table-bordered" id="orders-table">
	            <thead>
	                <tr>
	                    <th><input type="checkbox" class="selectAll"></th>
	                    <th>주문번호</th>
	                    <th>주문자</th>
	                    <th>주문상품</th>
	                    <th>주문일자</th>
	                    <th>결제가격</th>
	                    <th>작업</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="orders" items="(${memberOrdersList} || ${guestOrdersList})">
	                    <tr class="data-row">
	                        <td><input type="checkbox" name="orderCheck" value="${orders.ordersNo}"></td>
	                        <td>${orders.ordersNo}</td>
	                        <td>${orders.member.name} (${orders.member.memberId})</td>
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
	                            <button class="btn btn-sm btn-secondary" onclick="deliveryOk()" id="orders-ok-btn" type="button">수락</button>
	                            <button class="btn btn-sm btn-secondary" onclick="deliveryNotOk()" id="orders-notok-btn" type="button">배송불가</button>
	                        </td>
	                        <td>
	                            <button class="btn btn-sm btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#detailsCollapse${orders.ordersNo}" aria-expanded="false" aria-controls="detailsCollapse${orders.ordersNo}">
	                                상세보기
	                            </button>
	                        </td>
	                    </tr>
	                    <tr class="collapse" id="detailsCollapse${orders.ordersNo}">
	                        <td colspan="8">
	                            <div class="card card-body bg-light">
	                                <c:forEach var="ordersDetail" items="${orders.orderDetails}">
	                                    <div class="details-row">
	                                        <img src="${hpath}/resources/${ordersDetail.product.productPhoto1}" alt="${ordersDetail.product.productName}" />
	                                        <p>주문상세번호 : ${ordersDetail.ordersDetailNo}</p>
	                                        <p>${ordersDetail.product.productCate} - No.${ordersDetail.product.productNo}</p>
	                                        <p><b>${ordersDetail.product.productName}</b></p>
	                                        <p>주문 수량 : ${ordersDetail.ordersDetailAmount}개</p>
	                                    </div>
	                                </c:forEach>
	                            </div>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <button class="action-button" onclick="deliveryOkAll(${exchange.orderExchangeNo})">선택수락</button>
	        <button class="action-button" onclick="deliveryNotOkAll(${product.productNo})">선택배송불가</button>
	    </div>
	</c:when>
	
	
	<c:when test="${tab eq 'order' && type eq 'exchange'}">
		<h2>교환 요청 정보</h2>
	    <div class="table-responsive" id="exchangeAll">
	        <table class="table table-bordered" id="product-table">
	            <thead>
	                <tr>
	                    <th><input type="checkbox" class="selectAll"></th>
	                    <th>No.</th>
	                    <th></th>
	                    <th>교환 요청 정보</th>
	                    <th>작업</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="exchange" items="${ordersExchangeList}">
	                    <tr class="data-row">
	                        <td><input type="checkbox" name="exchangeCheck" value="${exchange.orderExchangeNo}"></td>
	                        <td>${exchange.orderExchangeNo}</td>
	                        <td><img src="${hpath}/resources/${exchange.ordersDetail.product.productPhoto1}" alt="${exchange.ordersDetail.product.productName}" /></td>
	                        <td class="data-details-row">
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
	                            <button class="btn btn-sm btn-secondary" id="exchange-ok-btn" onclick="processExchange(${exchange.orderExchangeNo})" type="button">교환승인</button>
	                            <button class="btn btn-sm btn-secondary" id="exchange-notok-btn" onclick="rejectExchange(${exchange.orderExchangeNo})" type="button">교환불가</button>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <button class="action-button" onclick="processExchangeAll(${exchange.orderExchangeNo})">선택교환승인</button>
	        <button class="action-button" onclick="rejectExchangeAll(${product.productNo})">선택교환불가</button>
	    </div>
	</c:when>
	
	
	<c:when test="${tab eq 'order' && type eq 'refund'}">
		<h2>환불 요청 정보</h2>
	    <div class="table-responsive" id="refundAll">
	        <table class="table table-bordered" id="product-table">
	            <thead>
	                <tr>
	                    <th><input type="checkbox" class="selectAll"></th>
	                    <th>No.</th>
	                    <th></th>
	                    <th>교환 요청 정보</th>
	                    <th>작업</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="refund" items="${ordersRefundList}">
	                    <tr class="data-row">
	                        <td><input type="checkbox" name="refundCheck" value="${exchange.orderExchangeNo}"></td>
	                        <td>${exchange.orderExchangeNo}</td>
	                        <td><img src="${hpath}/resources/${exchange.ordersDetail.product.productPhoto1}" alt="${exchange.ordersDetail.product.productName}" /></td>
	                        <td class="data-details-row">
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
	                            <button class="btn btn-sm btn-secondary" id="exchange-ok-btn" onclick="approveRefund(${exchange.orderExchangeNo})" type="button">환불승인</button>
	                            <button class="btn btn-sm btn-secondary" id="exchange-notok-btn" onclick="rejectRefund(${exchange.orderExchangeNo})" type="button">환불불가</button>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <button class="action-button" onclick="approveRefundAll(${exchange.orderExchangeNo})">선택환불승인</button>
	        <button class="action-button" onclick="rejectRefundAll(${exchange.orderExchangeNo})">선택환불불가</button>
	    </div>
	</c:when>
	
	
	
	
	
	
	
	<c:when test="${tab eq 'member' && type eq 'all'}">
	    <h2>회원 관리</h2>
	    <div class="table-responsive" id="memberAll">
	        <table class="table table-bordered" id="orders-table">
	            <thead>
	                <tr>
	                    <th><input type="checkbox" class="selectAll"></th>
	                    <th>아이디</th>
	                    <th>성명</th>
	                    <th>가입일</th>
	                    <th>보유 포인트</th>
	                    <th>작업</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="member" items="${memberList}">
	                    <tr class="data-row">
	                        <td><input type="checkbox" name="orderCheck" value="${orders.ordersNo}"></td>
	                        <td>${member.memberId}</td>
	                        <td>${member.name}</td>
	                        <td>${member.resdate}</td>
	                        <td>${member.point}</td>
	                        <td>
	                            <button class="action-button" onclick="deleteMember('${member.memberId}')">삭제</button>
	                            <button class="btn btn-sm btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#detailsCollapse${member.memberNo}" aria-expanded="false" aria-controls="detailsCollapse${member.memberNo}">
	                                상세보기
	                            </button>
	                        </td>
	                    </tr>
	                    <tr class="collapse" id="detailsCollapse${member.memberNo}">
	                        <td colspan="8">
	                            <div class="card card-body bg-light">
	                                <div class="details-row">
	                                    <p>아이디 :     ${member.memberId}</p>
	                                    <p>성명 :       ${member.name}</p>
	                                    <p>가입일 :     ${member.resdate}</p>
	                                    <p>보유포인트 :  ${member.point}</p>
	                                    <p>이메일 :     ${member.email}</p>
	                                    <p>연락처 :     ${member.tell}</p>
	                                    <p>주소 :       ${member.addr1} ${member.addr2} (${member.postcode})</p>
	                                    <br/>
	                                    <c:forEach var="reply" items="${member.replyList}">
	                                        <h4>작성한 댓글(최근 5개)</h4>
	                                        <p>${reply.content}</p>
	                                    </c:forEach>
	                                </div>
	                            </div>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <button class="action-button" onclick="deleteMemberAll(${member.memberNo})">선택전체강퇴</button>
	    </div>
	</c:when>
	
	
	<c:when test="${tab eq 'member' && type eq 'unsubscribed'}">
	    <h2>탈퇴회원 관리</h2>
	    <div class="table-responsive" id="memberAll">
	        <table class="table table-bordered" id="orders-table">
	            <thead>
	                <tr>
	                    <th><input type="checkbox" class="selectAll"></th>
	                    <th>아이디</th>
	                    <th>성명</th>
	                    <th>가입일</th>
	                    <th>보유 포인트</th>
	                    <th>작업</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="member" items="${memberList}">
	                    <tr class="data-row">
	                        <td><input type="checkbox" name="memberCheck" value="${member.memberNo}"></td>
	                        <td>${member.memberId}</td>
	                        <td>${member.name}</td>
	                        <td>${member.resdate}</td>
	                        <td>${member.point}</td>
	                        <td>
	                            <button class="action-button" onclick="deleteMember('${member.memberNo}')">복구</button>
	                            <button class="btn btn-sm btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#detailsCollapse${member.memberNo}" aria-expanded="false" aria-controls="detailsCollapse${member.memberNo}">
	                                상세보기
	                            </button>
	                        </td>
	                    </tr>
	                    <tr class="collapse" id="detailsCollapse${member.memberNo}">
	                        <td colspan="8">
	                            <div class="card card-body bg-light">
	                                <div class="details-row">
	                                    <p>아이디 :     ${member.memberId}</p>
	                                    <p>성명 :       ${member.name}</p>
	                                    <p>가입일 :     ${member.resdate}</p>
	                                    <p>보유포인트 :  ${member.point}</p>
	                                    <p>이메일 :     ${member.email}</p>
	                                    <p>연락처 :     ${member.tell}</p>
	                                    <p>주소 :       ${member.addr1} ${member.addr2} (${member.postcode})</p>
	                                    <br/>
	                                    <c:forEach var="reply" items="${member.replyList}">
	                                        <h4>작성한 댓글(최근 5개)</h4>
	                                        <p>${reply.content}</p>
	                                    </c:forEach>
	                                </div>
	                            </div>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <button class="action-button" onclick="deleteMemberAll(${member.memberNo})">선택전체복구</button>
	    </div>
	</c:when>
	
	
	
	
	
	
	
	<c:when test="${tab eq 'review'}">
		<h2>리뷰 관리</h2>	
		<div class="table-responsive" id="replyAll">
	        <table class="table table-bordered" id="product-table">
	            <thead>
	                <tr>
	                    <th><input type="checkbox" class="selectAll"></th>
	                    <th>상품명</th>
	                    <th>아이디</th>
	                    <th>내용</th>
	                    <th>작성일</th>
	                    <th>작업</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="refund" items="${ordersRefundList}">
	                    <tr class="data-row">
	                        <td><input type="checkbox" name="reviewCheck" value="${reply.replyNo}"></td>
	                        <td>${exchange.orderExchangeNo}. ${reply.product.productName}</td>
	                        <td>${reply.memberId}</td>
	                        <td>${reply.content}</td>
	                        <td>${reply.writeDate}</td>
	                        <td>
	                            <button class="btn btn-sm btn-secondary" id="reply-delete-btn" onclick="deleteReply(${reply.replyNo})" type="button">삭제</button>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <button class="action-button" onclick="deleteReplyAll(${reply.replyNo})">선택삭제</button>
	    </div>
	</c:when>
	
	
	
	
	
	
	
	<c:when test="${tab eq 'notice'}">
	    <h2>공지사항 목록</h2>
	    <div class="table-responsive">
	        <table class="table table-bordered" id="product-table">
	            <thead>
	                <tr>
	                    <th><input type="checkbox" class="selectAll"></th>
	                    <th>No.</th>
	                    <th>분류</th>
	                    <th>제목</th>
	                    <th>작성일</th>
	                    <th>작업</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="notice" items="${noticeList}">
	                    <tr class="data-row">
	                        <td><input type="checkbox" name="noticeCheck" value="${notice.noticeNo}"></td>
	                        <td>${notice.noticeNo}</td>
	                        <td>${notice.noticeCate}</td>
	                        <td><a href="${hpath}/notice/notice.jsp">${notice.noticeTitle}</a></td>
	                        <td>${notice.resdate}</td>
	                        <td>
	                            <button class="btn btn-sm btn-secondary" id="notice-delete-btn" onclick="deleteNotice(${notice.noticeNo})" type="button">삭제</button>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        <button class="action-button" onclick="insertProduct()">상품추가</button>
	        <button class="action-button" onclick="deleteProduct(${product.productNo})">선택상품삭제</button>
	    </div>
	</c:when>
</c:choose>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

</script>