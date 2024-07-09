<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hpath" value="<%= request.getContextPath() %>"/>
<html>
<head>
<%@ include file="/bootstrap.jsp" %>
<link rel="stylesheet" href="${hpath }/resources/css/common.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/header.css?after1"/>
<link rel="stylesheet" href="${hpath }/resources/css/breadCrumb.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/searchHeader.css"/>
<script src="${hpath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Home</title>
<link rel="stylesheet" href="${hpath}/resources/css/login.css">
	<style>
		.img:before {
		    content: '';
		    position: absolute;
		    right: 0;
		    top: 0;
		    width: 900px; /* $contW */
		    height: 100%; 
		    background-image: url(${hpath}/resources/imgs/login/e2c17eb8fa492366b69bf6c2d0af73a0.jpg);
		    background-size: cover;
		    background-position-y: -50px;
		    transition: transform 1.2s ease-in-out; /* $switchAT */
		}
	</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div id="main_content">
<%@ include file="/searchHeader.jsp" %>

	<div class="tab_content">
        <button class="pop_clo"><svg xmlns="http://www.w3.org/2000/svg" height="12px" viewBox="0 -960 960 960" width="12px" fill="#EA3323"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg></button>
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
              <label for="idf1">이름 </label>
              <input type="text" name="idf1" id="idf1" required><br>
              <label for="idf2">이메일 </label>
              <input type="text" name="idf2" id="idf2" required>
              <button type="submit" id="fnext">NEXT</button>
            </form>
          </div>
          <div class="conbox con2">
            <form action="">
              <label for="idf3">이름 </label>
              <input type="text" name="idf3" id="pwf1" required><br>
              <label for="idf4">아이디 </label>
              <input type="text" name="idf4" id="pwf2" required>
              <label for="idf5">이메일 </label>
              <input type="text" name="idf5" id="pwf3" required>
              <button type="submit" id="fnext1">NEXT</button>
            </form> 
          </div>
      </div>
    <section class="contbox">
        <div class="cont">
            <div class="form sign-in">
                <img id="logo" src="${hpath}/resources/imgs/login/SQL LCODE.png" alt="">
                    
                    <form id="accesspanel" name="loginForm" action="${hpath }/member/loginPro.do" method="post">
                        <div class="inset">
                            <p style="text-align: center;">
                                <input class="loginp" type="text" name=memberId id="loginId" placeholder="ID를 입력 해주세요.">
                            </p>
                            <p style="text-align: center;">
                                <input class="loginp" type="password" name="memberPw" id="loginPw" placeholder="PW를 입력 해주세요.">
                            </p>

                            <div class="infofound">
                                <p><a href="" class="infopop">ID 찾기 / PW 찾기</a></p>
                                <input type="checkbox" name="remember" id="remember">
                                <label for="remember" style="margin: 0px;">아이디 기억하기</label>
                            </div>
                            <p class="p-container">
                                <input type="submit" name="Login" id="go" value="LOGIN">
                            </p>
                    </form>
                       <c:if test="${not empty msg}">
                       <script>alert('${msg}');</script>
                       </c:if>
                       <div class="login-buttons">
                           <button class="yhbtn btn-kakao">
                               <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" alt="카카오" style="width: 24px; height: 24px;">
                               카카오 로그인
                           </button>
                           <button class="yhbtn btn-naver">
                               <img src="${hpath}/resources/imgs/login/naver.png" alt="네이버" style="width: 24px; height: 24px;">
                               네이버 로그인
                           </button>
                           <button class="yhbtn btn-google">
                               <img src="${hpath}/resources/imgs/login/google.png" alt="구글" style="width: 24px; height: 24px;">
                               구글 로그인
                           </button>
                       </div>  
           	</div>
        </div>
            <div class="sub-cont">
			    <div class="img">
			        <div class="img__text m--up" style="margin-top: 50px;">
			            <h2>New here?</h2>
			            <p>Sign up and discover great amount of new opportunities!</p>
			        </div>
			        <div class="img__text m--in" style="margin-top: 50px;">
			            <h2>One of us?</h2>
			            <p>If you already has an account, just sign in. We've missed you!</p>
			        </div>
			        <div class="img__btn" style="margin-top: 50px;">
			            <span class="m--up">JOIN</span>
			            <span class="m--in">LOGIN</span>
			        </div>
			    </div>
			    <form name="frm1" id="frm1" action="${hpath }/member/joinPro.do" method="post" onsubmit="return joinCheck(this)">
			        <div class="inset">
			            <p>
			                <label class="label" for="memberId">아이디</label>
			                <input style="margin-bottom: 5px;" type="text" id="memberId" name="memberId">
			                <button class="ybtn" type="button" onclick="checkId()">중복검사</button>
			                <input type="hidden" name="idck" id="idck" value="no"/>
			                <c:if test="${empty qid }">
			                <p id="msg1" style="clear:both;padding:0.5rem;margin-left:130px" value=""></p>
			                </c:if>
			            </p>
			            <p>
			                <label for="memberPw">비밀번호</label>
			                <input type="password" id="memberPw" name="memberPw">
			            </p>
			            <p>
			                <label for="memberPw2">비밀번호 확인</label>
			                <input type="password" id="memberPw2" name="memberPw2">
			            </p>
			            <p>
			                <label for="name">이름</label>
			                <input type="text" id="name" name="name">
			            </p>
			            <p>
			                <label for="email">이메일</label>
			                <input type="text" id="email" name="email">
			            </p>
			            <p>
			                <label for="tell">연락처</label>
			                <input type="text" id="tell" name="tell">
			            </p>
			            <p>
			                <label for="postcode">우편번호</label>
			                <input type="text" id="postcode" name="postcode">
			                <button class="ybtn" type="button" onclick="searchpostcode()">주소 검색</button>
			            </p>
			            <p>
			                <label for="addr1">주소</label>
			                <input type="text" id="addr1" name="addr1">
			            </p>
			            <p>
			                <label for="addr2">상세주소</label>
			                <input type="text" id="addr2" name="addr2">
			            </p>
			            <p>
			                <label for="birth">생년월일</label>
			                <input type="date" id="birth" name="birth">
			            </p>
			            <p style="font-size: 15px; font-weight: 600; margin-left: 20px;">관심 음악 장르</p>
			            <p>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="Pop"> Pop</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="Rock"> Rock</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="HipHop"> HipHop</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="Jazz"> Jazz</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="Classical"> Classical</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="Electronic"> Electronic</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="Ballad"> Ballad</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="Country"> Country</label>
			                <label style="width: 180px;"><input type="checkbox" name="genre" value="Metal"> Metal</label>
			                
			                <input type="hidden" id="tag1" name="tag1">
			                <input type="hidden" id="tag2" name="tag2">
			                <input type="hidden" id="tag3" name="tag3">
			            </p>
			        </div>
			        <p style="font-size: 15px; font-weight: 600; margin-left: 20px; margin-top: 30px;">
                        <input type="checkbox" id="agree" name="agree">
                        <label for="agree">회원약관 및 개인정보처리방침 동의</label>
                    </p>
			        <p class="p-container">
			            <input type="submit" value="JOIN" onclick="setGenreTags()">
			        </p>
			    </form>
			</div>
    </section>
    <script>
	    function checkId() {
	    	if($("#memberId").val()==""){
	            alert("아이디를 입력 해주세요.");
	            $("#memberId").focus();
	            return;
	    		}
	    	var params = { memberId : $("#memberId").val() }
	    	$.ajax({
	    		url: "${hpath }/member/idCheck.do?memberId="+$("#memberId").val(),
				type: "get",
				dataType: "json",
				//data : params,
				success:function(result){
					console.log(result.data);
	                var idChk = result.data;	//true 또는 false를 받음
	                if(idChk == false){	//사용할 수 없는 아이디
	                    $("#idck").val("no");
	                    $("#msg1").html("<strong style='color:red'>이미 사용중인 아이디가 있습니다.</strong>");
	                    $("#memberId").focus();
	                } else if(idChk == true){	//사용 가능한 아이디
	                    $("#idck").val("yes");
	                    $("#msg1").html("<strong style='color:blue'>사용가능한 아이디 입니다.</strong>");
	                } else if(idck==""){
	                    $("#msg1").html("<strong>아이디가 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
	                }
				}
	    	});
	    }
	    
	 // 로그인 , 가입 클릭시 
        document.querySelector('.img__btn').addEventListener('click', function() {
            document.querySelector('.cont').classList.toggle('s--signup');
        });


        //팝업창
        $(document).ready(function(){
            $(".infopop").click(function(event){
                event.preventDefault();
                $(".tab_content").addClass("active");
            });
            
            $(".pop_clo").click(function(event){
                event.preventDefault();
                $(".tab_content").removeClass("active");
            });

        });

        //회원가입
        
        function joinCheck(f){
            if(f.memberPw.value!=f.memberPw2.value){
                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                f.memberPw.focus();
                return false;
            }
            if(f.idck.value!="yes"){
                alert("아이디 중복 체크를 하지 않으셨습니다.");
                return false;
            }
        }
        
      //우편번호 검색
        function searchpostcode() {
        	new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);
                    var roadAddr = data.roadAddress;
                    var jibunAddr = data.jibunAddress;
                    document.getElementById("postcode").value = data.zonecode;
                    if(roadAddr !== '') {
                        document.getElementById("addr1").value = roadAddr;
                    } else if(jibunAddr !== ''){
                        document.getElementById("addr1").value = jibunAddr;
                    }
                    document.getElementById("addr2").focus();
                }
            }).open();
        }
    
        
        //가입시 태그 선택 DB에 저장
        function getSelectTgas() {
            var selectTgas = [];
            var checkboxes = document.querySelectorAll('input[name="genre"]:checked');
            checkboxes.forEach(function(checkbox) {
            	selectTgas.push(checkbox.value);
            });
            return selectTgas;
        }
        
        function setGenreTags() {
            var selectTgas = getSelectTgas();
            document.getElementById('tag1').value = selectTgas[0] || ''; // 첫 번째 장르를 설정
            document.getElementById('tag2').value = selectTgas[1] || ''; // 두 번째 장르를 설정
            document.getElementById('tag3').value = selectTgas[2] || ''; // 세 번째 장르를 설정
        	return true;
        }
	    
    </script>
    
</div>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/footer.jsp" %>
</body>
</html>