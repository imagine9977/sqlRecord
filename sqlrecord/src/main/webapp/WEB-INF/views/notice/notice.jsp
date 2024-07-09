<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path0" value="<%=request.getContextPath()%>" />
<!DOCTYPE>
<html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/bootstrap.jsp" %>
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
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	width: 80%;
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
	display: flex; /* Use flexbox for layout */
	align-items: center; /* Center items vertically */
	justify-content: space-between;
	margin-top: 10px; /* Distribute items evenly with space between them */
}

.filter-buttons {
	display: flex; /* Use flexbox for filter buttons */
	flex: 1; /* Occupy remaining space */
	gap: 10px; /* Spacing between buttons */
}

.search {
	margin-left: 10px;
	/* Add some margin between filter buttons and search */
}

.search form {
	display: flex; /* Use flexbox for search form */
}

.filter-buttons button:hover {
	background-color: #f0f0f0; /* Light grey background on hover */
	color: #000; /* Darker text color on hover */
}

.filter-buttons button:focus {
	text-decoration-line: underline;
	text-decoration-thickness: 3px;
	font-weight: bold;
	outline: none; /* Remove default focus outline */
	background-color: #e0e0e0; /* Slightly darker grey on focus */
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

#fileArea {
	background-color: lightgray;
	width: 300px;
	height: 100px;
}

#content {
	width: 800px;
	height: auto;
	margin: auto;
}

.load-more-container {
	display: flex;
	justify-content: center;
	margin-top: 20px; /* Adjust as needed */
}

#outerDiv {
	width: 800px;
	display: block;
	overflow: auto;
	padding-top: 20px;
}

.headerRow, .noticeEl {
	display: flex;
	align-items: center; /* Align items vertically */
}

.headerRow>div, .noticeEl>div {
	padding: 10px; /* Adjust padding for spacing */
	white-space: nowrap; /* Prevent text wrapping */
	overflow: hidden; /* Hide overflow */
	text-overflow: ellipsis; /* Show ellipsis for overflow */
}

#noticeModal {
	min-height: 300px;
}

.modal-content {
	height: 50%;
	border: 0;
	@
	include
	border-radius(0);
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
	justify-content: space-between;
	align-items: center;
	width: 100%;
	text-align: center;
	margin: 20px 0;
}

.button-line button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.add-notice-button {
	padding: 10px 20px;
	background: #4CAF50;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.add-notice-button:hover {
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

</style>
</head>

<body>
	<%@ include file="/header.jsp"%>
	<div id="main_content">
		<%@ include file="/searchHeader.jsp"%>
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
				<div class="modal-dialog 	modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="noticeTitle">${noticeTitle }</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div id="notice-detail">
								<h4>파일 내려받기</h4>
								<div id="fileArea">
									<h5>파일1:</h5>
									<div id="noticeFile1"></div>
									<h5>파일2:</h5>
									<div id="noticeFile2"></div>
									<h5>파일3:</h5>
									<div id="noticeFile3"></div>
								</div>

								<div id="noticeContent"></div>
								<div id="noticeActions">
									<a class="btn btn-sm btn-warning" data-toggle="modal"
										href="#updateModal">수정하기</a> <a
										class="btn btn-sm btn-secondary" onclick="deleteById()">삭제하기</a>
									<button class="share-button btn-secondary	" type="button"
										title="Share this article">
										
										<span>Share</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="content"></div>


			<div class="button-line">
				<div class="see-more">
					<!--  <span class="get-more-list" onclick="loadMoreNotices()">더 보기</span> -->
				</div>
				<div class="add">
					<button class="add-notice-button">공지 추가하기</button>
				</div>
			</div>

			<script>
			let currentPage = 0; // Keep track of current page for findAll
			const currentPageCate = {}; // Object to keep track of current page for each category
			const noticesPerPage = 10; // Number of notices to load per "Load More" click
			let noticeListGlobal = []; // Global variable to store the initial notice list
			let currentCategory = 'all'; // To track the current category being viewed

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
			        noticeEl.appendChild(createDiv(o.noticeCategory, '130px'));
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
			        noticeEl.appendChild(createDiv(o.noticeCategory, '130px'));
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

			                // Update modal content with notice details
			                $('#noticeModal #noticeTitle').text(notice.noticeTitle);
			                $('#noticeModal #noticeContent').text(notice.noticeContent);

			                // Show the modal
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
			/*
			$('#content').on('click' , '.noticeEl' , e => {
	            //console.log(e.currentTarget.childNodes[0].innerText);
	            const noticeNo = e.currentTarget.childNodes[0].innerText;
	            $.ajax({
	                url: 'notice/' + noticeNo,
	                type: 'get',
	                success: response => {
                        const notice = response.data;

                        const contentValue = '<div id="notice-detail">'


                                            + '<div>' + notice.noticeTitle + '</div>'
                                            + '<div>' + notice.noticeContent + '</div>'
                                            + '<div>'
                                            + '<a class="btn btn-sm btn-warning" data-toggle="modal" href="#updateModal">'
                                            + '수정하기'
                                            + '</a>'
                                            + '<a class="btn btn-sm btn-secondary" onclick="deleteById()">삭제하기</a>'
                                            + '</div>'
                                            + '</div>';
                        $('#updateNo').val(notice.noticeNo);
                        $('updateTitle').val(notice.noticeTitle);
    					$('updateCategory').val(notice.noticeCategory);
    					$('updateContent').val(notice.noticeContent);                
                                                   
                                            
                        $('#detail').html(contentValue);
                        $('#detail').slideDown(500);
                    }
                });
            });
                let currentPage = 0;
                const notices = []; // Assuming notices array is defined somewhere

                window.onload = () => {
                    findAllNew();
                    loadMoreNotices();
                };
                const findAllNew = () => {
                    $.ajax({
                        url: 'notice',
                        type: 'get',
                        success: response => {
                            const noticeList = response.data;
                            notices=response.data;
                            const outerDiv = document.createElement('div');
                            outerDiv.id = 'outerDiv';
                            noticeList.map(o => {
                                const noticeEl = document.createElement('div');
                                noticeEl.className = 'noticeEl';
                                noticeEl.appendChild(createDiv(o.noticeNo, '50px'));
                                noticeEl.appendChild(createDiv(o.noticeCategory, '150px'));
                                noticeEl.appendChild(createDiv(o.noticeTitle, '400px'));
                                noticeEl.appendChild(createDiv(o.createDate, '200px'));
                                outerDiv.appendChild(noticeEl);
                            });
                            document.getElementById('content').appendChild(outerDiv);
                        }
                    });
                };

                const findAll = () => {
                    $.ajax({
                        url: 'notice',
                        type: 'get',
                        success: response => {
                        	document.getElementById('outerDiv').remove();
                            const noticeList = response.data;
                            const outerDiv = document.createElement('div');
                            outerDiv.id = 'outerDiv';
                            noticeList.map(o => {
                                const noticeEl = document.createElement('div');
                                noticeEl.className = 'noticeEl';
                                noticeEl.appendChild(createDiv(o.noticeNo, '50px'));
                                noticeEl.appendChild(createDiv(o.noticeCategory, '150px'));
                                noticeEl.appendChild(createDiv(o.noticeTitle, '400px'));
                                noticeEl.appendChild(createDiv(o.createDate, '200px'));
                                outerDiv.appendChild(noticeEl);
                            });
                            document.getElementById('content').appendChild(outerDiv);
                        }
                    });
                };
	
                const findByCate = (cate) => {
                    $.ajax({
                        url: 'notice/category/' + cate,
                        type: 'get',
                        success: response => {
                        	document.getElementById('outerDiv').remove();
                            const noticeList = response.data;
                            const outerDiv = document.createElement('div');
                            outerDiv.id = 'outerDiv';
                            noticeList.map(o => {
                                const noticeEl = document.createElement('div');
                                noticeEl.className = 'noticeEl';
                                noticeEl.appendChild(createDiv(o.noticeNo, '50px'));
                                noticeEl.appendChild(createDiv(o.noticeCategory, '150px'));
                                noticeEl.appendChild(createDiv(o.noticeTitle, '400px'));
                                noticeEl.appendChild(createDiv(o.createDate, '200px'));
                                outerDiv.appendChild(noticeEl);
                            });
                            document.getElementById('content').appendChild(outerDiv);
                        }
                    });
                };
                
                const createDiv = (data, style) => {
                    const divEl = document.createElement('div');
                    const divText = document.createTextNode(data);
                    divEl.style.width = style;
                    divEl.appendChild(divText);
                    return divEl;
                };
                
                function update() {
                    const updateData = {
                        "noticeNo": document.getElementById('updateNo').value,
                        "noticeTitle": document.getElementById('updateTitle').value,
                        "noticeCategory": document.getElementById('updateCategory').value,
                        "noticeContent": document.getElementById('updateContent').value
                    };
                    $.ajax({
                        url: "notice",
                        type: "put",
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

                function insert() {
                    const requestData = {
                        "noticeTitle": document.getElementById('noticeTitle').value,
                        "noticeContent": document.getElementById('noticeContent').value,
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

                function deleteById(noticeNo) {
                    $.ajax({
                        url: 'notice/' + noticeNo,
                        type: 'delete',
                        success: response => {
                            if (response.message === '삭제성공!') {
                                $('#detail').slideUp(300);
                                document.getElementById('outerDiv').remove();
                                findAll();
                            }
                        }
                    });
                }

                $('#content').on('click', '.noticeEl', e => {
                    const noticeNo = e.currentTarget.childNodes[0].innerText;
                    $.ajax({
                        url: 'notice/' + noticeNo,
                        type: 'get',
                        success: response => {
                            const notice = response.data;
                            const contentValue = `
                                <div id="notice-detail">
                                    <div>${notice.noticeTitle}</div>
                                    <div>${notice.noticeContent}</div>
                                    <div>
                                        <a class="btn btn-sm btn-warning" data-toggle="modal" href="#updateModal">수정하기</a>
                                        <a class="btn btn-sm btn-secondary" onclick="deleteById()">삭제하기</a>
                                    </div>
                                </div>`;
                            document.getElementById('updateNo').value = notice.noticeNo;
                            document.getElementById('updateTitle').value = notice.noticeTitle;
                            document.getElementById('updateCategory').value = notice.noticeCategory;
                            document.getElementById('updateContent').value = notice.noticeContent;

                            document.getElementById('detail').innerHTML = contentValue;
                            $('#detail').slideDown(500);
                        }
                    });
                });
                */
            </script>
		</div>
	</div>
	<script src="${hpath }/resources/js/forHeader.js?after1"></script>
	<%@ include file="/footer.jsp"%>
</body>

</html>
