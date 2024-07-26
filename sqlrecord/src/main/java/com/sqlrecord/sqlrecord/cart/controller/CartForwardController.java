package com.sqlrecord.sqlrecord.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.cart.model.service.CartService;
import com.sqlrecord.sqlrecord.cart.model.vo.Cart;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartForwardController {
	
	
	private final CartService cartService;
	
	
	
	@GetMapping("/member/{userid}")
	public String getMemberCartListPage(@PathVariable int userid , Model model , HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/member/login.do";
		}
		
		List<Cart> cartList = cartService.getCartList(userid);
		model.addAttribute("list",cartList);
		
		return "cart/cart";
	}
	
	
	
	@PostMapping("/insert")
	public String insertCart(Cart cart) {
		
		cartService.insert(cart);
		
		
		log.info("cart : {}" , cart.getCartAmount());
		log.info("cart : {}"  , cart.getMember().getMemberNo());
		log.info("cart : {}"  , cart.getProduct().getProductNo());
		
		String redirect = "redirect:member/" + cart.getMember().getMemberNo();
		
		
		return redirect;
	}
	
}
