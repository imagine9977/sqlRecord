<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.text.*, java.net.InetAddress"%>
<c:set var="path0" value="<%=request.getContextPath()%>" />
<!DOCTYPE>
<html lang="ko">
<html>
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
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

#qna-container .container {
	width: 80%;
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
	width: 800px;
	height: auto;
	margin: auto;
}

#qna-container .load-more-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

#qna-container #outerDiv {
	width: 800px;
	display: block;
	overflow: auto;
	padding-top: 20px;
}

#qna-container .headerRow, #qna-container .qnaEl {
	display: flex;
	align-items: center;
}

#qna-container .headerRow>div, #qna-container .qnaEl>div {
	padding: 10px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#qna-container #qnaModal {
	top: 100px;
	min-height: 300px;
	height: auto;
	z-index: 999999;
}

#qna-container #updateModal {
	top: 100px;
	min-height: 300px;
	height: auto;
		z-index: 9999999;
}

#qna-container .modal-content {
	height: 60%;
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
	justify-content: space-between;
	align-items: center;
	width: 100%;
	text-align: center;
	margin: 20px 0;
}

#qna-container .button-line button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#qna-container .add-qna-button {
	padding: 10px 20px;
	background: #4CAF50;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#qna-container .add-qna-button:hover {
	background: #45a049;
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

#qna-container #liveAlertPlaceholder {
	z-index: 10;
}
</style>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../searchHeader.jsp"%>
	<div id="qna-container">

		<header>
			<h1>공지사항</h1>
		</header>
		<div class="container">
			<div class="filter-search-container">
				<div class="filter-buttons">
					<button type="button" class="btn btn-outline-secondary"
						onclick="findAll()">전체</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="findByCate('general')">일반</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="findByCate('service')">서비스</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="findByCate('event')">이벤트</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="findByCate('etc')">기타</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="turnQnaSolved()">미해결만 보기</button>
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
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="qnaHeader"></h5>
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
						</div>
						<div class="modal-footer">
							<div id="qnaActions">
								<a class="btn btn-warning" onclick="toggleUpdateModal();"
									style="height: 40px; color: white; border: 0px solid #388E3C;">수정하기</a>&nbsp;&nbsp;
								<a class="btn btn-danger" id="deleteButton"
									style="height: 40px; color: white; border: 0px solid #388E3C;">삭제하기</a>&nbsp;&nbsp;
								<a class="btn btn-secondary" data-bs-dismiss="modal"
									style="height: 40px; color: white; border: 0px solid #388E3C;">닫기</a>&nbsp;&nbsp;
								<button class="btn share-button btn-secondary"
									title="Share this article">
									<span>공유하기</span>
								</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="modal fade" id="updateModal" tabindex="-1"
			aria-labelledby="updateModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<form method="POST" enctype="multipart/form-data"
						id="fileUploadForm">
						<input type="hidden" id="fileNoDel" name="fileNoDel" value="">
						<input type="hidden" id="fileNameDel" name="fileNameDel" value="">
						<div class="modal-header">
							<h5 id="qnaNo" class="inline-header"></h5>
							<input type="hidden" name="qnaNo" value="${qna.qnaNo }" />
							<label for="qnaTitle">제목</label> <input type="text"
								class="form-control" id='qnaTitle' name='qnaTitle'
								value="">
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="qnaCategory">분류</label> <select
									class="form-control" id="qnaCategory" name="qnaCategory">
									<option value="general">일반</option>
									<option value="event">이벤트</option>
									<option value="service">서비스</option>
									<option value="etc">기타</option>
								</select>
							</div>
							<div id="qna-detail">
								<h4>파일 내려받기</h4>
								<div id="files"></div>
								<hr />
								<div class="form-group">
									<label for="qnaContent">내용</label>
									<textarea class="form-control" rows="5" id='qnaContent'
										style="resize: none;"></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div id="qnaActions">
								<button class="btn" type="button" id="btnSubmit"
									style="background-color: orange; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">수정하기</button>
								&nbsp;&nbsp; <a class="btn" data-bs-dismiss="modal"
									style="background-color: #ff52a0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">닫기</a>&nbsp;&nbsp;
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div id="liveAlertPlaceholder"></div>

		<div id="content"></div>


		<div class="button-line">
			<div class="see-more">
				<!--  <span class="get-more-list" onclick="loadMoreqnas()">더 보기</span> -->
			</div>
			<div class="add">
				<a class="add-qna-button" href="qnas/insert.do">공지 추가하기</a>
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
			let currentqnaNo=0;
			
			var fileNoArry = [];
			var fileNameArry = [];

			$(document).on('click', '.fileDelBtn', function() {
			    var fileNo = $(this).data('fileNo');
			    var fileName = $(this).data('fileName');
			    
			    fileNoArry.push(fileNo);
			    fileNameArry.push(fileName);
			    
			    $('#fileNoDel').attr('value', fileNoArry);
			    $('#fileNameDel').attr('value', fileNameArry);
			    $(this).parent().remove();
			});
			
			function turnQnaSolved() {
	            if(solvedBoolean=='N'){
	            	solvedBoolean='Y';
	            }else{
	            	solvedBoolean='N';
	            }
	            if(currentCategory='all'){
	            	findAll();
	            }else{
	            	findByCate(currentCategory);
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
			// 공지사항 업데이트 
			$("#btnSubmit").click(function (event) {         
			    //event.preventDefault();  // 기본 폼 제출 방지
			    console.log("Try");
			    var form = $('#fileUploadForm')[0];  // 폼 요소 가져오기
			    
			    var data = new FormData(form);  // FormData 객체 생성
			    console.log("Sending data: ",data);
			 	// 필요한 경우 추가 파일을 FormData 객체에 추가 가능
			    // 예를 들어, 'fileInput2', 'fileInput3' 등의 ID를 가진 추가 파일 입력이 있는 경우
			   	 //data.append('updateFile2', $('#fileInput2')[0].files[0]);
			     //data.append('updateFile3', $('#fileInput3')[0].files[0]);
			   
			    
			    $.ajax({             
			        type: "put",  
			        url: "qna/update",
			        data: data,  // Pass FormData object JSON.stringify(data)
			    	/* 
			        headers: { 
				        Accept : "text/javascript; charset=utf-8",
				        "Content-Type": "text/javascript; charset=utf-8"
				    },
				    */
				  
			        processData: false,  // Important: Do not process the data
			        contentType: false, 
			        success: function (result) {
			            if (result.data === 1) {
			                document.getElementById('outerDiv').remove();
			                findAll();
			                $('#detail').slideUp(300);
			            }
			        },
			        error: function (e) {  
			            console.log("ERROR : ", e);     
			            $("#btnSubmit").prop("disabled", false);    
			            alert("fail");      
			        }   
			    });  
			});

			// 공지사항 추가하기 
			function insert() {
                const requestData = {
                    "qnaTitle": document.getElementById('insertTitle').value,
                    "qnaContent": document.getElementById('insertContent').value,
                    "qnaCategory": document.getElementById('insertCategory').value,
                    "qnaCategory": document.getElementById('insertCategory').value
                };
                console.log(requestData);
                $.ajax({
                    url: 'qna',
                    type: 'post',
                    data: requestData,
                    success: response => {
                        console.log(response);
                        if (response.message === '서비스 요청 성공') {
                            document.getElementById('outerDiv').remove();
                            findAll();
                            document.getElementById('qnaTitle').value = '';
                            document.getElementById('qnaContent').value = '';
                        }
                    }
                });
            }
			
			//공지 수정하기를 누르면 조회 모달을 숨기고 수정 모달로 변경
			function toggleUpdateModal() {
	            $('#qnaModal').modal('hide'); // Hide the main qna modal
	            $('#updateModal').modal('show'); // Show the update modal
	        }
			
			//공지 수정하기가 종료/성공하면 조회 모달로 변경
			$('#updateModal').on('hidden.bs.modal', function () {
	            $('#qnaModal').modal('show');
	        });
			
			/*
			var data = new FormData();
			jQuery.each(jQuery('#files')[0].files, function(i, file) {
			    data.append('file-'+i, file);
			});
			function update() {
                const updateData = {
                		"qnaNo" : $('qnaNo').val(),
    					"qnaTitle" : $('qnaTitle').val(),
    					"qnaWriter" : $('updateWriter').val(),
    					"qnaContent" : $('qnaContent').val(),
    					"qnaCategory" : $('qnaCategory').val(),	
    					"List<qnaFile>" :data
                };
                $.ajax({
                    url: "qna",
                    type: "put",
                    enctype: 'multipart/form-data',  
                    data: JSON.stringify(updateData),
                    contentType: 'application/json',
                    success: result => {
                        if (result.data === 1) {
                            document.getElementById('outerDiv').remove();
                            findAll();
                            $('#detail').slideUp(300);
                        }
                    }
                });
            }
			
			*/
			
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
                             findAll();
                             alert('게시글 삭제 성공');
                         }
                     } 
                 });
             }
			// 공지 전부 띄우기 
			const findAll = () => {
			    currentCategory = 'all';
			    currentPage = 0; // 페이지 갯수 초기화
			    $.ajax({
			        url: 'qna/' + currentCategory,
			        type: 'get',
			        success: response => {
			        	qnaListGlobal = response.data; // Store initial qna list globally
			            qnaListGlobal = formatDates(qnaListGlobal); // Format the dates
			            renderqnas(qnaListGlobal.slice(0, qnasPerPage));
			            currentPage++; // Increment page after loading initial data
			            checkLoadMoreButton();
			        },
			        error: err => {
			            console.error('Error fetching data:', err);
			        }
			    });
			};

			// Function to load qnas by category
			const findByCate = (cate) => {
			    currentCategory = cate;
			    currentPageCate[cate] = 0; // Initialize page count for this category
			    $.ajax({
			        url: 'qna/' + cate,
			        type: 'get',
			        success: response => {
			            qnaListGlobal = response.data; // Store initial qna list globally
			            qnaListGlobal = formatDates(qnaListGlobal);
			            renderqnasCate(cate, qnaListGlobal.slice(0, qnasPerPage));
			            currentPageCate[cate]++; // Increment page after loading initial data
			            checkLoadMoreButtonCate(cate);
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
			
			
			const formatDates = (qnaList) => {
			    return qnaList.map(qna => {
			        if (qna.createDate) {
			            qna.createDate = formatDate(qna.createDate);
			        }
			        return qna;
			    });
			};


			const formatDate = (dateString) => {
			    const date = new Date(dateString); // Create a Date object from the datetime string

			    const year = date.getFullYear(); // Get the year
			    const month = ('0' + (date.getMonth() + 1)).slice(-2); // Get the month (adding 1 because months are zero-indexed)
			    const day = ('0' + date.getDate()).slice(-2); // Get the day

			    return `${year}-${month}-${day}`;
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
			    headerRow.appendChild(createDiv('제목', '400px'));
			    headerRow.appendChild(createDiv('날짜', '200px'));
			    outerDiv.appendChild(headerRow);

			    qnaList.forEach(o => {
			        const qnaEl = document.createElement('div');
			        qnaEl.className = 'qnaEl';
			        qnaEl.appendChild(createDiv(o.qnaNo, '70px'));
			        
			        qnaEl.appendChild(createDiv(getKoreanqnaCategory(o.qnaCategory), '130px'));
			        qnaEl.appendChild(createDiv(o.qnaTitle, '400px'));
			        qnaEl.appendChild(createDiv(o.createDate, '200px'));
			        outerDiv.appendChild(qnaEl);
			    });
			    document.getElementById('content').appendChild(outerDiv);

			    // Add "Load More" button for findAll if there are more qnas to load
			    if (currentPage * qnasPerPage < qnaListGlobal.length) {
			        const loadMoreButtonContainer = document.createElement('div');
			        loadMoreButtonContainer.className = 'load-more-container'; // Container for centering

			        const loadMoreButton = document.createElement('button');
			        loadMoreButton.className = 'get-more-list btn btn-outline-secondary';
			        loadMoreButton.textContent = '더 보기';
			        loadMoreButton.onclick = loadMoreqnas;

			        loadMoreButtonContainer.appendChild(loadMoreButton); // Add button to the container
			        document.getElementById('content').appendChild(loadMoreButtonContainer); // Add container to the content
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
			    headerRow.appendChild(createDiv('제목', '400px'));
			    headerRow.appendChild(createDiv('날짜', '200px'));
			    outerDiv.appendChild(headerRow);
			    qnaList.forEach(o => {
			        const qnaEl = document.createElement('div');
			        qnaEl.className = 'qnaEl';
			        qnaEl.appendChild(createDiv(o.qnaNo, '70px'));
			        qnaEl.appendChild(createDiv(getKoreanqnaCategory(o.qnaCategory), '130px'));
			        qnaEl.appendChild(createDiv(o.qnaTitle, '400px'));
			        qnaEl.appendChild(createDiv(o.createDate, '200px'));
			        outerDiv.appendChild(qnaEl);
			    });
			    document.getElementById('content').appendChild(outerDiv);

			    // Add "Load More" button for this category if there are more qnas to load
			    if (currentPageCate[cate] * qnasPerPage < qnaListGlobal.length) {
			        const loadMoreButtonContainer = document.createElement('div');
			        loadMoreButtonContainer.className = 'load-more-container'; // Container for centering

			        const loadMoreButton = document.createElement('button');
			        loadMoreButton.className = 'get-more-list-cate btn btn-outline-secondary';
			        loadMoreButton.textContent = '더 보기';
			        loadMoreButton.onclick = () => loadMoreqnasCate(cate);

			        loadMoreButtonContainer.appendChild(loadMoreButton); // Add button to the container
			        document.getElementById('content').appendChild(loadMoreButtonContainer); // Add container to the content
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
				findAll();

			    // Attach click events to category buttons if they exist in the DOM
			    const generalButton = document.getElementById('generalButton');
			    const serviceButton = document.getElementById('serviceButton');
			    const eventButton = document.getElementById('eventButton');
			    const etcButton = document.getElementById('etcButton');

			    if (generalButton) {
			        generalButton.addEventListener('click', () => findAll());
			    }
			    if (serviceButton) {
			        serviceButton.addEventListener('click', () => findByCate('service'));
			    }
			    if (eventButton) {
			        eventButton.addEventListener('click', () => findByCate('event'));
			    }
			    if (etcButton) {
			        etcButton.addEventListener('click', () => findByCate('etc'));
			    }};
			    
			    
			    //게시글 클릭할 시 
			    $('#content').on('click', '.qnaEl', e => {
			        const qnaNo = e.currentTarget.childNodes[0].innerText; // Assuming first child is the qnaNo

			        $.ajax({
			            url: 'qna/' + qnaNo,
			            type: 'get',
			            success: response => {
			                const qna = response.data;
			                currentqnaNo = parseInt(qnaNo);
			                // Update modal content with qna details
			                var textTitle = qnaNo+'. [' +getKoreanqnaCategory(qna.qnaCategory)+'] '+qna.qnaTitle;
			                $('#qnaModal #qnaHeader').text(textTitle);
			                $('#qnaModal #qnaContent').text(qna.qnaContent);
			                $('#qnaModal #files').empty();
			                
			                
			                $('#updateModal #qnaNo').val(qnaNo);
			                $('#updateModal #qnaTitle').val(qna.qnaTitle);
			                $('#updateModal #qnaContent').val(qna.qnaContent);
			                $('#updateModal #files').empty();
			                $('select[name^="qnaCategory"] option:selected').attr("selected",null);
			                $("select[name=qnaCategory]").val(qna.qnaCategory).prop("selected", true);
							
			                // Append file links if files exist
			                if (qna.files && qna.files.length > 0) {
			                    qna.files.forEach((file, index) => {
			                        const fileLink = $('<div>')
			                            .append($('<span>').text((index + 1) + '. '))
			                            .append($('<a>').attr('href', '${path0}/' + file.changedName) // Ensure this path is correct
			                                .attr('download', file.originalName)
			                                .text(file.originalName));
			                        
			                        $('#qnaModal #files').append(fileLink);
			                        
			                        const updatefileLink = $('<div>')
			                        .append($('<span>').text((index + 1) + '. 현재 업로드된 파일: '))
			                        
			                         .append($('<a>').attr('href', `${path0}/` + file.changedName) // Ensure this path is correct
			                            .attr('download', file.originalName)
			                            .text(file.originalName))
			                        .append($('<input>').attr('type', 'file')
			                            .attr('class', 'form-control-file border')
			                            .attr('name', 'updatefile'))
			                        .append($('<button>').attr('type', 'button')
					                .attr('class', 'fileDelBtn')
					                .text('삭제')
					                .data('qnaFileNo', file.qnaFile_NO)
					                .data('fileName', 'qnaFile_NO_' + index));
			                    
			                    $('#updateModal #files').append(updatefileLink);
			                });
							
			                // Append additional input fields if less than 3 files exist
			                for (let i = qna.files.length; i < 3; i++) {
			                    $('#updateModal #files').append('<input type="file" class="form-control-file border" name="updatefile">');
			                } 
			            } else {
			                // If no files exist
			                $('#qnaModal #files').html('<p>파일이 존재하지 않습니다.</p>');
			                
			                // Show 3 input fields for new file uploads
			                for (let i = 0; i < 3; i++) {
			                    $('#updateModal #files').append('<input type="file" class="form-control-file border" name="updatefile">');
			                }
			            }

			                document.getElementById('deleteButton').onclick = function() {
			                    return ConfirmDelete(currentqnaNo);
			                };

			                $('#qnaModal').modal('show');
			            }
			        });
			    });
				//공지사항 공유하기
			    const shareButton = document.querySelector('.share-button');
			    shareButton.addEventListener('click', async () => {
			    	  try {
			    	    await navigator.share({
			    	      title: 'SQLRECORD 공지사항',
			    	      text: 'SQLRECORD 공지사항 공유',
			    	      url: '',
			    	    });
			    	    console.log('공유 성공');
			    	  } catch (e) {
			    	    console.log('공유 실패');
			    	  }
			    	});
			    
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

            </script>

	</div>
	<script src="${hpath }/resources/js/forHeader.js?after1"></script>
	<%@ include file="../footer.jsp"%>
</body>

</html>
