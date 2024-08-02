	// 회원 테이블 생성
	function loadMemberTable(contentType, page = 1) {
	    $.ajax({
	        url: '/sqlrecord/admin/ajaxMemberManagement',
	        type: 'GET',
	        data: {
	        	page: page,
	        	type: contentType
	        },
	        success: function(response) {
	            if (response.data && response.data.length > 0) {
	                var table = '<table class="accordion-table">' +
	                    '<thead>' +
	                    '<tr>' +
	                    '<th><input type="checkbox" class="checkAllMembers"></th>' +
	                    '<th>No.</th>' +
	                    '<th>아이디</th>' +
	                    '<th>이름</th>' +
	                    '<th>가입일</th>' +
	                    '<th>보유포인트</th>' +
	                    '<th>작업</th>' +
	                    '</tr>' +
	                    '</thead>' +
	                    '<tbody>';
	
	                response.data.forEach(function(member) {
	                    table += '<tr class="accordion-header">' +
	                        '<td><input type="checkbox" name="memberCheck" value="' + member.memberNo + '"></td>' +
	                        '<td>' + member.memberNo + '</td>' +
	                        '<td>' + member.memberId + '</td>' +
	                        '<td>' + member.name + '</td>' +
	                        '<td>' + member.resdate + '</td>' +
	                        '<td>' + member.point + '</td>' +
	                        '<td><button class="btn btn-sm btn-secondary toggle-details">상세보기</button>' +
	                        '<button class="btn btn-sm btn-secondary toggle-details">삭제</button></td>' +
	                    '</tr>' +
	                    '<tr class="accordion-content">' +
	                        '<td colspan="7">' +
	                            '<div class="member-details">' +
	                                '<div class="details-content">' +
	                                    '<h3>회원 상세 정보</h3><br/>' +
	                                    '<p><b>아이디:</b> ' + member.memberId + '</p>' +
	                                    '<p><b>이름:</b> ' + member.name + '</p>' +
	                                    '<p><b>생년월일:</b> ' + member.birth + '</p>' +
	                                    '<p><b>이메일:</b> ' + member.email + '</p>' +
	                                    '<p><b>연락처:</b> ' + member.tell + '</p>' +
	                                    '<p><b>주소:</b> ' + member.addr1 + member.addr2  + '(' + member.postcode + ')' + '</p>' +
	                                    '<p><b>가입일:</b> ' + member.resdate + '</p>' +
	                                    '<p><b>회원상태:</b> ' + member.status + '</p>' +
	                                    '<p><b>보유 포인트:</b> ' + member.point + '</p>' +
	                                '</div>' +
	                                '<div class="record-actions">' +
	                                    '<button class="btn btn-sm btn-secondary" onclick="deleteMember(' + member.memberNo + ')" type="button">삭제</button>' +
	                                '</div>' +
	                            '</div>' +
	                        '</td>' +
	                    '</tr>';
	                });
	
	                table += '</tbody></table>';
	
	                $('#content-area').html(table);
	                
	                // 페이지네이션 생성
	                var pageInfo = response.pageInfo;
	                var pagingHtml = createPagination(pageInfo, 'member');
	                $('#content-area').append(pagingHtml);
	                
	
	                // slideToggle 기능 추가
	                $('.toggle-details').click(function() {
	                    $(this).closest('tr').next('.accordion-content').slideToggle();
	                });
	            } else {
	                $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("회원 데이터 호출 중 오류 발생: ", error);
	            $('#content-area').html('<div class="error">데이터를 불러오는 중 오류가 발생했습니다.</div>');
	        }
	    });
	}

	// 페이지네이션 생성
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
