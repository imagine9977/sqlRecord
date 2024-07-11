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
/* Scoped styles for notice.jsp content */
#notice-container {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

#notice-container .container {
	width: 80%;
	margin: auto;
	overflow: hidden;
}

#notice-container header {
	background: #161616;
	color: #ffffff;
	padding-top: 30px;
	min-height: 70px;
	border-bottom: #2f4f4f 3px solid;
}

#notice-container header h1 {
	text-align: center;
	text-transform: uppercase;
	margin: 0;
	font-size: 24px;
}

#notice-container .filter-search-container {
	width: 900px;
	margin: auto;
	margin-top: 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#notice-container .filter-buttons {
	display: flex;
	flex: 1;
	gap: 10px;
}

#notice-container .search {
	margin-left: 10px;
}

#notice-container .search form {
	display: flex;
}

#notice-container .filter-buttons button:hover {
	background-color: #f0f0f0;
	color: #000;
}

#notice-container .filter-buttons button:focus {
	text-decoration-line: underline;
	text-decoration-thickness: 3px;
	font-weight: bold;
	outline: none;
	background-color: #e0e0e0;
}

#notice-container .search input[type="search"] {
	padding: 10px;
	font-size: 16px;
	width: 200px;
}

#notice-container .search input[type="submit"] {
	padding: 10px;
	background: #2C2C2C;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#notice-container #files {
	background-color: lightgray;
	width: 300px;
	height: 100px;
}

#notice-container #content {
	width: 800px;
	height: auto;
	margin: auto;
}

#notice-container .load-more-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

#notice-container #outerDiv {
	width: 800px;
	display: block;
	overflow: auto;
	padding-top: 20px;
}

#notice-container .headerRow, #notice-container .noticeEl {
	display: flex;
	align-items: center;
}

#notice-container .headerRow>div, #notice-container .noticeEl>div {
	padding: 10px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#notice-container #noticeModal {
	top: 100px;
	min-height: 300px;
	z-index: 999999;
}

#notice-container #updateModal {
	top: 100px;
	min-height: 300px;
	z-index: 9999999;
}

#notice-container .modal-content {
	height: 60%;
	border: 1rem solid;
	border-radius: 10;
}

#notice-container .inline-header {
	display: inline-block;
	margin-right: 10px;
}

#notice-container .modal-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#notice-container #title {
	margin-top: 100px;
	text-align: center;
}

#notice-container #detail {
	background-color: #23C293;
	width: 800px;
	margin: auto;
	text-align: center;
	color: white;
	height: 150px;
	display: none;
}

#notice-container #detail>div {
	height: 50px;
	line-height: 50px;
	border: 1px solid rgba(255, 255, 255, 0.656);
}

#notice-container .button-line {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	text-align: center;
	margin: 20px 0;
}

#notice-container .button-line button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#notice-container .add-notice-button {
	padding: 10px 20px;
	background: #4CAF50;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#notice-container .add-notice-button:hover {
	background: #45a049;
}

#notice-container .col-category {
	width: 10%;
}

#notice-container .col-title {
	width: 50%;
}

#notice-container .col-date {
	width: 20%;
}

#notice-container #liveAlertPlaceholder {
	z-index: 10;
}
</style>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../searchHeader.jsp"%>
	<div id="notice-container">

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
				</div>
				<div class="search">
					<form action="/" method="get">
						<input type="search" name="s" placeholder="검색어를 입력하세요." /> <input
							type="hidden" name="post_type" value="notice" /> <input
							type="submit" value="검색" />
					</form>
				</div>
			</div>
			<div class="modal fade" id="noticeModal" tabindex="-1"
				aria-labelledby="noticeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="noticeHeader"></h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<div id="notice-detail">
								<h4>파일 내려받기</h4>
								<div id="files"></div>
								<hr />
								<div class="form-group">
									<label for="noticeContent">내용</label>
									<div id="noticeContent"></div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div id="noticeActions">
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
				 <form method="POST" enctype="multipart/form-data" id="fileUploadForm"> 	
					<div class="modal-header">
						<h5 id="updateNo" class="inline-header"></h5>
						<label for="updateTitle">제목</label> <input type="text"
							class="form-control" id='updateTitle' value="">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="updateCategory">분류</label> <select
								class="form-control" id="updateCategory" name="updateCategory">
								<option value="general">일반</option>
								<option value="event">이벤트</option>
								<option value="service">서비스</option>
								<option value="etc">기타</option>
							</select>
						</div>
						<div id="notice-detail">
							<h4>파일 내려받기</h4>
							<div id="files"></div>
							<hr />
							<div class="form-group">
								<label for="updateContent">내용</label>
								<textarea class="form-control" rows="5" id='updateContent'
									style="resize: none;"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div id="noticeActions">
							<a class="btn" type="submit" id="btnSubmit"
								style="background-color: orange; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">수정하기</a>&nbsp;&nbsp;
							<a class="btn" data-bs-dismiss="modal"
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
				<!--  <span class="get-more-list" onclick="loadMoreNotices()">더 보기</span> -->
			</div>
			<div class="add">
				<a class="add-notice-button" href="notices/insert.do">공지 추가하기</a>
			</div>
		</div>

		<script>
			let currentPage = 0; // Keep track of current page for findAll
			const currentPageCate = {}; // Object to keep track of current page for each category
			const noticesPerPage = 10; // Number of notices to load per "Load More" click
			let noticeListGlobal = []; // Global variable to store the initial notice list
			let currentCategory = 'all'; // To track the current category being viewed
			let nfileListGlobal = [];
			let currentNoticeNo=0;
			// Function to clear the notice list
			const clearNoticeList = () => {
			    const existingOuterDiv = document.getElementById('outerDiv');
			    if (existingOuterDiv) {
			        existingOuterDiv.remove(); // Remove existing outerDiv if present
			    }
			    // Remove existing "Load More" buttons if present
			    $('.get-more-list').remove();
			    $('.get-more-list-cate').remove();
			    $('.load-more-container').remove();
			}
			$("#btnSubmit").click(function (event) {         
			    event.preventDefault();  // Prevent default form submission
			    
			    var form = $('#fileUploadForm')[0];  // Get the form element
			    
			    var data = new FormData(form);  // Create FormData object
			    
			    // You can append additional files to FormData object if needed
			    // For example, if you have additional file inputs with ID 'fileInput2', 'fileInput3', etc.
			    // data.append('file2', $('#fileInput2')[0].files[0]);
			    // data.append('file3', $('#fileInput3')[0].files[0]);
			    
			    $("#btnSubmit").prop("disabled", true);  // Disable the submit button
			    
			    $.ajax({             
			        type: "put",  
			        url: "notice/update",
			        enctype: 'multipart/form-data',  
			        contentType: 'application/json; charset=UTF-8',  // Set content type to false
			        processData: false,   // Set processData to false
			        data: JSON.stringify(data),  // Pass FormData object
			        timeout: 600000,    
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


			function insert() {
                const requestData = {
                    "noticeTitle": document.getElementById('noticeTitle').value,
                    "noticeContent": document.getElementById('noticeContent').value,
                    "noticeCategory": document.getElementById('noticeCategory').value,
                    "noticeCategory": document.getElementById('noticeCategory').value
                };
                console.log(requestData);
                $.ajax({
                    url: 'notice',
                    type: 'post',
                    data: requestData,
                    success: response => {
                        console.log(response);
                        if (response.message === '서비스 요청 성공') {
                            document.getElementById('outerDiv').remove();
                            findAll();
                            document.getElementById('noticeTitle').value = '';
                            document.getElementById('noticeContent').value = '';
                        }
                    }
                });
            }
			function toggleUpdateModal() {
	            $('#noticeModal').modal('hide'); // Hide the main notice modal
	            $('#updateModal').modal('show'); // Show the update modal
	        }
			$('#updateModal').on('hidden.bs.modal', function () {
	            $('#noticeModal').modal('show');
	        });
			var data = new FormData();
			jQuery.each(jQuery('#files')[0].files, function(i, file) {
			    data.append('file-'+i, file);
			});
			function update() {
                const updateData = {
                		"noticeNo" : $('updateNo').val(),
    					"noticeTitle" : $('updateTitle').val(),
    					"noticeWriter" : $('updateWriter').val(),
    					"noticeContent" : $('updateContent').val(),
    					"noticeCategory" : $('updateCategory').val(),	
    					"List<Nfile>" :data
                };
                $.ajax({
                    url: "notice",
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
			function ConfirmDelete(noticeNo) {
			    if (confirm("Are you sure you want to delete this notice?")) {
			    	 console.log(noticeNo);
			    	deleteById(noticeNo);
			    }
			    return false; // To prevent the default link behavior
			}
			 function deleteById(noticeNo) {
                 $.ajax({
                	
                     url: 'notice/' + noticeNo,
                     type: 'delete',
                     success: response => {
                         if (response.message === '게시글 삭제 성공') {
                        	 
                        	 $('#noticeModal').modal('hide');
                        	 $('#noticeModal').slideUp(300);
                             document.getElementById('outerDiv').remove();
                             findAll();
                             alert('게시글 삭제 성공');
                         }
                     } 
                 });
             }
			// Function to load all notices
			const findAll = () => {
			    currentCategory = 'all';
			    currentPage = 0; // Reset page count for findAll
			    $.ajax({
			        url: 'notice',
			        type: 'get',
			        success: response => {
			        	noticeListGlobal = response.data; // Store initial notice list globally
			            noticeListGlobal = formatDates(noticeListGlobal); // Format the dates
			            renderNotices(noticeListGlobal.slice(0, noticesPerPage));
			            currentPage++; // Increment page after loading initial data
			            checkLoadMoreButton();
			        },
			        error: err => {
			            console.error('Error fetching data:', err);
			        }
			    });
			};

			// Function to load notices by category
			const findByCate = (cate) => {
			    currentCategory = cate;
			    currentPageCate[cate] = 0; // Initialize page count for this category
			    $.ajax({
			        url: 'notice/category/' + cate,
			        type: 'get',
			        success: response => {
			            noticeListGlobal = response.data; // Store initial notice list globally
			            noticeListGlobal = formatDates(noticeListGlobal);
			            renderNoticesCate(cate, noticeListGlobal.slice(0, noticesPerPage));
			            currentPageCate[cate]++; // Increment page after loading initial data
			            checkLoadMoreButtonCate(cate);
			        },
			        error: err => {
			            console.error('Error fetching data:', err);
			        }
			    });
			};
			const findFiles = (noticeNo) => {
			   
			    $.ajax({
			        url: 'notice/nFile/' + noticeNo,
			        type: 'get',
			        success: response => {
			        	nfileListGlobal = response.data; // Store initial notice list globally
			        },
			        error: err => {
			            console.error('Error fetching data:', err);
			        }
			    });
			};
			
			// Function to load more notices when "Load More" is clicked for findAll
			const loadMoreNotices = () => {
			    renderNotices(noticeListGlobal.slice(0, (currentPage + 1) * noticesPerPage));
			    currentPage++; // Increment page after loading more data
			    checkLoadMoreButton();
			};

			// Function to load more notices by category when "Load More" is clicked for findByCate
			const loadMoreNoticesCate = (cate) => {
			    renderNoticesCate(cate, noticeListGlobal.slice(0, (currentPageCate[cate] + 1) * noticesPerPage));
			    currentPageCate[cate]++; // Increment page after loading more data
			    checkLoadMoreButtonCate(cate);
			};
			const formatDates = (noticeList) => {
			    return noticeList.map(notice => {
			        if (notice.resdate) {
			            notice.createDate = formatDate(notice.resdate);
			        }
			        return notice;
			    });
			};


			const formatDate = (dateString) => {
			    const date = new Date(dateString); // Create a Date object from the datetime string

			    const year = date.getFullYear(); // Get the year
			    const month = ('0' + (date.getMonth() + 1)).slice(-2); // Get the month (adding 1 because months are zero-indexed)
			    const day = ('0' + date.getDate()).slice(-2); // Get the day

			    return `${year}-${month}-${day}`;
			};
			function getKoreanNoticeCategory(noticeCategory) {
			    switch (noticeCategory) {
			        case 'etc':
			        	console.log('기타');
			            return '기타';
			        case 'service':
			            return '서비스';
			        case 'event':
			            return '이벤트';
			        case 'general':
			            return '일반';
			        default:
			            return 'Unknown Category'; // Default case if category does not match any known types
			    }
			}
			// Function to render notices in the UI for findAll
			const renderNotices = (noticeList) => {
			    clearNoticeList(); // Clear existing notices
			    const outerDiv = document.createElement('div');
			    outerDiv.id = 'outerDiv';
			    const headerRow = document.createElement('div');
			    headerRow.className = 'headerRow';
			    headerRow.appendChild(createDiv('번호', '70px'));
			    headerRow.appendChild(createDiv('분류', '130px'));
			    headerRow.appendChild(createDiv('제목', '400px'));
			    headerRow.appendChild(createDiv('날짜', '200px'));
			    outerDiv.appendChild(headerRow);

			    noticeList.forEach(o => {
			        const noticeEl = document.createElement('div');
			        noticeEl.className = 'noticeEl';
			        noticeEl.appendChild(createDiv(o.noticeNo, '70px'));
			        
			        noticeEl.appendChild(createDiv(getKoreanNoticeCategory(o.noticeCategory), '130px'));
			        noticeEl.appendChild(createDiv(o.noticeTitle, '400px'));
			        noticeEl.appendChild(createDiv(o.resdate, '200px'));
			        outerDiv.appendChild(noticeEl);
			    });
			    document.getElementById('content').appendChild(outerDiv);

			    // Add "Load More" button for findAll if there are more notices to load
			    if (currentPage * noticesPerPage < noticeListGlobal.length) {
			        const loadMoreButtonContainer = document.createElement('div');
			        loadMoreButtonContainer.className = 'load-more-container'; // Container for centering

			        const loadMoreButton = document.createElement('button');
			        loadMoreButton.className = 'get-more-list btn btn-outline-secondary';
			        loadMoreButton.textContent = '더 보기';
			        loadMoreButton.onclick = loadMoreNotices;

			        loadMoreButtonContainer.appendChild(loadMoreButton); // Add button to the container
			        document.getElementById('content').appendChild(loadMoreButtonContainer); // Add container to the content
			    }
			};
			
			// Function to render notices by category in the UI for findByCate
			const renderNoticesCate = (cate, noticeList) => {
			    clearNoticeList(); // Clear existing notices
			    const outerDiv = document.createElement('div');
			    outerDiv.id = 'outerDiv';
			    const headerRow = document.createElement('div');
			    headerRow.className = 'headerRow';
			    headerRow.appendChild(createDiv('번호', '70px'));
			    headerRow.appendChild(createDiv('분류', '130px'));
			    headerRow.appendChild(createDiv('제목', '400px'));
			    headerRow.appendChild(createDiv('날짜', '200px'));
			    outerDiv.appendChild(headerRow);
			    noticeList.forEach(o => {
			        const noticeEl = document.createElement('div');
			        noticeEl.className = 'noticeEl';
			        noticeEl.appendChild(createDiv(o.noticeNo, '70px'));
			        noticeEl.appendChild(createDiv(getKoreanNoticeCategory(o.noticeCategory), '130px'));
			        noticeEl.appendChild(createDiv(o.noticeTitle, '400px'));
			        noticeEl.appendChild(createDiv(o.resdate, '200px'));
			        outerDiv.appendChild(noticeEl);
			    });
			    document.getElementById('content').appendChild(outerDiv);

			    // Add "Load More" button for this category if there are more notices to load
			    if (currentPageCate[cate] * noticesPerPage < noticeListGlobal.length) {
			        const loadMoreButtonContainer = document.createElement('div');
			        loadMoreButtonContainer.className = 'load-more-container'; // Container for centering

			        const loadMoreButton = document.createElement('button');
			        loadMoreButton.className = 'get-more-list-cate btn btn-outline-secondary';
			        loadMoreButton.textContent = '더 보기';
			        loadMoreButton.onclick = () => loadMoreNoticesCate(cate);

			        loadMoreButtonContainer.appendChild(loadMoreButton); // Add button to the container
			        document.getElementById('content').appendChild(loadMoreButtonContainer); // Add container to the content
			    }
			};

			// Function to check and manage "Load More" button visibility for findAll
			const checkLoadMoreButton = () => {
			    const loadMoreButton = document.querySelector('.get-more-list');
			    if (loadMoreButton && currentPage * noticesPerPage >= noticeListGlobal.length) {
			        loadMoreButton.style.display = 'none'; // Hide button if no more notices to load
			    }
			};

			// Function to check and manage "Load More" button visibility for findByCate
			const checkLoadMoreButtonCate = (cate) => {
			    const loadMoreButton = document.querySelector('.get-more-list-cate');
			    if (loadMoreButton && currentPageCate[cate] * noticesPerPage >= noticeListGlobal.length) {
			        loadMoreButton.style.display = 'none'; // Hide button if no more notices to load
			    }
			};

			// Helper function to create div elements
			const createDiv = (data, style) => {
			    const divEl = document.createElement('div');
			    const divText = document.createTextNode(data);
			    divEl.style.width = style;
			    divEl.appendChild(divText);
			    return divEl;
			};

			// Initial loading on page load
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
			    
			    $('#content').on('click', '.noticeEl', e => {
			        const noticeNo = e.currentTarget.childNodes[0].innerText; // Assuming first child is the noticeNo

			        $.ajax({
			            url: 'notice/' + noticeNo,
			            type: 'get',
			            success: response => {
			                const notice = response.data;
			                currentNoticeNo = parseInt(noticeNo);
			                // Update modal content with notice details
			                var textTitle = noticeNo+'. [' +getKoreanNoticeCategory(notice.noticeCategory)+'] '+notice.noticeTitle;
			                $('#noticeModal #noticeHeader').text(textTitle);
			                $('#noticeModal #noticeContent').text(notice.noticeContent);
			                $('#noticeModal #files').empty();
			                
			                
			                $('#updateModal #updateNo').val(noticeNo);
			                $('#updateModal #updateTitle').val(notice.noticeTitle);
			                $('#updateModal #updateContent').val(notice.noticeContent);
			                $('#updateModal #files').empty();
			                $('select[name^="updateCategory"] option:selected').attr("selected",null);
			                $("select[name=updateCategory]").val(notice.noticeCategory).prop("selected", true);
							
			                // Append file links if files exist
			                if (notice.files && notice.files.length > 0) {
			                    notice.files.forEach((file, index) => {
			                        const fileLink = $('<div>')
			                            .append($('<span>').text((index + 1) + '. '))
			                            .append($('<a>').attr('href', '${path0}/' + file.changedName) // Ensure this path is correct
			                                .attr('download', file.originalName)
			                                .text(file.originalName));
			                        
			                        $('#noticeModal #files').append(fileLink);
			                        
			                        const updatefileLink = $('<div>')
			                        .append($('<span>').text((index + 1) + '. 현재 업로드된 파일: '))
			                        .append($('<a>').attr('href', `${path0}/` + file.changedName) // Ensure this path is correct
			                            .attr('download', file.originalName)
			                            .text(file.originalName))
			                        .append('<br>')
			                        .append($('<input>').attr('type', 'file')
			                            .attr('class', 'form-control-file border')
			                            .attr('name', 'updatefile' + index));
			                    
			                    $('#updateModal #files').append(updatefileLink);
			                });

			                // Append additional input fields if less than 3 files exist
			                for (let i = notice.files.length; i < 3; i++) {
			                    $('#updateModal #files').append('<input type="file" class="form-control-file border" name="newfile' + i + '">');
			                }
			            } else {
			                // If no files exist
			                $('#noticeModal #files').html('<p>파일이 존재하지 않습니다.</p>');
			                
			                // Show 3 input fields for new file uploads
			                for (let i = 0; i < 3; i++) {
			                    $('#updateModal #files').append('<input type="file" class="form-control-file border" name="newfile' + i + '">');
			                }
			            }

			                document.getElementById('deleteButton').onclick = function() {
			                    return ConfirmDelete(currentNoticeNo);
			                };

			                $('#noticeModal').modal('show');
			            }
			        });
			    });

			    const shareButton = document.querySelector('.share-button');
			    shareButton.addEventListener('click', async () => {
			    	  try {
			    	    await navigator.share({
			    	      title: '재그지그의 개발 블로그',
			    	      text: '디자인과 UI, UX에 관심이 많은 주니어 웹 프론트엔드 개발자입니다.',
			    	      url: '',
			    	    });
			    	    console.log('공유 성공');
			    	  } catch (e) {
			    	    console.log('공유 실패');
			    	  }
			    	});
			    
			    const alertPlaceholder = document.getElementById('liveAlertPlaceholder')

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
	</div>
	<script src="${hpath }/resources/js/forHeader.js?after1"></script>
	<%@ include file="../footer.jsp"%>
</body>

</html>
