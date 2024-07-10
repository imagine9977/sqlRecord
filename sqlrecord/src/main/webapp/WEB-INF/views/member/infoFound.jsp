<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hpath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${hpath }/resources/css/common.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/header.css?after1"/>
<link rel="stylesheet" href="${hpath }/resources/css/breadCrumb.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/searchHeader.css"/>
<script src="${hpath }/resources/js/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>INFO FOUND</title>
<link rel="stylesheet" href="${hpath}/resources/css/login.css">
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/searchHeader.jsp" %>
	<div class="tab_content">
        <p class="pop_op" style="text-align: center;
                cursor: pointer;
                font-size: 50px;
                font-weight: 600;
                margin-top: 20px;
                margin-bottom: 35px;
                color: black;"
        >ID / PW 찾기</p>
        
        <input type="radio" name="idpw" id="tab1" checked>
        <label class="rala1" for="tab1">아이디</label>
        <input type="radio" name="idpw" id="tab2">
        <label class="rala2" for="tab2">비밀번호</label>

        <div class="conbox con1">
        <form action="">
            <label for="idf">이름 </label>
            <input type="text" name="name" id="name" required><br>
            <label for="idf">이메일 </label>
            <input type="text" name="email" id="email" required>
            <button type="submit" id="fnext" onclick="emailchek()">NEXT</button>
        </form>
        </div>
        <div class="conbox con2">
        <form action="">
            <label for="idf">이름 </label>
            <input type="text" name="name" id="name1" required><br>
            <label for="idf">아이디 </label>
            <input type="text" name="memberId" id="pwf2" required>
            <label for="idf">이메일 </label>
            <input type="text" name="email" id="email1" required>
            <button type="submit" id="fnext1" onclick="emailchek1()">NEXT</button>
        </form> 
        </div>
    </div>
    <script>
    
    
	    function emailchek(){
	        const name = $("#name").val();
	        const email = $("#email").val();
	
	        $.ajax({
	            url : '${hpath }/member/emailck',
	            type : 'post',
	            data : {name : name,
	            		email : email},
           		success : result => {
           			console.log(result);
           		},
           		error: result() {
                    checkResult.show().css('color', 'red').text('오류가 발생했습니다.');
                }
	        });
	    }
    
    </script>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>