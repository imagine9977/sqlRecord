			let solvedBoolean = 'N'; 
			let currentPage = 0; // 현재 페이지 0으로 고정
			const currentPageCate = {}; // 카테고리 사용시 현재 페이지 기억
			const qnasPerPage = 10; // 공지사항 한번에 표시되는 공지사항 수
			let qnaListGlobal = []; //초기 공지사항 목록을 저장할 전역 변수
			let currentCategory = 'all'; // 현재 보고 있는 카테고리 추적
			let qnaFileListGlobal = [];
			let pageInfoGlobal = {};
			let currentQnaNo=0;
			
			var fileNoArry = [];
			var fileNameArry = [];
			var userRole = '${sessionScope.loginUser.memberId}';
			
			// Check if the "goToUpdatePage" element exists before setting the onclick property
		    const goToUpdatePageButton = document.getElementById("goToUpdatePage");
		    if (goToUpdatePageButton) {
		        goToUpdatePageButton.onclick = function () {
		            location.href = "qnas/update.do/"+currentQnaNo;
		        };
		    }
		    
			$(document).on('click', '.fileDelBtn', function() {
			    var fileNo = $(this).data('fileNo');
			    var fileName = $(this).data('fileName');
			    
			    fileNoArry.push(fileNo);
			    fileNameArry.push(fileName);
			    
			    $('#fileNoDel').attr('value', fileNoArry);
			    $('#fileNameDel').attr('value', fileNameArry);
			    $(this).parent().remove();
			});
			$('#addCommentButton').on('click', () => {
			    $('#commentForm').toggle();
			});

			// Handle comment form submission
			$('#submitCommentButton').on('click', () => {
			    const commentContent = $('#newCommentContent').val();
			    if (!commentContent) {
			        alert('Comment content cannot be empty');
			        return;
			    }

			    const newComment = {
			        qnaNo: currentQnaNo,
			        memberNo: '${sessionScope.loginUser.memberNo}',
			        commentContent: commentContent, 
			    };

			    $.ajax({
			        url: 'qna/comment/insert',
			        type: 'post',
			        contentType: 'application/json',
			        data: JSON.stringify(newComment),
			        success: response => {
			            
			                // Add the new comment to the comments section
			                const commentDiv = $('<div>')
			                    .addClass('comment')
			                    .append($('<span>').addClass('comment-author').text('Author: ' + newComment.memberNo))
			                     .append($('<span>').addClass('comment-date').text('Date: ' + newComment.resdate)) //댓글등록시간이 안나옴
			                    .append($('<div>').addClass('comment-content').text(newComment.commentContent))
			                    .append($('<div>').addClass('comment-details')
			                        
			                    );

			                $('#qnaModal #comments').append(commentDiv);
			                $('#newCommentContent').val(''); // Clear the comment input
			                $('#commentForm').hide(); // Hide the comment form
			            
			        }
			    });
			});
			function turnQnaSolved() {
	            if(solvedBoolean=='N'){
	            	solvedBoolean='Y';
	            	 document.getElementById('toggleSolved').textContent = "해결만 보기";
	            }else if(solvedBoolean=='Y'){
	            	solvedBoolean='both';
	            	document.getElementById('toggleSolved').textContent = "미해결/해결 보기";
	            }else{
	            	solvedBoolean='N';
	            	document.getElementById('toggleSolved').textContent = "미해결 보기";
	            }
	            
	            if(currentCategory=='all'){
	            	findAll(solvedBoolean,1);
	            }else{
	            	findByCate(currentCategory,solvedBoolean,1);
	            }
	        }
			
			// 공지사항 목록을 지우는 함수
			const clearqnaList = () => {
			    const existingOuterDiv = document.getElementById('outerDiv');
			    if (existingOuterDiv) {
			        existingOuterDiv.remove(); // 기존의 outerDiv가 있으면 제거
			    }
			    // 기존 "더 보기" 버튼이 있으면 제거
			    $('.get-more-list').remove();
			    $('.get-more-list-cate').remove();
			    $('.load-more-container').remove();
			}
			
			//공지 삭제하기 확인 프롬프트
			function ConfirmDelete(qnaNo) {
			    if (confirm("Are you sure you want to delete this qna?")) {
			    	 console.log(qnaNo);
			    	deleteById(qnaNo);
			    }
			    return false;
			}
			
			
			//공지 삭제하기
			 function deleteById(qnaNo) {
                 $.ajax({
                	
                     url: 'qna/qnaNotice/' + qnaNo,
                     type: 'delete',
                     success: response => {
                         if (response.message === '게시글 삭제 성공') {
                        	 
                        	 $('#qnaModal').modal('hide');
                        	 $('#qnaModal').slideUp(300);
                             document.getElementById('outerDiv').remove();
                             findAll(solvedBoolean,1);
                             alert('게시글 삭제 성공');
                         }
                     } 
                 });
             }
			// 공지 전부 띄우기 
			const findAll = (solvedBoolean,page=1) => {
			    currentCategory = 'all';
			    currentPage = 0; // 페이지 갯수 초기화
			    $.ajax({
			        url: 'qna/list/' + currentCategory+'/'+solvedBoolean+'/'+page,
			        type: 'get',
			        success: function(response)  {
			        	qnaListGlobal = response.data.qnaList; // Access qnaList
			            const pageInfo = response.data.pageInfo; // Access pageInfo
			            renderqnas(qnaListGlobal.slice(0, qnasPerPage));
			            renderPagination(pageInfo);
			            currentPage++; // Increment page after loading initial data
			            
			        },
			        error: err => {
			        	
			        	console.error('Error fetching data:', err);
			        	 try {
			                 qnaListGlobal = response.data.qnaList; // Access qnaList
			                 const pageInfo = response.data.pageInfo; // Access pageInfo
			                 renderqnas(qnaListGlobal.slice(0, qnasPerPage));
			                 renderPagination(pageInfo);
			             } catch (parseErr) {
			                 console.error('Error parsing error response:', parseErr);
			                 qnaListGlobal = [];
			                 renderqnas(qnaListGlobal);
			             }
			        }
			    });
			};

			// Function to load qnas by category
			const findByCate = (cate,solvedBoolean,page=1) => {
			    currentCategory = cate;
			    currentPageCate[cate] = 0; // Initialize page count for this category
			    $.ajax({
			        url: 'qna/list/' + cate+'/'+solvedBoolean+'/'+page,
			        type: 'get',
			        success: response => {
			            qnaListGlobal = response.data.qnaList; // Store initial qna list globally
			            const pageInfo = response.data.pageInfo; // Access pageInfo
			            renderqnasCate(cate, qnaListGlobal.slice(0, qnasPerPage));
			            renderPagination(pageInfo);
			            currentPageCate[cate]++; // Increment page after loading initial data
			           
			        },
			        error: err => {
			        	
			            console.error('Error fetching data:', err);
			            try {
			                qnaListGlobal = response.data.qnaList; // Access qnaList
			                const pageInfo = response.data.pageInfo; // Access pageInfo
			                renderqnas(qnaListGlobal.slice(0, qnasPerPage));
			                renderPagination(pageInfo);
			            } catch (parseErr) {
			                console.error('Error parsing error response:', parseErr);
			                qnaListGlobal = [];
			                renderqnas(qnaListGlobal);
			            }
			        }
			    });
			};
			const findFiles = (qnaNo) => {
			   
			    $.ajax({
			        url: 'qna/qnaFile/' + qnaNo,
			        type: 'get',
			        success: response => {
			        	qnaFileListGlobal = response.data; // Store initial qna list globally
			        },
			        error: err => {
			            console.error('Error fetching data:', err);
			        }
			    });
			};
			
		
			function getKoreanqnaCategory(qnaCategory) {
			    switch (qnaCategory) {
			        case 'etc':
			            return '기타';
			        case 'service':
			            return '서비스';
			        case 'pay':
			            return '결제';
			        case 'general':
			            return '일반';
			        case 'unsolved':
			            return '미해결';
			        default:
			            return 'Unknown Category'; // Default case if category does not match any known types
			    }
			}
			// Function to render qnas in the UI for findAll
			const renderqnas = (qnaList) => {
    clearqnaList(); // Clear existing qnas
    const outerDiv = document.createElement('div');
    outerDiv.id = 'outerDiv';

    if (qnaList.length === 0) {
        const emptyMessage = document.createElement('div');
        emptyMessage.className = 'emptyMessage';
        emptyMessage.textContent = '글이 없습니다';
        outerDiv.appendChild(emptyMessage);
    } else {
        const headerRow = document.createElement('div');
        headerRow.className = 'headerRow';
        headerRow.appendChild(createDiv('번호', '70px'));
        headerRow.appendChild(createDiv('분류', '130px'));
        headerRow.appendChild(createDiv('제목', '450px'));
        headerRow.appendChild(createDiv('날짜', '200px'));
        headerRow.appendChild(createDiv('해결', '150px'));
        outerDiv.appendChild(headerRow);

        qnaList.forEach(o => {
            const qnaEl = document.createElement('div');
            qnaEl.className = 'qnaEl';
            qnaEl.appendChild(createDiv(o.qnaNo, '70px'));
            qnaEl.appendChild(createDiv(getKoreanqnaCategory(o.qnaCategory), '130px'));
            
            let newTitle = o.qnaTitle;
            const currentUser = '${sessionScope.loginUser.memberId}';
            if (o.secret === 'Y') {
                if (currentUser === 'admin' || currentUser === o.memberId) {
                    newTitle = '🔑' + o.qnaTitle;
                } else {
                    newTitle = '🔒' + o.qnaTitle;
                }
            } else {
                if (currentUser === o.memberId) {
                    newTitle = '✏️' + o.qnaTitle;
                }
            }
            qnaEl.appendChild(createDiv(newTitle, '450px'));
            qnaEl.appendChild(createDiv(o.createDate, '200px'));
            qnaEl.appendChild(createDiv(o.solved, '150px'));
            outerDiv.appendChild(qnaEl);
        });

    }
    document.getElementById('content').appendChild(outerDiv);
};

			
			// Function to render qnas by category in the UI for findByCate
			const renderqnasCate = (cate, qnaList) => {
			    clearqnaList(); // Clear existing qnas
			    const outerDiv = document.createElement('div');
			    outerDiv.id = 'outerDiv';
			    if (qnaList.length === 0) {
			        const emptyMessage = document.createElement('div');
			        emptyMessage.className = 'emptyMessage';
			        emptyMessage.textContent = '글이 없습니다';
			        outerDiv.appendChild(emptyMessage);
			    }else{
			    const headerRow = document.createElement('div');
			    headerRow.className = 'headerRow';
			    headerRow.appendChild(createDiv('번호', '70px'));
			    headerRow.appendChild(createDiv('분류', '130px'));
			    headerRow.appendChild(createDiv('제목', '450px'));
			    headerRow.appendChild(createDiv('날짜', '200px'));
			    headerRow.appendChild(createDiv('해결', '150px'));
			    outerDiv.appendChild(headerRow);
			    qnaList.forEach(o => {
			        const qnaEl = document.createElement('div');
			        qnaEl.className = 'qnaEl';
			        qnaEl.appendChild(createDiv(o.qnaNo, '70px'));
			        qnaEl.appendChild(createDiv(getKoreanqnaCategory(o.qnaCategory), '130px'));
			       
			        let newTitle = o.qnaTitle;
					if (o.secret === 'Y') {
						const currentUser = '${sessionScope.loginUser.memberId}';
						console.log(o.memberId);
					    if (currentUser === 'admin' || currentUser === o.memberId) {
					                newTitle = '🔑' + o.qnaTitle;
					    } else {
					                newTitle = '🔒' + o.qnaTitle;
					    }
					}else {
						const currentUser = '${sessionScope.loginUser.memberId}';
						if ( currentUser === o.memberId) {
			                newTitle = '✏️' + o.qnaTitle;
			    		}
					}
			        qnaEl.appendChild(createDiv(newTitle, '450px'));
			        qnaEl.appendChild(createDiv(o.createDate, '200px'));
			        qnaEl.appendChild(createDiv(o.solved, '150px'));
			        outerDiv.appendChild(qnaEl);
			    });
			    }
			    document.getElementById('content').appendChild(outerDiv);

			    // Add "Load More" button for this category if there are more qnas to load
			    if (currentPageCate[cate] * qnasPerPage < qnaListGlobal.length) {
			        
			    }
			};

		

			// div 생성을 도와주는 함수
			const createDiv = (data, style) => {
			    const divEl = document.createElement('div');
			    const divText = document.createTextNode(data);
			    divEl.style.width = style;
			    divEl.appendChild(divText);
			    return divEl;
			};

			// 사이트 시작할 때 로딩하는 정보
			window.onload = () => {
				findAll(solvedBoolean);
				
			    // Attach click events to category buttons if they exist in the DOM
			    const generalButton = document.getElementById('generalButton');
			    const serviceButton = document.getElementById('serviceButton');
			    const payButton = document.getElementById('payButton');
			    const eventButton = document.getElementById('eventButton');
			    const etcButton = document.getElementById('etcButton');

			    if (generalButton) {
			        generalButton.addEventListener('click', () => findAll(solvedBoolean,1));
			    }
			    if (serviceButton) {
			        serviceButton.addEventListener('click', () => findByCate('service',solvedBoolean,1));
			    }
			    if (payButton) {
			    	payButton.addEventListener('click', () => findByCate('pay',solvedBoolean,1));
			    }
			    if (eventButton) {
			        eventButton.addEventListener('click', () => findByCate('event',solvedBoolean,1));
			    }
			    if (etcButton) {
			        etcButton.addEventListener('click', () => findByCate('etc',solvedBoolean,1));
			    }};
			    
			    
			    //게시글 클릭할 시 
			    $('#content').on('click', '.qnaEl', e => {
			        const qnaNo = e.currentTarget.childNodes[0].innerText; // Assuming first child is the qnaNo

			        $.ajax({
			            url: 'qna/' + qnaNo,
			            type: 'get',
			            success: response => {
			            	 const qna = response.data;
			                 const currentUserId = '${sessionScope.loginUser.memberId}';
			                 const isAdmin = currentUserId === 'admin';
			                 const isAuthor = currentUserId === qna.memberId;
			                 
			                 // Check if the Q&A is secret and if the user is authorized to view it
			                 if ((qna.secret ==='Y'  )&& !isAdmin && !isAuthor) {
			                     alert('비밀글은 작성자 또는 관리자만 확인할 수 있습니다.');
			                     return;
			                 }
			                 
			                 console.log(currentUserId);
			                 console.log(qna.memberId);
			                 console.log(isAuthor);
			                currentQnaNo = parseInt(qnaNo);
			                // Update modal content with qna details
			               
			                let newTitle ='';
					        if (qna.secret === 'Y') {
					            const currentUser = '${sessionScope.loginUser.memberId}';
					            if (currentUser === 'admin' || currentUser === qna.memberId) {
					                newTitle = '🔑' ;
					            } else {
					                newTitle = '🔒' ;
					            }
					        }
			                var textTitle = qnaNo+'. [' +getKoreanqnaCategory(qna.qnaCategory)+'] '+newTitle+qna.qnaTitle;
			                $('#qnaModal #qnaHeader').text(textTitle);
			                $('#qnaModal #qnaContent').text(qna.qnaContent);
			                $('#qnaModal #qnaSolved').text(qna.solved);
			                $('#qnaModal #qnaId').text(qna.memberId);
			                $('#qnaModal #files').empty();
			                $('#qnaModal #comments').empty();
			                
							
			                // Append file links if files exist
			                if (qna.files && qna.files.length > 0) {
			                    qna.files.forEach((file, index) => {
			                        const fileLink = $('<div>')
			                            .append($('<span>').text((index + 1) + '. '))
			                            .append($('<a>').attr('href', '${path0}/' + file.changedName) // Ensure this path is correct
			                                .attr('download', file.originalName)
			                                .text(file.originalName));
			                        
			                        $('#qnaModal #files').append(fileLink);
			                        
			                    
			                });
							
			                
				            } else {
				                // If no files exist
				                $('#qnaModal #files').html('<p>파일이 존재하지 않습니다.</p>');
				                
				                
				            }
			                if (qna.comments && qna.comments.length > 0) {
			                    qna.comments.forEach(comment => {
			                    	const commentDiv = $('<div>')
			                        .addClass('comment')
			                        .append($('<span>').addClass('comment-author').text('작성자: ' + comment.memberNo + '  '))
			                        .append($('<span>').addClass('comment-date').text('날짜: ' + comment.resdate))
			                        .append($('<div>').addClass('comment-content').text(comment.commentContent));
			                    
			                    // Check if the user is logged in and append Edit/Delete buttons
			                  if (${sessionScope.loginUser != null && (sessionScope.loginUser.memberId == 'admin' || sessionScope.loginUser.memberNo == comment.memberNo) } ) {
			                        const changeBtn = $('<div>').addClass('comment-change btn').text('수정');
			                        const deleteBtn = $('<div>').addClass('comment-delete btn').text('삭제');
			
			                        changeBtn.click(() => {
			                            editComment(commentDiv, comment);
			                        });
			                        deleteBtn.click(() => {
			                            if (confirm('정말로 삭제하시겠습니까?')) {
			                                deleteComment(commentDiv, comment);
			                            }
			                        });
			                        commentDiv.append(changeBtn).append(deleteBtn);
			                    }

			                    $('#qnaModal #comments').append(commentDiv);
			                    });
			                } else {
			                    // If no comments exist
			                    $('#qnaModal #comments').html('<p>댓글이 없습니다.</p>');
			                }
			                if (isAdmin || isAuthor) {
			                    $('#goToUpdatePage').show();
			                    $('#deleteButton').show();
			                    $('#addCommentButton').show();
			                } else {
			                    $('#goToUpdatePage').hide();
			                    $('#deleteButton').hide();
			                    $('#addCommentButton').hide();
			                }
			                
			                const goToDeleteButton = document.getElementById('deleteButton');
			               if(goToDeleteButton){ goToDeleteButton.onclick = function() {
			                    return ConfirmDelete(currentQnaNo);
			                };}
			               

			                $('#qnaModal').modal('show');
			            }
			        });
			    });
			
			    function editComment(commentDiv, comment) {
			    	const originalContent = comment.commentContent;
			        const contentDiv = commentDiv.find('.comment-content');
			        const editInput = $('<input>').attr('type', 'text').val(originalContent);
			        const saveBtn = $('<div>').addClass('btn').text('저장');
			        const closeBtn = $('<div>').addClass('btn').text('닫기');

			        // Replace comment content with input field
			        contentDiv.empty().append(editInput);

			        // Add save and close buttons
			        contentDiv.append(saveBtn).append(closeBtn);

                    // Save button click event
                    saveBtn.click(() => {
                        const newContent = editInput.val();
                        comment.commentContent = newContent;
                        const updatedComment = {
                                commentNo: comment.commentNo,
                                qnaNo: comment.qnaNo,
                                memberNo: comment.memberNo,
                                commentContent: newContent
                            };
                        
                        console.log(JSON.stringify(updatedComment));
                        
                        $.ajax({
                        	 url: 'qna/comment/edit',
                             type: 'put',
                            // traditional: true,
                             contentType: 'application/json',
                             data: JSON.stringify(updatedComment),
                             success: response => {
                                 if (response.message === '댓글 수정 성공') {
                                     contentDiv.text(newContent);
                                 } else {
                                     contentDiv.text(originalContent);
                                     alert('댓글 수정 실패');
                                 }
                             },
                             error: () => {
                                 contentDiv.text(originalContent);
                                 alert('댓글 수정 중 오류 발생');
                             }
    			          
                        });
                    });

                    // Close button click event
                    closeBtn.click(() => {
                        contentDiv.text(originalContent);
                    });
                }
			    function deleteComment(commentDiv, comment) {
			        // Show confirmation dialog
			        
			            // Send AJAX request to delete the comment
			            $.ajax({
			                url: 'qna/commentDelete.do', // Ensure this matches the backend endpoint
			                type: 'POST', // Use POST for deletion, not PUT
			                contentType: 'application/json',
			                data: JSON.stringify({ commentNo: comment.commentNo }), // Send only commentNo
			                success: response => {
			                    if (response.message === '댓글 삭제 성공') {
			                        // Remove the comment from the UI
			                        commentDiv.remove();
			                    } else {
			                        alert('댓글 삭제 실패');
			                    }
			                },
			                error: () => {
			                    alert('댓글 삭제 중 오류 발생');
			                }
			            });
			        
			    }
			    
				
				// 공지사항 에러 출력하기
				const alert = (message) => {
				document.getElementById('liveAlertPlaceholder').innerHTML=`
				    <div class="alert alert-warning alert-dismissible fade show" role="alert">
				      <strong>\${message}</strong>
				      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				    </div> `;
				}
				

				const renderPagination = (pageInfo) => {
				    const paginationUl = document.getElementById('paginationUl');
				    paginationUl.innerHTML = ''; // Clear previous pagination

				    // "Previous" button
				    const prevLi = document.createElement('li');
				    prevLi.className = `page-item ${pageInfo.currentPage == 1 ? 'disabled' : ''}`;
				    const prevLink = document.createElement('a');
				    prevLink.className = 'page-link';
				    prevLink.href = `#`;
				    prevLink.innerText = '이전';
				    prevLink.onclick = (e) => {
				        e.preventDefault();
				        if (pageInfo.currentPage > 1) {
				            findAll(solvedBoolean, pageInfo.currentPage - 1); // Fetch previous page
				        }
				    };
				    prevLi.appendChild(prevLink);
				    paginationUl.appendChild(prevLi);

				    // Page numbers
				    for (let p = pageInfo.startPage; p <= pageInfo.endPage; p++) {
				        const pageLi = document.createElement('li');
				        pageLi.className = `page-item ${pageInfo.currentPage == p ? 'active' : ''}`;
				        const pageLink = document.createElement('a');
				        pageLink.className = 'page-link';
				        pageLink.href = `#`;
				        pageLink.innerText = p;
				        pageLink.style.color = pageInfo.currentPage == p ? 'red' : ''; // Change color of current page
				        pageLink.onclick = (e) => {
				            e.preventDefault();
				            findAll(solvedBoolean, p); // Fetch specific page
				        };
				        pageLi.appendChild(pageLink);
				        paginationUl.appendChild(pageLi);
				    }
				 // "Next" button
				    const nextLi = document.createElement('li');
				 	console.log(pageInfo.currentPage);
				 	console.log(pageInfo.maxPage);
				    nextLi.className = `page-item `;
				    const nextLink = document.createElement('a');
				    nextLink.className = 'page-link';
				    nextLink.href = `#`;
				    nextLink.innerText = '다음';
				    nextLink.onclick = (e) => {
				        e.preventDefault();
				        if (pageInfo.currentPage < pageInfo.maxPage) {
				            findAll(solvedBoolean, pageInfo.currentPage + 1); // Fetch next page
				        }
				    };
				    nextLi.appendChild(nextLink);
				    paginationUl.appendChild(nextLi);
				};
