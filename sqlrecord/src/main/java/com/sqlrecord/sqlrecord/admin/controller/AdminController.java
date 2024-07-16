package com.sqlrecord.sqlrecord.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sqlrecord.sqlrecord.common.vo.PageInfo;
import com.sqlrecord.sqlrecord.member.model.service.MemberService;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.message.Message;
import com.sqlrecord.sqlrecord.notice.model.service.NoticeService;
import com.sqlrecord.sqlrecord.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
	
	// 페이징
	@ResponseBody
    @GetMapping("/ajaxNoticeManagement")
    public Map<String, Object> getAdminpageListAjax(@RequestParam(value = "page", defaultValue = "1") int page) {
        int listCount = noticeService.noticeCount();
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
        
        log.info("값내놔 : {}" , formattedNoticeList);

        Map<String, Object> result = new HashMap<>();
        result.put("noticeList", formattedNoticeList);
        result.put("pageInfo", pageInfo);

        return result;
    }
	
	
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


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 공지사항 목록 가져오기
	@GetMapping("/noticeData")
	public ResponseEntity<Message> getNoticeList() {
		List<Notice> noticeList =  noticeService.findAll();
		if(noticeList.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Message.builder().message("조회결과가 없습니다.").build());
		}
		Message responseMsg = Message.builder().data(noticeList).message("조회 요청 성공").build();
		
		log.info("조회된 공지사항 목록 : {}", noticeList);
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
	
	// 회원 목록 가져오기
	@GetMapping("/memberDataY")
	public ResponseEntity<Message> getYMemberList() {
		List<Member> memberList = memberService.findAllMemberY();
		if(memberList.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Message.builder().message("조회결과가 없습니다.").build());
		}
		Message responseMsg = Message.builder().data(memberList).message("조회 요청 성공").build();
		log.info("조회된 회원 목록 : {}", memberList);
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
	
	// 탈퇴 회원 목록 가져오기
	@GetMapping("/memberDataN")
	public ResponseEntity<Message> getNMemberList() {
		List<Member> memberList = memberService.findAllMemberN();
		if(memberList.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Message.builder().message("조회결과가 없습니다.").build());
		}
		Message responseMsg = Message.builder().data(memberList).message("조회 요청 성공").build();
		log.info("조회된 탈퇴 회원 목록 : {}", memberList);
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}

	/* 상품 바인딩
	@GetMapping("/productData")
	public ResponseEntity<Message> getProductList() {
		List<Notice> productList = productService.findAll();
	}
	*/
}
