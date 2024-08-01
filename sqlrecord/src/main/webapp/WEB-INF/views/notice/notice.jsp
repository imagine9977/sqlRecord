<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sqlrecord.sqlrecord.member.model.vo.Member"%>
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
	height: auto;
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
	height: auto;
	z-index: 999999;
}

#notice-container #updateModal {
	top: 100px;
	min-height: 300px;
	height: auto;
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
	justify-content: end;
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
	margin-right: 300px;
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
	height:auto;
}

#notice-container .admin-button {
	background: #666362;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;

}

#notice-container .admin-button:hover {
	background:  #494F55;
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
				
			</div>
			<div class="modal fade" id="noticeModal" tabindex="-1"
				aria-labelledby="noticeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<input type="hidden" id="noticeNo" name="noticeNo" value="" />
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
							<!-- <a class="btn btn-warning" onclick="toggleUpdateModal();"
										style="height: 40px; color: white; border:	 0px solid #388E3C;">수정하기</a>&nbsp;&nbsp; -->
								<a class="btn btn-warning admin-only" id="goToUpdatePage"
									style="height: 40px; color: white; border: 0px solid #388E3C; display: none;">
									수정하기</a>&nbsp;&nbsp; 
									<a class="btn btn-danger admin-only"
									id="deleteButton"
									style="height: 40px; color: white; border: 0px solid #388E3C; display: none;">
									삭제하기</a>&nbsp;&nbsp; <a class="btn btn-secondary"
									data-bs-dismiss="modal"
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
				<div class="modal-content" id="fileUploadForm">
					<input type="hidden" id="fileNoDel" name="fileNoDel" value="">
					<div class="modal-header">
						<h5 id="updateNumber" class="inline-header"></h5>
						<input type="hidden" id="updateNo" name="updateNo" value="" /> <label
							for="updateTitle">제목</label> <input type="text"
							class="form-control" id='updateTitle' name='updateTitle' value="">
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
							<div id="upfiles"></div>
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
							<button class="btn" type="button" id="btnSubmit"
								style="background-color: orange; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">수정하기</button>
							&nbsp;&nbsp; <a class="btn" data-bs-dismiss="modal"
								style="background-color: #ff52a0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">닫기</a>&nbsp;&nbsp;
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<div id="liveAlertPlaceholder"></div>

		<div id="content"></div>


		<div class="button-line">
			<div class="see-more">
			</div>
			<c:if test="${ sessionScope.loginUser.memberId eq 'admin'}">
				<div class="admin-button">
						<a class=" admin-button btn" href="${hpath }/adminFor#notice">관리자페이지로
							가기</a>
				</div>
			
				<div class="add">

					<a class="add-notice-button" href="notices/insert.do">공지 추가하기</a>

				</div>
			</c:if>
		</div>

		<script>
			let currentPage = 0; // 현재 페이지 0으로 고정
			const currentPageCate = {}; // 카테고리 사용시 현재 페이지 기억
			const noticesPerPage = 10; // 공지사항 한번에 표시되는 공지사항 수
			let noticeListGlobal = []; //초기 공지사항 목록을 저장할 전역 변수
			let currentCategory = 'all'; // 현재 보고 있는 카테고리 추적
			let nfileListGlobal = [];
			let currentNoticeNo=0;
			
			var fileNoArry = [];
			var fileNameArry = [];
			
			document.getElementById("goToUpdatePage").onclick = function () {
		        location.href = "notices/update.do/"+currentNoticeNo;
		    };
			
			var userRole = '${sessionScope.loginUser.memberId}';

		    document.addEventListener('DOMContentLoaded', function() {
		        if (userRole === 'admin') {
		            var adminElements = document.querySelectorAll('.admin-only');
		            adminElements.forEach(function(element) {
		                element.style.display = 'inline-block';
		            });
		        }
		    });
			$(document).on('click', '.fileDelBtn', function() {
			    var fileNo = $(this).data('nfileNo');
			    
			    fileNoArry.push(fileNo);
			    $('#fileNoDel').attr('value', fileNoArry);
			    $(this).parent().remove();
			});
			
			
			// 공지사항 목록을 지우는 함수	
			const clearNoticeList = () => {
			    const existingOuterDiv = document.getElementById('outerDiv');
			    if (existingOuterDiv) {
			        existingOuterDiv.remove(); // 기존의 outerDiv가 있으면 제거
			    }
			    // 기존 "더 보기" 버튼이 있으면 제거
			    $('.get-more-list').remove();
			    $('.get-more-list-cate').remove();
			    $('.load-more-container').remove();
			}
			
			// 공지사항 추가하기 
			function insert() {
                const requestData = {
                    "noticeTitle": document.getElementById('insertTitle').value,
                    "noticeContent": document.getElementById('insertContent').value,
                    "noticeCategory": document.getElementById('insertCategory').value,
                    "noticeCategory": document.getElementById('insertCategory').value
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
			
			//공지 수정하기를 누르면 조회 모달을 숨기고 수정 모달로 변경
			/*
			function toggleUpdateModal() {
	            $('#noticeModal').modal('hide'); // Hide the main notice modal
	            $('#updateModal').modal('show'); // Show the update modal
	        }
			*/
			//공지 수정하기가 종료/성공하면 조회 모달로 변경
			$('#updateModal').on('hidden.bs.modal', function () {
	            $('#noticeModal').modal('show');
	        });
			
			
			
			//공지 삭제하기 확인 프롬프트
			function ConfirmDelete(noticeNo) {
			    if (confirm("Are you sure you want to delete this notice?")) {
			    	 console.log(noticeNo);
			    	deleteById(noticeNo);
			    }
			    return false;
			}
			//공지 삭제하기
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
	
			const findAll = () => {
			    currentCategory = 'all';
			    currentPage = 0; 
			    $.ajax({
			        url: 'notice/list',
			        type: 'get',
			        success: response => {
			        	noticeListGlobal = response.data; 
			            noticeListGlobal = formatDates(noticeListGlobal); 
			            renderNotices(noticeListGlobal.slice(0, noticesPerPage));
			            currentPage++;
			            checkLoadMoreButton();
			        },
			        error: err => {
			            console.error('Error fetching data:', err);
			        }
			    });
			};

		
			const findByCate = (cate) => {
			    currentCategory = cate;
			    currentPageCate[cate] = 0; 
			    $.ajax({
			        url: 'notice/list/cate/' + cate,
			        type: 'get',
			        success: response => {
			            noticeListGlobal = response.data; 
			            noticeListGlobal = formatDates(noticeListGlobal);
			            renderNoticesCate(cate, noticeListGlobal.slice(0, noticesPerPage));
			            currentPageCate[cate]++; 
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
			        	nfileListGlobal = response.data;
			        },
			        error: err => {
			            console.error('Error fetching data:', err);
			        }
			    });
			};
			
			
			const loadMoreNotices = () => {
			    renderNotices(noticeListGlobal.slice(0, (currentPage + 1) * noticesPerPage));
			    currentPage++; 
			    checkLoadMoreButton();
			};

		
			const loadMoreNoticesCate = (cate) => {
			    renderNoticesCate(cate, noticeListGlobal.slice(0, (currentPageCate[cate] + 1) * noticesPerPage));
			    currentPageCate[cate]++; 
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
			    const date = new Date(dateString); 

			    const year = date.getFullYear(); 
			    const month = ('0' + (date.getMonth() + 1)).slice(-2);
			    const day = ('0' + date.getDate()).slice(-2); 

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
			            return 'Unknown Category'; 
			    }
			}
			
			const renderNotices = (noticeList) => {
			    clearNoticeList();
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


			    if (currentPage * noticesPerPage < noticeListGlobal.length) {
			        const loadMoreButtonContainer = document.createElement('div');
			        loadMoreButtonContainer.className = 'load-more-container'; 

			        const loadMoreButton = document.createElement('button');
			        loadMoreButton.className = 'get-more-list btn btn-outline-secondary';
			        loadMoreButton.textContent = '더 보기';
			        loadMoreButton.onclick = loadMoreNotices;

			        loadMoreButtonContainer.appendChild(loadMoreButton);
			        document.getElementById('content').appendChild(loadMoreButtonContainer);
			    }
			};
			
			const renderNoticesCate = (cate, noticeList) => {
			    clearNoticeList(); 
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

			    if (currentPageCate[cate] * noticesPerPage < noticeListGlobal.length) {
			        const loadMoreButtonContainer = document.createElement('div');
			        loadMoreButtonContainer.className = 'load-more-container';

			        const loadMoreButton = document.createElement('button');
			        loadMoreButton.className = 'get-more-list-cate btn btn-outline-secondary';
			        loadMoreButton.textContent = '더 보기';
			        loadMoreButton.onclick = () => loadMoreNoticesCate(cate);

			        loadMoreButtonContainer.appendChild(loadMoreButton);
			        document.getElementById('content').appendChild(loadMoreButtonContainer); 
			    }
			};

			
			const checkLoadMoreButton = () => {
			    const loadMoreButton = document.querySelector('.get-more-list');
			    if (loadMoreButton && currentPage * noticesPerPage >= noticeListGlobal.length) {
			        loadMoreButton.style.display = 'none'; 
			    }
			};

			const checkLoadMoreButtonCate = (cate) => {
			    const loadMoreButton = document.querySelector('.get-more-list-cate');
			    if (loadMoreButton && currentPageCate[cate] * noticesPerPage >= noticeListGlobal.length) {
			        loadMoreButton.style.display = 'none'; 
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
			    $('#content').on('click', '.noticeEl', e => {
			        const noticeNo = e.currentTarget.childNodes[0].innerText;

			        $.ajax({
			            url: 'notice/' + noticeNo,
			            type: 'get',
			            success: response => {
			                const notice = response.data;
			                currentNoticeNo = parseInt(noticeNo);
			                var textTitle = noticeNo+'. [' +getKoreanNoticeCategory(notice.noticeCategory)+'] '+notice.noticeTitle;
			                $('#noticeModal #noticeNo').val(noticeNo);
			                $('#noticeModal #noticeHeader').text(textTitle);
			                $('#noticeModal #noticeContent').text(notice.noticeContent);
			                $('#noticeModal #files').empty();
			                
			                
			                $('#updateModal #updateNumber').text(noticeNo);
			                $('#updateModal #updateNo').val(noticeNo);
			                $('#updateModal #updateTitle').val(notice.noticeTitle);
			                $('#updateModal #updateContent').val(notice.noticeContent);
			                $('#updateModal #upfiles').empty();
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
			                        .append($('<button>').attr('type', 'button')
					                .attr('class', 'fileDelBtn')
					                .text('삭제')
					                .data('nfileNo', file.nfileNo) );
			                    
			                    $('#updateModal #upfiles').append(updatefileLink);
			                });
							
			                // Append additional input fields if less than 3 files exist
			                for (let i = notice.files.length; i < 3; i++) {
			                    $('#updateModal #upfiles').append('<input type="file" class="form-control-file border" name="updatefile">');
			                } 
			            } else {
			                // If no files exist
			                $('#noticeModal #files').html('<p>파일이 존재하지 않습니다.</p>');
			                
			                // Show 3 input fields for new file uploads
			                for (let i = 0; i < 3; i++) {
			                    $('#updateModal #upfiles').append('<input type="file" class="form-control-file border" name="updatefile">');
			                }
			            }

			                document.getElementById('deleteButton').onclick = function() {
			                    return ConfirmDelete(currentNoticeNo);
			                };

			                $('#noticeModal').modal('show');
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
			    const alertPlaceholder = document.getElementById('liveAlertPlaceholder');

				  // 공지사항 에러 출력하기
				  const alert = (message) => {
				    const wrapper = document.createElement('div');
				    wrapper.innerHTML = `
				      <div class="alert alert-warning alert-dismissible" role="alert">
				        \${message}
				        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				      </div>
				    `;
				
				    alertPlaceholder.append(wrapper);
				  };
				  
            </script>

	</div>
	<script src="${hpath }/resources/js/forHeader.js?after1"></script>
	<%@ include file="../footer.jsp"%>
</body>

</html>
