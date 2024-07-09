<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="hpath" value="${pageContext.request.contextPath}" />
<!-- 헤더 내용 기술 -->
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${hpath}/resources/css/common.css">
<style>
.navbar-item a {
  color: #fff;
}


#main_header1 {
    width: 100%;
    height: 50px;
    background-color: #383637;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.navleft, .navright {
    display: flex;
    align-items: center;
    margin: 0 150px;
    width: auto;
    height: 100%;
    justify-content: center;
}
.logo {
    display: flex;
    max-height: 75px;
    height: auto;
    width: auto;
}
.navbar-start, .navbar-end {
    display: flex;
    align-items: center;
    margin-left: 20px;
    flex-wrap: nowrap;
    width: auto;
    height: 100%;
    justify-content: center;
}
.navbar-item {
    width: auto;
    height: 100%;
    margin: 0 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 80px;
}
.membox {
    width: auto;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 200px;
}
</style>
</head>

<nav class="navbar" id="main_header1">
    <div class="navleft">
        <div class="navbar-start">
            <div class="navbar-item">
                <a href="${hpath}/qna/getQnaList.do">
                    고객지원
                </a>
            </div>
            <div class="navbar-item">
                <a href="${hpath}/board/getBoardList.do">
                    공지사항
                </a>
            </div>
        </div>
    </div>

    <div class="navright">
        <div class="navbar-end">
            <div class="membox">
                <c:if test="${!empty sid}">
                    <div class="navbar-item">
                        <a href="${hpath}/member/mypage.do">
                            마이페이지
                        </a>
                    </div>
                    <div class="navbar-item">
                        <a href="${hpath}/member/logout.do">
                            로그아웃
                        </a>
                    </div>
                </c:if>
                <c:if test="${empty sid}">
                    <div class="navbar-item">
                        <a href="${hpath}/member/login.do">
                            로그인
                        </a>
                    </div>
                    <div class="navbar-item">
                        <a href="${hpath}/member/term.do">
                            회원가입
                        </a>
                    </div>
                </c:if>
                <c:if test="${sid.equals('admin')}">
                    <div class="navbar-item">
                        <a href="${hpath}/admin/adminpage.do">
                            관리자페이지
                        </a>
                    </div>
                    <div class="navbar-item">
                        <a href="${hpath}/member/logout.do">
                            로그아웃
                        </a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</nav>