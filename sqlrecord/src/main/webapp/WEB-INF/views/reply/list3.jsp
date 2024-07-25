<%-- 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.util.Map" %>
<c:set var="hpath" value="${pageContext.request.contextPath }" />

<html>
<head>
<script src="${hpath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="${hpath }/resources/css/common.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/header.css?after1"/>
<link rel="stylesheet" href="${hpath }/resources/css/breadCrumb.css"/>
<link rel="stylesheet" href="${hpath }/resources/css/searchHeader.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


	<div class="container">
	    <div class="review-header" style="text-align: center;">
	        <h1>REVIEW</h1>
	    </div>
	    <div class="overall-rating">
	        <div class="individual-rating">
	            <c:forEach var="star" items="${starAll}">
	                <div class="bar-container">
	                    <span>${star.ratingRange}</span>
	                    <div class="bar">
	                        <span style="width: ${star.percentage}%"></span>
	                    </div>
	                    <span>${star.count}</span>
	                </div>
	            </c:forEach>
	        </div>
	
	        <div class="total-rating">
	            <div style="text-align: center;">
	                <p style="margin-bottom: 5px; margin-top: 0px;">전체 평점</p>
	                <h2 class="pavg" style="font-size: 35px;">${avgStar}</h2>
	            </div>
	            <div class="rating-details" style="margin-left: 30px;">
	                <div class="score">
	                    <p class="sfavg">★★★★★</p>
	                    <p class="sbavg">☆☆☆☆☆</p>
	                </div>
	                <span>${replyCount}개 리뷰</span>
	            </div>
	        </div>
	    </div>
	    <c:if test="${!empty sessionScope.loginUser}">
	        <div id="commentForm">
	            <div class="overlay" id="overlay"></div>
	            <div class="popup" id="popup">
	                <p>평점을 입력하세요:</p>
	                <input type="number" id="ratingInput" name="star" min="0" max="5" step="0.1">
	                <button onclick="submitRating()">제출</button>
	            </div>
	            <div class="review-header">
	                <p>리뷰 작성하기</p>
	                <input type="hidden" name="productNo" id="productNo" value="${product.productNo}"> <!-- 상품 번호를 포함 -->
	                <input type="hidden" name="depth" id="depth" value="0"> <!-- 기본 댓글이므로 깊이는 0 -->
	                <div class="stars">
	                    <div class="score-wrapper">
	                        <div class="score" id="starRating">
	                            <p class="foreground" style="font-size: 25px; cursor: pointer;">★★★★★</p>
	                            <p class="background" style="font-size: 25px; cursor: pointer;">☆☆☆☆☆</p>
	                        </div>
	                        <span class="point" style="font-size: 25px;">평점</span>
	                    </div>
	                </div>
	                <input style="height: 30px; margin-bottom:10px;" class="recontent" id="content" name="content" type="text" placeholder="리뷰를 작성해주세요.">
	                <button class="rebtn1" id="rebtn1">
	                    <img style="width: 30px; height: 30px;" src="${hpath}/resources/imgs/login/move_9743734.png" alt="">
	                </button>
	                <input type="file" id="fileInput" multiple="multiple" style="display: none;" onchange="loadImg(this)">
	                <button class="rebtn2" id="rebtn2" onclick="commentWrite()">등록</button>
	                <div id="yimgbox"></div>
	            </div>
	        </div>
	    </c:if>
	    <c:forEach var="reply" items="${list }">
	        <div class="reviews" id="review-${reply.replyNo}" data-replyNo="${reply.replyNo}">
	            <div class="review">
	                <div class="review-title">
	                    <div class="stars">
	                        <div class="score">
	                            <p class="s1favg" style="font-size: 20px;">★★★★★</p>
	                            <p class="s1bavg" style="font-size: 20px;">☆☆☆☆☆</p>
	                        </div>
	                        <h4 class="pavg1" class="yrestar" style="margin:0px;">${reply.star}</h4>
	                    </div>
	                    <span id="id">${reply.memberId}</span>
	                    <div class="date">${reply.writeDate}</div>
	                </div>
	              
	                <div class="review-content">
	                    <span class="yrecon">${reply.content}</span>
	                    
	                    <c:if test="${sessionScope.loginUser.memberNo eq reply.memberNo and reply.status ne 'N' }">
		                        <div class="align-right">
		                            <button class="editButton">수정</button>
		                            <button class="deleteButton" style="margin-left: 10px; margin-right: 10px;">삭제</button>
		                        </div>
	                    </c:if>
	                    
	                    <!-- 본 리뷰 수정팝업창 , 답글 수정 팝업창 -->
	                    
	                    <div id="editPopup" class="edit-popup">
	                        <div class="edit-popup-content">
	                            <span class="close" onclick="closeEditPopup()">&times;</span>
	                            <p>댓글 수정하기</p>
	                            <input type="number" id="editRatingInput" name="star" min="0" max="5" step="0.1" placeholder="별점 입력">
	                            <textarea id="editContent" name="content" rows="4" placeholder="내용 수정"></textarea>
	                            <div id="editimgbox">
				                	<c:forEach var="img" items="${imgList}">
				                		<c:if test="${reply.replyNo eq img.replyNo}">
				                			<img src="${hpath}/resources/uploadFiles/reply/${img.changeName}" alt="img"
				                			data-reply-no="${reply.replyNo}" 
				                			data-image-path="${hpath}/resources/uploadFiles/reply/${img.changeName}">
				                		</c:if>
				                	</c:forEach>
				                </div>
				                <br>
	                            <button class="submitButton" type="button">수정 완료</button>
	                        </div>
	                    </div>
	                    <div id="editPopup2" class="edit-popup">
	                        <div class="edit-popup-content">
	                            <span class="close" onclick="closeEditPopup()">&times;</span>
	                            <p>댓글 수정하기</p>
	                            <textarea id="editContent2" name="content" rows="4" placeholder="내용 수정"></textarea>
	                            <button class="submitButton2" type="button">수정 완료</button>
	                        </div>
	                    </div>
	                </div>
	                <div id="yimgbox1">
	                	<c:forEach var="img" items="${imgList}">
	                		<c:if test="${reply.replyNo eq img.replyNo}">
	                			<img  src="${hpath}/resources/uploadFiles/reply/${img.changeName}" alt="img" class="imgFiles" id="imgFile-${reply.replyNo}"">
	                			<input type="hidden" class="hiddenReplyNo" value="${reply.replyNo }">
	                		</c:if>
	                	</c:forEach>
	                </div>
	                <div class="reply-section">
					    <button class="reply-toggle">답글 보기</button>
					    <c:if test="${!empty sessionScope.loginUser}">
					        <div class="reply-list" style="display: none;">
					            <!-- 답글 입력 폼 -->
					            <div class="reply-input" >
					                <input type="hidden" class="pReply" value="${reply.replyNo}">
					                <input type="hidden" class="pDepth" value="1">
					                <input class="chContent" name="chContent" type="text" placeholder="내용을 입력해주세요.">
					                <button class="reply-submit" data-reply-no="${reply.replyNo}">등록</button>
					            </div>
					            <!-- 기존 답글 목록 -->
					            <c:forEach var="chReply" items="${chList}">
					                <c:if test="${chReply.replyNo == reply.replyNo}">
					                    <div class="chBack" style="background-color: #E2E2E2; height:80px;">
						                    <div class="reply" >
						                        <span class="reply-author">${chReply.memberId}</span><br>
						                        <span class="reply-date">${chReply.writeDate}</span>
						                    </div>
				            				<div class="chReplyedit">
						                        <p class="reply-content">${chReply.chContent}</p>
							                    <c:if test="${sessionScope.loginUser.memberNo == chReply.memberNo }">
							                        <div class="align-right">
							                            <button class="editButton2" id="chReplyNo-${chReply.chReplyNo}">수정</button>
							                            <button class="deleteButton2" id="chReplyNo-${chReply.chReplyNo}" style="margin-left: 10px; margin-right: 10px;">삭제</button>
							                        </div>
							                    </c:if>
								            </div>
							            </div>
					                <hr>
					                </c:if>
					            </c:forEach>
					        </div>
					    </c:if>
					</div>
	            </div>
	        </div>
	    </c:forEach>
	    <div class="pagination">
	        <a href="#">&laquo;</a>
	        <a href="#">1</a>
	        <a href="#">2</a>
	        <a href="#">&raquo;</a>
	    </div>
	</div>
	
	
<script>
	
	$(document).ready(function() {
        const avgStar = $(".pavg").text(); 
        const max = 5;
        const percent = (avgStar / max) * 100;
        $(".rating-details").find(".sfavg").css("width", percent + "%");
        
        $(".reply-toggle").click(function() {
            const replyList = $(this).siblings(".reply-list");
            replyList.slideToggle();

            /*
            if (replyList.is(":empty")) {
                // 답글 목록이 비어있으면 서버에서 데이터를 가져옵니다
                $.ajax({
                    url: "답글_데이터_요청_URL",
                    method: "GET",
                    success: function(data) {
                        // 서버에서 받아온 답글 데이터를 추가합니다
                        data.forEach(function(reply) {
                            const replyHtml = `
                                <div class="reply">
                                    <span class="reply-author">${reply.author}</span>
                                    <span class="reply-date">${reply.date}</span>
                                    <p class="reply-content">${reply.content}</p>
                                </div>
                            `;
                            replyList.append(replyHtml);
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error("답글 로딩 실패:", error);
                    }
                });
            }
            */
        });
    });
    
    // each 각각의 요소를 순회하며 주어진 함수를 실행 ,즉, 선택된 여러 요소를 하나씩 처리할 때 사용
    $(document).ready(function() {
        $(".reviews").each(function() {
            const avgStar1 = $(this).find(".pavg1").text();
            const max = 5;
            const percent = (avgStar1 / max) * 100;
            $(this).find(".s1favg").css("width", percent + "%");
        });
        
    });
    
  /*  이거는 모든 요소를 다 반복하면서 처리해서 오류 발생함 ㅗ fuck 
  $(document).ready(function() {
        const avgStar1 = $(".pavg1").text(); 
        const max = 5;
        const percent = (avgStar1 / max) * 100;
        $(".stars").find(".s1favg").css("width", percent + "%");
    }); */

    $(document).ready(function() {
        $('.deleteButton').on('click', function() {
            //const replyNo = $(this).closest('.reviews').data('replyNo');
			const replyNo = $(this).closest('.reviews').attr('id').split('-')[1];
			console.log(replyNo); // 댓글 번호 출력
            
            if (confirm('댓글을 삭제하시겠습니까?')) {
                $.ajax({
                    type: 'POST',
                    url: '${hpath}/productFor/delReply.do',
                    data: { "replyNo" : replyNo},
                    success: function(response) {
                        console.log('삭제 성공:', response);
                        // 삭제 후 페이지 리로드 또는 다른 동작 수행
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        console.error('삭제 실패:', error);
                    }
                });
            }
        });
        
        
        $('.deleteButton2').on('click', function() {
        	const chReplyNo = $(this).closest('.deleteButton2').attr('id').split('-')[1];
			console.log(chReplyNo); // 댓글 번호 출력
            
            if (confirm('댓글을 삭제하시겠습니까?')) {
                $.ajax({
                    type: 'POST',
                    url: '${hpath}/productFor/delChReply.do',
                    data: { "chReplyNo" : chReplyNo },
                    success: function(response) {
                        console.log('삭제 성공:', response);
                        // 삭제 후 페이지 리로드 또는 다른 동작 수행
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        console.error('삭제 실패:', error);
                    }
                });
            }
        });
	       
        
     // 수정 버튼 클릭 시 해당 댓글의 내용과 별점을 가져와 수정 팝업을 열도록 설정
		$(".editButton").click(function() {
		    const replyNo = $(this).closest('.reviews').attr('id').split('-')[1];
		    console.log(replyNo); // 댓글 번호 출력
		    const currentContent = $(this).closest('.review-content').find('.yrecon').text();
		    const currentRating = $(this).closest('.review').find('.pavg1').text();
		    const imgSrc = [];
		    
			 // isEmpty() 비어있으면 true
			 if ($('.imgFiles').length > 0) {
			     $('.imgFiles').each(function(){
			         imgSrc.push($(this).attr('src'));
			         $('#editimgbox').css("display", "block");
			     });
			 }
		    console.log(imgSrc);
		    
		    openEditPopup(currentContent, currentRating, replyNo, imgSrc);
		});
     
     	//답글 수정
		$(".editButton2").click(function() {
			
		    const chReplyNo = $(this).closest('.editButton2').attr('id').split('-')[1];
		    console.log(chReplyNo); // 댓글 번호 출력
		    const currentContent = $(this).closest('.chReplyedit').find('.reply-content').text();
		    openEditPopup2(currentContent, chReplyNo);
		});
     
	     //수정 완료 
	     $(".submitButton").click(function() {
	    	 // 저장된 replyNo 값을 가져옴
    	     const replyNo = $(this).data('replyNo');
    	     console.log(replyNo); // 댓글 번호 출력
		     
		     const updatedContent = document.getElementById('editContent').value;
		     const updatedRating = document.getElementById('editRatingInput').value;
		     
		    $.ajax({
		        type: 'POST',
		        url: '${hpath}/productFor/upReply.do',
		        data: {
		            replyNo: replyNo,
		            content: updatedContent,
		            star: updatedRating,
		        },
		        success: function(response) {
		            alert("댓글 수정에 성공했습니다.");
		            location.reload();
		
		            // 수정 완료 후 수정 창 닫기
		            closeEditPopup();
		
		            // DOM 업데이트
		            const reviewElement = document.querySelector(`.reviews[data-replyNo='${replyNo}']`);
		            if (reviewElement) {
		                reviewElement.querySelector('.yrecon').textContent = updatedContent;
		                reviewElement.querySelector('.yrestar').textContent = updatedRating;
		            }
		        },
		        error: function(xhr, status, error) {
		            alert("댓글 수정에 실패했습니다.");
		            console.error("댓글 수정 실패:", error);
		        }
		    });
	     });
	     
	  // 답글 수정
	  	$(".submitButton2").click(function() {
    	     const chReplyNo = $(this).data('chReplyNo');
    	     console.log(chReplyNo); // 댓글 번호 출력
		     
		     const updatedContent = document.getElementById('editContent2').value;
			
		     $.ajax({
			        type: 'POST',
			        url: '${hpath}/productFor/upChReply.do',
			        data: {
			        	chReplyNo: chReplyNo,
			        	chContent: updatedContent
			        },
			        success: function(response) {
			            alert("댓글 수정에 성공했습니다.");
			            location.reload();
			
			            // 수정 완료 후 수정 창 닫기
			            closeEditPopup();
			
			            // DOM 업데이트
			            const reviewElement = chReplyNo;
			            if (reviewElement) {
			                reviewElement.querySelector('.reply-content').textContent = updatedContent;
			            }
			        },
			        error: function(xhr, status, error) {
			            alert("댓글 수정에 실패했습니다.");
			            console.error("댓글 수정 실패:", error);
			        }
			    });
		     });
	     
	  // 답글 등록
	     $(".reply-submit").click(function() {
	         const $replySection = $(this).closest('.reply-section');
	         const replyNo = $(this).data('reply-no');
	         const chContent = $replySection.find('.chContent').val();
	         const depth = $replySection.find('.pDepth').val();

	         if (!chContent.trim()) {
	             alert("내용을 입력해주세요.");
	             return;
	         }

	         const formData = new FormData();
	         formData.append('chContent', chContent);
	         formData.append('replyNo', replyNo);
	         formData.append('depth', depth);

	         $.ajax({
	             type: "POST",
	             url: "${hpath}/productFor/chInsReply.do",
	             data: formData,
	             contentType: false,
	             processData: false,
	             success: function(response) {
	                 alert("댓글 등록에 성공했습니다.");
	                 location.reload();
	             },
	             error: function(xhr, status, error) {
	                 alert("댓글 등록에 실패했습니다.");
	                 console.error(xhr.responseText);
	             }
	         });
	     });
    });
    
    
    
    
    
	 // 수정 창 열기 함수
	    function openEditPopup(currentContent, currentRating, replyNo, imgSrc) {
		    // 수정 창을 열 때 가져온 내용과 별점을 해당 입력 필드에 설정합니다.
		    //currentreplyNo = replyNo;
		    console.log(replyNo); // 댓글 번호 출력
		    $('.submitButton').data('replyNo', replyNo);
		    document.getElementById('editPopup').style.display = 'block';
		    document.getElementById('editContent').value = currentContent;
		    document.getElementById('editRatingInput').value = currentRating;
		}
	 
	 // 답글
	    function openEditPopup2(currentContent,chReplyNo) {
		    //console.log(replyNo); // 댓글 번호 출력
		    $('.submitButton2').data('chReplyNo', chReplyNo);
		    document.getElementById('editPopup2').style.display = 'block';
		    document.getElementById('editContent2').value = currentContent;
		}
		
		

	    // 수정 창 닫기 함수
	    function closeEditPopup() {
	        document.getElementById('editPopup').style.display = 'none';
	        document.getElementById('editPopup2').style.display = 'none';
	    }

	    // 수정 제출 함수
	    function submitEdit(replyNo) {
	    	//const replyNo = reviewElement.data('replyNo'); // 이걸 추가하면 별점 데이터가 다 사라짐.. 그래서 빼고 실행
	    	//const replyNo = $(this).closest('.reviews').attr('id').split('-')[1];
		    console.log(replyNo); // 댓글 번호 출력
		    const updatedContent = document.getElementById('editContent').value;
		    const updatedRating = document.getElementById('editRatingInput').value;
			
		    
		    // AJAX 요청 예시
		    $.ajax({
		        type: 'POST',
		        url: '${hpath}/productFor/upReply.do',
		        data: {
		            replyNo: replyNo,
		            content: updatedContent,
		            star: updatedRating,
		        },
		        success: function(response) {
		            alert("댓글 수정에 성공했습니다.");
		            location.reload();
		
		            // 수정 완료 후 수정 창 닫기
		            closeEditPopup();
		
		            // DOM 업데이트
		            const reviewElement = document.querySelector(`.reviews[data-replyNo='${replyNo}']`);
		            if (reviewElement) {
		                reviewElement.querySelector('.yrecon').textContent = updatedContent;
		                reviewElement.querySelector('.yrestar').textContent = updatedRating;
		            }
		        },
		        error: function(xhr, status, error) {
		            alert("댓글 수정에 실패했습니다.");
		            console.error("댓글 수정 실패:", error);
		        }
		    });
		}
	    
	 
	    
	    
       function updateRating(rate) {
           const max = 5;
           const percent = (rate / max) * 100;
           $(".score-wrapper").find(".foreground").css("width", percent + "%");
           $(".score-wrapper").find(".point").text(rate);
       }

       //jquery를 이용한 show/hide 
       function openPopup() {
           $("#overlay").show();
           $("#popup").show();
       }

       function closePopup() {
           $("#overlay").hide();
           $("#popup").hide();
       }

       $("#starRating").click(function() {
           openPopup();
       });

       $("#overlay").click(function() {
           closePopup();
       });
       
       
       

       function submitRating() {
           event.preventDefault(); // form태그 안에서 새로고침 막는 용도
           const rate = parseFloat($("#ratingInput").val());
           if (!isNaN(rate) && rate >= 0 && rate <= 5) { //!isNaN 숫자인지 아닌지 검사
               updateRating(rate);
               closePopup();
           } else {
               alert("유효한 평점을 입력하세요 (0-5 사이).");
           }
       }

       
       
       
       function commentWrite() {
           // 파일 업로드를 위한 FormData 객체를 생성
           const formData = new FormData();
           formData.append('productNo', document.getElementById('productNo').value);
           formData.append('star', document.getElementById('ratingInput').value);
           formData.append('content', document.getElementById('content').value);

           // 파일이 선택되었다면 FormData에 추가
           const fileInput = document.getElementById('fileInput');
           if (fileInput.files.length > 0) {
               for (let i = 0; i < fileInput.files.length; i++) {
                   formData.append('files', fileInput.files[i]);
               }
           }
           $.ajax({
               type: "POST",
               url: "${hpath}/productFor/insReply.do",
               data: formData,
               contentType: false,
               processData: false,
               success: function(response) {
               	alert("댓글 등록에 성공했습니다.");
                   console.log("파일 등록 성공:", response);
                   location.reload();
                   // 폼 초기화
                   document.getElementById('commentForm').reset();
                   
                   // 평점 초기화
                   document.getElementById('ratingInput').value = '';
                   
                   // 파일 입력 초기화
                   fileInput.value = '';
               },
               error: function(xhr, status, error) {
               	alert("댓글 등록에 실패했습니다.");
                   console.error("파일 등록 실패:", error);
               }
           });
       } 
       
       
       
		function loadImg(inputFile) {
		    	   
		    	   const yimgbox = document.getElementById('yimgbox');
		    	   yimgbox.innerHTML=""; // 다시 선택할경우 리셋 필요함
		    	   const formData = new FormData();
		    	   
		   			if(inputFile.files.length) {	//파일이 첨부되었다면
		   				for(let i=0; i<inputFile.files.length; i++){
		    				const reader = new FileReader();
			    			reader.readAsDataURL(inputFile.files[i]);
		   					
		    			// reader객체를 가지고 파일을 읽어들이는 메소드를 호출
		    			// 파일 읽기가 완료되면 실행할 핸들러 정의
			    			reader.onload = e => {
			                    const img = document.createElement('img');
			                    img.src = e.target.result;
			                    img.id = `img${i}`;
			                    yimgbox.appendChild(img);
			                    
			                    formData.append('files', file);
			                    loadedFilesCount++;

			                };
		    			};
		    			yimgbox.style.display = "flex"; // 이미지 박스 표시
		   		    } else {
		   		        yimgbox.style.display = "none"; // 파일이 선택되지 않은 경우 숨김
		   		    }
		   		} 
      		 
       
       /*
       function reloadComments() {
           $.ajax({
               type: "POST",
               url: `${hpath}/reply/getComments.do?productNo=${document.getElementById('productNo').value}`,
               success: function(response) {
                   // 댓글 목록 갱신 코드
                   document.getElementById('commentList').innerHTML = response;
               },
               error: function(xhr, status, error) {
                   console.error("댓글 목록 갱신 실패:", error);
               }
           });
       }  
      */
      	  document.getElementById("rebtn1").addEventListener("click", function() {
          document.getElementById("fileInput").click();
          });

          document.getElementById("fileInput").addEventListener("change", function() {
              const selectedFile = this.files[0];
              console.log("선택된 파일:", selectedFile);
          });
      

       
</script>


<!-- 
</body>
</html> -->