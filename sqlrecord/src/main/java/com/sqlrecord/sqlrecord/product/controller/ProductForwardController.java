package com.sqlrecord.sqlrecord.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/productFor")
public class ProductForwardController {

	@GetMapping("/list")
	private String getProductList() {
		return "product/list";
	}
	
	@GetMapping("/detail/{productNo}")
	private String getProductOne(@PathVariable int productNo) {
		return "product/detail";
	}
}
