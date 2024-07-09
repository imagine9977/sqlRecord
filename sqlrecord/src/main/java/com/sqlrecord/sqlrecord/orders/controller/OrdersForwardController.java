package com.sqlrecord.sqlrecord.orders.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.cart.model.vo.Cart;
import com.sqlrecord.sqlrecord.cart.model.vo.GuestCart;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.orders.model.service.OrdersService;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrdersForwardController {
	
	
	private final OrdersService ordersService;
	
	@PostMapping("/order")
	public String userOrdersPage(Cart cart , 
								 int product_price , 
								 int product_no ,
								 GuestCart guestCart,
								 HttpSession session
								 ) {
		
		if(cart.getCart_amount() != 0) {
			
			
			log.info("유저임{}" , cart.getCart_amount());
			
			Member member = (Member) session.getAttribute("loginUser");
			
			MemberOrders memberOrders2 = new MemberOrders();
			memberOrders2.setOrders_address(member.getAddr1());
			memberOrders2.setOrders_address2(member.getAddr2());
			memberOrders2.setOrders_postcode(member.getPostcode());
			memberOrders2.setMember_no(member.getMemberNo());
			
			ordersService.insertMemberOrders(memberOrders2);
			
			
			
			
		} else {
			
			log.info("게스트임{}" , guestCart.getGuest_cart_amount());
			log.info("{}" , product_price);
			log.info("{}" , product_no);
		}
		
		
		return "redirect:/sqlrecord/orders/member/detail";
	}
	
	@GetMapping("/member/detail")
	public String memberDetail() {
		return "orders/detail";
	}
	
	@GetMapping("/exchange")
	public String memberExchangePage() {
		return "orders/exchange";
	}
	
	@GetMapping("/insert")
	public String memberInsertPage() {
		return "orders/insert";
	}
}
