package com.sqlrecord.sqlrecord.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/productFor")
public class ProductForwardController {

	// 개별 상품 상세보기 페이지로 이동
	@GetMapping("/detail/{productNo}")
	public String getProductOne(@PathVariable int productNo) {
		return "product/detail";
	}
	
	// 상품 추가 페이지로 이동
	@GetMapping("/saveProductForm")
	public String saveProductFormForwarding() {
		return "product/insertForm";
	}
}
