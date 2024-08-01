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
<!--<script type="text/javascript" src="${path0 }/resources/js/qna/list.js"></script>  -->
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
}

#qna-container # comments {
	padding: 15px;
	background-color: #f9f9f9;
	border-top: 1px solid #e0e0e0;
	margin-top: 15px;
}

/* Individual comment container */
#qna-container .comment {
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

/* Comment content styling */
#qna-container .comment-content {
	font-size: 14px;
	color: #333;
	margin-bottom: 5px;
}

/* Comment details container */
#qna-container .comment-details {
	display: flex;
	justify-content: space-between;
	font-size: 12px;
	color: #777;
}

/* Author and date styling */
#qna-container .comment-author, .comment-date {
	margin-right: 10px;
}

/* Add comment button styling */
#qna-container #addCommentButton {
	margin-bottom: 10px;
}

/* Comment form styling */
#qna-container #commentForm {
	margin-bottom: 10px;
}

#qna-container #commentForm textarea {
	width: 100%;
	height: 80px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-bottom: 10px;
}

#qna-container #commentForm button {
	float: right;
}

#qna-container .container {
	width: 90%;
	margin-left: 5%;
	margin-right: 5%;
	margin: auto;
	overflow: hidden;
}

#qna-container header {
	background: #161616;
	color: #ffffff;
	padding-top: 30px;
	min-height: 70px;
	border-bottom: #2f4f4f 3px solid;
}

#qna-container header h1 {
	text-align: center;
	text-transform: uppercase;
	margin: 0;
	font-size: 24px;
}

#qna-container .filter-search-container {
	width: 900px;
	margin: auto;
	margin-top: 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#qna-container .filter-buttons {
	display: flex;
	flex: 1;
	gap: 10px;
}

#qna-container .search {
	margin-left: 10px;
}

#qna-container .search form {
	display: flex;
}

#qna-container .filter-buttons button:hover {
	background-color: #f0f0f0;
	color: #000;
}

#qna-container .filter-buttons button:focus {
	text-decoration-line: underline;
	text-decoration-thickness: 3px;
	font-weight: bold;
	outline: none;
	background-color: #e0e0e0;
}

#qna-container .search input[type="search"] {
	padding: 10px;
	font-size: 16px;
	width: 200px;
}

#qna-container .search input[type="submit"] {
	padding: 10px;
	background: #2C2C2C;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#qna-container #files {
	background-color: lightgray;
	width: 300px;
	height: auto;
}

#qna-container #content {
	width: 1000px;
	height: auto;
	margin: auto;
}

#qna-container .load-more-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

#qna-container #outerDiv {
	width: 1000px;
	display: block;
	overflow: auto;
	padding-top: 20px;
}

#qna-container .headerRow, .qnaEl {
	display: flex;
	align-items: center;
}

#qna-container .headerRow>div, .qnaEl>div {
	padding: 10px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#qna-container #qnaModal {
	top: 100px;
	min-height: 900px;
	z-index: 999999;
}

#qna-container #updateModal {
	top: 100px;
	min-height: 900px;
	height: auto;
	z-index: 9999999;
}

#qna-container .modal-content {
	height: 80%;
	border: 1rem solid;
	border-radius: 10;
}

#qna-container .inline-header {
	display: inline-block;
	margin-right: 10px;
}

#qna-container .modal-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#qna-container #title {
	margin-top: 100px;
	text-align: center;
}

#qna-container #detail {
	background-color: #23C293;
	width: 800px;
	margin: auto;
	text-align: center;
	color: white;
	height: 150px;
	display: none;
}

#qna-container #detail>div {
	height: 50px;
	line-height: 50px;
	border: 1px solid rgba(255, 255, 255, 0.656);
}

#qna-container .button-line {
	display: flex;
	justify-content: end;
	align-items: center;
	width: 90%;
	text-align: center;
	margin: 5%, 20px;
}

#qna-container .button-line a {
	padding: 5px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	display: block;
}

#qna-container .add-qna-button {
	background: #4CAF50;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 200px;
}

#qna-container .add-qna-button:hover {
	background: #45a049;
}

#qna-container .admin-button {
	background: #666362;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	padding-right: 20px;
}

#qna-container .admin-button:hover {
	background:  #494F55;
}

#qna-container .col-category {
	width: 10%;
}

#qna-container .col-title {
	width: 50%;
}

#qna-container .col-date {
	width: 20%;
}

#qna-container #pagingArea {
	text-align: center;
	margin-top: 20px;
	/* Optional, to add some space above the pagination */
	display: inline-block;
	width: 500px;
	margin-left: 500px;
}

#qna-container .page-item.disabled .page-link {
    color: #6c757d;
    pointer-events: none;
    cursor: not-allowed;
}

#qna-container .page-item.active .page-link {
    color: white; /* Change color of the active page */
}

#qna-container .page-link {
    cursor: pointer;
}

#qna-container .comment-change {
	background: #4CAF50;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#qna-container .comment-delete {
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<div id="qna-container">

		<header>
			<h1>QNA 고객지원</h1>
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
						id="toggleSolved" onclick="turnQnaSolved()">미해결/해결 보기</button>
				</div>
				
			</div>
			<div class="modal fade" id="qnaModal" tabindex="-1"
				aria-labelledby="qnaModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 id="qnaHeader"></h4>
							<label for="qnaId">작성자: </label>
							<div id="qnaId"></div>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<label for="qnaSolved" style="display: inline"><h4>해결상태:</h4>
							</label>
							<h5 id="qnaSolved"></h5>
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
								
										<div>
											<button id="addCommentButton" class="btn btn-primary">댓글 작성</button>
										</div>
										<div id="commentForm" style="display: none;">
											<textarea id="newCommentContent"
												placeholder="댓글을 작성하세요"></textarea>
											<button id="submitCommentButton" class="btn btn-success">댓글 추가</button>
										</div>
								

							</div>
						</div>
						<div class="modal-footer">
							<div id="qnaActions">
							
								
										<a class="btn btn-warning " id="goToUpdatePage"
											style="height: 40px; color: white; border: 0px solid #388E3C;">
											수정하기</a>&nbsp;&nbsp;
									 <a class="btn btn-danger" id="deleteButton"
											style="height: 40px; color: white; border: 0px solid #388E3C;">
											삭제하기</a>&nbsp;&nbsp; 
									
								<a class="btn btn-secondary" data-bs-dismiss="modal"
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
				<c:choose>
					<c:when test="${ not empty sessionScope.loginUser.memberId }">
						<a class="add-qna-button" href="qnas/insert.do">질문 추가하기</a>
					</c:when>
				</c:choose>
			</div>
		</div>

		<script>
		let solvedBoolean = 'all'; 
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
		            
		                const commentDiv = $('<div>')
		                    .addClass('comment')
		                    .append($('<span>').addClass('comment-author').text('Author: ' + newComment.memberNo))
		                     .append($('<span>').addClass('comment-date').text('Date: ' + newComment.resdate)) //댓글등록시간이 안나옴
		                    .append($('<div>').addClass('comment-content').text(newComment.commentContent))
		                    .append($('<div>').addClass('comment-details')
		                        
		                    );

		                $('#qnaModal #comments').append(commentDiv);
		                $('#newCommentContent').val(''); 
		                $('#commentForm').hide(); 
		            
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
		    if (confirm("질문글을 삭제하시겠습니까?")) {
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
		    currentPage = 0; 
		    $.ajax({
		        url: 'qna/list/' + currentCategory+'/'+solvedBoolean+'/'+page,
		        type: 'get',
		        success: function(response)  {
		        	qnaListGlobal = response.data.qnaList;
		            const pageInfo = response.data.pageInfo; 
		            renderqnas(qnaListGlobal.slice(0, qnasPerPage));
		            renderPagination(pageInfo);
		            currentPage++; 
		            
		        },
		        error: err => {
		        	
		        	 try {
		                 qnaListGlobal = response.data.qnaList; 
		                 const pageInfo = response.data.pageInfo; 
		                 renderqnas(qnaListGlobal.slice(0, qnasPerPage));
		                 renderPagination(pageInfo);
		             } catch (parseErr) {
		                 
		                 qnaListGlobal = [];
		                 renderqnas(qnaListGlobal);
		             }
		        }
		    });
		};

		
		const findByCate = (cate,solvedBoolean,page=1) => {
		    currentCategory = cate;
		    currentPageCate[cate] = 0; 
		    $.ajax({
		        url: 'qna/list/' + cate+'/'+solvedBoolean+'/'+page,
		        type: 'get',
		        success: response => {
		            qnaListGlobal = response.data.qnaList; 
		            const pageInfo = response.data.pageInfo;
		            renderqnasCate(cate, qnaListGlobal.slice(0, qnasPerPage));
		            renderPagination(pageInfo);
		            currentPageCate[cate]++; 
		           
		        },
		        error: err => {
		            try {
		                qnaListGlobal = response.data.qnaList; 
		                const pageInfo = response.data.pageInfo;
		                renderqnas(qnaListGlobal.slice(0, qnasPerPage));
		                renderPagination(pageInfo);
		            } catch (parseErr) {
		         
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
		        	qnaFileListGlobal = response.data; 
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
		            return 'Unknown Category'; 
		    }
		}
		
		const renderqnas = (qnaList) => {
clearqnaList(); 
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

		
		const renderqnasCate = (cate, qnaList) => {
		    clearqnaList(); 
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
		        const qnaNo = e.currentTarget.childNodes[0].innerText;

		        $.ajax({
		            url: 'qna/' + qnaNo,
		            type: 'get',
		            success: response => {
		            	 const qna = response.data;
		                 const currentUserId = '${sessionScope.loginUser.memberId}';
		                 const isAdmin = currentUserId === 'admin';
		                 const isAuthor = currentUserId === qna.memberId;
		                 
		                 if ((qna.secret ==='Y'  )&& !isAdmin && !isAuthor) {
		                     alert('비밀글은 작성자 또는 관리자만 확인할 수 있습니다.');
		                     return;
		                 }
		                 
		               
		                currentQnaNo = parseInt(qnaNo);
		               
		               
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
		                
						

		                if (qna.files && qna.files.length > 0) {
		                    qna.files.forEach((file, index) => {
		                        const fileLink = $('<div>')
		                            .append($('<span>').text((index + 1) + '. '))
		                            .append($('<a>').attr('href', '${path0}/' + file.changedName) 
		                                .attr('download', file.originalName)
		                                .text(file.originalName));
		                        
		                        $('#qnaModal #files').append(fileLink);
		                        
		                    
		                });
						
		                
			            } else {
			            
			                $('#qnaModal #files').html('<p>파일이 존재하지 않습니다.</p>');
			                
			                
			            }
		                if (qna.comments && qna.comments.length > 0) {
		                    qna.comments.forEach(comment => {
		                    	const commentDiv = $('<div>')
		                        .addClass('comment')
		                        .append($('<span>').addClass('comment-author').text('작성자: ' + comment.memberId + '  '))
		                        .append($('<span>').addClass('comment-date').text('날짜: ' + comment.resdate))
		                        .append($('<div>').addClass('comment-content').text(comment.commentContent));
		                    
		                    //console.log(currentUserId);
		                    //console.log(comment.memberId);
		                  
		                  if (${sessionScope.loginUser != null  }&& (currentUserId== 'admin' || currentUserId == comment.memberId) ) {
		                          //console.log(currentUserId== 'admin' || currentUserId == comment.memberId);
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


		        contentDiv.empty().append(editInput);

	
		        contentDiv.append(saveBtn).append(closeBtn);

      
                saveBtn.click(() => {
                    const newContent = editInput.val();
                    comment.commentContent = newContent;
                    const updatedComment = {
                            commentNo: comment.commentNo,
                            qnaNo: comment.qnaNo,
                            memberNo: comment.memberNo,
                            commentContent: newContent
                        };
                   
                    
                    
                    $.ajax({
                    	 url: 'qna/comment/edit',
                         type: 'put',
                     
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

                closeBtn.click(() => {
                    contentDiv.text(originalContent);
                });
            }
		    function deleteComment(commentDiv, comment) {
		       
		            $.ajax({
		                url: 'qna/commentDelete.do', 
		                type: 'POST', 
		                contentType: 'application/json',
		                data: JSON.stringify({ commentNo: comment.commentNo }), 
		                success: response => {
		                    if (response.message === '댓글 삭제 성공') {
		                        
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
			    paginationUl.innerHTML = ''; 

			  
			    const prevLi = document.createElement('li');
			    prevLi.className = `page-item ${pageInfo.currentPage == 1 ? 'disabled' : ''}`;
			    const prevLink = document.createElement('a');
			    prevLink.className = 'page-link';
			    prevLink.href = `#`;
			    prevLink.innerText = '이전';
			    prevLink.onclick = (e) => {
			        e.preventDefault();
			        if (pageInfo.currentPage > 1) {
			        	if(currentCategory=='all'){
			        		findAll(solvedBoolean, pageInfo.currentPage - 1);
			        	}else{
			        		findByCate(currentCategory, solvedBoolean, pageInfo.currentPage - 1);
			        	}
			            
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
			        pageLink.style.color = pageInfo.currentPage == p ? 'red' : ''; 
			        pageLink.onclick = (e) => {
			            e.preventDefault();
			            if(currentCategory=='all'){
			        		findAll(solvedBoolean, p);
			        	}else{
			        		
			        		findByCate(currentCategory, solvedBoolean, p);
			        	}
			        };
			        pageLi.appendChild(pageLink);
			        paginationUl.appendChild(pageLi);
			    }
			 // "Next" button
			    const nextLi = document.createElement('li');
			 
			    nextLi.className = `page-item `;
			    const nextLink = document.createElement('a');
			    nextLink.className = 'page-link';
			    nextLink.href = `#`;
			    nextLink.innerText = '다음';
			    nextLink.onclick = (e) => {
			        e.preventDefault();
			        if (pageInfo.currentPage < pageInfo.maxPage) {
			        	
			        	if(currentCategory=='all'){
			        		findAll(solvedBoolean, pageInfo.currentPage + 1);
			        	}else{
			        		
			        		findByCate(currentCategory, solvedBoolean, pageInfo.currentPage + 1);
			        	}
			        }
			    };
			    nextLi.appendChild(nextLink);
			    paginationUl.appendChild(nextLi);
			};

            </script>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="${hpath }/resources/js/forHeader.js?after1"></script>
	<%@ include file="../footer.jsp"%>
</body>