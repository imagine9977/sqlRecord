// 상품 탭 사이드바 호출
    function loadProductSidebar() {
        var sidebarContent = `
            <div class="sidebar">
                <h2>상품 카테고리</h2>
                <div class="sidebar-element"><p><a href="#" data-content="all">상품 전체</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="turntables">TURNTABLES</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="speakers">SPEAKERS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="radios">RADIOS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="cdPlayers">CD PLAYERS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="cassettePlayers">CASSETTE PLAYERS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="mediaStands">MEDIA STANDS</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="vynyls">VINYLS</a></p></div>
                <hr/>
            </div>`;
        $('#sidebar').html(sidebarContent);
        addSidebarListeners();
    }

	// 주문 탭 사이드바 호출
    function loadOrderSidebar() {
        var sidebarContent = `
            <div class="sidebar">
                <h2>주문 관리</h2>
                <div class="sidebar-element"><p><a href="#" data-content="default">주문 내역</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="exchange">교환 요청</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="refund">환불 요청</a></p></div>
                <hr/>
            </div>`;
        $('#sidebar').html(sidebarContent);
        addSidebarListeners();
    }
	
    // 회원 탭 사이드바 호출	
    function loadMemberSidebar() {
        var sidebarContent = `
            <div class="sidebar">
                <h2>회원 관리</h2>
                <div class="sidebar-element"><p><a href="#" data-content="all">전체 회원</a></p></div>
                <hr/>
                <div class="sidebar-element"><p><a href="#" data-content="withdrawn">탈퇴 회원</a></p></div>
                <hr/>
            </div>`;
        $('#sidebar').html(sidebarContent);
        addSidebarListeners();
    }

 	

 	// 사이드바 요소 클릭 이벤트(content호출용)
    function addSidebarListeners() {
        $('#sidebar a').click(function(e) {
            e.preventDefault();
            var contentType = $(this).data('content');
            var currentTab = $('.tab-btnItem.active').data('tab');
            loadContent(currentTab, contentType);
        });
    }
    
    // 내용(표) 호출 (사이드바 값 받아옴)
    function loadContent(tabName, contentType = 'default') {
        $('#content-area').empty(); // 기존 콘텐츠 제거

        if (tabName === 'product') {
            loadProductTable(contentType);
        } else if (tabName === 'order') {
            loadOrderTable(contentType);
        } else if (tabName === 'member') {
            loadMemberTable(contentType);
        } else if (tabName === 'reply') {
            loadReplyTable(contentType);
        } else if (tabName === 'notice') {
            loadNoticeTable(contentType);
        } else if (tabName === 'qna') {
            loadQnaTable(contentType);
        } else {
            $('#content-area').html('<div class="no-data">조회된 내용이 없습니다</div>');
        }
    }