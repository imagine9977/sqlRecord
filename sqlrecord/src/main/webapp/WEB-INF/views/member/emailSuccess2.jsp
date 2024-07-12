<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hpath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<script src="${hpath}/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${hpath}/resources/css/common.css"/>
<link rel="stylesheet" href="${hpath}/resources/css/header.css?after1"/>
<link rel="stylesheet" href="${hpath}/resources/css/breadCrumb.css"/>
<link rel="stylesheet" href="${hpath}/resources/css/searchHeader.css"/>
<meta charset="UTF-8">
<title>SUCCESS</title>
    <style>
        body {margin: 0px; padding: 0px; background: #ededed;}
        #einput {
            background-color: #e7dfdf;
            border: 1px solid #706767;
            border-radius: .3em;
            box-shadow: 0 1px 0 rgba(255,255,255,0.1);
            color: #0f0f0f;
            margin-left: 50px;
            font-size: 13px;
            padding: 8px 5px;
            width: 50%;
        }

        .tab_content {
            margin: auto;
            margin-top: 200px;
            margin-bottom: 200px;
            background-color: whitesmoke;
            width: 451px;
            height: 510px;
            padding: 23px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }

        .emailbtn  {
            width: 100px; height: 30px;
            margin-left: 10px;
            margin-top: 20px;
            background-color: #2f4f4f;
            color: white;
            border: 1px solid rgba(252, 248, 248, 0.4);
            border-radius: .3em;
            box-shadow: inset 0 1px 0 rgba(255,255,255,0.3), inset 0 10px 10px rgba(255,255,255,0.1);
        }
        
        .emailbtn:hover {
                background-color: #294242;
            }
        
        .message {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 70px;
        }

        .icon {
            width: 36px;
            height: 36px;
            margin-right: 10px;
        }

        #ems {font-weight: 600;
            font-size: 25px;}

        .countdown-container {
            margin-left: 85px;
            display: flex;
        }

        #countdown {
        	margin-top:20px;
            color: #333;
            font-weight: 600;
        }

        .etext {
        	margin-top:20px;
            font-weight: 600;
            color: #333;
        }
        
        
        #successPw {
            margin: auto;
            margin-top: 200px;
            margin-bottom: 200px;
            background-color: whitesmoke;
            width: 451px;
            height: 510px;
            padding: 23px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
            display: none;
        }
        a {
            text-decoration: none;
            color: white;
        }

        #loginGo  {
            cursor: pointer;
            width: 120px; height: 30px;
            margin-left: 160px;
            margin-top: 20px;
            background-color: #2f4f4f;
            color: white;
            border: 1px solid rgba(252, 248, 248, 0.4);
            border-radius: .3em;
            box-shadow: inset 0 1px 0 rgba(255,255,255,0.3), inset 0 10px 10px rgba(255,255,255,0.1);
        }
        
        #loginGo:hover {
                background-color: #294242;
            }
            
        #pwVeiw {
            margin-top: 120px;
            text-align: center;
        }    
        
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/searchHeader.jsp" %>

	<div class="tab_content">
	    <div class="message">
	        <img src="https://e7.pngegg.com/pngimages/333/868/png-clipart-mail-computer-icons-email-graphy-e-mail-miscellaneous-angle.png" alt="메일 아이콘" class="icon">
	        <p id="ems">메일 전송이 완료 되었습니다.</p>
	    </div>
	    <div class="input-container">
	        <input type="text" placeholder="인증번호 입력해주세요" id="einput">
	        <button class="emailbtn" onclick="numCheck()">확인</button>
	    </div>
	    <div class="countdown-container">
	        <p class="etext">인증번호 유효시간은 &nbsp; </p>
	        <p id="countdown">02:00</p>
	        <p class="etext">&nbsp;남았습니다.</p>
	    </div>
	</div>


	<div id="successPw">
        <h3 id="pwVeiw">회원님의 변경된 비밀번호는 <br><strong style="color: rgb(12, 113, 153);">"<c:out value='${memberPw}'/>"</strong> 입니다. <br><br><br>개인정보 보안을 위하여
        <br>비밀번호를 변경하여<br>이용해주시기 바랍니다.</h3>
        <button id="loginGo"><a href="${hpath}/member/login.do">로그인</a></button>
    </div>
<script>
    window.onload = function() {
        let time = 2 * 60; // 2분을 초로 환산
        const countdownElement = document.getElementById('countdown');

        const countdownTimer = setInterval(() => {
            let minutes = Math.floor(time / 60); // 소수점 버리고 정수로 반환
            let seconds = time % 60;

            // 두 자리 숫자로 표시되도록 형식 지정
          minutes = minutes < 10 ? '0' + minutes : minutes;
          seconds = seconds < 10 ? '0' + seconds : seconds;

            countdownElement.innerHTML = minutes+':'+seconds;

            if (time <= 0) {
                clearInterval(countdownTimer);
                countdownElement.innerHTML = '00:00';
                document.getElementById('einput').disabled = true;
            }

            time--;
        }, 1000);
    }
    
    function numCheck(){
    	const mvCode = "<c:out value='${code}'/>";
    	console.log(mvCode);
    	const codenum = $('#einput').val();
    	if(mvCode != codenum){
    		alert("인증번호가 일치하지 않습니다.");
    	} else {
			$('.tab_content').css('display','none');
			$('#successPw').css('display','block');
    	}
    }
    
</script>

<script src="${hpath}/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
