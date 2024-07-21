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
								 int product_price , 
								 int product_no ,
								 int cartNum ,
								 HttpServletRequest request
								 ) {
		HttpSession session = request.getSession();
		
		// 각 카트의 갯수 배열로 하나하나 받기
		String[] cart_amountArr = request.getParameterValues("cart_amount");
		String[] product_priceArr = request.getParameterValues("product_price");
		String[] product_noArr = request.getParameterValues("product_no");
		String[] cartNo_Arr = request.getParameterValues("cartNum");
		
		log.info("카트번호 개수 몇개? : {}" , cartNo_Arr.length);
		if(cart_amountArr.length != 0) {
			
			
			
			
			Member member =  (Member) session.getAttribute("loginUser");
			
			
			// 멤버 오더에 넣을 값을 객체에 담기
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
			
			
			
			// 멤버 오더 디테일에 넣을 값을 객체에 담기
			List<MemberOrdersDetail> odList = new ArrayList<MemberOrdersDetail>();
			
			// Member_Orders에 생성된 넘버를 가져옴 detail에 넣기 위해서
			int successMO = ordersService.insertMemberOrders(memberOrders, member.getMemberNo());
			
			// name이 같은 값이 하나가 아니기 때문에 Array로 담아서 하나씩 List에 넣어줌
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
			
			// 디테일 인서트 성공 시 디테일로 리다이렉트
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
		
		
		// 유저의 OrderDetail을 리스트로 담기
		List<MemberOrdersDetail> odList  = ordersService.getOrdersDetail(member.getMemberNo());
		
		// set에 OrderDetail의 Orders_no의 값을 넣어서 중복되지 않는 HashSet을 만듬 
		Set<Integer> hs = new LinkedHashSet<Integer>();
		
		// HashSet에 add
		for(MemberOrdersDetail item : odList) {
			hs.add(item.getMemberOrders().getMemberOrdersNo());
			log.info("odList : {}" , odList.size());
			log.info("odList안의 하나 포토들 : {}" , odList.get(0).getProduct().getProductPhotosList().size());
		}
		
		// 2중 리스트를 만들기 위해서 준비
		List<List<MemberOrdersDetail>> newOdList = new ArrayList<List<MemberOrdersDetail>>();
		
		
		
		// HashSet의 Orders_no의 값과 같은 것들만 묶은 List를 2중리스트에 하나씩 add
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
		
		
		log.info("mod가 왔나? : {}" , memberOrdersEx.getMemberOrdersDetail().getMemberOrdersDetailNo());
		log.info("product가 왔나? : {}" , memberOrdersEx.getProduct().getProductNo());
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
		
		log.info("이게 돼? : {}" , memberOrdersExList.get(0).getMemberOrdersDetail().getMemberOrders().getMemberNo());
		log.info("그전 상품 사진 : {}" , memberOrdersExList.get(0).getMemberOrdersDetail().getProduct().getProductName());
		log.info("스테이터스 : {}" , memberOrdersExList.get(0).getMemberOrdersExStatus());
		
		
		
		
		
		
		
		// 유저의 OrderDetail을 리스트로 담기
		
		
		
		
		
		
		model.addAttribute("memberOrdersExList",memberOrdersExList);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return "orders/exchange";
	}
	
	
}
