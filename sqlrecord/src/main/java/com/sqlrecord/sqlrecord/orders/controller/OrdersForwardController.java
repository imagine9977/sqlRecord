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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.cart.model.service.CartService;
import com.sqlrecord.sqlrecord.cart.model.vo.Cart;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.orders.model.service.OrdersService;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersEx;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrdersForwardController {
	
	private final CartService cartService;
	private final OrdersService ordersService;
	
	@PostMapping("/order")
	public String userOrdersPage( 
								 HttpServletRequest request
								 ) {
		HttpSession session = request.getSession();

		String[] cart_amountArr = request.getParameterValues("cartAmount");
		String[] product_priceArr = request.getParameterValues("productPrice");
		String[] product_noArr = request.getParameterValues("productNo");
		String[] cartNo_Arr = request.getParameterValues("cartNum");
		
		int value = cart_amountArr.length;
		
		if(product_priceArr.length == value && product_noArr.length == value && cartNo_Arr.length == value) {
			
			Member member =  (Member) session.getAttribute("loginUser");
			
			
			MemberOrders memberOrders = new MemberOrders();
			memberOrders.setMemberOrdersAddress(member.getAddr1());
			memberOrders.setMemberOrdersAddress2(member.getAddr2());
			memberOrders.setMemberOrdersPostcode(member.getPostcode());
			memberOrders.setMemberNo(member.getMemberNo());
			
			
			List<Integer> cartNoList = new ArrayList<Integer>();
			
			for(String item : cartNo_Arr) {
				cartNoList.add(Integer.parseInt(item));
			}
			
			
			cartService.deleteCart(cartNoList);
			
			
			List<MemberOrdersDetail> odList = new ArrayList<MemberOrdersDetail>();
			

			int successMO = ordersService.insertMemberOrders(memberOrders, member.getMemberNo());
			

			for(int i = 0; i < cart_amountArr.length; i++) {
				MemberOrdersDetail ordersDetail = new MemberOrdersDetail();
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
			

			if(ordersService.insertOrdersDetail(odList) > 0) {
				
				return "redirect:/orders/member/detail";
			}
			
		} 
		
		return "redirect:/sqlrecord/error";
		
	}
	
	@GetMapping("/member/detail")
	public String memberDetail(HttpServletRequest request , Model model) {
		
		HttpSession session = request.getSession();
		
		Member member =  (Member) session.getAttribute("loginUser");
		if(member == null) {
			return "redirect:/member/login.do";
		}
		
		List<MemberOrdersDetail> odList  = ordersService.getOrdersDetail(member.getMemberNo());

		Set<Integer> hs = new LinkedHashSet<Integer>();
		
		for(MemberOrdersDetail item : odList) {
			hs.add(item.getMemberOrders().getMemberOrdersNo());
		}
		
		List<List<MemberOrdersDetail>> newOdList = new ArrayList<List<MemberOrdersDetail>>();
		
		for(Integer hsItem : hs) {
			List<MemberOrdersDetail> od = (List<MemberOrdersDetail>)odList.stream().filter((item) -> item.getMemberOrders().getMemberOrdersNo() == hsItem).collect(Collectors.toList());
			
			newOdList.add(od);
		}
		

		model.addAttribute("newOdList",newOdList);

		return "orders/detail";
	}
	
	
	@GetMapping("/insert/{memberOrdersDetailNo}")
	public String exInsertPage(@PathVariable int memberOrdersDetailNo , Model model) {
		
		
		log.info("멤버 상세 번호 : {}" , memberOrdersDetailNo);
		
		MemberOrdersDetail memberOrdersDetail = ordersService.getOrdersDetailOne(memberOrdersDetailNo);
		List<Product> productList = ordersService.getProduct();
		log.info("엑 오디 원 : {}" , memberOrdersDetail.getProduct().getProductName());
		
		
		model.addAttribute("memberOrdersDetail" , memberOrdersDetail);
		model.addAttribute("productList" , productList);
		
		
		return "orders/insert";
	}
	
	
	
	
	@PostMapping("/insertMemberOE")
	public String insertMemberOD(MemberOrdersEx memberOrdersEx) {
		
		
		ordersService.insertMemberOrdersEx(memberOrdersEx);
	
		return "redirect:exchange";
	}
	
	
	@GetMapping("/exchange")
	public String memberExchangePage(HttpServletRequest request , Model model) {
		
		HttpSession session = request.getSession();
		
		Member member =  (Member) session.getAttribute("loginUser");
		if(member == null) {
			return "redirect:/member/login.do";
		}
		
		List<MemberOrdersEx> memberOrdersExList = ordersService.getOrdersEx(member.getMemberNo());
	
		model.addAttribute("memberOrdersExList",memberOrdersExList);
		

		return "orders/exchange";
	}
	
	
}
