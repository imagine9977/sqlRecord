package com.sqlrecord.sqlrecord.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.product.model.service.ProductService;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/productFor")
@RequiredArgsConstructor
public class ProductForwardController {

	
	private final ProductService productService;
	
	
	// 개별 상품 상세보기 페이지로 이동
	@GetMapping("/detail/{productNo}")
	public String getProductOne(@PathVariable int productNo , Model model) {
		
		
		
		Product product = productService.findOne(productNo);
		
		log.info("product? : {}" , product.getProductDetail());
		
		model.addAttribute("product",product);
		
		return "product/detail";
	}
	
	// 상품 추가 페이지로 이동
	@GetMapping("/saveProductForm")
	public String saveProductFormForwarding() {
		return "product/insertForm";
	}
	
	
	@GetMapping("/list/{productCate}")
	public String getProductList(@PathVariable String productCate , Model model) {
		
		
		List<Product> productList = productService.findAll(productCate);
		
		
		
		
		model.addAttribute("productList" , productList);
		
		return "product/list";
	}
	
	
}
