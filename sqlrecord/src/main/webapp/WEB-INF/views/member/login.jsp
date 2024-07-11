<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hpath" value="<%= request.getContextPath() %>"/>
<html>
<head>
<script src="${hpath }/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${hpath }/resources/css/common.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/header.css?after1"/>
<link rel="stylesheet" href="${hpath }/resources/css/breadCrumb.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/searchHeader.css"/>
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
		.agreebox {background-color: whitesmoke;
		    width: 60%;
		    height: 670px;
		    margin: 80px auto;
		    padding-top: 1px;
		    border-radius: 5px;
		    box-shadow: 0 0 5px gray;
		    display: none;
		    position: absolute;
		    z-index: 9999;
		    top: 5%;
		    left: 15%;
		}
        .terms-container {
            width: 85%;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 0 5px gray;
        }
        .terms-content {
            height: 100px;
            overflow-y: scroll;
            padding: 10px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
        }
        .buttons {
            text-align: center;
        }
        .form-check {height: 30px;
            display: flex;
        }
        h4 {margin: 0;}
        #in_btn1 {cursor: pointer;
		    border: 1px solid rgba(252, 248, 248, 0.4);
		    border-radius: .3em;
		    background-color: #2f4f4f;
		    color: white;
		    border-radius: 3px;
		    margin-top: 15px;
		    margin-left: 168px;
		    height: 30px;
		    width: 80px;
		    font-weight: 600;
		}
        #in_btn1:hover {background-color: #294242;}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div id="main_content">
<%@ include file="/WEB-INF/views/searchHeader.jsp" %>
	
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
                         
                    </form>
                            <div class="infofound">
                                <p><a href="${hpath}/member/findIdPw">ID 찾기 / PW 찾기</a></p>
                                <input type="checkbox" name="remember" id="remember">
                                <label for="remember" style="margin: 0px;">아이디 기억하기</label>
                            </div>
                            <p class="p-container">
                                <input type="submit" name="Login" id="go" value="LOGIN">
                            </p>
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
			                <label style="width: 180px;"><input type="checkbox" name="tagNo" value="1"> Pop</label>
			                <label style="width: 180px;"><input type="checkbox" name="tagNo" value="2"> Rock</label>
			                <label style="width: 180px;"><input type="checkbox" name="tagNo" value="3"> HipHop</label>
			                <label style="width: 180px;"><input type="checkbox" name="tagNo" value="4"> Jazz</label>
			                <label style="width: 180px;"><input type="checkbox" name="tagNo" value="5"> Classical</label>
			                <label style="width: 180px;"><input type="checkbox" name="tagNo" value="6"> Electronic</label>
			                <label style="width: 180px;"><input type="checkbox" name="tagNo" value="7"> Ballad</label>
			                <label style="width: 180px;"><input type="checkbox" name="tagNo" value="8"> Country</label>
			                <label style="width: 180px;"><input type="checkbox" name="tagNo" value="9"> Metal</label>
			                
			                <!--  
			                <input type="hidden" id="tag1" name="tag1">
			                <input type="hidden" id="tag2" name="tag2">
			                <input type="hidden" id="tag3" name="tag3">
							-->		            
			            </p>
			        </div>
			        <p style="font-size: 15px; font-weight: 600; margin-left: 20px; margin-top: 30px;">
                        <input type="checkbox" id="agree" name="agree" onclick="agreecheck()">
                        <label for="agree">회원약관 및 개인정보처리방침 동의</label>
                    </p>
			        <p class="p-container">
			            <input type="submit" value="JOIN">
			        </p>
			    </form>
			</div>
			<section class="agreebox">
		        <div class="terms-container">
		            <h2>회원약관</h2>
		            <div class="terms-content">
		                <p><h2>제1장 총칙</h2>
		                
		                    제1조(목적) 이 약관은 회사가 온라인으로 제공하는 디지털콘텐츠(이하 "콘텐츠"라고 한다) 및 제반서비스의 이용과 관련하여 회사와 이용자와의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.
		                    제2조(정의) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
		                    1. "회사"라 함은 "콘텐츠" 산업과 관련된 경제활동을 영위하는 자로서 콘텐츠 및 제반서비스를 제공하는 자를 말합니다.
		            
		                    2. "이용자"라 함은 "회사"의 사이트에 접속하여 이 약관에 따라 "회사"가 제공하는 "콘텐츠" 및 제반서비스를 이용하는 회원 및 비회원을 말합니다.
		            
		                    3. "회원"이라 함은 "회사"와 이용계약을 체결하고 "이용자" 아이디(ID)를 부여받은 "이용자"로서 "회사"의 정보를 지속적으로 제공받으며 "회사"가 제공하는 서비스를 지속적으로 이용할 수 있는 자를 말합니다.
		            
		                    4. "비회원"이라 함은 "회원"이 아니면서 "회사"가 제공하는 서비스를 이용하는 자를 말합니다.
		            
		                    5. "콘텐츠"라 함은 정보통신망이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 정보통신망에서 사용되는 부호·문자·음성·음향·이미지 또는 영상 등으로 표현된 자료 또는 정보로서, 그 보존 및 이용에 있어서 효용을 높일 수 있도록 전자적 형태로 제작 또는 처리된 것을 말합니다.
		            </p>
		            </div>
		            <div class="form-check">
		                <input type="checkbox" id="ck_item1" name="ck_item" class="form-check-input">
		                <label for="ck_item1" class="form-check-label"><h4>약관에 동의</h4></label><br><br>
		            </div>
		        </div>
		
		        <div class="terms-container">
		            <h2>개인정보처리방침</h2>
		            <div class="terms-content">
		                <p>제1장 총칙
					
					        제1조(목적) 이 지침은 「개인정보 보호법」(이하 "법"이라 한다) 제12조제1항에 따른 개인정보의 처리에 관한 기준, 개인정보 침해의 유형 및 예방조치 등에 관한 세부적인 사항을 규정함을 목적으로 한다.
					        제2조(용어의 정의) 이 지침에서 사용하는 용어의 뜻은 다음과 같다.
					        1. "개인정보 처리"란 개인정보를 수집, 생성, 연계, 연동, 기록, 저장, 보유, 가공, 편집, 검색, 출력, 정정(訂正), 복구, 이용, 제공, 공개, 파기(破棄), 그 밖에 이와 유사한 행위를 말한다.
					
					        2. "개인정보처리자"란 업무를 목적으로 법 제2조제4호에 따른 개인정보파일을 운용하기 위하여 개인정보를 처리하는 모든 공공기관, 영리목적의 사업자, 협회·동창회 등 비영리기관·단체, 개인 등을 말한다.
					
					        3. "공공기관"이란 법 제2조제6호 및 「개인정보 보호법 시행령」(이하 "영"이라 한다) 제2조에 따른 기관을 말한다.
					
					        4. "친목단체"란 학교, 지역, 기업, 인터넷 커뮤니티 등을 단위로 구성되는 것으로서 자원봉사, 취미, 정치, 종교 등 공통의 관심사나 목표를 가진 사람간의 친목도모를 위한 각종 동창회, 동호회, 향우회, 반상회 및 동아리 등의 모임을 말한다.
					
					        5. "개인정보 보호책임자"란 개인정보처리자의 개인정보 처리에 관한 업무를 총괄해서 책임지는 자로서 영 제32조제2항에 해당하는 자를 말한다.
					        </p>
		            </div>
		            <div class="form-check">
		                <input type="checkbox" id="ck_item2" name="ck_item2" class="form-check-input">
		                <label for="ck_item2" class="form-check-label"><h4>개인정보처리방침에 동의</h4></label>
		            </div><hr>
		            <div class="form-check">
		                <label onclick="protocol()" class="form-check-label" style="cursor: pointer;"><strong>전체 약관에 동의</strong></label>
		            </div>
		            <hr>
		            <div class="btn-group">
		                <button type="button" id="in_btn1" class="button is-info" onclick="agreeclose()">확 인</button>
		            </div>
		        </div>
		    </section>
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
	    
	    in_btn1.addEventListener("click", function(){
		    var ck_item1 = document.getElementById("ck_item1");
	        var ck_item2 = document.getElementById("ck_item2");
	        var in_btn1 = document.getElementById("in_btn1");
            var agree = document.getElementById("agree");
	        
            if(ck_item1.checked && ck_item2.checked){
                agree.checked = ture;
                return;
            } else {
                agree.checked = false;
                alert("약관 및 개인정보처리 방침에 동의하지 않으셨습니다.");
                return;
            }
        });
        function protocol(){
            ck_item1.checked = true;
            ck_item2.checked = true;
        }

        function agreecheck(){
            $(".agreebox").show();
        }

        function agreeclose(){
            $(".agreebox").hide();
        }
    </script>
    
</div>
<script src="${hpath}/resources/js/login.js"></script>
<script src="${hpath }/resources/js/forHeader.js?after1"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>