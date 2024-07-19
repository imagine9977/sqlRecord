	// 공지 테이블 생성
	function loadNoticeTable(contentType, page = 1) {
	    $.ajax({
	        url: '/sqlrecord/admin/ajaxNoticeManagement',
	        type: 'GET',
	        data: { page: page, type: contentType },
	        success: function(response) {
	            if (response.data && response.data.length > 0) {
	                var table = '<table class="accordion-table" style="margin: 0 auto; width: 80%;">' +
	                    '<thead>' +
	                    '<tr>' +
	                    '<th><input type="checkbox"></th>' +
	                    '<th>No.</th>' +
	                    '<th>공지 카테고리</th>' +
	                    '<th>제목</th>' +
	                    '<th>등록일</th>' +
	                    '<th>작업</th>' +
	                    '</tr>' +
	                    '</thead>' +
	                    '<tbody>';
	
	                response.data.forEach(function(notice) {
	                    table += '<tr class="data-row">' +
	                        '<td><input type="checkbox" name="noticeCheck" value="' + notice.noticeNo + '"></td>' +
	                        '<td>' + notice.noticeNo + '</td>' +
	                        '<td>' + notice.noticeCategory + '</td>' +
	                        '<td><a href="${hpath}/notice/detail/' + notice.noticeNo + '">' + notice.noticeTitle + '</a></td>' +
	                        '<td>' + notice.resdate + '</td>' +
	                        '<td class="record-actions">' +
	                            '<button class="btn btn-sm btn-secondary" onclick="editNotice(' + notice.noticeNo + ')" type="button">수정</button>' +
	                            '<button class="btn btn-sm btn-secondary" onclick="deleteNotice(' + notice.noticeNo + ')" type="button">삭제</button>' +
	                        '</td>' +
	                        '</tr>';
	                });
	
	                table += '</tbody>' +
	                    '</table>';
	
	                $('#content-area').html(table);
	
	                // 페이지네이션 생성
	                var pageInfo = response.pageInfo;
	                var pagingHtml = createPagination(pageInfo, 'notice');
	                $('#content-area').append(pagingHtml);
	                
	                setupPaginationHandlers();
	                
	            } else {
	                $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("공지 데이터 호출 중 오류 발생: ", error);
	            $('#content-area').html('<div class="error">데이터를 불러오는 중 오류가 발생했습니다.</div>');
	        }
	    });
	}
	
	//페이지네이션 생성
    function createPagination(pageInfo, contentType) {
	    var html = '<div class="pagination-custom" data-content-type="' + contentType + '">';
	    if (pageInfo.startPage > 1) {
	        html += '<a href="#" data-page="' + (pageInfo.startPage - 1) + '">이전</a>';
	    }
	    for (var i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
	        var activeClass = (i === pageInfo.currentPage) ? 'active' : '';
	        html += '<a class="' + activeClass + '" href="#" data-page="' + i + '">' + i + '</a>';
	    }
	    if (pageInfo.endPage < pageInfo.maxPage) {
	        html += '<a href="#" data-page="' + (pageInfo.endPage + 1) + '">다음</a>';
	    }
	    html += '</div>';
	    return html;
	}