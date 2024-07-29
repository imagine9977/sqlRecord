package com.sqlrecord.sqlrecord.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sqlrecord.sqlrecord.common.template.PageTemplate;
import com.sqlrecord.sqlrecord.common.vo.PageInfo;
import com.sqlrecord.sqlrecord.member.model.service.MemberService;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.notice.model.service.NoticeService;
import com.sqlrecord.sqlrecord.notice.model.vo.Notice;
import com.sqlrecord.sqlrecord.orders.model.service.OrdersService;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersEx;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

//	// Service 생성자 주입
//	@Autowired
//	private ProductService productService;
//	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private MemberService memberService;
	
//	@Autowired
//	private ReplyService replyService;
	
	@Autowired
	private NoticeService noticeService;
	
/////////////////////////////////////////////////////////////////////////////////	
	
	// Notice 리스트 + 페이징
	@ResponseBody
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
	@ResponseBody
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
	@ResponseBody
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


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
//	  @GetMapping("/ajaxMemberOrders")
//    @ResponseBody
//    public ResponseEntity<Map<String, Object>> getMemberOrders(
//            @RequestParam(value="page", defaultValue="1") int page,
//            @RequestParam(value="type", defaultValue="orders") String type) {
//        
//        int listCount = ordersService.orderCount();
//        int currentPage = page;
//        int pageLimit = 5;
//        int boardLimit = 10;
//
//        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
//        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
//        int endPage = startPage + pageLimit - 1;
//
//        if (endPage > maxPage) {
//            endPage = maxPage;
//        }
//
//        PageInfo pageInfo = PageInfo.builder()
//                .listCount(listCount)
//                .currentPage(currentPage)
//                .pageLimit(pageLimit)
//                .boardLimit(boardLimit)
//                .maxPage(maxPage)
//                .startPage(startPage)
//                .endPage(endPage)
//                .build();
//        
//        Map<String, Integer> map = new HashMap<>();
//        int startValue = (currentPage - 1) * boardLimit + 1;
//        int endValue = startValue + boardLimit - 1;
//        map.put("startValue", startValue);
//        map.put("endValue", endValue);
//
//        // 조회
//        List<MemberOrders> orderList = ordersService.findAllOrders(map);
//
//        List<Map<String, Object>> formattedOrderList = new ArrayList<>();
//        for (MemberOrders order : orderList) {
//            Map<String, Object> formattedOrder = new HashMap<>();
//            formattedOrder.put("ordersNo", order.getMemberOrdersNo());
//            formattedOrder.put("memberId", order.member.getMemberId());
//            formattedOrder.put("addr1", order.getMemberOrdersAddress());
//            formattedOrder.put("addr2", order.getMemberOrdersAddress2());
//            formattedOrder.put("postcode", order.getMemberOrdersPostcode());
//            formattedOrder.put("ordersDate", order.getMemberOrdersDate());
//            formattedOrder.put("totalPrice", order.getTotalPrice());
//            // 연결 테이블 컬럼(토글 상세보기용)
//            formattedOrder.put("productNo", order.product.getProductNo());
//            formattedOrder.put("productCate", order.product.getProductCate());
//            formattedOrder.put("productName", order.product.getProductName());
//            formattedOrder.put("productPhoto1", order.productPhoto1.getProductPhotosPath());
//            formattedOrder.put("productPhotosName", order.productPhoto1.getProductPhotosName());
//            formattedOrderList.add(formattedOrder);
//        }
//        
//        Map<String, Object> response = new HashMap<>();
//        response.put("data", formattedOrderList);
//        response.put("pageInfo", pageInfo);
//        
//        return ResponseEntity.ok(response);
//    }
	
	
	// 전체 memberOrders(주문건) 리스트
	@GetMapping("/ajaxOrdersManagement")
	@ResponseBody
	public Map<String, Object> getAllMemberOrders(@RequestParam int page, @RequestParam String type) {
		return ordersService.getAllMemberOrders(page, type);
	}
	
	// 특정 memberOrdersNo에 해당하는 memberOrdersDetail 리스트
	@GetMapping("ajaxOrderDetails")
	@ResponseBody
	public List<MemberOrdersDetail> getMemberOrderDetails(@RequestParam int memberOrdersNo) {
		return ordersService.getMemberOrderDetails(memberOrdersNo);
	}
	
	
	
	
	
	
	
//	@GetMapping("/ajaxExchangeRequests")
//    @ResponseBody
//    public ResponseEntity<Map<String, Object>> getExchangeRequests(
//            @RequestParam(value="page", defaultValue="1") int page,
//            @RequestParam(value="type", defaultValue="exchanges") String type) {
//        
//        int listCount = ordersService.exchangeCount();
//        int currentPage = page;
//        int pageLimit = 5;
//        int boardLimit = 15;
//
//        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
//        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
//        int endPage = startPage + pageLimit - 1;
//
//        if (endPage > maxPage) {
//            endPage = maxPage;
//        }
//
//        PageInfo pageInfo = PageInfo.builder()
//                .listCount(listCount)
//                .currentPage(currentPage)
//                .pageLimit(pageLimit)
//                .boardLimit(boardLimit)
//                .maxPage(maxPage)
//                .startPage(startPage)
//                .endPage(endPage)
//                .build();
//        
//        Map<String, Integer> map = new HashMap<>();
//        int startValue = (currentPage - 1) * boardLimit + 1;
//        int endValue = startValue + boardLimit - 1;
//        map.put("startValue", startValue);
//        map.put("endValue", endValue);
//
//        // 조회
//        List<MemberOrdersEx> exchangeList = ordersService.findAllExchanges(map);
//
//        List<Map<String, Object>> formattedExchangeList = new ArrayList<>();
//        for (MemberOrdersEx exchange : exchangeList) {
//            Map<String, Object> formattedExchange = new HashMap<>();
//            formattedExchange.put("ordersExchangeNo", exchange.getMemberOrdersExNo());
//            formattedExchange.put("memberId", exchange.getMemberId());
//            formattedExchange.put("ordersExchangeDate", exchange.getMemberOrdersExDate());
//            formattedExchange.put("ordersQuantity", exchange.getMemberOrdersQuantity());
//            formattedExchange.put("price", exchange.getPrice());
//            formattedExchange.put("requestReason", exchange.getMemberOrdersExReason());
//            formattedExchangeList.add(formattedExchange);
//        }
//        
//        Map<String, Object> response = new HashMap<>();
//        response.put("data", formattedExchangeList);
//        response.put("pageInfo", pageInfo);
//        
//        return ResponseEntity.ok(response);
//    }
//
//    @GetMapping("/ajaxRefundRequests")
//    @ResponseBody
//    public ResponseEntity<Map<String, Object>> getRefundRequests(
//            @RequestParam(value="page", defaultValue="1") int page,
//            @RequestParam(value="type", defaultValue="refunds") String type) {
//        
//        int listCount = ordersService.refundCount();
//        int currentPage = page;
//        int pageLimit = 5;
//        int boardLimit = 15;
//
//        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
//        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
//        int endPage = startPage + pageLimit - 1;
//
//        if (endPage > maxPage) {
//            endPage = maxPage;
//        }
//
//        PageInfo pageInfo = PageInfo.builder()
//                .listCount(listCount)
//                .currentPage(currentPage)
//                .pageLimit(pageLimit)
//                .boardLimit(boardLimit)
//                .maxPage(maxPage)
//                .startPage(startPage)
//                .endPage(endPage)
//                .build();
//        
//        Map<String, Integer> map = new HashMap<>();
//        int startValue = (currentPage - 1) * boardLimit + 1;
//        int endValue = startValue + boardLimit - 1;
//        map.put("startValue", startValue);
//        map.put("endValue", endValue);
//
//        // 조회
//        List<MemberOrdersEx> refundList = ordersService.findAllRefunds(map);
//
//        List<Map<String, Object>> formattedRefundList = new ArrayList<>();
//        for (MemberOrdersEx refund : refundList) {
//            Map<String, Object> formattedRefund = new HashMap<>();
//            formattedRefund.put("ordersRefundNo", refund.getMemberOrdersExNo());
//            formattedRefund.put("memberId", refund.getMemberId());
//            formattedRefund.put("ordersRefundDate", refund.getMemberOrdersExDate());
//            formattedRefund.put("ordersQuantity", refund.getMemberOrdersQuantity());
//            formattedRefund.put("price", refund.getPrice());
//            formattedRefund.put("requestReason", refund.getMemberOrdersExReason());
//            formattedRefundList.add(formattedRefund);
//        }
//        
//        Map<String, Object> response = new HashMap<>();
//        response.put("data", formattedRefundList);
//        response.put("pageInfo", pageInfo);
//        
//        return ResponseEntity.ok(response);
//    }
}