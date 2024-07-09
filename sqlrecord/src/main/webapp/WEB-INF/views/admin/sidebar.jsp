<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

.sidebar-element a {
    text-decoration: none;
    color: inherit;
}
.sidebar-element a:hover {
    text-decoration: underline;
}
</style>

<c:choose>
    <c:when test="${tab eq 'product'}">
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
	        <hr/>
        </div>
    </c:when>
    <c:when test="${tab eq 'order'}">
    	<div class="sidebar">
	        <h2>주문 관리</h2>
	        <div class="sidebar-element"><p><a href="#" data-content="all">주문 내역</a></p></div>
	        <hr/>
	        <div class="sidebar-element"><p><a href="#" data-content="turntables">교환 요청</a></p></div>
	        <hr/>
	        <div class="sidebar-element"><p><a href="#" data-content="refund">환불 요청</a></p></div>
	        <hr/>
	        <hr/>
        </div>
    </c:when>
</c:choose>