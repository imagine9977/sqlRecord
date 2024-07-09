package com.sqlrecord.sqlrecord.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	// admin.jsp 내 sidebar 삽입
	@GetMapping("/sidebar")
	public String getSidebar(@RequestParam String tab, Model model) {
		model.addAttribute("tab",tab);
		return "admin/sidebar";
	}
	
	// admin.jsp 내 content(테이블) 삽입
	@GetMapping("/content")
	public String getContent(@RequestParam String tab, @RequestParam String type, Model model) {
		model.addAttribute("tab", tab);
		model.addAttribute("type", type);
		return "admin/content";
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
//	@Autowired
//	private MemberService memberService;
//	
//	@Autowired
//	private ReplyService replyService;
//	
//	@Autowired
//	private NoticeService noticeService;
//	
//	@Autowired
//	private QnaService qnaService;
//	
//
//	// 사이드바 불러오기
//	@GetMapping("/sidebar")
//	@ResponseBody
//	public String getAdminSidebar(@RequestParam String tab,
//								  Model model) {
//		
//		model.addAttribute("tab", tab);
//		
//		switch (tab) {
//			
//			case "product" : 
//		}
//		
//		
//		//반환
//		return "admin/sidebar";
//	}
//	
//	// 내용(테이블, Chart.js) 불러오기
//	@GetMapping("/content")
//	@ResponseBody
//	public String getAdminContent(@RequestParam String tab,
//								  @RequestParam (defaultValue = "all") String type,
//								  Model model) {
//		
//		model.addAttribute("tab", tab);
//		model.addAttribute("type", type);
//		
//		switch (tab) {
//			
//			case "product" : if("all".equals(type)) {
//				List<Product> productList = productService.getAllProducts();
//				model.addAttribute("productList", productList);
//			}
//			
//			case "order" :
//				// 주문건 전체
//				if("all".equals(type)) {
//					List<MemberOrders> memberOrdersList = memberOrdersService.getAllOrders();
//					List<OrdersDetail> ordersDetailList = ordersDetailService.getAllOrdersDetail();
//					List<GuestOrders> guestOrdersList = guestOrdersService.getAllOrders();
//					List<GuestOrdersDetail> guestOrdersDetailList = guestOrdersDetailService.getAllOrdersDetail();
//					model.addAttribute("memberOrdersList", memberOrdersList);
//					model.addAttribute("ordersDetailList", ordersDetailList);
//					model.addAttribute("guestOrdersList", guestOrdersList);
//					model.addAttribute("guestOrdersDetailList", guestOrdersDetailList);
//				}
//				// 교환/환불
//				else {	
//					List<OrdersExchange> ordersExchangeList = ordersExchangeService.getAllExchanges();
//					List<GuestOrdersExchange> guestOrdersExchangeList = guestOrdersExchangeService.getAllExchanges();
//					model.addAttribute("ordersExchangeList", ordersExchangeList);
//					model.addAttribute("guestOrdersExchangeList", guestOrdersExchangeList);
//				}
//			
//			case "member" : if("all".equals(type)) {	// 추후 Vo 클래스 AdminMember로 바꿀 수도 있음
//				List<Member> memberList = memberService.getAllMembers();
//				model.addAttribute("memberList", memberList);
//			}
//			
//			case "review" : if("all".equals(type)) {
//				List<Reply> replyList = replyService.getAllReplys();
//				model.addAttribute("replyList", replyList);
//			}
//			
//			case "analytics" : if("all".equals(type)) {
//
//			}
//			
//			case "notice" : if("all".equals(type)) {
//				List<Notice> noticeList = noticeService.getAllNotices();
//				model.addAttribute("noticeList", noticeList);
//			}
//			
//			case "qna" : if("all".equals(type)) {
//				List<Qna> qnaList = qnaService.getAllQnas();
//				model.addAttribute("qnaList", qnaList);
//			}
//		}
//		
//		// 페이지 반환
//		return "admin/content";
//	}
	
}
