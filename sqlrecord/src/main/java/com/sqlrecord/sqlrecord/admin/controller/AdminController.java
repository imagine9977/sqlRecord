package com.sqlrecord.sqlrecord.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sqlrecord.sqlrecord.common.vo.PageInfo;
import com.sqlrecord.sqlrecord.member.model.service.MemberService;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.notice.model.service.NoticeService;
import com.sqlrecord.sqlrecord.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

//	// Service 생성자 주입
//	@Autowired
//	private ProductService productService;
//	
//	@Autowired
//	private MemberOrdersService memberOrdersService;
//
//	@Autowired
//	private GuestOrdersService guestOrdersService;
//	
//	@Autowired
//	private OrdersDetailService ordersDetailService;
//	
//	@Autowired
//	private GuestOrdersDetailService guestOrdersDetailService;
//	
//	@Autowired
//	private OrdersExchangeService ordersExchangeService;
//	
//	@Autowired
//	private GuestOrdersExchangeService guestOrdersExchangeService;
//	
	@Autowired
	private MemberService memberService;
	
//	@Autowired
//	private ReplyService replyService;
	
	@Autowired
	private NoticeService noticeService;
//	
//	@Autowired
//	private QnaService qnaService;
	
	
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
	
	// Member 리스트 + 페이징
	@ResponseBody
	@GetMapping("/ajaxMemberManagement")
	public ResponseEntity<Map<String, Object>> getMemberListAjax(@RequestParam(value="page", defaultValue="1") int page) {
		int listCount = memberService.memberCount();
        int currentPage = page;
        int pageLimit = 5;
        int boardLimit = 20;

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

        List<Member> memberList = memberService.memberFindAll(map);

        List<Map<String, Object>> formattedMemberList = new ArrayList<>();
        
        for (Member member : memberList) {
            Map<String, Object> formattedMember = new HashMap<>();
            formattedMember.put("memberNo", member.getMemberNo());
            formattedMember.put("memberId", member.getMemberId());
            formattedMember.put("name", member.getName());
            formattedMember.put("resdate", member.getResDate());
            formattedMember.put("point", member.getPoint());
            formattedMemberList.add(formattedMember);
        }
        
        Map<String, Object> response = new HashMap<>();
        response.put("data", formattedMemberList);
        response.put("pageInfo", pageInfo);
        
        log.info("회원값내놔 : {}", response);
        
        return ResponseEntity.ok(response);
	}
	
	


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 상품 바인딩
	@GetMapping("/productData")
	public ResponseEntity<Message> getProductList() {
		List<Notice> productList = productService.findAll();
	}
	*/
}
