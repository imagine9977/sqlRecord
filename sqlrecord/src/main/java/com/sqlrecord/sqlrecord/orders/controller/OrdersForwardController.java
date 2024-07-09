package com.sqlrecord.sqlrecord.orders.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.cart.model.vo.Cart;
import com.sqlrecord.sqlrecord.cart.model.vo.GuestCart;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/orders")
public class OrdersForwardController {
	
	@PostMapping("/order")
	public String userOrdersPage(Cart cart , 
								 int product_price , 
								 int product_no ,
								 GuestCart guestCart 
								 ) {
		
		if(cart.getCart_amount() != 0) {
			
			log.info("유저임{}" , cart.getCart_amount());
			log.info("{}" , product_price);
			log.info("{}" , product_no);
		} else {
			
			log.info("게스트임{}" , guestCart.getGuest_cart_amount());
			log.info("{}" , product_price);
			log.info("{}" , product_no);
		}
		
		
		return "redirect:/sqlrecord/orders/member/detail";
	}
	
	@GetMapping("/member/detail")
	public String memberDetail() {
		return "";
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
