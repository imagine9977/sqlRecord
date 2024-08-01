package com.sqlrecord.sqlrecord.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sqlrecord.sqlrecord.common.template.PageTemplate;
import com.sqlrecord.sqlrecord.common.vo.PageInfo;
import com.sqlrecord.sqlrecord.member.model.service.MemberService;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.notice.model.service.NoticeService;
import com.sqlrecord.sqlrecord.notice.model.vo.Notice;
import com.sqlrecord.sqlrecord.orders.model.dto.MemberOrdersDTO;
import com.sqlrecord.sqlrecord.orders.model.dto.MemberOrdersDetailDTO;
import com.sqlrecord.sqlrecord.orders.model.dto.ProductDTO;
import com.sqlrecord.sqlrecord.orders.model.service.OrdersService;
import com.sqlrecord.sqlrecord.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/admin")
@Slf4j
public class AdminController {

	// Service 생성자 주입
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private MemberService memberService;
	
//	@Autowired
//	private ReplyService replyService;
	
	@Autowired
	private NoticeService noticeService;
	
/////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/ajaxProductManagement")
    public ResponseEntity<Map<String, Object>> getAllProducts(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "type", defaultValue = "default") String type) {

        int listCount = productService.productCount();
        int currentPage = page;
        int pageLimit = 5;
        int boardLimit = 10;

        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pageInfo = PageInfo.builder()
                .listCount(listCount)
                .currentPage(currentPage)
                .pageLimit(pageLimit)
                .boardLimit(boardLimit)
                .maxPage(maxPage)
                .startPage(startPage)
                .endPage(endPage)
                .build();

        int startValue = (currentPage - 1) * boardLimit + 1;
        int endValue = currentPage * boardLimit;

        List<ProductDTO> productList = productService.getAllProducts(startValue, endValue);

        Map<String, Object> response = new HashMap<>();
        response.put("data", productList);
        response.put("pageInfo", pageInfo);

        return ResponseEntity.ok(response);
    }
	
/////////////////////////////////////////////////////////////////////////////////	
	
	// Notice 리스트 + 페이징
	@GetMapping("/ajaxNoticeManagement")
	public ResponseEntity<Map<String, Object>> getNoticeListAjax(@RequestParam(value="page", defaultValue="1") int page) {
		int listCount = noticeService.noticeCount();
        int currentPage = page;
        int pageLimit = 5;
        int boardLimit = 15;

        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pageInfo = PageInfo.builder()
                .listCount(listCount)
                .currentPage(currentPage)
                .pageLimit(pageLimit)
                .boardLimit(boardLimit)
                .maxPage(maxPage)
                .startPage(startPage)
                .endPage(endPage)
                .build();
        
        Map<String, Integer> map = new HashMap<>();

        int startValue = (currentPage - 1) * boardLimit + 1;
        int endValue = startValue + boardLimit - 1;

        map.put("startValue", startValue);
        map.put("endValue", endValue);

        List<Notice> noticeList = noticeService.noticeFindAll(map);

        List<Map<String, Object>> formattedNoticeList = new ArrayList<>();
        
        for (Notice notice : noticeList) {
            Map<String, Object> formattedNotice = new HashMap<>();
            formattedNotice.put("noticeNo", notice.getNoticeNo());
            formattedNotice.put("noticeCategory", notice.getNoticeCategory());
            formattedNotice.put("noticeTitle", notice.getNoticeTitle());
            formattedNotice.put("resdate", notice.getResdate());
            formattedNoticeList.add(formattedNotice);
        }
        
        Map<String, Object> response = new HashMap<>();
        response.put("data", formattedNoticeList);
        response.put("pageInfo", pageInfo);
        
        log.info("공지값내놔 : {}", response);
        
        return ResponseEntity.ok(response);
	}

////////////////////////////////////////////////////////////////////////////////////////////////
	
	// Member 리스트 + 페이징
	@GetMapping("/ajaxMemberManagement")
	public ResponseEntity<Map<String, Object>> getMemberListAjax(
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="type", defaultValue="all") String type) {
		int listCount = memberService.memberCount();
        int currentPage = page;
        int pageLimit = 5;
        int boardLimit = 15;

        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pageInfo = PageInfo.builder()
                .listCount(listCount)
                .currentPage(currentPage)
                .pageLimit(pageLimit)
                .boardLimit(boardLimit)
                .maxPage(maxPage)
                .startPage(startPage)
                .endPage(endPage)
                .build();
        
        Map<String, Integer> map = new HashMap<>();

        int startValue = (currentPage - 1) * boardLimit + 1;
        int endValue = startValue + boardLimit - 1;

        map.put("startValue", startValue);
        map.put("endValue", endValue);

        // 조회
        List<Member> memberList = "withdrawn".equals(type)
        		? memberService.findWithdrawnMembers(map)
        		: memberService.findAllMembers(map);
        
        for (Member member : memberList) {
            System.out.println("memberNo: " + member.getMemberNo());
            System.out.println("memberId: " + member.getMemberId());
            System.out.println("point: " + member.getPoint());
        }

        List<Map<String, Object>> formattedMemberList = new ArrayList<>();
        
        for (Member member : memberList) {
            Map<String, Object> formattedMember = new HashMap<>();
            formattedMember.put("memberNo", member.getMemberNo());
            formattedMember.put("memberId", member.getMemberId());
            formattedMember.put("name", member.getName());
            formattedMember.put("resdate", member.getResDate());
            formattedMember.put("birth", member.getBirth());
            formattedMember.put("email", member.getEmail());
            formattedMember.put("tell", member.getTell());
            formattedMember.put("addr1", member.getAddr1());
            formattedMember.put("addr2", member.getAddr2());
            formattedMember.put("postcode", member.getPostcode());
            formattedMember.put("status", member.getStatus());
            formattedMember.put("point", member.getPoint());
            formattedMemberList.add(formattedMember);
        }
        
        Map<String, Object> response = new HashMap<>();
        response.put("data", formattedMemberList);
        response.put("pageInfo", pageInfo);
        
        log.info("회원값내놔 : {}", response);
        
        return ResponseEntity.ok(response);
	}
	
	// 회원 상태 업데이트
	@PostMapping("/updateMemberStatus")
	public ResponseEntity<String> updateMemberStatus(@RequestBody Map<String, Object> payload) {
		
		List<Integer> memberNos = (List<Integer>) payload.get("memberNos");
		String status = (String) payload.get("status");
		
		for (Integer memberNo : memberNos) {
			memberService.updateMemberStatus(memberNo, status);
		}
		return ResponseEntity.ok("변경이 정상적으로 처리되었습니다");
	}
	
	// 검색 기능(조건 조회 + 페이징)
	@GetMapping("/memberSearch")
	public String memberSearch(String condition,
							   String keyword,
							   @RequestParam(value="page", defaultValue="1") int page,
							   Model model) {
		
		log.info("검색 조건 : {}", condition);
	    log.info("검색 키워드 : {}", keyword);
	    
	    Map<String, String> map = new HashMap();
	    map.put("condition", condition);
	    map.put("keyword", keyword);
	    
	    // 검색 결과 수
	    int searchMemberCount = memberService.searchMemberCount(map);
	    log.info("검색 조건에 부합하는 행의 수 : {}", searchMemberCount);
	    int currentPage = page;
	    int pageLimit = 5;
	    int boardLimit = 15;
	    
	    PageInfo pageInfo = PageTemplate.getPageInfo(searchMemberCount,
                									 currentPage,
									                 pageLimit,
									                 boardLimit);
	    
	    RowBounds rowBounds = new RowBounds((currentPage - 1) * boardLimit, boardLimit);
	    
	    List<Member> memberList = memberService.findByConditionAndKeyword(map, rowBounds);
	    
	    model.addAttribute("list", memberList);
	    model.addAttribute("pageInfo", pageInfo);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("condition", condition);
	    
	    return "admin/admin";
	}

////////////////////////////////////////////////////////////
	
	@GetMapping("/ajaxOrdersManagement")
    public ResponseEntity<Map<String, Object>> getAllMemberOrders(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "type", defaultValue = "default") String type) {

        int listCount = ordersService.getTotalOrdersCount();
        int currentPage = page;
        int pageLimit = 5;
        int boardLimit = 5;

        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pageInfo = PageInfo.builder()
                .listCount(listCount)
                .currentPage(currentPage)
                .pageLimit(pageLimit)
                .boardLimit(boardLimit)
                .maxPage(maxPage)
                .startPage(startPage)
                .endPage(endPage)
                .build();

        int startValue = (currentPage - 1) * boardLimit + 1;
        int endValue = currentPage * boardLimit;

        List<MemberOrdersDTO> ordersList = ordersService.getAllMemberOrders(startValue, endValue);

        Map<String, Object> response = new HashMap<>();
        response.put("data", ordersList);
        response.put("pageInfo", pageInfo);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/ajaxOrderDetails")
    public ResponseEntity<List<MemberOrdersDetailDTO>> getMemberOrdersDetails(@RequestParam int memberOrdersNo) {
        List<MemberOrdersDetailDTO> result = ordersService.getMemberOrdersDetails(memberOrdersNo);
        return ResponseEntity.ok(result);
    }
    
    @PutMapping("/orderAccepted")
    public ResponseEntity<Map<String, String>> orderAccepted(@RequestBody List<Integer> memberOrdersDetailNos) {
        ordersService.acceptOrders(memberOrdersDetailNos);
        Map<String, String> response = new HashMap<>();
        response.put("message", "주문처리 성공");
        return ResponseEntity.ok(response);
    }

    @PutMapping("/orderDenied")
    public ResponseEntity<Map<String, String>> orderDenied(@RequestBody List<Integer> memberOrdersDetailNos) {
        ordersService.denyOrders(memberOrdersDetailNos);
        Map<String, String> response = new HashMap<>();
        response.put("message", "주문거절 성공");
        return ResponseEntity.ok(response);
    }

    @PostMapping("/getMemberOrdersDetailNos")
    public ResponseEntity<List<Integer>> getMemberOrdersDetailNos(@RequestBody List<Integer> memberOrdersNos) {
        List<Integer> allDetailNos = new ArrayList<>();
        for (int memberOrdersNo : memberOrdersNos) {
            allDetailNos.addAll(ordersService.getMemberOrdersDetailNos(memberOrdersNo));
        }
        return ResponseEntity.ok(allDetailNos);
    }
}