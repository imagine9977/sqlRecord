<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.text.*, java.net.InetAddress"%>
<c:set var="path0" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../head.jsp"%>
<meta charset="UTF-8">

<title>공지사항</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css'
	rel='stylesheet' type='text/css'>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<style>
/* Scoped styles for qna.jsp content */
#qna-container {
	font-family: Arial, sans-serif;
	padding: 0;
	background-color: #f4f4f4;
	margin-bottom: 15px;
	} # comments { padding : 15px;
	background-color: #f9f9f9;
	border-top: 1px solid #e0e0e0;
	margin-top: 15px;
}

/* Individual comment container */
.comment {
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

/* Comment content styling */
.comment-content {
	font-size: 14px;
	color: #333;
	margin-bottom: 5px;
}

/* Comment details container */
.comment-details {
	display: flex;
	justify-content: space-between;
	font-size: 12px;
	color: #777;
}

/* Author and date styling */
.comment-author, .comment-date {
	margin-right: 10px;
}

/* Add comment button styling */
#addCommentButton {
	margin-bottom: 10px;
}

/* Comment form styling */
#commentForm {
	margin-bottom: 10px;
}

#commentForm textarea {
	width: 100%;
	height: 80px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-bottom: 10px;
}

#commentForm button {
	float: right;
}

.container {
	width: 90%;
	margin-left: 5%;
	margin-right: 5%;
	margin: auto;
	overflow: hidden;
}

header {
	background: #161616;
	color: #ffffff;
	padding-top: 30px;
	min-height: 70px;
	border-bottom: #2f4f4f 3px solid;
}

header h1 {
	text-align: center;
	text-transform: uppercase;
	margin: 0;
	font-size: 24px;
}

.filter-search-container {
	width: 900px;
	margin: auto;
	margin-top: 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.filter-buttons {
	display: flex;
	flex: 1;
	gap: 10px;
}

.search {
	margin-left: 10px;
}

.search form {
	display: flex;
}

.filter-buttons button:hover {
	background-color: #f0f0f0;
	color: #000;
}

.filter-buttons button:focus {
	text-decoration-line: underline;
	text-decoration-thickness: 3px;
	font-weight: bold;
	outline: none;
	background-color: #e0e0e0;
}

.search input[type="search"] {
	padding: 10px;
	font-size: 16px;
	width: 200px;
}

.search input[type="submit"] {
	padding: 10px;
	background: #2C2C2C;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#files {
	background-color: lightgray;
	width: 300px;
	height: auto;
}

#content {
	width: 1000px;
	height: auto;
	margin: auto;
}

.load-more-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

#outerDiv {
	width: 1000px;
	display: block;
	overflow: auto;
	padding-top: 20px;
}

.headerRow, .qnaEl {
	display: flex;
	align-items: center;
}

.headerRow>div, .qnaEl>div {
	padding: 10px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#qnaModal {
	top: 100px;
	min-height: 900px;
	z-index: 999999;
}

#updateModal {
	top: 100px;
	min-height: 900px;
	height: auto;
	z-index: 9999999;
}

.modal-content {
	height: 80%;
	border: 1rem solid;
	border-radius: 10;
}

.inline-header {
	display: inline-block;
	margin-right: 10px;
}

.modal-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#title {
	margin-top: 100px;
	text-align: center;
}

#detail {
	background-color: #23C293;
	width: 800px;
	margin: auto;
	text-align: center;
	color: white;
	height: 150px;
	display: none;
}

#detail>div {
	height: 50px;
	line-height: 50px;
	border: 1px solid rgba(255, 255, 255, 0.656);
}

.button-line {
	display: flex;
	justify-content: end;
	align-items: center;
	width: 90%;
	text-align: center;
	margin: 5%, 20px;
}

.button-line a {
	padding: 5px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	display: block;
}

.add-qna-button {
	background: #4CAF50;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.add-qna-button:hover {
	background: #45a049;
}

.admin-button {
	background: #4CAF50;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	paddint-right: 20px;
}

.admin-button:hover {
	background: #45a049;
}

.col-category {
	width: 10%;
}

.col-title {
	width: 50%;
}

.col-date {
	width: 20%;
}

#liveAlertPlaceholder {
	z-index: 10;
}

#pagingArea {
	text-align: center;
	margin-top: 20px;
	/* Optional, to add some space above the pagination */
	display: inline-block;
	width: 500px;
	margin-left: 500px;
}

.pagination .page-item.active .page-link {
	background-color: #007bff;
	color: white;
	border-color: #007bff;
}

.pagination .page-item .page-link {
	color: #007bff;
}

.pagination .page-item .page-link:hover {
	background-color: #0056b3;
	color: white;
	border-color: #0056b3;
}

.comment-change {
	background: #4CAF50;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.comment-delete {
	background: red;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;

}
</style>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../searchHeader.jsp"%>
	<div id="qna-container">

		<header>
			<h1>QNA 질문게시판</h1>
		</header>
		<div class="container">
			<div class="filter-search-container">
				<div class="filter-buttons">
					<button type="button" class="btn btn-outline-secondary"
						id="toggleCategory1" onclick="findAll(solvedBoolean,1)">전체</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="findByCate('general', solvedBoolean,1)">일반</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="findByCate('pay', solvedBoolean,1)">결제</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="findByCate('service', solvedBoolean,1)">서비스</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="findByCate('etc', solvedBoolean,1)">기타</button>
					<button type="button" class="btn btn-outline-secondary"
						id="toggleSolved" onclick="turnQnaSolved()">미해결만 보기</button>
				</div>
				<div class="search">
					<form action="/" method="get">
						<input type="search" name="s" placeholder="검색어를 입력하세요." /> <input
							type="hidden" name="post_type" value="qna" /> <input
							type="submit" value="검색" />
					</form>
				</div>
			</div>
			<div class="modal fade" id="qnaModal" tabindex="-1"
				aria-labelledby="qnaModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="qnaHeader"></h5>
							<label for="qnaId">작성자: </label>
							<div id="qnaId"></div>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<div id="qna-detail">
								<h4>파일 내려받기</h4>
								<div id="files"></div>
								<hr />
								<div class="form-group">
									<label for="qnaContent">내용</label>
									<div id="qnaContent"></div>
								</div>
							</div>
							<hr />
							<div id="qna-comments">
							<div id="comments"></div>
							<c:choose>
							<c:when test="${sessionScope.loginUser.memberId} eq 'admin'
									|| ${sessionScope.loginUser.memberId}==qnaId">
								
								<div><button id="addCommentButton admin-only"
									class="btn btn-primary">Add Comment</button></div>
								
									<div id="commentForm" style="display: none;">
									<textarea id="newCommentContent"
										placeholder="Enter your comment"></textarea>
									<button id="submitCommentButton" class="btn btn-success">Submit
										Comment</button>
									</div>
								</c:when>

								</c:choose>
							</div>
						</div>
						<div class="modal-footer">
							<div id="qnaActions">
								<a class="btn btn-warning user-only" id="goToUpdatePage"
									style="height: 40px; color: white; border: 0px solid #388E3C; display: none;">
									수정하기</a>&nbsp;&nbsp; <a class="btn btn-danger user-only"
									id="deleteButton"
									style="height: 40px; color: white; border: 0px solid #388E3C; display: none;">
									삭제하기</a>&nbsp;&nbsp; <a class="btn btn-secondary"
									data-bs-dismiss="modal"
									style="height: 40px; color: white; border: 0px solid #388E3C;">닫기</a>&nbsp;&nbsp;

							</div>
						</div>
					</div>

				</div>
			</div>
		</div>


		<div id="liveAlertPlaceholder"></div>

		<div id="content"></div>
		<div id="pagingArea">
			<ul class="pagination" id="paginationUl"></ul>
		</div>

		<div class="button-line">

			<c:choose>
				<c:when test="${ sessionScope.loginUser.memberId == 'admin' }">
					<div class="admin-button">
						<a class=" admin-button btn" href="${hpath }/adminFor">관리페이지로
							가기</a>
					</div>
				</c:when>
			</c:choose>
			<br />

			<div class="add">
				<a class="add-qna-button" href="qnas/insert.do">질문 추가하기</a>
			</div>
		</div>

		<script>
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
			
			document.getElementById("goToUpdatePage").onclick = function () {
		        location.href = "qnas/update.do/"+currentQnaNo;
		    };
			
		    
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
			        memberNo: userRole,
			        commentContent: commentContent, 
			    };

			    $.ajax({
			        url: 'qna/comment/',
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
                	
                     url: 'qna/' + qnaNo,
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
			        url: 'qna/' + currentCategory+'/'+solvedBoolean+'/'+page,
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
			        }
			    });
			};

			// Function to load qnas by category
			const findByCate = (cate,solvedBoolean,page=1) => {
			    currentCategory = cate;
			    currentPageCate[cate] = 0; // Initialize page count for this category
			    $.ajax({
			        url: 'qna/' + cate+'/'+solvedBoolean+'/'+page,
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
			        qnaEl.appendChild(createDiv(o.qnaTitle, '450px'));
			        qnaEl.appendChild(createDiv(o.createDate, '200px'));
			        qnaEl.appendChild(createDiv(o.solved, '150px'));
			        outerDiv.appendChild(qnaEl);
			    });
			    document.getElementById('content').appendChild(outerDiv);

			    // Add "Load More" button for findAll if there are more qnas to load
			    if (currentPage * qnasPerPage < qnaListGlobal.length) {
			       
			    }
			};
			
			// Function to render qnas by category in the UI for findByCate
			const renderqnasCate = (cate, qnaList) => {
			    clearqnaList(); // Clear existing qnas
			    const outerDiv = document.createElement('div');
			    outerDiv.id = 'outerDiv';
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
			        //if(userRole !=null || userRole!=o.qnaId)
			        qnaEl.appendChild(createDiv(o.qnaTitle, '450px'));
			        qnaEl.appendChild(createDiv(o.createDate, '200px'));
			        qnaEl.appendChild(createDiv(o.solved, '150px'));
			        outerDiv.appendChild(qnaEl);
			    });
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
			                currentQnaNo = parseInt(qnaNo);
			                // Update modal content with qna details
			                var textTitle = qnaNo+'. [' +getKoreanqnaCategory(qna.qnaCategory)+'] '+qna.qnaTitle;
			                $('#qnaModal #qnaHeader').text(textTitle);
			                $('#qnaModal #qnaContent').text(qna.qnaContent);
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
			                    if (${sessionScope.loginUser != null}) {
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
			                
			                
			                
			                document.getElementById('deleteButton').onclick = function() {
			                    return ConfirmDelete(currentQnaNo);
			                };

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
                        console.log(updatedComment);
                        $.ajax({
                        	 url: 'qna/commentEdit.do',
                             type: 'Put',
                             traditional: true,
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
			        if (confirm('정말로 삭제하시겠습니까?')) {
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
			    }
			    
			    //공지사항 삭제/오류 시 나오는 에러
			    const alertPlaceholder = document.getElementById('liveAlertPlaceholder')
				
			 	//공지사항 에러 출력하기
			    const alert = (message) => {
			      const wrapper = document.createElement('div')
			      wrapper.innerHTML = [
			        '<div class="alert alert-warning alert-dismissible" role="alert">',
			        '   <div>${message}</div>',
			        '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
			        '</div>'
			      ].join('')

			      alertPlaceholder.append(wrapper)
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
			                findAll(solvedBoolean,pageInfo.currentPage - 1); // Fetch previous page
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
			            pageLink.onclick = (e) => {
			                e.preventDefault();
			                findAll( solvedBoolean, p); // Fetch specific page
			            };
			            pageLi.appendChild(pageLink);
			            paginationUl.appendChild(pageLi);
			        }

			        // "Next" button
			        const nextLi = document.createElement('li');
			        nextLi.className = `page-item ${pageInfo.currentPage == pageInfo.maxPage ? 'disabled' : ''}`;
			        const nextLink = document.createElement('a');
			        nextLink.className = 'page-link';
			        nextLink.href = `#`;
			        nextLink.innerText = '다음';
			        nextLink.onclick = (e) => {
			            e.preventDefault();
			            if (pageInfo.currentPage < pageInfo.maxPage) {
			                findAll(solvedBoolean,pageInfo.currentPage + 1); // Fetch next page
			            }
			        };
			        nextLi.appendChild(nextLink);
			        paginationUl.appendChild(nextLi);
			    };
            </script>

	</div>
	<script src="${hpath }/resources/js/forHeader.js?after1"></script>
	<%@ include file="../footer.jsp"%>
</body>

