package com.sqlrecord.sqlrecord.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@GetMapping("/{productNo}")
	public String getProductOne(@PathVariable int productNo) {
		return "product/detail";
	}
}
