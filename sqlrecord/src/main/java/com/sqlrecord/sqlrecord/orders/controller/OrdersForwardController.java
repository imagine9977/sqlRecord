package com.sqlrecord.sqlrecord.orders.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.cart.model.vo.Cart;
import com.sqlrecord.sqlrecord.cart.model.vo.GuestCart;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.orders.model.service.OrdersService;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.OrdersDetail;
import com.sqlrecord.sqlrecord.orders.model.vo.Product;

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
			log.info("어마운트 갯수 : {}" , product_noArr[1]);
			
			Member member =  (Member) session.getAttribute("loginUser");
			
			
			log.info("유저유저 : {}" , member.getEmail());
			// 멤버 오더에 넣을 값을 객체에 담기
			MemberOrders memberOrders = new MemberOrders();
			memberOrders.setMemberOrdersAddress(member.getAddr1());
			memberOrders.setMemberOrdersAddress2(member.getAddr2());
			memberOrders.setMemberOrdersPostcode(member.getPostcode());
			memberOrders.setMemberNo(member.getMemberNo());
			
			
			// 멤버 오더 디테일에 넣을 값을 객체에 담기
			List<OrdersDetail> odList = new ArrayList<OrdersDetail>();
			
			// Member_Orders에 생성된 넘버를 가져옴 detail에 넣기 위해서
			int successMO = ordersService.insertMemberOrders(memberOrders, member.getMemberNo());
			
			// name이 같은 값이 하나가 아니기 때문에 Array로 담아서 하나씩 List에 넣어줌
			for(int i = 0; i < cart_amountArr.length; i++) {
				OrdersDetail ordersDetail = new OrdersDetail();
				Product product = new Product();
				product.setProductNo(Integer.parseInt(product_noArr[i]));
				ordersDetail.setProduct(product);
				MemberOrders memberOrders1 = new MemberOrders();
				memberOrders1.setMemberOrdersNo(successMO);
				ordersDetail.setMemberOrders(memberOrders1);
				ordersDetail.setMemberOrdersDetailAmount(Integer.parseInt(cart_amountArr[i]));
				ordersDetail.setMemberOrdersDetailPrice(Integer.parseInt(cart_amountArr[i]) * Integer.parseInt(product_priceArr[i]));
				
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
		if(member == null) {
			return "redirect:member/login.do";
		}
		
		
		// 유저의 OrderDetail을 리스트로 담기
		List<OrdersDetail> odList  = ordersService.getOrdersDetail(member.getMemberNo());
		
		// set에 OrderDetail의 Orders_no의 값을 넣어서 중복되지 않는 HashSet을 만듬 
		Set<Integer> hs = new LinkedHashSet<Integer>();
		
		// HashSet에 add
		for(OrdersDetail item : odList) {
			hs.add(item.getMemberOrders().getMemberOrdersNo());
		}
		
		// 2중 리스트를 만들기 위해서 준비
		List<List<OrdersDetail>> newOdList = new ArrayList<List<OrdersDetail>>();
		
		
		for(OrdersDetail od : odList) {
			log.info("얘는 멤버 오더스 넘버 : {}" , od.getMemberOrders().getMemberOrdersNo());
		}
		
		// HashSet의 Orders_no의 값과 같은 것들만 묶은 List를 2중리스트에 하나씩 add
		for(Integer hsItem : hs) {
			log.info("얘는 hsItem : {}" , hsItem);
			List<OrdersDetail> od = (List<OrdersDetail>)odList.stream().filter((item) -> item.getMemberOrders().getMemberOrdersNo() == hsItem) .collect(Collectors.toList());;
			newOdList.add(od);
		}
		
		log.info("오디? : {} , {}" , newOdList.get(0).size());
		
		
		
		model.addAttribute("newOdList",newOdList);
		log.info("이게 오디 개수 : {}" , newOdList.get(0).get(0).getMemberOrders().getMemberOrdersDate());
		log.info("이게 오디 개수 : {}" , odList.size());
		log.info("이게 뉴오디 개수 : {}" , newOdList.size());
		log.info("이게 뉴오디 : {}" , newOdList.get(0).get(0).getProduct().getProductName());
		
		
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
