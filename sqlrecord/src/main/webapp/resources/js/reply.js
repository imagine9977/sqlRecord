	
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
                    url: '${hpath}/reply/delReply.do',
                    data: { "replyNo" : replyNo },
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
                    url: '${hpath}/reply/delChReply.do',
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
			/*
			// 해당 수정 버튼이 속한 댓글 요소를 찾습니다.
		    const reviewElement = $(this).closest('.reviews');
		    // 댓글 요소에서 replyNo 값을 가져옵니다.
		    const replyNo = reviewElement.data('replyNo');
		    */
		    const replyNo = $(this).closest('.reviews').attr('id').split('-')[1];
		    console.log(replyNo); // 댓글 번호 출력
		    const currentContent = $(this).closest('.review-content').find('.yrecon').text();
		    const currentRating = $(this).closest('.review').find('.pavg1').text();
		    openEditPopup(currentContent, currentRating,replyNo);
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
		        url: '${hpath}/reply/upReply.do',
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
			        url: '${hpath}/reply/upChReply.do',
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
	             url: "${hpath}/reply/chInsReply.do",
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
	    function openEditPopup(currentContent, currentRating,replyNo) {
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
		        url: '${hpath}/reply/upReply.do',
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
               url: "${hpath}/reply/insReply.do",
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
	