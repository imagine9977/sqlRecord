<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hpath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<script src="${hpath }/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${hpath }/resources/css/common.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/header.css?after1"/>
<link rel="stylesheet" href="${hpath }/resources/css/breadCrumb.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/searchHeader.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/mypage.css">

	<style>
        body {
            font-family: 'Open Sans', Helvetica, Arial, sans-serif;
            background: #ededed;
            margin: 0px;
            padding: 0px;
        }

        .sub-cont {
        	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        	margin: auto;
        	margin-top:200px;
        	margin-bottom:200px;
            width: 700px; /* $contW */
            height: 800px;
            background: #fff;
        }

        input[type=text], input[type=password], input[type=date] {
            background-color: #e7dfdf;
            border: 1px solid #706767;
            border-radius: .3em;
            box-shadow: 0 1px 0 rgba(255,255,255,0.1);
            color: #0f0f0f;
            margin-bottom: 20px;
            font-size: 13px;
            padding: 8px 5px;
            width: 50%;
        }

        label {display: inline-block;
            width: 110px;
            font-size: 15px;
            font-weight: 600;
            margin-left: 70px;
        }

        .ybtn {cursor: pointer;
            border: 1px solid rgba(252, 248, 248, 0.4);
            border-radius: .3em;
            background-color: #2f4f4f;
            color: white;
            border-radius: 3px;
            margin-left: 10px;
            height: 30px;
            width: 80px;
            font-weight: 600;
        }

        .ybtn:hover {background: #294242;}
        
        input[type="radio"] + label {display: inline-block; padding: 20px; cursor: pointer;}
        
        .idInput {
            margin-top: 50px;
        }
        
        #checkResult,#checkResult1 {
        	margin-left:180px;
        	font-weight: 600;
        }
    </style>
<meta charset="UTF-8">
<title></title>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/searchHeader.jsp" %>
	<div class="sub-cont">
        <form name="frm1" id="frm1" action="${hpath }/member/" method="post">
            <div class="inset">
                <p>
                    <label class="label" for="memberId">아이디</label>
                    <input class="idInput" type="text" id="memberId" name="memberId" readonly value="${sessionScope.loginUser.memberId }">
                </p>
                <p>
                    <label for="pw">현재 비밀번호</label>
                    <input type="password" id="pw" name="pw">
                    <button class="ybtn" type="button" onclick="chekPw();">확 인</button>
                    <p id="checkResult" style="display:hidden; font-size:15px;"></p> <br>
                </p>
                <p>
                    <label for="memberPw">비밀번호</label>
                    <input type="password" id="memberPw" name="memberPw" readonly>
                </p>
                <p>
                    <label for="memberPw2">비밀번호 확인</label>
                    <input type="password" id="memberPw2" name="memberPw2" readonly>
                    <div id="checkResult1" style="display:none; font-size:15px;"></div> <br>
                </p>
                <p>
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" value="${sessionScope.loginUser.name }">
                </p>
                <p>
                    <label for="email">이메일</label>
                    <input type="text" id="email" name="email" value="${sessionScope.loginUser.email }">
                </p>
                <p>
                    <label for="tell">연락처</label>
                    <input type="text" id="tell" name="tell" value="${sessionScope.loginUser.tell }">
                </p>
                <p>
                    <label for="postcode">우편번호</label>
                    <input type="text" id="postcode" name="postcode" value="${sessionScope.loginUser.postcode }">
                    <button class="ybtn" type="button" onclick="searchpostcode()">주소 검색</button>
                </p>
                <p>
                    <label for="addr1">주소</label>
                    <input type="text" id="addr1" name="addr1" value="${sessionScope.loginUser.addr1 }">
                </p>
                <p>
                    <label for="addr2">상세주소</label>
                    <input type="text" id="addr2" name="addr2" value="${sessionScope.loginUser.addr2 }">
                </p>
                <p style="font-size: 15px; font-weight: 600; margin-left: 70px;">관심 게임 장르</p>
                <p>
                    <label style="width: 150px;"><input type="checkbox" name="tagNo" value="1"> Pop</label>
                    <label style="width: 150px;"><input type="checkbox" name="tagNo" value="2"> Rock</label>
                    <label style="width: 150px;"><input type="checkbox" name="tagNo" value="3"> HipHop</label>
                    <label style="width: 150px;"><input type="checkbox" name="tagNo" value="4"> Jazz</label>
                    <label style="width: 150px;"><input type="checkbox" name="tagNo" value="5"> Classical</label>
                    <label style="width: 150px;"><input type="checkbox" name="tagNo" value="6"> Electronic</label>
                    <label style="width: 150px;"><input type="checkbox" name="tagNo" value="7"> Ballad</label>
                    <label style="width: 150px;"><input type="checkbox" name="tagNo" value="8"> Country</label>
                    <label style="width: 150px;"><input type="checkbox" name="tagNo" value="9"> Metal</label>
                </p>
                <button style="width: 100px; margin-left: 300px; margin-top: 25px;" class="ybtn" type="button" onclick="">회원정보 수정</button>
            </div>
        </form>
    </div>
    <script>
       
    	$(document).ready(()=>{
    		const tagList = ${tagList};
    		const tag = ${tagNo};
    		console.log(tagList);
    		console.log(tag);
    		$.each(tagList, function(index, item) {
                $('input[name="tagNo"][value="' + item + '"]').prop('checked', true);
            });
    	});
    	
    	$(document).ready(function() {
	           // 비밀번호 입력 필드의 keyup 이벤트에 이벤트 핸들러 추가
	           $('#memberPw, #memberPw2').keyup(function() {
	               const memberPw = $('#memberPw').val();
	               const memberPw2 = $('#memberPw2').val();
	               const checkResult1 = $('#checkResult1');
	               
	               if (memberPw === memberPw2) {
	                   checkResult1.show().css('color', 'green').text('비밀번호가 일치합니다.');
	               } else {
	                   checkResult1.show().css('color', 'red').text('비밀번호가 일치하지 않습니다.');
	               }
	           });
	       });
    	
       /*
    	$(document).ready(() => {
            const tagList = ${tgaList};
            const tagNo = ${tagNo};
            console.log(tagList);
            console.log(tagNo);
            $.each(tagList, function(index, item) {
                $('input[name="tagNo"][value="' + item + '"]').prop('checked', true);
            });
        });
       */
       
       function chekPw() {
           const checkPwd = $('#pw').val();
           const checkResult = $('#checkResult');
           if (checkPwd != "") {
               $.ajax({
                   url: 'pwCheck',
                   type: 'GET',
                   data: { checkPwd: checkPwd },
                   success: function(result) {
                       if (result == 'success') {
                           checkResult.show().css('color', 'green').text('비밀번호가 일치합니다.');
                           $('#memberPw').removeAttr("readonly");
                           $('#memberPw2').removeAttr("readonly");
                       } else {
                           checkResult.show().css('color', 'red').text('비밀번호가 일치하지 않습니다.');
                       }
                   },
                   error: function() {
                       checkResult.show().css('color', 'red').text('오류가 발생했습니다.');
                   }
               });
           } else {
               checkResult.show().css('color', 'red').text('비밀번호를 입력해주세요.');
           }
       }
    </script>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>