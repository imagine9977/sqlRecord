package com.sqlrecord.sqlrecord.orders.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.cart.model.vo.Cart;
import com.sqlrecord.sqlrecord.cart.model.vo.GuestCart;
import com.sqlrecord.sqlrecord.member.model.service.MemberService;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.orders.model.service.OrdersService;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.OrdersDetail;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrdersForwardController {
	
	
	private final OrdersService ordersService;
	
	@PostMapping("/order")
	public String userOrdersPage( 
								 int product_price , 
								 int product_no ,
								 HttpServletRequest request
								 ) {
		HttpSession session = request.getSession();
		
		// 각 카트의 갯수 배열로 하나하나 받기
		String[] cart_amountArr = request.getParameterValues("cart_amount");
		String[] guest_amountArr = request.getParameterValues("guest_amount");
		String[] product_priceArr = request.getParameterValues("product_price");
		String[] product_noArr = request.getParameterValues("product_no");
		if(cart_amountArr.length != 0) {
			
			
			
			log.info("어마운트 갯수 : {}" , cart_amountArr[1]);
			
			Member member =  (Member) session.getAttribute("loginUser");
			
			
			log.info("{}" , member);
			// 멤버 오더에 넣을 값을 객체에 담기
			MemberOrders memberOrders = new MemberOrders();
			memberOrders.setOrders_address(member.getAddr1());
			memberOrders.setOrders_address2(member.getAddr2());
			memberOrders.setOrders_postcode(member.getPostcode());
			memberOrders.setMember_no(member.getMemberNo());
			
			
			// 멤버 오더 디테일에 넣을 값을 객체에 담기
			
			List<OrdersDetail> odList = new ArrayList<OrdersDetail>();
			
			int successMO = ordersService.insertMemberOrders(memberOrders, member.getMemberNo());
			
			for(int i = 0; i < cart_amountArr.length; i++) {
				OrdersDetail ordersDetail = new OrdersDetail();
				ordersDetail.setProduct_no(Integer.parseInt(product_noArr[i]));
				ordersDetail.setOrders_no(successMO);
				ordersDetail.setOrders_detail_amount(Integer.parseInt(cart_amountArr[i]));
				ordersDetail.setOrders_detail_price(Integer.parseInt(cart_amountArr[i]) * Integer.parseInt(product_priceArr[i]));
				
				odList.add(ordersDetail);
			}
			
			log.info("이게 디테일? : {}" , odList.get(1).toString());
			
			// 디테일 인서트 성공 시 디테일로 리다이렉트
			if(ordersService.insertOrdersDetail(odList) > 0) {
				
				return "redirect:/orders/member/detail";
			}
			
			
			
		} else {
			
			log.info("게스트임");
			log.info("{}" , product_price);
			log.info("{}" , product_no);
		}
		
		
		return "redirect:/sqlrecord/orders/member/detail";
	}
	
	@GetMapping("/member/detail")
	public String memberDetail(HttpServletRequest request , Model model) {
		
		HttpSession session = request.getSession();
		
		Member member =  (Member) session.getAttribute("loginUser");
		
		
		List<OrdersDetail> odList  = ordersService.getOrdersDetail(member.getMemberNo());
		
		
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
