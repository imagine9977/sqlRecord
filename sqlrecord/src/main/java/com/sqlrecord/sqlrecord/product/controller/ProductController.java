package com.sqlrecord.sqlrecord.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.sqlrecord.product.model.service.ProductService;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	private final ProductService productService;
	
	// 전체 상품 조회 (list.jsp)
	@GetMapping
	private String getAllProducts(@PathVariable String productCate) {
		
		return null;
	}
	
	// 1개 상품 조회
	@GetMapping
	private String getOneProduct(@PathVariable int productNo) {
		
		return null;
	}
	
	// 상품 추가
	@PostMapping
	private String saveProduct(Product product) {
		
		
	}
}
